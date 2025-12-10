CREATE TABLE Ville (
    id_ville        INT AUTO_INCREMENT PRIMARY KEY,
    nom_ville       VARCHAR(100) NOT NULL,
    latitude        DECIMAL(9,6),
    longitude       DECIMAL(9,6),
    region          VARCHAR(100),
    pays            VARCHAR(100)
);

CREATE TABLE Agence (
    code_agence     INT PRIMARY KEY,
    rue             VARCHAR(100),
    numero          INT,
    code_postal     INT,
    telephone       INT,
    site_web        VARCHAR(150),
    id_ville        INT NOT NULL,
    FOREIGN KEY (id_ville) REFERENCES Ville(id_ville)
);

CREATE TABLE Chambre (
    code_chambre    INT PRIMARY KEY,
    etage           INT,
    superficie_m2   DECIMAL(6,2),
    type_chambre    ENUM('simple','double','triple','suite') NOT NULL
);

CREATE TABLE Equipement (
    id_equip        INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Chambre_Equipement (
    code_chambre    INT NOT NULL,
    id_equip        INT NOT NULL,
    PRIMARY KEY (code_chambre, id_equip),
    FOREIGN KEY (code_chambre) REFERENCES Chambre(code_chambre),
    FOREIGN KEY (id_equip) REFERENCES Equipement(id_equip)
);

CREATE TABLE Espace_Suite (
    id_espace       INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Chambre_Espace (
    code_chambre    INT NOT NULL,
    id_espace       INT NOT NULL,
    PRIMARY KEY (code_chambre, id_espace),
    FOREIGN KEY (code_chambre) REFERENCES Chambre(code_chambre),
    FOREIGN KEY (id_espace) REFERENCES Espace_Suite(id_espace)
);

CREATE TABLE Reservation (
    id_reservation  INT AUTO_INCREMENT PRIMARY KEY,
    date_debut      DATE NOT NULL,
    date_fin        DATE NOT NULL,
    prix_journalier DECIMAL(10,2) NOT NULL,
    code_chambre    INT NOT NULL,
    code_agence     INT NOT NULL,
    FOREIGN KEY (code_chambre) REFERENCES Chambre(code_chambre),
    FOREIGN KEY (code_agence)  REFERENCES Agence(code_agence)
);