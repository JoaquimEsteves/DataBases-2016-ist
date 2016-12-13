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


INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('1','IST','Central');
INSERT INTO local_dimension VALUES ('2','IST','DEI','Lab1');
INSERT INTO local_dimension VALUES ('3','IST','DEI','Lab2');
INSERT INTO local_dimension VALUES ('4','IST','DEI','Lab3');
INSERT INTO local_dimension VALUES ('5','IST','DEI','Lab4');
INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('6','IST','DEG');
INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('7','IST','DEQ');

INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('8','FEUP','Central');
INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('9','FEUP','DEI');
INSERT INTO local_dimension VALUES ('10','FEUP','DEG','Lab1');
INSERT INTO local_dimension VALUES ('11','FEUP','DEG','Lab2');
INSERT INTO local_dimension VALUES ('12','FEUP','DEG','Lab3');
INSERT INTO local_dimension VALUES ('13','FEUP','DEG','Lab4');
INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('14','FEUP','DEQ');

INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('15','Catolica','Central');
INSERT INTO local_dimension VALUES ('16','Catolica','DMKT','Sala1');
INSERT INTO local_dimension VALUES ('17','Catolica','DMKT','Sala2');
INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('18','Catolica','DG');

INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('19','ISEL','Central');
INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('20','ISEL','DEI');
INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('21','ISEL','DEG');
INSERT INTO local_dimension (local_id, edificio, posto) VALUES ('22','ISEL','DEQ');


INSERT INTO reserva VALUES ('2016-01','113056729','1','1111','453','aceite','250,00','30');
INSERT INTO reserva VALUES ('2016-02','113056729','2','34','765','paga','123,00','30');
INSERT INTO reserva VALUES ('2016-03','103246782','3','1020','123','aceite','1000,00','60');
INSERT INTO reserva VALUES ('2016-04','113056729','4','400','234','aceite','250,00','30');
INSERT INTO reserva VALUES ('2016-05','120456781','5','1400','134','paga','300,00','28');
INSERT INTO reserva VALUES ('2016-06','120456781','6','123','423','aceite','250,00','23');
INSERT INTO reserva VALUES ('2016-07','113056729','7','1321','143','aceite','250,00','10');
INSERT INTO reserva VALUES ('2016-08','193336793','8','101','421','aceite','250,00','45');
INSERT INTO reserva VALUES ('2016-09','113056729','9','34','133','aceite','100,00','34');
INSERT INTO reserva VALUES ('2016-10','113056729','10','10','741','aceite','230,50','84');
INSERT INTO reserva VALUES ('2016-11','113056729','11','1','800','aceite','250,00','90');
INSERT INTO reserva VALUES ('2016-12','123456719','12','34','324','paga','333,00','12');
INSERT INTO reserva VALUES ('2016-13','143856248','13','343','829','paga','666,00','23');

-- data_dimension & tempo_dimension are created by a procedure
  
