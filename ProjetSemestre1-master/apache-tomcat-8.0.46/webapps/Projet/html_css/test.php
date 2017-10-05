<?php
	$conn_string = "host=localhost port=5432 dbname=da2i user=lamboisa password=moi";
	$dbconn4 = pg_connect($conn_string);
	$result = pg_query($dbconn4, "SELECT * FROM client");
	// connexion à une base de données nommée "test" sur l'hôte "mouton" avec un
	// nom d'utilisateur et un mot de passe
	echo $result
?>
