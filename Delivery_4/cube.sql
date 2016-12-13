DROP TABLE IF EXISTS cube;
DROP PROCEDURE IF EXISTS insert_cube;

CREATE TABLE cube (
    l integer,
    d integer,
    paga integer,
    primary key(l,d),
    forgein key (l) references local_dimension(local_id)ON UPDATE CASCADE,
    forgein key (d) references data_dimension(data_id) ON UPDATE CASCADE);

DELIMITER $$
CREATE PROCEDURE insert_cube()
    BEGIN
        SET @l_id = 0;
        SET @d_id = 0;

        WHILE @l_id <= count(local_id)
        DO
          INSERT INTO cube (l,paga) VALUES (@l_id,(SELECT paga FROM local_dimension WHERE local_id = @l_id));
          SET @l_id = @l_id+1;
        END WHILE;

        WHILE @d_id <= count(data_id)
        DO
          INSERT INTO cube (d) VALUES (@d_id);
          SET @d_id = @d_id+1;
        END WHILE;

    END; $$
DELIMITER ;

call insert_cube;


