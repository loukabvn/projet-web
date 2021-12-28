USE projet;

INSERT INTO
    Maintainer(MainName, MainMail, MainPassword, MainSalt, MainStatus)
VALUES
    -- Mot de passe : Password#1
    ("Default1", "default1@domain.com", "zamMZxUqbTscWQTUG5W0ET60lna_tdHAUQ0SFvlXKlY=",
        "kf3-Re6E00xc8rnnRN0vtyg5557GA2dkdxtxpMoE0oM=", 1),
    -- Mot de passe : Password#2
    ("Default2", "default2@domain.com", "HM6qYGlj7hDQY0th-1dF8V45tUHZ5r0hoZ33f9jzINA=",
        "TzSfHbNruIckCsHO2OW52W9-TXarHderYhLWdXfWbn4=", 1);

INSERT INTO
    Ressource(ResDesc, ResLocation, ResMaintainer)
VALUES
    ("Vidéo-projecteur", "Salle U2.2.39", 1),
    ("Photocopieuse", "Hall", 1),
    ("Robinet", "Toilettes 1ère étage", 1),
    ("Écran d\'ordinateur - Poste 12", "Salle U2.2.49", 2),
    ("Toile de projection", "Amphi D", 2);

INSERT INTO
    Anomaly(AnomalyDesc, AnomalyStatus, AnomalyRes, AnomalyStartDate)
VALUES
    ("Problème d\'affichage", 0, 1, "2021-12-20"),
    ("Plus d\'encre", 0, 2, "2021-12-11"),
    ("Plus de papier", 0, 2, "2021-12-11"),
    ("Ne fonctionne plus", 0, 3, "2021-11-24"),
    ("L\'écran ne s\'allume plus", 0, 4, "2021-12-05"),
    ("La toile ne descend plus", 0, 5, "2021-12-07");
