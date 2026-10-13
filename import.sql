CREATE DATABASE IF NOT EXISTS bdd_jdbc
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE bdd_jdbc;


-- ============================================
-- TABLE : etudiant
-- ============================================

CREATE TABLE etudiant (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          nom VARCHAR(50) NOT NULL,
                          prenom VARCHAR(50) NOT NULL,
                          email VARCHAR(100) NOT NULL UNIQUE,
                          date_naissance DATE
);


-- ============================================
-- TABLE : matiere
-- ============================================

CREATE TABLE matiere (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         nom VARCHAR(100) NOT NULL,
                         coefficient DECIMAL(3,1) NOT NULL DEFAULT 1.0
);


-- ============================================
-- TABLE : note
-- ============================================

CREATE TABLE note (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      etudiant_id INT NOT NULL,
                      matiere_id INT NOT NULL,
                      note DECIMAL(4,2) NOT NULL,
                      date_evaluation DATE NOT NULL,
                      type_evaluation VARCHAR(30) NOT NULL,

                      CONSTRAINT fk_note_etudiant
                          FOREIGN KEY (etudiant_id)
                              REFERENCES etudiant(id)
                              ON DELETE CASCADE,

                      CONSTRAINT fk_note_matiere
                          FOREIGN KEY (matiere_id)
                              REFERENCES matiere(id)
                              ON DELETE CASCADE,

                      CONSTRAINT chk_note
                          CHECK (note >= 0 AND note <= 20)
);

USE bdd_jdbc;

-- ============================================
-- MATIERES
-- ============================================

INSERT INTO matiere (nom, coefficient) VALUES
                                           ('Bloc 1', 1.0),
                                           ('Bloc 2', 1.0),
                                           ('Bloc 3', 1.0),
                                           ('AP', 1.0);


-- ============================================
-- ETUDIANTS
-- ============================================

INSERT INTO etudiant (nom, prenom, email, date_naissance) VALUES
                                                              ('ABDALLAH SOILIHI', 'Mzé', 'mze.abdallah@example.com', '2005-02-14'),
                                                              ('ABDELAZIZ', 'Raken', 'raken.abdelaziz@example.com', '2004-11-08'),
                                                              ('AISSI', 'Rayane', 'rayane.aissi@example.com', '2005-06-23'),
                                                              ('ARIYARATNAM', 'Vithusan', 'vithusan.ariyaratnam@example.com', '2004-09-17'),
                                                              ('ASLAM', 'Sani', 'sani.aslam@example.com', '2005-01-29'),
                                                              ('ATRIDE', 'Edwin', 'edwin.atride@example.com', '2004-12-05'),
                                                              ('BELAID', 'Rayane-Berdjil', 'rayane-berdjil.belaid@example.com', '2005-04-11'),
                                                              ('BESSA', 'Oriane', 'oriane.bessa@example.com', '2004-07-19'),
                                                              ('BRIANTO', 'Alexandre', 'alexandre.brianto@example.com', '2005-10-02'),
                                                              ('CAMALET', 'Kylian', 'kylian.camalet@example.com', '2004-03-26'),
                                                              ('CARON-NAGEL', 'Louis', 'louis.caron-nagel@example.com', '2005-08-15'),
                                                              ('CAZE', 'Adrien', 'adrien.caze@example.com', '2004-05-31'),
                                                              ('DIARRASSOUBA', 'Beh-Moustapha', 'beh-moustapha.diarrassouba@example.com', '2005-11-12'),
                                                              ('EHIRIM NWOSE', 'Church Hill', 'church-hill.ehirim-nwose@example.com', '2004-10-21'),
                                                              ('ERAMBERT', 'Thomas', 'thomas.erambert@example.com', '2005-03-07'),
                                                              ('ERGESHOV', 'Baimurat', 'baimurat.ergeshov@example.com', '2004-06-14'),
                                                              ('KARAMOKO', 'Tanty', 'tanty.karamoko@example.com', '2005-09-28'),
                                                              ('KPODZO', 'Lina', 'lina.kpodzo@example.com', '2004-02-18'),
                                                              ('KRAFT-VALENTIN', 'Clément', 'clement.kraft-valentin@example.com', '2005-07-04'),
                                                              ('KWETE', 'Janicia', 'janicia.kwete@example.com', '2004-12-19'),
                                                              ('LOUCIF', 'Anis', 'anis.loucif@example.com', '2005-05-22'),
                                                              ('MOUCHOU', 'Yann', 'yann.mouchou@example.com', '2004-08-09'),
                                                              ('NASRULLA', 'Waleed', 'waleed.nasrulla@example.com', '2005-01-16'),
                                                              ('NYOURI', 'Mohamed-Reda', 'mohamed-reda.nyouri@example.com', '2004-04-27'),
                                                              ('PINDI MUNDELE', 'Peter', 'peter.pindi-mundele@example.com', '2005-10-18'),
                                                              ('RAYMOND', 'Ulrick', 'ulrick.raymond@example.com', '2004-11-03'),
                                                              ('SIDAMBARAM', 'Harin', 'harin.sidambaram@example.com', '2005-06-08'),
                                                              ('SONGCHAROENKUL', 'Nathanan', 'nathanan.songcharoenku@example.com', '2004-09-25'),
                                                              ('YAHYA', 'Adam', 'adam.yahya@example.com', '2005-02-02'),
                                                              ('ZACHELIN', 'Lenny', 'lenny.zachelin@example.com', '2004-07-13');

