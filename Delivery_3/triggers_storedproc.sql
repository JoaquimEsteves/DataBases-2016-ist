a)
DELIMITER //
CREATE TRIGGER ins_dataOferta BEFORE INSERT ON oferta
	FOR EACH ROW
	BEGIN
		DECLARE error_message varchar(255);

		IF NEW.data_inicio NOT IN (SELECT data_inicio FROM oferta WHERE morada = NEW.morada AND codigo = NEW.codigo)
		THEN
			INSERT INTO oferta (morada, codigo, data_inicio, data_fim, tarifa)
			VALUES (NEW.morada, NEW.codigo, NEW.data_inicio, NEW.data_fim, NEW.tarifa);
		ELSE
			SET error_message = 'Ja existe uma oferta associada a este edificio com esta data';
			CALL error_message;
		ENDIF;
	END //
DELIMITER ;

b)
DELIMITER //
CREATE TRIGGER ins_dataPagamento BEFORE INSERT ON paga
	FOR EACH ROW
	BEGIN
		DECLARE error_message varchar(255);
		DECLARE biggest_timestamp timestamp;
		(SELECT MAX(timestamp) INTO biggest_timestamp FROM estado NATURAL JOIN paga WHERE numero = NEW.numero);
		
		IF biggest_timestamp > NEW.data
		THEN	
			SET error_message = 'A data do pagamento tem de ser superior ao timestamp do ultimo estado';
			CALL error_message;
		ELSE
			INSERT INTO paga (numero, data, metodo) VALUES (NEW.numero, NEW.data, NEW.metodo);
		ENDIF;

	END //
DELIMITER ;

-- STORED PROCEDURE / INSERT BUILDINGS -- DONE BY RAQUEL
DELIMITER //
CREATE PROCEDURE insertBuilding(IN @morada varchar(255))
BEGIN
   	INSERT INTO Edificio (morada) VALUES (@morada);
END //
 
DELIMITER ;
