DROP TRIGGER IF EXISTS ins_dataOferta;
DROP TRIGGER IF EXISTS ins_dataPagamento;
DROP PROCEDURE IF EXISTS insertBuilding;
DROP PROCEDURE IF EXISTS insertSpace;
DROP PROCEDURE IF EXISTS insertOffer;
DROP PROCEDURE IF EXISTS insertPost;

DELIMITER $$
CREATE TRIGGER ins_dataOferta BEFORE INSERT ON oferta
        FOR EACH ROW
        BEGIN
                DECLARE error_message varchar(255);
                IF (EXISTS (select data_inicio from oferta
                            where morada = NEW.morada AND codigo = NEW.codigo AND data_inicio = NEW.data_inicio))
        THEN
              set @error_message = 'Ja existe uma oferta associada a este edificio com esta data';
              CALL error;
        END IF;
END; $$

CREATE TRIGGER ins_dataPagamento BEFORE INSERT ON paga
        FOR EACH ROW
        BEGIN
                DECLARE error_message varchar(255);

                IF TIMESTAMPDIFF(SECOND,(SELECT MAX(time_stamp) FROM estado WHERE numero = NEW.numero), NEW.data) <0
                THEN
                        SET @error_message = 'A data do pagamento tem de ser superior ao timestamp do ultimo estado';
                        CALL error;
                END IF;

END; $$


CREATE PROCEDURE insertBuilding(IN new_morada varchar(255))
        BEGIN
                INSERT INTO edificio (morada) VALUES (new_morada);
END; $$

CREATE PROCEDURE insertSpace(IN new_morada varchar(255), IN new_codigo varchar(255))
BEGIN
    IF (EXISTS (SELECT morada FROM edificio where morada = new_morada)) AND (EXISTS(SELECT codigo FROM alugavel where codigo = new_codigo)) 
    THEN
        INSERT INTO espaco (morada, codigo) VALUES (new_morada, new_codigo);
        
    ELSEIF (NOT EXISTS (SELECT morada FROM edificio where morada = new_morada))
    THEN
        INSERT INTO edificio (morada) VALUES (new_morada);
        INSERT INTO alugavel (morada, codigo,foto) VALUES (new_morada, new_codigo,'no image');
        INSERT INTO espaco (morada, codigo) VALUES (new_morada, new_codigo);          
        
    ELSEIF (EXISTS (SELECT morada FROM edificio where morada = new_morada)) AND (NOT EXISTS (SELECT codigo FROM alugavel where codigo = new_codigo))
    THEN
        INSERT INTO alugavel (morada, codigo,foto) VALUES (new_morada, new_codigo,'no image');
        INSERT INTO espaco (morada, codigo) VALUES (new_morada, new_codigo);
        
    ELSE
        CALL error;
    END IF;
END; $$

CREATE PROCEDURE insertOffer(IN new_morada varchar(255), IN new_codigo varchar(255), IN new_data_inicio date, IN new_data_fim date, IN new_tarifa integer)
    BEGIN
        IF EXISTS (SELECT morada, codigo FROM edificio NATURAL JOIN alugavel WHERE morada = new_morada AND codigo = new_codigo)
        THEN
            INSERT INTO oferta (morada, codigo, data_inicio, data_fim, tarifa) VALUES (new_morada, new_codigo, new_data_inicio, new_data_fim, new_tarifa);
            
        ELSEIF NOT EXISTS (SELECT morada FROM edificio where  morada = new_morada)
        THEN
            INSERT INTO edificio (morada) VALUES (new_morada);
            INSERT INTO alugavel (morada, codigo,foto) VALUES (new_morada, new_codigo,'no image');
            INSERT INTO oferta (morada, codigo, data_inicio, data_fim, tarifa) VALUES (new_morada, new_codigo, new_data_inicio, new_data_fim, new_tarifa);
          
        ELSEIF EXISTS (SELECT morada, codigo FROM edificio NATURAL JOIN alugavel WHERE morada =new_morada AND scodigo <> new_codigo)
        THEN
            INSERT INTO alugavel (morada, codigo,foto) VALUES (new_morada, new_codigo,'no image');
            INSERT INTO oferta (morada, codigo, data_inicio, data_fim, tarifa) VALUES (new_morada, new_codigo, new_data_inicio, new_data_fim, new_tarifa);
          
        ELSE
                CALL error;
        END IF;
END; $$
                      
CREATE PROCEDURE insertPost(IN new_morada varchar(255), IN new_codigo varchar(255), IN new_codigo_espaco varchar(255))
    BEGIN
        IF (EXISTS (SELECT morada, codigo FROM edificio NATURAL JOIN alugavel where new_morada = morada and new_codigo_espaco = codigo))
        THEN
            INSERT INTO posto (morada, codigo, codigo_espaco) VALUES (new_morada, new_codigo, new_codigo_espaco);
            
        ELSEIF NOT EXISTS (SELECT morada FROM edificio where new_morada = morada)
        THEN
            INSERT INTO edificio (morada) VALUES (new_morada);
            INSERT INTO alugavel (morada, codigo,foto) VALUES (new_morada, new_codigo,'no image');
            INSERT INTO espaco (morada, codigo) VALUES (new_morada, new_codigo_espaco);
            INSERT INTO posto (morada, codigo, codigo_espaco) VALUES (new_morada, new_codigo, new_codigo_espaco);
            
        ELSEIF EXISTS (SELECT morada, codigo FROM edificio NATURAL JOIN alugavel where new_morada = morada and new_codigo_espaco <> codigo)
        THEN
            INSERT INTO alugavel (morada, codigo, foto) VALUES (new_morada, new_codigo, 'no image');
            INSERT INTO espaco (morada, codigo) VALUES (new_morada, new_codigo_espaco);
            INSERT INTO posto (morada, codigo, codigo_espaco) VALUES (new_morada, new_codigo, new_codigo_espaco);
            
        ELSE
                CALL error;
        END IF;
END; $$  

DELIMITER ;
