USE projet;

INSERT INTO
    Maintainer(MainName, MainMail, MainPassword, MainSalt, MainStatus)
VALUES
    -- Mot de passe : Password1#
    ('Default', 'default@domain.com', 'K-sTG2MDVu4jc47LYmeRUYMfdZdGZxVBUQlElhXXEDk=',
        'CRaa0ql5iOhxMXNhf96hiBBzMl8D78QPE_c47EWcPtY=', 1),
    -- Mot de passe : Password2#
    ('Default2', 'default2@domain.com', 'a16F_VGIzYJ_hRvAdn7MiclsIeXGvnZsaTwX789j-4E=',
        'BslaBdmMXCZ0UjVaHRTa-ZIjwOU4TImiCR8b-tZKgkU=', 1);

INSERT INTO
    Ressource(ResDesc, ResLocation, ResMaintainer)
VALUES
    ('Vidéo-projecteur', 'Salle U2.2.39', 1),
    ('Photocopieuse', 'Hall', 1),
    ('Robinet', 'Toilettes 1ère étage', 1),
    ("Écran d'ordinateur - Poste 12", 'Salle U2.2.49', 2),
    ('Toile de projection', 'Amphi D', 2);

INSERT INTO
    Anomaly(AnomalyDesc, AnomalyStatus, AnomalyRes, AnomalyStartDate)
VALUES
    ("Problème d'affichage", 0, 1, "2021-12-20"),
    ("Plus d'encre", 0, 2, "2021-12-11"),
    ("Ne fonctionne plus", 0, 3, "2021-11-24"),
    ("L'écran ne s'allume plus", 0, 4, "2021-12-05"),
    ("La toile ne descend plus", 0, 5, "2021-12-07");
