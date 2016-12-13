DROP PROCEDURE IF EXISTS insert_time;
DROP PROCEDURE IF EXISTS insert_date;

DELIMITER $$
CREATE PROCEDURE insert_time()
    BEGIN
        SET @id = 0;
        SET @hora = 0;
        SET @minuto = 0;
        WHILE @hora < 24
        DO
            SET @minuto = 0;
            WHILE @minuto < 60
            DO
                INSERT INTO time_dimension(tempo_id, hora, minuto) VALUES(@id, @hora, @minuto);
                SET @minuto = @minuto +1;
                SET @id = @id+1;

            END WHILE;
            SET @hora = @hora+1;
        END WHILE;
END; $$

CREATE PROCEDURE insert_date()
    BEGIN
        SET @id = 0;
        SET @dia = 1;
        SET @total_semanas = 1;
        SET @dias_semana = 1;
        SET @mes = 1;
        SET @semestre = 1;
        SET @ano = 2016;
        WHILE @ano < 2020
        DO
            SET @mes = 1;
            SET @semestre = 1;
            WHILE @mes <= 12
            DO
                SET @dia = 1;
                WHILE @dia < 28
                DO
                    IF @mes = 1 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Janeiro', @semestre, @ano);
                    ELSEIF @mes = 2 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Fevereiro', @semestre, @ano);
                    ELSEIF @mes = 3 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Marco', @semestre, @ano);
                    ELSEIF @mes = 4 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Abril', @semestre, @ano);
                    ELSEIF @mes = 5 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Maio', @semestre, @ano);
                    ELSEIF @mes = 6 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Junho', @semestre, @ano);
                    ELSEIF @mes = 7 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Julho', @semestre, @ano);
                    ELSEIF @mes = 8 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Agosto', @semestre, @ano);
                    ELSEIF @mes = 9 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Setembro', @semestre, @ano);
                    ELSEIF @mes = 10 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Outubro', @semestre, @ano);
                    ELSEIF @mes = 11 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Novembro', @semestre, @ano);
                    ELSEIF @mes = 12 THEN
                        INSERT INTO date_dimension(data_id, dia, semana, mes, semestre, ano) 
                            VALUES(@id, @dia, @semana, 'Dezembro', @semestre, @ano);
                    END IF;
                    
                   IF @dias_semana = 7 THEN
                        SET @dias_semana = 1;
                        SET @total_semanas = @total_semanas+1;
                   ENDIF;
                   
                   SET @dias_semana = @dias_semana+1;
                   SET @dia = @dia+1;
                   SET @id = @id+1;
                 
                END WHILE;
                IF @mes = 6 THEN
                    SET @semestre = 2;
                END IF;
                SET @mes = @mes+1;
            END WHILE;
            SET @ano = @ano+1;
        END WHILE;
END; $$
    
DELIMITER ;
