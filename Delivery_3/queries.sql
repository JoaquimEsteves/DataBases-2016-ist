//a)
SELECT DISTINCT e.morada, e.codigo 
FROM espaco e NATURAL JOIN posto 
WHERE  e.morada NOT IN (SELECT a.morada FROM aluga a);

//b)
SELECT  a.morada, COUNT(a.morada) AS Amount_of_reservations
FROM  aluga a NATURAL JOIN edificio
GROUP BY morada 
HAVING Amount_of_reservations >= (SELECT COUNT(x.numero)/2 FROM reserva x);

//c)
SELECT u.nome
FROM user u NATURAL JOIN arrenda a
WHERE EXISTS
(SELECT COUNT(f1.id) FROM arrenda NATURAL JOIN fiscaliza f1 
GROUP BY f1.id 
HAVING f1.id IN
(SELECT COUNT(f2.id) FROM fiscaliza f2 GROUP BY f2.id));

//d)
SELECT DISTINCT e.morada, SUM(o.tarifa)*365 AS maxpayed 
FROM paga p NATURAL JOIN oferta o NATURAL JOIN espaco e NATURAL JOIN aluga 
WHERE p.data LIKE '%2016%'
GROUP BY o.tarifa;
