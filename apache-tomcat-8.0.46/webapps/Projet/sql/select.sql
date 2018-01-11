DROP TABLE IF EXISTS reservation;

CREATE TABLE reservation(
	rno serial,
	pseudo text,
	trajet_id text,
	date_expiration text,
	CONSTRAINT pk_rno PRIMARY KEY (rno),
	CONSTRAINT fk_pseudo FOREIGN KEY (pseudo) REFERENCES client(pseudo) on delete restrict on update cascade 
);