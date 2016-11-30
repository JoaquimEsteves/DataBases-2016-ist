//a)
SELECT DISTINCT e.morada, e.codigo 
FROM Espaco e NATURAL JOIN Posto 
WHERE  e.morada NOT IN (SELECT a.morada FROM Aluga

//b)
SELECT  a.morada, COUNT(a.morada) AS Amount_of_reservations
FROM  Aluga a NATURAL JOIN Edificio
GROUP BY morada 
HAVING Amount_of_reservations >= (SELECT COUNT(x.numero)/2 FROM Reserva x);

//c)
SELECT u.nome
FROM User u NATURAL JOIN Arrenda a
WHERE EXISTS
(SELECT COUNT(f1.id) FROM Arrenda NATURAL JOIN Fiscaliza f1 
GROUP BY f1.id 
HAVING f1.id IN
(SELECT COUNT(f2.id) FROM Fiscaliza f2 GROUP BY f2.id));

//d)
SELECT DISTINCT e.morada, SUM(o.tarifa)*365 AS maxpayed 
FROM Paga p NATURAL JOIN Oferta o NATURAL JOIN Espaco e NATURAL JOIN Aluga 
WHERE p.data LIKE '%2016%'
GROUP BY o.tarifa;
