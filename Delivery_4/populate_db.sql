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
    DECLARE codigo_espaco varchar(255);
    
    SET @i = 0;
    SET @id = 1;
    
    WHILE @i < 10000
    DO
    
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO codigo_espaco;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO morada;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO codigo;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO nif;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO numero;
        SELECT NOW() - INTERVAL FLOOR(RAND() * 14) DAY INTO time_stamp;
        SELECT CURDATE() - INTERVAL FLOOR(RAND() * 14) DAY INTO data_inicio;
        
        INSERT INTO edificio(morada) VALUES(morada);
        INSERT INTO alugavel(morada, codigo) VALUES(morada, codigo);
        INSERT INTO oferta(morada, codigo, data_inicio) VALUES(morada, codigo, data_inicio);
        
        INSERT INTO user(nif) VALUES(nif);
        INSERT INTO reserva(numero) VALUES(numero);
        INSERT INTO aluga(morada, codigo, data_inicio, nif, numero) VALUES(morada, codigo,data_inicio, nif,numero);
        
        INSERT INTO fiscal(id) VALUES(@id);
        INSERT INTO arrenda(morada, codigo,nif) VALUES(morada, codigo,nif);
        INSERT INTO fiscaliza(id, morada, codigo) VALUES(@id, morada, codigo);
        
        INSERT INTO espaco(morada, codigo) VALUES(morada, codigo);
        INSERT INTO posto(morada, codigo, codigo_espaco) VALUES(morada, codigo_espaco, codigo);
        
        INSERT INTO estado(numero, time_stamp) VALUES(numero, time_stamp);
        
        SET @i = @i+1;
        SET @id = @id+1;
        
    END WHILE;
END;
$$

DELIMITER ;
