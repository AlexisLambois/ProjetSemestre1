DROP TABLE if EXISTS test;
DROP TABLE if EXISTS temporaly_data;

CREATE TABLE test(
	id serial,
	trajet_id int,
	stop_id int,
	primary key (id)
);

INSERT INTO test(trajet_id,stop_id) VALUES(1,1);
INSERT INTO test(trajet_id,stop_id) VALUES(1,2);
INSERT INTO test(trajet_id,stop_id) VALUES(1,3);
INSERT INTO test(trajet_id,stop_id) VALUES(1,4);
INSERT INTO test(trajet_id,stop_id) VALUES(1,5);


CREATE TABLE temporaly_data as(
	SELECT st1.trajet_id,st1.stop_id as gare1,st1.num_sequence as ns1,st2.stop_id as gare2,st2.num_sequence as ns2
	FROM stop_times as st1
	INNER JOIN stop_times as st2 ON st1.trajet_id=st2.trajet_id
	WHERE st1.stop_id!=st2.stop_id AND st1.stop_times_id < st2.stop_times_id);
