#!/bin/bash

# Script d'installation - Projet Langages Web 1
# Necéssite les droits administrateurs

# useful functions

# check password strength
is_valid() {
        [ "${#1}" -ge 8 ] &&
        [[ $1 =~ [[:upper:]] ]] &&
        [[ $1 =~ [[:lower:]] ]] &&
        [[ $1 =~ [[:digit:]] ]] &&
        [[ $1 =~ [[:punct:]] ]]
}

# read password and replace with asterisk (*)
read_password() {
    local password=""

    if [[ $1 == "confirm" ]]; then
        prompt="Confirmer votre mot de passe : "
    else
        prompt="Mot de passe : "
    fi

    # use Internal Field Separator
    while IFS= read -p "$prompt" -r -s -n 1 letter
    do
        # catch 'Enter'
        if [[ $letter == $'\0' ]]
        then
            break
        fi
        # store password letter by letter
        password="$password$letter"
        # output asterisk
        prompt="*"
    done

    echo $password
}

# ask password to user
ask_password() {
    # ask password
    echo "Le mot de passe doit contenir au minimum 8 caractères, 1 chiffre, 1 maj., 1 min. et 1 spécial." >&2
    password=$(read_password)
    echo "" >&2 # newline
    while ! is_valid $password
    do
        echo "Erreur : Mot de passe trop faible !" >&2
        password=$(read_password)
        echo "" >&2 # newline
    done
 
    confirm=$(read_password confirm)
    echo "" >&2 # newline
    # check if passwords are same
    while [[ "$password" != "$confirm" ]]
    do
        echo "Erreur : mot de passes différents !" >&2
        # re-ask password
        confirm=$(read_password confirm)
        echo "" >&2 # newline
    done
    echo "$password"
}

### MAIN ###

echo "Installation de la plateforme..."

###### GET FILES #######

# get project from github if it's not in the directory
if [[ ! -f ./ProjetWeb.war ]]; then
    echo "Récupération de l'archive du projet depuis GitHub..."
    wget https://raw.githubusercontent.com/loukabvn/projet-web/main/ProjetWeb.war > /dev/null
    war=true
fi

if [[ ! -f ./creation.sql ]]; then
    echo "Récupération du script SQL de création des tables depuis GitHub..."
    wget https://raw.githubusercontent.com/loukabvn/projet-web/main/creation.sql > /dev/null
    sql_script=true
fi

if [[ ! -f ./Generation.java ]]; then
    echo "Récupération du script Java pour la génération de mot de passe depuis GitHub..."
    wget https://raw.githubusercontent.com/loukabvn/projet-web/main/Generation.java > /dev/null
    java=true
fi

###### DEPLOYEMENT ######

# Deploy application with Tomcat
echo -e "\n[1/7] Déploiement de l'application..."
if [[ -n "$war" ]]; then
    mv ./ProjetWeb.war /var/lib/tomcat8/webapps/
else
    cp ./ProjetWeb.war /var/lib/tomcat8/webapps/
fi

###### MYSQL CONFIGURATION ######

# Config database access
echo -e "\n[2/7] Configuration de l'accès à la base de données."
echo "Création d'un utilisateur MySQL avec tous les droits sur la base de données de la plateforme."
echo -e "\nVeuillez entrer les informations suivantes :"

# ask username
username=""
read -p "Nom d'utilisateur : " username
# ask password
password=$(ask_password)
echo "$password"

# admin rights needed here
sql="CREATE USER '$username'@'%' IDENTIFIED BY '$password';"
mysql <<< $sql

sql="GRANT ALL PRIVILEGES ON projet.* TO '$username'@'%';"
mysql <<< $sql

echo -e "\n[3/7] Utilisateur créé"

###### CREATION ######

# Tables creation
mysql < ./creation.sql

echo -e "\n[4/7] Tables créées"

###### PLATFORM CONFIGURATION ######

# Create admin for the platform
echo -e "\n[5/7] Création du compte de l'administrateur de la plateforme :"
echo "Ce compte permettra d'accéder en tant qu'administrateur à la plateforme de maintenance et gérer les responsables de maintenance."

# ask username
read -p "Nom d'utilisateur : " username
# ask email
email="";
read -p "Adresse email : " email
# ask password
password=$(ask_password)

# Use Java to generate salt and hash to decode it in the platform
echo -e "\n[6/7] Génération du hash..."
salt=$(java ./Generation.java salt)
passwd_hash=$(java ./Generation.java cook "$salt" "$password")

sql="USE projet; INSERT INTO Admin(AdminName, AdminMail, AdminPassword, AdminSalt) VALUES('$username', '$email', '$passwd_hash', '$salt');"
# Insert admin
mysql <<< $sql

echo -e "\n[7/7] Administrateur ajouté à la table"

###### CLEANING ######

if [[ -n "$sql_script" ]]; then
    rm ./creation.sql
fi
if [[ -n "$java" ]]; then
    rm ./Generation.java
fi

###### DONE ######

echo "Fini"
echo "L'application est installé, rendez-vous sur : http://192.168.76.76:8080/ProjetWeb/home"

exit 0
