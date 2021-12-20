USE projet;

INSERT INTO
    Maintainer(MainName, MainMail, MainPassword, MainSalt, MainStatus)
VALUES
    ('Default', 'default@email.com', 'K-sTG2MDVu4jc47LYmeRUYMfdZdGZxVBUQlElhXXEDk=',
       'CRaa0ql5iOhxMXNhf96hiBBzMl8D78QPE_c47EWcPtY=', 1);

INSERT INTO
    Ressource(ResDesc, ResLocation, ResMaintainer)
VALUES
    ('Vidéo-projecteur', 'Salle U2.2.39', 1),
    ();

INSERT INTO
    Anomaly(AnomalyDesc, AnomalyStatus, AnomalyRes, AnomalyStartDate)
VALUES
    ("Problème d'affichage", 
