--a)
SELECT * 
FROM posto o, espaco e 
WHERE e.morada NOT IN (SELECT a.morada FROM aluga a) AND  o.morada NOT IN (SELECT a.morada FROM aluga a);

--b)
SELECT  a.morada, COUNT(a.morada) AS Amount_of_reservations
FROM  aluga a NATURAL JOIN edificio
GROUP BY morada 
HAVING Amount_of_reservations >= (SELECT COUNT(x.numero)/2 FROM reserva x);

--c)
SELECT A.nif,COUNT(A.id) as count FROM 
      (SELECT DISTINCT id,nif 
       FROM user u 
            NATURAL JOIN arrenda a 
            NATURAL JOIN fiscaliza
            NATURAL JOIN fiscal)
      AS A 
      GROUP BY nif 
      HAVING count=1;

--d)
SELECT DISTINCT e.morada, o.codigo, SUM(o.tarifa)*DATEDIFF(o.data_fim, o.data_inicio) AS maxpayed
FROM paga p 
      NATURAL JOIN oferta o 
      NATURAL JOIN espaco e 
      NATURAL JOIN aluga
WHERE YEAR(p.data) = 2016
GROUP BY e.morada;

--e)
SELECT * 
FROM espaco x 
WHERE x.morada NOT IN
	 (SELECT a.morada FROM aluga a WHERE a.numero NOT IN
		(SELECT e.numero FROM estado e WHERE e.estado NOT IN('Aceite')));
