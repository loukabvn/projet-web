USE projet;

DROP TABLE IF EXISTS Anomaly;
DROP TABLE IF EXISTS Ressource;
DROP TABLE IF EXISTS Maintainer;
DROP TABLE IF EXISTS Admin;

CREATE TABLE Admin (
    AdminId         integer(10) not null auto_increment, 
    AdminName       varchar(32),
    AdminMail       varchar(64) not null,
    AdminPassword   varchar(64) not null,
    AdminSalt       varchar(64) not null,
    primary key (AdminId)
);

CREATE TABLE Maintainer (
    MainId         integer(10) not null auto_increment, 
    MainName       varchar(32),
    MainMail       varchar(64) not null,
    MainPassword   varchar(64) not null,
    MainSalt       varchar(64) not null,
    MainStatus     tinyint(10) not null,
    primary key (MainId)
);

CREATE TABLE Ressource (
    ResId         integer(10) not null auto_increment, 
    ResDesc       varchar(64) not null,
    ResLocation   varchar(64) not null,
    ResMaintainer integer(10) not null,
    constraint  FK_MaintainerRessource foreign key (ResMaintainer)
    references Maintainer(MainId),
    primary key (ResId)
);

CREATE TABLE Anomaly (
    AnomalyId        integer(10) not null auto_increment,
    AnomalyDesc      varchar(64) not null,
    AnomalyStatus    tinyint(10) not null,
    AnomalyRes       integer(10) not null,
    AnomalyStartDate date,
    AnomalyEndDate   date,
    constraint FK_AnomalyRessource foreign key (AnomalyRes)
    references Ressource(ResId),
    primary key (AnomalyId)    
);
