#!/bin/bash

# Script d'installation - Projet Langages Web 1
# Necéssite les droits administrateurs

# colors

red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

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
    while IFS= read -p "$prompt" -r -s -n 1 char 
    do
        if [[ $char == $'\0' ]]; then
            break
        fi
        if [[ $char == $'\177' ]]; then
            prompt=$'\b \b'
            password="${password%?}"
        else
            prompt='*'
            password+="$char"
        fi
    done
    echo $password
}

# ask password to user
ask_password() {
    # ask password
    echo "${red}Le mot de passe doit contenir au minimum 8 caractères, 1 chiffre, 1 maj., 1 min. et 1 spécial.${reset}" >&2
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
    wget https://raw.githubusercontent.com/loukabvn/projet-web/main/ProjetWeb.war 2&1> /dev/null
    war=1
fi

if [[ ! -f ./creation.sql ]]; then
    echo "Récupération du script SQL de création des tables depuis GitHub..."
    wget https://raw.githubusercontent.com/loukabvn/projet-web/main/creation.sql 2&1> /dev/null
    sql_script=1
fi

if [[ ! -f ./Generation.java ]]; then
    echo "Récupération du script Java pour la génération de mot de passe depuis GitHub..."
    wget https://raw.githubusercontent.com/loukabvn/projet-web/main/Generation.java 2&1> /dev/null
    java=1
fi

###### DEPLOYEMENT ######

# Deploy application with Tomcat
echo -e "\n${bold}[1/7] Déploiement de l'application...${reset}"
if [[ $war -gt 0 ]]; then
    mv ./ProjetWeb.war /var/lib/tomcat8/webapps/
else
    cp ./ProjetWeb.war /var/lib/tomcat8/webapps/
fi

###### MYSQL CONFIGURATION ######

# Config database access
echo -e "\n${bold}[2/7] Configuration de l'accès à la base de données.${reset}"
echo "Création d'un utilisateur MySQL avec tous les droits sur la base de données de la plateforme."
echo -e "\nVeuillez entrer les informations suivantes :"

# ask username
username=""
read -p "Nom d'utilisateur : " username
# ask password
password=$(ask_password)

# admin rights needed here
sql="CREATE USER '$username'@'%' IDENTIFIED BY '$password';"
mysql <<< $sql

sql="GRANT ALL PRIVILEGES ON projet.* TO '$username'@'%';"
mysql <<< $sql

echo -e "\n${bold}[3/7] Utilisateur $username créé${reset}"

###### CREATION ######

# Tables creation
mysql < ./creation.sql

echo -e "\n${bold}[4/7] Tables créées${reset}"

###### PLATFORM CONFIGURATION ######

# Create admin for the platform
echo -e "\n${bold}[5/7] Création du compte de l'administrateur de la plateforme :${reset}"
echo "Ce compte permettra d'accéder en tant qu'administrateur à la plateforme de maintenance et gérer les responsables de maintenance."

# ask username
read -p "Nom d'utilisateur : " username
# ask email
email="";
read -p "Adresse email : " email
# ask password
password=$(ask_password)

# Use Java to generate salt and hash to decode it in the platform
echo -e "\n${bold}[6/7] Génération du hash...${reset}"
salt=$(java ./Generation.java salt)
passwd_hash=$(java ./Generation.java cook "$salt" "$password")

sql="USE projet; INSERT INTO Admin(AdminName, AdminMail, AdminPassword, AdminSalt) VALUES('$username', '$email', '$passwd_hash', '$salt');"
# Insert admin
mysql <<< $sql

echo -e "\n${bold}[7/7] $username ajouté en tant qu'administrateur${reset}"

###### CLEANING ######

echo "Nettoyage des fichiers d'installation..."
[[ $sql_script -gt 0 ]] && rm ./creation.sql
[[ $java -gt 0 ]] && rm ./Generation.java

###### DONE ######

echo "Fini"
echo -e "${green}cL'application est installé, rendez-vous sur : http://192.168.76.76:8080/ProjetWeb/home${reset}"

exit 0
