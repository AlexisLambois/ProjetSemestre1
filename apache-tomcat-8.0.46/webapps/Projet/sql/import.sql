DROP TABLE if EXISTS stop_times;
DROP TABLE if EXISTS trajet;
DROP TABLE if EXISTS routes;
DROP TABLE if EXISTS gare;
DROP TABLE if EXISTS agency;
DROP TABLE if EXISTS stops;
DROP TABLE if EXISTS client;

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

CREATE TABLE agency(
	agency_id text,
	nom text,
	url text,
	timezone text,
	lang char(3),
	constraint pk_agency primary key (agency_id)
);

CREATE TABLE gare(
	gare_id serial,
	libelle text,
	fret char(1),
	voyageur char(1),
	codeligne integer,
	rang float,
	commune text,
	departement text,
	latitude float ,
	longitude float,
	constraint pk_gare primary key (gare_id)
);

CREATE TABLE stops(
	stop_id text,
	name text,
	latitude float,
	longitude float,
	constraint pk_stops primary key (stop_id)
);

CREATE TABLE routes(
	route_id text,
	agency_id text,
	route_long_name text,
	type int,
	constraint pk_routes primary key (route_id),
	constraint fk_agency foreign key (agency_id) REFERENCES agency(agency_id) on delete restrict on update cascade
);

CREATE TABLE trajet(
	trajet_id text,
	route_id text,
	service_id int,
	headsign int,
	direction_num int,
	constraint pk_trajet primary key (trajet_id),
	constraint fk_route foreign key (route_id) REFERENCES routes(route_id) on delete restrict on update cascade
);

CREATE TABLE stop_times(
	stop_times_id serial,
	trajet_id text,
	stop_id text,
	departure_time text,
	arrival_time text,
	num_sequence int,
	constraint fk_trajet foreign key (trajet_id) REFERENCES trajet(trajet_id) on delete restrict on update cascade,
	constraint fk_stop foreign key (stop_id) REFERENCES stops(stop_id) on delete restrict on update cascade
);


INSERT INTO client(nom,mail,mdp) VALUES('root','root@root.root','root');
\copy agency (agency_id,nom,url,timezone,lang) FROM '/home/infoetu/lamboisa/S5/Projet/data/data_agency.csv' DELIMITER ',';
\copy gare (libelle,fret,voyageur,codeligne,rang,commune,departement,latitude,longitude) FROM '/home/infoetu/lamboisa/S5/Projet/data/gares.csv' DELIMITER ',';
\copy stops (stop_id,name,latitude,longitude) FROM '/home/infoetu/lamboisa/S5/Projet/data/data_stops.csv' DELIMITER ',';
\copy routes (route_id,agency_id,route_long_name,type) FROM '/home/infoetu/lamboisa/S5/Projet/data/data_routes.csv' DELIMITER ',';



