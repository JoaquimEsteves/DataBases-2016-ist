
a)

DELIMITER //
CREATE PROCEDURE insert_oferta(IN @morada varchar(255), IN @codigo varchar(255))

CREATE TRIGGER ins_dataOferta 
BEFORE INSERT ON oferta
FOR EACH ROW
BEGIN
	set @error = 'Ja existe uma oferta associada a este edificio com esta data.';
	set @current_time = (select CURTIME());
	
	IF @current_time in (select data_inicio from oferta where morada = @morada and codigo = @codigo)
	THEN
		CALL @error;
	END IF;
END //
DELIMITER;


b)

CREATE TRIGGER ins_dataPagamento
BEFORE INSERT ON paga
FOR EACH ROW
BEGIN
	set @error = ’ERROEOEOEOORR!?!?kappa.’;
	set @timestamp = (SELECT estado, time_stamp from estado NATURAL JOIN paga);
	set @aceite = (SELECT )

	IF NEW.data < @timestamp
		CALL @error;
	END IF
END//
DELIMITER;



QUESTIONS/WORK:
2nd queires does not work
both have to be tested



a) RI-1: "Não podem existir ofertas com datas sobrepostas"
b) RI-2: "A data de pagamento de uma reserva paga tem de ser superior ao timestamp do
último estado dessa reserva"
			
