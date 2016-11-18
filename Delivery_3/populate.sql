INSERT INTO Reserva (numero) VALUES (1);
INSERT INTO Reserva (numero) VALUES (2);

INSERT INTO User (nif, nome, telefone) VALUES ('11111','Joaquim','987765432');
INSERT INTO User(nif, nome, telefone) VALUES ('22222', 'Raquel', '999777666');

INSERT INTO Fiscal(id, empresa) VALUES ('123','sical');
INSERT INTO Fiscal(id, empresa) VALUES ('456','delta');

INSERT INTO Edificio(morada) VALUES ('rua da igreja');
INSERT INTO Edificio(morada) VALUES ('rua da quinta');

INSERT INTO Alugavel(morada, codigo) VALUES ('rua da igreja', '898');
INSERT INTO Alugavel(morada, codigo) VALUES ('rua da quinta', '989');

INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da igreja','898','11111');
INSERT INTO Arrenda(morada, codigo, nif) VALUES ('rua da quinta','989','22222');

INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('123','rua da igreja','898');
INSERT INTO Fiscaliza(id, morada, codigo) VALUES ('456', 'rua da quinta', '989');

INSERT INTO Espaco(morada, codigo) VALUES ('rua da igreja','898');
INSERT INTO Espaco(morada, codigo) VALUES ('rua da quinta', '989');

INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da igreja','898','898');
INSERT INTO Posto(morada, codigo, codigo_espaco) VALUES ('rua da quinta', '989','989');

INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da igreja','898', '2017-11-18', '2017-11-19','300');
INSERT INTO Oferta(morada, codigo, data_inicio, data_fim, tarifa) VALUES ('rua da quinta', '989', '2017-11-19', '2017-11-20','200');

INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da igreja', '898', '2017-11-18', '11111', '1');
INSERT INTO Aluga(morada, codigo, data_inicio, nif, numero) VALUES ('rua da quinta', '989', '2017-11-19', '22222', '2');

INSERT INTO Paga(numero, data, metodo) VALUES ('1','2017-11-18','CASH');
INSERT INTO Paga(numero, data, metodo) VALUES ('2','2017-11-19','MB');

INSERT INTO Estado(numero, timestamp, estado) VALUES ('1', '1993-01-02 13:14:15.000001', 'aceite');
INSERT INTO Estado(numero, timestamp, estado) VALUES ('2', '2012-01-02 13:14:15.000001', 'pendente');
