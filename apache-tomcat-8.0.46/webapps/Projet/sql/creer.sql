DROP TABLE if EXISTS billet;
DROP TABLE if EXISTS trajet;
DROP TABLE if EXISTS ligne;
DROP TABLE if EXISTS train;
DROP TABLE if EXISTS gare;
DROP TABLE if EXISTS client;

CREATE TABLE train
(
	tno serial,
	type text,
	categorie text,
	nbPlace integer,
	constraint pk_train primary key (tno)
);

CREATE TABLE gare
(
	gno serial,
	nom text,
	ville text,
	cp integer,
	adresse text,
	constraint pk_gare primary key (gno)
);

CREATE TABLE ligne
(
	lno serial,
	gare_dep integer,
	gare_arr integer,
	constraint pk_ligne primary key (lno),
	constraint fk_gare1 foreign key (gare_dep) references gare(gno) on delete restrict on update cascade,
	constraint fk_gare2 foreign key (gare_arr) references gare(gno) on delete restrict on update cascade
);

CREATE TABLE trajet
(
	trajet_no serial,
	lno integer,
	tno integer,
	prix float,
	hDep date,
	duree time,
	constraint pk_trajet primary key (trajet_no),
	constraint fk_ligne foreign key (lno) references ligne(lno) on delete restrict on update cascade,
	constraint fk_train foreign key (tno) references train(tno) on delete restrict on update cascade
);

CREATE TABLE client
(
	cno serial,
	nom text,
	prenom text,
	adresse text,
	mail text,
	mdp text,
	dateNaissance date,
	constraint pk_client primary key (cno)
);

CREATE TABLE billet
(
	bno serial,
	trajet_no integer,
	cno integer,
	hdep time,
	harr time,
	prix float,
	constraint pk_billet primary key (bno),
	constraint fk_trajet foreign key (trajet_no)
		references trajet(trajet_no)
		on delete restrict
		on update cascade,
	constraint fk_client foreign key (cno)
		references client(cno)
		on delete restrict
		on update cascade
);

INSERT INTO client(nom,mail,mdp) VALUES('root','root@root.root','root');
INSERT INTO gare(nom,ville) VALUES('St Cyprien','Paris');
INSERT INTO gare(nom,ville) VALUES('St Jean','Paris');
INSERT INTO gare(nom,ville) VALUES('St Phillipe','Paris');
INSERT INTO gare(nom,ville) VALUES('St Carle','Paris');
INSERT INTO gare(nom,ville) VALUES('St Benoit','Paris');
INSERT INTO gare(nom,ville) VALUES('St JB','Paris');
INSERT INTO gare(nom,ville) VALUES('St Truc','Paris');
