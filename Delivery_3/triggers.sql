a)
DELIMITER //
CREATE TRIGGER ins_dataOferta BEFORE INSERT ON Oferta
	FOR EACH ROW
	BEGIN
		DECLARE ERROR_MESSAGE varchar(255);

		IF NEW.data_inicio in (select data_inicio from Oferta where morada = NEW.morada and codigo = NEW.codigo)
		THEN
			set ERROR_MESSAGE = 'Ja existe uma oferta associada a este edificio com esta data';
			CALL ERROR_MESSAGE;
		ELSE
			INSERT INTO Oferta values(NEW.morada, NEW.codigo, NEW.data_inicio, NEW.data_fim, NEW.tarifa);
			
	ENDIF;

END //
DELIMITER ;

b)
DELIMITER //
CREATE TRIGGER ins_dataPagamento BEFORE INSERT ON Paga
	FOR EACH ROW
	BEGIN
		DECLARE ERROR_MESSAGE varchar(255);
		DECLARE biggest_timestamp timestamp;
		(select MAX(timestamp) into biggest_timestamp from Estado natural join Paga where numero = NEW.numero)
		
		IF biggest_timestamp > NEW.data
		THEN	
			set ERROR_MESSAGE = 'A data do pagamento tem de ser superior ao timestamp do ultimo estado';
			CALL ERROR_MESSAGE;
		ELSE
			INSERT INTO Paga values(NEW.numero, NEW.data, NEW.metodo);
		ENDIF;

END //
DELIMITER ;
