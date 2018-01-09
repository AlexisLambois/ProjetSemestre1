SELECT count(*)
FROM temporaly_data as td1 
INNER JOIN temporaly_data as td2 ON td1.gare2=td2.gare1 
WHERE td1.gare1 LIKE '%87286401%' AND td2.gare2 LIKE '%87286542%'
AND td1.trajet_id IN (
	SELECT trajet_id
	FROM stop_times
	WHERE stop_id LIKE '%87286401%' AND arrival_time > '12:00'
	INTERSECT
	SELECT trajet_id 
	FROM trajet 
	WHERE service_id IN (
		SELECT service_id 
		FROM calendar 
		WHERE tuesday=1 AND start_date < '2018-01-09' AND end_date > '2018-01-09'
	)
)AND td2.trajet_id IN (
	SELECT trajet_id
	FROM stop_times
	WHERE stop_id LIKE '%87286542%' AND arrival_time > '12:00'
	INTERSECT
	SELECT trajet_id 
	FROM trajet 
	WHERE service_id IN (
		SELECT service_id 
		FROM calendar 
		WHERE tuesday=1 AND start_date < '2018-01-09' AND end_date > '2018-01-09'
	)
);

SELECT count(*)
FROM temporaly_data as td1 
INNER JOIN temporaly_data as td2 ON td1.gare2=td2.gare1 
WHERE td1.gare1 LIKE '%87286401%' AND td2.gare2 LIKE '%87286542%'
AND td1.trajet_id IN ( 
	SELECT trajet_id 
	FROM trajet 
	WHERE service_id IN ( 
		SELECT service_id 
		FROM calendar
		WHERE tuesday=1 AND start_date < '2018-01-09' AND end_date > '2018-01-09'
	)
) AND td2.trajet_id IN ( 
	SELECT trajet_id 
	FROM trajet 
	WHERE service_id IN ( 
		SELECT service_id 
		FROM calendar 
		WHERE tuesday=1 AND start_date < '2018-01-09' AND end_date > '2018-01-09'
	)
) AND td1.trajet_id IN ( 
	SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%87286401%' AND arrival_time > '12:00'
) AND td2.trajet_id IN ( 
	SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%87286542%' AND arrival_time > '12:00'
);