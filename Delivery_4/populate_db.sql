DROP PROCEDURE IF EXISTS populate_all;


DELIMITER $$

CREATE PROCEDURE populate_all()
BEGIN
    DECLARE morada varchar(255);
    DECLARE codigo varchar(255);
    DECLARE nif varchar(9);
    DECLARE data_inicio date;
    DECLARE numero varchar(255);
    DECLARE time_stamp timestamp;
    DECLARE ce varchar(255);
    
    SET @i = 0;
    SET @pivot_ts = '2013-01-15 22:15:45';
    SET @max_span = 432000;
    SET @bias = SIGN(-0.5 + RAND());
    SET @id = 45;
    
    WHILE @i < 1000
    DO
    
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO ce;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO morada;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO codigo;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO nif;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO numero;
        SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(@pivot_ts) + ( @bias * (FLOOR(RAND()*@max_span)) )) INTO time_stamp;
        SELECT FLOOR(7 + (RAND() * 5)) INTO data_inicio;
        
        INSERT INTO edificio(morada) VALUES(morada);
        INSERT INTO user(nif) VALUES(nif);
        INSERT INTO fiscal(id) VALUES(@id);
        INSERT INTO alugavel(morada, codigo) VALUES(morada, codigo);
        INSERT INTO arrenda(morada, codigo,nif) VALUES(morada, codigo,nif);
        INSERT INTO fiscaliza(id, morada, codigo) VALUES(id, morada, codigo);
        
        INSERT INTO oferta(morada, codigo, data_inicio) VALUES(morada, codigo, data_inicio);
        
        INSERT INTO reserva(numero) VALUES(numero);
        INSERT INTO estado(numero, time_stamp) VALUES(numero, time_stamp);
        INSERT INTO aluga(morada, codigo, data_inicio, nif, numero) VALUES(morada, codigo,data_inicio, nif,numero);
        INSERT INTO espaco(morada, codigo) VALUES(morada, codigo);
        INSERT INTO posto(morada, codigo, codigo_espaco) VALUES(morada, ce, codigo);
        
        SET @i = @i+1;
        SET @id = @id+2;
        
    END WHILE;
END;
$$

DELIMITER ;
