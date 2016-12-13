INSERT INTO user_dimension VALUES ('123456719', 'Jorge Poeta', '992323123');
INSERT INTO user_dimension VALUES ('113056729', 'António Martins', '992333123');
INSERT INTO user_dimension VALUES ('133956139', 'David Manuel', '992323124');
INSERT INTO user_dimension VALUES ('143856248', 'Nuno Sousa', '992323125');
INSERT INTO user_dimension VALUES ('153756357', 'Armando Sousa', '992323126');
INSERT INTO user_dimension VALUES ('163656466', 'Gonçalo Santos', '992323127');
INSERT INTO user_dimension VALUES ('173516575', 'Alberto Silva', '992323128');
INSERT INTO user_dimension VALUES ('183426684', 'Rubim Guerreiro', '992323129');
INSERT INTO user_dimension VALUES ('193336793', 'Anacleto Vieira', '993323123');
INSERT INTO user_dimension VALUES ('103246782', 'Luis Raposo', '995323123');
INSERT INTO user_dimension VALUES ('120456781', 'Rui Vitória', '997323123');


INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('1','IST','Central','200,00');
INSERT INTO local_dimension VALUES ('2','IST','DEI','Lab1','120,00');
INSERT INTO local_dimension VALUES ('3','IST','DEI','Lab2','120,00');
INSERT INTO local_dimension VALUES ('4','IST','DEI','Lab3','120,00');
INSERT INTO local_dimension VALUES ('5','IST','DEI','Lab4','120,00');
INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('6','IST','DEG','110,00');
INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('7','IST','DEQ','110,50');

INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('8','FEUP','Central','90,00');
INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('9','FEUP','DEI','95,00');
INSERT INTO local_dimension VALUES ('10','FEUP','DEG','Lab1','50,50');
INSERT INTO local_dimension VALUES ('11','FEUP','DEG','Lab2','50,50');
INSERT INTO local_dimension VALUES ('12','FEUP','DEG','Lab3','50,50');
INSERT INTO local_dimension VALUES ('13','FEUP','DEG','Lab4','50,50');
INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('14','FEUP','DEQ','240,00');

INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('15','Catolica','Central','240,00');
INSERT INTO local_dimension VALUES ('16','Catolica','DMKT','Sala1','450,00');
INSERT INTO local_dimension VALUES ('17','Catolica','DMKT','Sala2','321,00');
INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('18','Catolica','DG','123,00');

INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('19','ISEL','Central','100,50');
INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('20','ISEL','DEI','20,00');
INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('21','ISEL','DEG','270,00');
INSERT INTO local_dimension (local_id, edificio, posto, paga) VALUES ('22','ISEL','DEQ','300,00');


INSERT INTO reserva VALUES ('2016-01','113056729','1','1111','453','aceite','45');
INSERT INTO reserva VALUES ('2016-02','113056729','2','34','765','paga','67');
INSERT INTO reserva VALUES ('2016-03','103246782','3','1020','123','aceite','17');
INSERT INTO reserva VALUES ('2016-04','113056729','4','400','234','aceite','54');
INSERT INTO reserva VALUES ('2016-05','120456781','5','1400','134','paga','32');
INSERT INTO reserva VALUES ('2016-06','120456781','1','123','423','aceite','21');
INSERT INTO reserva VALUES ('2016-07','113056729','7','1321','143','aceite','10');
INSERT INTO reserva VALUES ('2016-08','193336793','8','101','421','aceite','40');
INSERT INTO reserva VALUES ('2016-09','113056729','1','34','133','aceite','81');
INSERT INTO reserva VALUES ('2016-10','113056729','10','10','741','aceite','10');
INSERT INTO reserva VALUES ('2016-11','113056729','20','1','800','aceite','2');
INSERT INTO reserva VALUES ('2016-12','123456719','12','34','324','paga','61');
INSERT INTO reserva VALUES ('2016-13','143856248','5','343','829','paga','70');

-- data_dimension & tempo_dimension are created by a procedure
