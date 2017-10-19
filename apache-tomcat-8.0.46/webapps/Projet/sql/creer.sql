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
	depart timestamp,
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
INSERT INTO gare(nom,ville,cp) VALUES('St Cyprien','Paris',75000);
INSERT INTO gare(nom,ville,cp) VALUES('St Jean','Paris',75000);
INSERT INTO gare(nom,ville,cp) VALUES('St Phillipe','Paris',75000);
INSERT INTO gare(nom,ville,cp) VALUES('St Carle','Paris',75000);
INSERT INTO gare(nom,ville,cp) VALUES('St Benoit','Paris',75000);
INSERT INTO gare(nom,ville,cp) VALUES('St JB','Paris',75000);
INSERT INTO gare(nom,ville,cp) VALUES('St Truc','Paris',75000);

INSERT INTO ligne(gare_dep,gare_arr) VALUES(1,2);
INSERT INTO ligne(gare_dep,gare_arr) VALUES(1,3);
INSERT INTO ligne(gare_dep,gare_arr) VALUES(1,4);
INSERT INTO ligne(gare_dep,gare_arr) VALUES(1,5);
INSERT INTO ligne(gare_dep,gare_arr) VALUES(1,6);
INSERT INTO ligne(gare_dep,gare_arr) VALUES(1,7);

INSERT INTO train(type,categorie,nbPlace) VALUES('A320','A',300);

INSERT INTO trajet(lno,tno,prix,depart,duree) VALUES(1,1,35,'2017-10-18 12:05:00','2:30');
