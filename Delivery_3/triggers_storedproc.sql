DROP TRIGGER IF EXISTS ins_dataOferta;
DROP TRIGGER IF EXISTS ins_dataPagamento;
--a)
DELIMITER //
CREATE TRIGGER ins_dataOferta BEFORE INSERT ON oferta
	FOR EACH ROW
	BEGIN
		DECLARE error_message varchar(255);
		IF NEW.data_inicio in (select data_inicio from oferta where morada = NEW.morada and codigo = NEW.codigo)
        THEN
              set error_message = 'Ja existe uma oferta associada a este edificio com esta data';
              CALL error_message;
         ELSE
              INSERT INTO oferta (morada, codigo, data_inicio, data_fim, tarifa) 
	      values (NEW.morada, NEW.codigo, NEW.data_inicio, NEW.data_fim, NEW.tarifa);
        END IF;
END //

--b)
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
--DELIMITER //
--CREATE PROCEDURE insertBuilding(IN @morada varchar(255))
--BEGIN
   	--INSERT INTO Edificio (morada) VALUES (@morada);
--END //
 
--DELIMITER ;
