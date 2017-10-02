DROP TABLE IF EXISTS commande CASCADE;
DROP TABLE IF EXISTS personne CASCADE;
DROP TABLE IF EXISTS produit CASCADE;

CREATE TABLE personne(
	idpersonne serial PRIMARY KEY,
	login text NOT NULL,
	mdp text NOT NULL,
	adresse text,
	nbconnec int
);

CREATE TABLE produit(
	idproduit serial PRIMARY KEY,
	nom text,
	prix int,
	description text,
	urlimg text
);

CREATE TABLE commande(
	idcommande serial PRIMARY KEY,
	idpersonne int,
	idproduit int,
	datecommande date,
	quantite int,
	FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne) ON DELETE CASCADE,
	FOREIGN KEY (idproduit) REFERENCES produit(idproduit) ON DELETE CASCADE
);


INSERT INTO personne(login, mdp, nbconnec) VALUES('admin','root',0);
INSERT INTO personne(login, mdp, nbconnec) VALUES('alexis','123',0);

INSERT INTO produit(nom, prix, description,urlimg) VALUES('Ensemble de truc',50,'Superbe ensemble','image1.jpg');
INSERT INTO produit(nom, prix, description,urlimg) VALUES('BLÄDJAN',12.95,'Drap de bain, multicolore','image2.jpg');
INSERT INTO produit(nom, prix, description,urlimg) VALUES('PRAKTTRY',24.95,'Housse de couette et taie, médaillon gris/blanc, beige','image3.jpg');
INSERT INTO produit(nom, prix, description,urlimg) VALUES('Ensemble de truc',50,'Superbe ensemble','image1.jpg');
INSERT INTO produit(nom, prix, description,urlimg) VALUES('Ensemble de truc',50,'Superbe ensemble','image1.jpg');
INSERT INTO produit(nom, prix, description,urlimg) VALUES('BLÄDJAN',12.95,'Drap de bain, multicolore','image2.jpg');
INSERT INTO produit(nom, prix, description,urlimg) VALUES('PRAKTTRY',24.95,'Housse de couette et taie, médaillon gris/blanc, beige','image3.jpg');
INSERT INTO produit(nom, prix, description,urlimg) VALUES('Ensemble de truc',50,'Superbe ensemble','image1.jpg');


INSERT INTO commande(idpersonne,idproduit) VALUES(1,1);