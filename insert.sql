USE projet;

INSERT INTO
    Maintainer(MainName, MainMail, MainPassword, MainSalt, MainStatus)
VALUES
    -- Mot de passe : Password#1
    ("Default", "default@domain.com", "ra_2i2hOcUaRQWXQLwVr34hBrsHzzgr2tC1hepbwWek=",
        "H1Y2hZ91pue8S_aMVJe5ekJS-wWNP1aU3ccrM-z0R3Y=", 1),
    -- Mot de passe : Password#2
    ("Default2", "default2@domain.com", "TzSfHbNruIckCsHO2OW52W9-TXarHderYhLWdXfWbn4=",
        "HM6qYGlj7hDQY0th-1dF8V45tUHZ5r0hoZ33f9jzINA=", 1);

INSERT INTO
    Ressource(ResDesc, ResLocation, ResMaintainer)
VALUES
    ("Vidéo-projecteur", "Salle U2.2.39", 1),
    ("Photocopieuse", "Hall", 1),
    ("Robinet", "Toilettes 1ère étage", 1),
    ("Écran d'ordinateur - Poste 12", "Salle U2.2.49", 2),
    ("Toile de projection", "Amphi D", 2);

INSERT INTO
    Anomaly(AnomalyDesc, AnomalyStatus, AnomalyRes, AnomalyStartDate)
VALUES
    ("Problème d'affichage", 0, 1, "2021-12-20"),
    ("Plus d'encre", 0, 2, "2021-12-11"),
    ("Ne fonctionne plus", 0, 3, "2021-11-24"),
    ("L'écran ne s'allume plus", 0, 4, "2021-12-05"),
    ("La toile ne descend plus", 0, 5, "2021-12-07");
