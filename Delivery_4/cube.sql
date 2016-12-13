DROP TABLE IF EXISTS cube;
DROP PROCEDURE IF EXISTS insert_cube;

CREATE TABLE cube (
    l integer,
    d integer,
    paga integer,
    primary key(l,d),
    foreign key  (l) references local_dimension(local_id),
    foreign key (d) references data_dimension(data_id));

DELIMITER $$
CREATE PROCEDURE insert_cube()
    BEGIN
        SET @l_id = 1;
        SET @d_id = 1;

        WHILE @l_id < (SELECT count(local_id) FROM local_dimension)
        DO
          INSERT INTO cube (l,paga) VALUES (@l_id,(SELECT paga FROM local_dimension WHERE local_id = @l_id));
          SET @l_id = @l_id+1;
        END WHILE;

        WHILE @d_id < (SELECT count(data_id) FROM data_dimension)
        DO
          INSERT INTO cube (d) VALUES (@d_id);
          SET @d_id = @d_id+1;
        END WHILE;

    END; $$
DELIMITER ;

