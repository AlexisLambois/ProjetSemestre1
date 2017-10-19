SELECT gare1.nom,gare1.ville,gare1.cp,gare2.nom,gare2.ville,gare2.cp,depart,duree,prix
FROM trajet
INNER JOIN ligne on trajet.lno = ligne.lno
INNER JOIN gare AS gare1 ON ligne.gare_dep = gare1.gno
INNER JOIN gare AS gare2 ON ligne.gare_arr = gare2.gno
WHERE depart='2017-10-18 12:05:00' AND ligne.lno=(SELECT ligne.lno FROM ligne WHERE gare_dep=1 AND gare_arr=2)
;