-- ============================================
-- NOTES
-- ============================================
INSERT INTO note
(etudiant_id, matiere_id, note, date_evaluation, type_evaluation)
VALUES
-- ABDALLAH SOILIHI Mzé
(1, 1, 4.5, '2026-09-15', 'DS'),
(1, 2, 7.0, '2026-09-22', 'DS'),
(1, 3, 8.5, '2026-09-29', 'TP'),
(1, 4, 1.0, '2026-10-02', 'Projet'),

-- ABDELAZIZ Raken
(2, 1, 4.0, '2026-09-15', 'DS'),
(2, 2, 6.5, '2026-09-22', 'DS'),
(2, 3, 5.0, '2026-09-29', 'TP'),
(2, 4, 2.0, '2026-10-02', 'Projet'),

-- AISSI Rayane
(3, 1, 3.5, '2026-09-15', 'DS'),
(3, 2, 7.0, '2026-09-22', 'DS'),
(3, 3, 7.0, '2026-09-29', 'TP'),
(3, 4, 8.0, '2026-10-02', 'Projet'),

-- ARIYARATNAM Vithusan
(4, 1, 4.5, '2026-09-15', 'DS'),
(4, 2, 3.0, '2026-09-22', 'DS'),
(4, 3, 8.5, '2026-09-29', 'TP'),
(4, 4, 1.0, '2026-10-02', 'Projet'),

-- ASLAM Sani
(5, 1, 2.5, '2026-09-15', 'DS'),
(5, 2, 4.0, '2026-09-22', 'DS'),
(5, 3, 11.0, '2026-09-29', 'TP'),
(5, 4, 8.5, '2026-10-02', 'Projet'),

-- ATRIDE Edwin
(6, 1, 5.0, '2026-09-15', 'DS'),
(6, 2, 7.5, '2026-09-22', 'DS'),
(6, 3, 6.0, '2026-09-29', 'TP'),
(6, 4, 8.0, '2026-10-02', 'Projet'),

-- BELAID Rayane-Berdjil
(7, 1, 8.5, '2026-09-15', 'DS'),
(7, 2, 6.0, '2026-09-22', 'DS'),
(7, 3, 4.5, '2026-09-29', 'TP'),
(7, 4, 12.0, '2026-10-02', 'Projet'),

-- BESSA Oriane
(8, 1, 1.0, '2026-09-15', 'DS'),
(8, 2, 8.0, '2026-09-22', 'DS'),
(8, 3, 6.5, '2026-09-29', 'TP'),
(8, 4, 9.0, '2026-10-02', 'Projet'),

-- BRIANTO Alexandre
(9, 1, 1.5, '2026-09-15', 'DS'),
(9, 2, 8.0, '2026-09-22', 'DS'),
(9, 3, 2.5, '2026-09-29', 'TP'),
(9, 4, 5.0, '2026-10-02', 'Projet'),

-- CAMALET Kylian
(10, 1, 6.5, '2026-09-15', 'DS'),
(10, 2, 5.5, '2026-09-22', 'DS'),
(10, 3, 7.0, '2026-09-29', 'TP'),
(10, 4, 6.0, '2026-10-02', 'Projet'),

-- CARON-NAGEL Louis
(11, 1, 4.0, '2026-09-15', 'DS'),
(11, 2, 3.5, '2026-09-22', 'DS'),
(11, 3, 5.0, '2026-09-29', 'TP'),
(11, 4, 8.5, '2026-10-02', 'Projet'),

-- CAZE Adrien
(12, 1, 8.5, '2026-09-15', 'DS'),
(12, 2, 2.0, '2026-09-22', 'DS'),
(12, 3, 9.5, '2026-09-29', 'TP'),
(12, 4, 3.0, '2026-10-02', 'Projet'),

-- DIARRASSOUBA Beh-Moustapha
(13, 1, 1.0, '2026-09-15', 'DS'),
(13, 2, 5.5, '2026-09-22', 'DS'),
(13, 3, 8.0, '2026-09-29', 'TP'),
(13, 4, 4.5, '2026-10-02', 'Projet'),

-- EHIRIM NWOSE Church Hill
(14, 1, 5.0, '2026-09-15', 'DS'),
(14, 2, 6.5, '2026-09-22', 'DS'),
(14, 3, 2.0, '2026-09-29', 'TP'),
(14, 4, 7.0, '2026-10-02', 'Projet'),

