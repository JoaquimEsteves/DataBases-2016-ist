DROP PROCEDURE IF EXISTS insert_time;
DROP PROCEDURE IF EXISTS insert_date;

DELIMITER $$
CREATE PROCEDURE insert_time()
    BEGIN
        SET @time_id = 0;
        SET @time_hour = 0;
        SET @time_minute = 0;
        WHILE @time_hour < 24
        DO
            SET @time_minute = 0;
            WHILE @time_minute < 60
            DO
                INSERT INTO time_dimension(time_id, time_hour, time_minute) VALUES(@time_id, @time_hour, @time_minute);
                SET @time_minute = @time_minute +1;
                SET @time_id = @time_id+1;
            END WHILE;
            SET @time_hour = @time_hour+1;
        END WHILE;
END; $$

CREATE PROCEDURE insert_date()
BEGIN
    DECLARE v_full_date DATETIME;
    DECLARE semester integer;
    SET v_full_date = '2016-01-01 00:00:00';
    SET semester = 1;  
    WHILE v_full_date < '2018-01-01 00:00:00' DO
    
        INSERT INTO date_dimension (
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
           DAY(v_full_date),
           semester
       );
       SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
       IF MONTH(v_full_date) > 6 THEN
            SET semester = 2;
       ELSE
            SET semester = 1;
       END IF;     
   END WHILE;
END; $$
    
DELIMITER ;
