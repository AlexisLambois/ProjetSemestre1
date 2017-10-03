DROP TABLE if EXISTS billet;
DROP TABLE if EXISTS train;
DROP TABLE if EXISTS gare;
DROP TABLE if EXISTS ligne;
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
	gare_dep text,
	gare_arr text,
	constraint pk_ligne primary key (lno)
);

CREATE TABLE client
(
	cno serial,
	nom text,
	prenom text,
	adresse text,
	mail text,
	mdp text,
	dateNaissance time,
	constraint pk_client primary key (cno)
);

CREATE TABLE billet
(
	bno serial,
	tno integer,
	lno integer,
	cno integer,
	hdep time,
	harr time,
	prix float,
	constraint pk_billet primary key (bno),
	constraint fk_train foreign key (tno)
		references train(tno)
		on delete restrict
		on update cascade,
	constraint fk_ligne foreign key (lno)
		references ligne(lno)
		on delete restrict
		on update cascade,
	constraint fk_client foreign key (cno)
		references client(cno)
		on delete restrict
		on update cascade
);

INSERT INTO client(nom,mail,mdp) VALUES('root','root@root.root','root');