-- ERAMBERT Thomas
(15, 1, 9.5, '2026-09-15', 'DS'),
(15, 2, 7.0, '2026-09-22', 'DS'),
(15, 3, 2.5, '2026-09-29', 'TP'),
(15, 4, 8.5, '2026-10-02', 'Projet'),

-- ERGESHOV Baimurat
(16, 1, 6.0, '2026-09-15', 'DS'),
(16, 2, 8.5, '2026-09-22', 'DS'),
(16, 3, 4.0, '2026-09-29', 'TP'),
(16, 4, 5.5, '2026-10-02', 'Projet'),

-- KARAMOKO Tanty
(17, 1, 4.5, '2026-09-15', 'DS'),
(17, 2, 6.0, '2026-09-22', 'DS'),
(17, 3, 5.5, '2026-09-29', 'TP'),
(17, 4, 7.0, '2026-10-02', 'Projet'),

-- KPODZO Lina
(18, 1, 6.0, '2026-09-15', 'DS'),
(18, 2, 1.5, '2026-09-22', 'DS'),
(18, 3, 4.5, '2026-09-29', 'TP'),
(18, 4, 6.5, '2026-10-02', 'Projet'),

-- KRAFT-VALENTIN Clément
(19, 1, 10.0, '2026-09-15', 'DS'),
(19, 2, 3.5, '2026-09-22', 'DS'),
(19, 3, 9.0, '2026-09-29', 'TP'),
(19, 4, 3.5, '2026-10-02', 'Projet'),

-- KWETE Janicia
(20, 1, 3.0, '2026-09-15', 'DS'),
(20, 2, 5.5, '2026-09-22', 'DS'),
(20, 3, 2.5, '2026-09-29', 'TP'),
(20, 4, 8.0, '2026-10-02', 'Projet'),

-- LOUCIF Anis
(21, 1, 3.0, '2026-09-15', 'DS'),
(21, 2, 4.5, '2026-09-22', 'DS'),
(21, 3, 8.0, '2026-09-29', 'TP'),
(21, 4, 6.5, '2026-10-02', 'Projet'),

-- MOUCHOU Yann
(22, 1, 4.5, '2026-09-15', 'DS'),
(22, 2, 3.0, '2026-09-22', 'DS'),
(22, 3, 5.0, '2026-09-29', 'TP'),
(22, 4, 13.5, '2026-10-02', 'Projet'),

-- NASRULLA Waleed
(23, 1, 8.0, '2026-09-15', 'DS'),
(23, 2, 6.5, '2026-09-22', 'DS'),
(23, 3, 2.0, '2026-09-29', 'TP'),
(23, 4, 7.5, '2026-10-02', 'Projet'),

-- NYOURI Mohamed-Reda
(24, 1, 5.5, '2026-09-15', 'DS'),
(24, 2, 7.0, '2026-09-22', 'DS'),
(24, 3, 10.5, '2026-09-29', 'TP'),
(24, 4, 3.0, '2026-10-02', 'Projet'),

-- PINDI MUNDELE Peter
(25, 1, 2.0, '2026-09-15', 'DS'),
(25, 2, 10.0, '2026-09-22', 'DS'),
(25, 3, 7.5, '2026-09-29', 'TP'),
(25, 4, 9.0, '2026-10-02', 'Projet'),

-- RAYMOND Ulrick
(26, 1, 11.5, '2026-09-15', 'DS'),
(26, 2, 3.0, '2026-09-22', 'DS'),
(26, 3, 5.0, '2026-09-29', 'TP'),
(26, 4, 12.5, '2026-10-02', 'Projet'),

-- SIDAMBARAM Harin
(27, 1, 7.5, '2026-09-15', 'DS'),
(27, 2, 6.0, '2026-09-22', 'DS'),
(27, 3, 8.0, '2026-09-29', 'TP'),
(27, 4, 3.0, '2026-10-02', 'Projet'),

-- SONGCHAROENKUL Nathanan
(28, 1, 9.0, '2026-09-15', 'DS'),
(28, 2, 11.0, '2026-09-22', 'DS'),
(28, 3, 7.5, '2026-09-29', 'TP'),
(28, 4, 3.0, '2026-10-02', 'Projet'),

-- YAHYA Adam
(29, 1, 12.5, '2026-09-15', 'DS'),
(29, 2, 9.5, '2026-09-22', 'DS'),
(29, 3, 4.0, '2026-09-29', 'TP'),
(29, 4, 5.0, '2026-10-02', 'Projet'),

-- ZACHELIN Lenny
(30, 1, 5.5, '2026-09-15', 'DS'),
(30, 2, 7.0, '2026-09-22', 'DS'),
(30, 3, 6.5, '2026-09-29', 'TP'),
(30, 4, 8.0, '2026-10-02', 'Projet');