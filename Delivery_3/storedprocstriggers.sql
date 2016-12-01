DROP TRIGGER IF EXISTS ins_dataOferta;
DROP TRIGGER IF EXISTS ins_dataPagamento;

DELIMITER //
CREATE TRIGGER ins_dataOferta BEFORE INSERT ON oferta
	FOR EACH ROW
	BEGIN
		DECLARE error_message varchar(255);
		IF (EXISTS (select data_inicio from oferta 
			    where morada = NEW.morada AND codigo = NEW.codigo AND data_inicio = NEW.data_inicio))
        THEN
              set error_message = 'Ja existe uma oferta associada a este edificio com esta data';
              CALL error_message;
        END IF;
END //

CREATE TRIGGER ins_dataPagamento BEFORE INSERT ON paga
	FOR EACH ROW
	BEGIN
		DECLARE error_message varchar(255);
		
		IF (SELECT MAX(timestamp) FROM estado NATURAL JOIN paga
		     WHERE numero = NEW.numero) > NEW.data
		THEN	
			SET error_message = 'A data do pagamento tem de ser superior ao timestamp do ultimo estado';
			CALL error_message;
		END IF;

END //

CREATE PROCEDURE insertBuilding(IN @morada varchar(255))
	BEGIN
   		INSERT INTO edificio (morada) VALUES (@morada);
END //
 
DELIMITER ;
