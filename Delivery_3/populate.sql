INSERT INTO Reserva (numero) VALUES (1);
INSERT INTO Reserva (numero) VALUES (2);
INSERT INTO Reserva (numero) VALUES (3);
INSERT INTO Reserva (numero) VALUES (4);
INSERT INTO Reserva (numero) VALUES (5);
INSERT INTO Reserva (numero) VALUES (6);
INSERT INTO Reserva (numero) VALUES (7);
INSERT INTO Reserva (numero) VALUES (8);
INSERT INTO Reserva (numero) VALUES (9);

INSERT INTO User (nif, nome, telefone) VALUES ('11111','Joaquim','987765432');
INSERT INTO User(nif, nome, telefone) VALUES ('22222', 'Raquel', '999777661');
INSERT INTO User(nif, nome, telefone) VALUES ('33333', 'Ruben', '999777662');
INSERT INTO User(nif, nome, telefone) VALUES ('44444', 'Daniel', '999777663');
INSERT INTO User(nif, nome, telefone) VALUES ('55555', 'Gustav', '999777664');
INSERT INTO User(nif, nome, telefone) VALUES ('66666', 'David', '999777665');
INSERT INTO User(nif, nome, telefone) VALUES ('77777', 'Maurice', '999777666');
INSERT INTO User(nif, nome, telefone) VALUES ('88888', 'Jose', '999777667');
INSERT INTO User(nif, nome, telefone) VALUES ('99999', 'Florian', '999777668');

INSERT INTO Fiscal(id, empresa) VALUES ('110','alpha');
INSERT INTO Fiscal(id, empresa) VALUES ('220','beta');
INSERT INTO Fiscal(id, empresa) VALUES ('330','gamma');
INSERT INTO Fiscal(id, empresa) VALUES ('440','epsilon');
INSERT INTO Fiscal(id, empresa) VALUES ('550','zeta');
INSERT INTO Fiscal(id, empresa) VALUES ('660','eta');
INSERT INTO Fiscal(id, empresa) VALUES ('770','theta');
INSERT INTO Fiscal(id, empresa) VALUES ('880','lota');
INSERT INTO Fiscal(id, empresa) VALUES ('990','kappa');

INSERT INTO Edificio(morada) VALUES ('rua da igreja');
INSERT INTO Edificio(morada) VALUES ('rua da quinta');
INSERT INTO Edificio(morada) VALUES ('rua da praca');
INSERT INTO Edificio(morada) VALUES ('rua do comercio');
INSERT INTO Edificio(morada) VALUES ('rua da agua');
INSERT INTO Edificio(morada) VALUES ('rua da direita');
INSERT INTO Edificio(morada) VALUES ('rua da maca');
INSERT INTO Edificio(morada) VALUES ('rua do telemovel');
INSERT INTO Edificio(morada) VALUES ('rua da avo');

INSERT INTO Alugavel(morada, codigo) VALUES ('rua da igreja','1151');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua da quinta','1152');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua da praca','1153');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua do comercio','1154');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua da agua','1155');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua da direita','1156');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua da maca','1157');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua do telemovel','1158');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua da avo','1159');

INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da igreja','1151','11111');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da quinta','1152','22222');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da praca', '1153','33333');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua do comercio','1154','44444');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da agua','1155','55555');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da direita','1156','66666');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da maca','1157','77777');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua do telemovel','1158','88888');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da avo','1159','99999');

INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('110','rua da igreja','1151');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('220', 'rua da quinta','1152');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('330','rua da praca', '1153');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('440', 'rua do comercio','1154');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('550','rua da agua','1155');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('660', 'rua da direita','1156');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('770', 'rua da maca','1157');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('880', 'rua do telemovel','1158');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('990', 'rua da avo','1159');

INSERT INTO Espaco(morada, codigo) VALUES ('rua da igreja','1151');
INSERT INTO Espaco(morada, codigo) VALUES ('rua da quinta','1152');
INSERT INTO Espaco(morada, codigo) VALUES ('rua da praca', '1153');
INSERT INTO Espaco(morada, codigo) VALUES ('rua do comercio','1154');
INSERT INTO Espaco(morada, codigo) VALUES ('rua da agua','1155');
INSERT INTO Espaco(morada, codigo) VALUES ('rua da direita','1156');
INSERT INTO Espaco(morada, codigo) VALUES ('rua da maca','1157');
INSERT INTO Espaco(morada, codigo) VALUES ('rua do telemovel','1158');
INSERT INTO Espaco(morada, codigo) VALUES ('rua da avo','1159');

INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da igreja','1151','1151');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da quinta','1152','1152');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da praca', '1153','1153');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua do comercio','1154','1154');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da agua','1155','1155');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da direita','1156','1156');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da maca','1157','1157');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua do telemovel','1158','1158');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da avo','1159','1159');

INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da igreja','1151', '2017-11-18', '2020-11-19','300');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da igreja', '1151', '2017-11-19', '2029-01-20','200');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da igreja', '1151', '2016-11-19', '2066-11-20','231');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua do igreja', '1151', '2003-11-19', '2013-11-20','600');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da igreja', '1151', '1991-11-19', '2040-11-20','223');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da direita', '1156', '2017-11-19', '2017-11-20','264');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da maca', '1157', '2017-11-19', '2019-03-11','242');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua do telemovel', '1158', '2017-11-19', '2017-11-20','1100');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da avo', '1159', '2017-11-19', '2018-06-04','23');

INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da igreja','1151', '2017-11-18', '11111', '1');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da igreja', '1151', '2017-11-19', '22222', '2');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da igreja', '1151', '2016-11-19', '33333', '3');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua do igreja', '1151', '2003-11-19', '44444', '4');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da igreja', '1151', '1991-11-19', '55555', '5');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da direita', '1156', '2017-11-19', '66666', '6');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da maca', '1157', '2017-11-19', '77777', '7');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua do telemovel', '1158', '2017-11-19', '88888', '8');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da avo', '1159', '2017-11-19', '99999', '9');

INSERT INTO Paga(numero, data, metodo) VALUES ('1','2017-11-18','CASH');
INSERT INTO Paga(numero, data, metodo) VALUES ('2','2017-11-19','MB');
INSERT INTO Paga(numero, data, metodo) VALUES ('3','2016-11-19','MB');
INSERT INTO Paga(numero, data, metodo) VALUES ('4','2003-11-19','CASH');
INSERT INTO Paga(numero, data, metodo) VALUES ('5','1991-11-19','MB');
INSERT INTO Paga(numero, data, metodo) VALUES ('6','2017-11-19','MB');
INSERT INTO Paga(numero, data, metodo) VALUES ('7','2017-11-19','MB');
INSERT INTO Paga(numero, data, metodo) VALUES ('8','2017-11-19','MB');
INSERT INTO Paga(numero, data, metodo) VALUES ('9','2017-11-19','MB');

INSERT INTO Estado(numero, timestamp, estado) VALUES ('1', '1993-01-11 13:33:32.000001', 'aceite');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('2', '2012-05-23 21:43:35.000001', 'pendente');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('3', '1991-01-15 13:55:34.000001', 'pendente');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('4', '2014-04-16 22:11:45.000001', 'pendente');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('5', '2016-01-06 16:14:13.000001', 'aceite');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('6', '2016-04-03 02:13:11.000001', 'pendente');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('7', '2012-12-19 13:13:15.000001', 'aceite');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('8', '2003-06-02 14:16:00.000001', 'pendente');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('9', '2002-04-23 13:27:15.000001', 'aceite');
