DROP TABLE if EXISTS stop_times;
DROP TABLE if EXISTS transferts;
DROP TABLE if EXISTS trajet;
DROP TABLE if EXISTS routes;
DROP TABLE if EXISTS gare;
DROP TABLE if EXISTS agency;
DROP TABLE if EXISTS stops;
DROP TABLE if EXISTS client;
DROP TABLE if EXISTS calendar_dates;
DROP TABLE if EXISTS calendar;

CREATE TABLE calendar(
	service_id int,
	monday int,
	tuesday int,
	wednesday int,
	thursday int,
	friday int,
	saturday int,
	sunday int,
	start_date date,
	end_date date,
	constraint pk_calendar primary key (service_id)
);

CREATE TABLE calendar_dates(
	service_id int,
	dat date,
	exception_type int,
	constraint pk_calendar_dates primary key (service_id,dat)
);

CREATE TABLE client(
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

CREATE TABLE transferts(
	from_stop_id text,
	to_stop_id text,
	transfert_type int,
	min_transfert_time int,
	constraint fk_transferts_from foreign key (from_stop_id) REFERENCES stops(stop_id) on delete restrict on update cascade,
	constraint fk_transferts_to foreign key (to_stop_id) REFERENCES stops(stop_id) on delete restrict on update cascade
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
	headsign text,
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
\copy trajet FROM '/home/infoetu/lamboisa/S5/Projet/data/data_trajet.csv' DELIMITER ',';
\copy calendar FROM '/home/infoetu/lamboisa/S5/Projet/data/data_calendar.csv' DELIMITER ',';
\copy calendar_dates FROM '/home/infoetu/lamboisa/S5/Projet/data/data_calendar_dates.csv' DELIMITER ',';
\copy stop_times (trajet_id,departure_time,arrival_time,stop_id,num_sequence) FROM '/home/infoetu/lamboisa/S5/Projet/data/data_stop_times.csv' DELIMITER ',';
\copy transferts FROM '/home/infoetu/lamboisa/S5/Projet/data/data_transfert.csv' DELIMITER ',';

