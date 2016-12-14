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

    DECLARE v_full_date DATETIME;
    DECLARE semester integer;
    
    SET v_full_date = '2016-01-01 00:00:00';
    SET semester = 1;
    
    WHILE v_full_date < '2018-01-01 00:00:00' DO
    
        INSERT INTO date_dimension(
            date_id,
            date_year,
            date_month_number,
            date_week,
            date_day,
            date_semester
       ) VALUES (
           YEAR(v_full_date) * 10000 + MONTH(v_full_date)*100 + DAY(v_full_date),
           YEAR(v_full_date),
           MONTH(v_full_date),
           WEEK(v_full_date),
           DAY(v_full_date)
           semester,
       );
 
       SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
       
       IF MONTH(v_full_date) > 6 THEN
            SET semestre = 2;
       ELSE
            SET semestre = 1;
       END IF;
        
   END WHILE;
END; $$
    
DELIMITER ;
