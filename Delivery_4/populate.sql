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


INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('1','IST','Central','20,00');
INSERT INTO local_dimension VALUES ('2','IST','DEI','Lab1','25,00');
INSERT INTO local_dimension VALUES ('3','IST','DEI','Lab2','50,00');
INSERT INTO local_dimension VALUES ('4','IST','DEI','Lab3','100,00');
INSERT INTO local_dimension VALUES ('5','IST','DEI','Lab4','30,00');
INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('6','IST','DEG','25,00');
INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('7','IST','DEQ','28,00');

INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('8','FEUP','Central','33,00');
INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('9','FEUP','DEI','55,00');
INSERT INTO local_dimension VALUES ('10','FEUP','DEG','Lab1','50,00');
INSERT INTO local_dimension VALUES ('11','FEUP','DEG','Lab2','200,00');
INSERT INTO local_dimension VALUES ('12','FEUP','DEG','Lab3','10,00');
INSERT INTO local_dimension VALUES ('13','FEUP','DEG','Lab4','5,00');
INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('14','FEUP','DEQ','125,00');

INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('15','Catolica','Central','202,00');
INSERT INTO local_dimension VALUES ('16','Catolica','DMKT','Sala1','50,00');
INSERT INTO local_dimension VALUES ('17','Catolica','DMKT','Sala2','70,00');
INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('18','Catolica','DG','80,00');

INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('19','ISEL','Central','20,00');
INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('20','ISEL','DEI','80,00');
INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('21','ISEL','DEG','90,00');
INSERT INTO local_dimension (local_id, local_building, local_post, payed_amount) VALUES ('22','ISEL','DEQ','200,00');

INSERT INTO status_dimension VALUES ('0','unpaid');
INSERT INTO status_dimension VALUES ('1','payed');

INSERT INTO reservation_fact VALUES ('2016-01','113056729','1','111','453','0','30');
INSERT INTO reservation_fact VALUES ('2016-02','113056729','2','34','765','0','30');
INSERT INTO reservation_fact VALUES ('2016-03','103246782','1','102','123','1','60');
INSERT INTO reservation_fact VALUES ('2016-04','113056729','4','400','234','0','30');
INSERT INTO reservation_fact VALUES ('2016-05','120456781','5','14','134','1','28');
INSERT INTO reservation_fact VALUES ('2016-06','120456781','1','123','423','0','23');
INSERT INTO reservation_fact VALUES ('2016-07','113056729','7','132','143','1','10');
INSERT INTO reservation_fact VALUES ('2016-08','193336793','8','101','421','0','45');
INSERT INTO reservation_fact VALUES ('2016-09','120456781','9','34','133','0','34');
INSERT INTO reservation_fact VALUES ('2016-10','120456781','10','10','741','0','84');
INSERT INTO reservation_fact VALUES ('2016-11','113056729','1','1','800','0','90');
INSERT INTO reservation_fact VALUES ('2016-12','123456719','12','34','324','1','12');
INSERT INTO reservation_fact VALUES ('2016-13','103246782','3','343','829','1','23');
INSERT INTO reservation_fact VALUES ('2016-14','103246782','13','223','829','1','23');
INSERT INTO reservation_fact VALUES ('2016-15','143856248','15','323','749','1','23');
INSERT INTO reservation_fact VALUES ('2016-16','143856248','13','243','829','0','30');
INSERT INTO reservation_fact VALUES ('2016-17','120456781','13','343','623','1','23');
INSERT INTO reservation_fact VALUES ('2016-18','143856248','20','33','829','1','23');
INSERT INTO reservation_fact VALUES ('2016-19','143856248','13','34','87','1','23');
INSERT INTO reservation_fact VALUES ('2016-20','120456781','12','343','829','0','11');
INSERT INTO reservation_fact VALUES ('2016-21','113056729','13','343','555','1','23');
INSERT INTO reservation_fact VALUES ('2016-22','103246782','10','343','829','0','56');
INSERT INTO reservation_fact VALUES ('2016-23','143856248','13','343','567','1','111');
INSERT INTO reservation_fact VALUES ('2016-24','103246782','2','343','829','0','23');
INSERT INTO reservation_fact VALUES ('2016-25','143856248','2','343','829','1','22');
INSERT INTO reservation_fact VALUES ('2016-26','143856248','10','100','829','1','80');

-- date_dimension & time_dimension are created by a procedure
