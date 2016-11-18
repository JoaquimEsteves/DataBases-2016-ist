insert into User (nif, nome, telefone) values ('11111','Joaquim','987765432');
insert into User(nif, nome, telefone) values ('22222', 'Raquel', '999777666');

insert into Fiscal(id, empresa) values ('123','sical');
insert into Fiscal(id, empresa) values ('456','delta');

insert into Edificio(morada) values ('rua da igreja');
insert into Edificio(morada) values ('rua da quinta');

insert into Arrenda(morada, codigo, nif) values ('rua da igreja','898','11111');
insert into Arrenda(morada, codigo, nif) values ('rua da quinta','989','22222');

insert into Fiscaliza(id, morada, codigo) values ('123','rua da igreja','898');
insert into Fiscaliza(id, morada, codigo) values ('456', 'rua da quinta', '989');

insert into Espaco(morada, codigo) values ('rua da igreja','898');
insert into Espaco(morada, codigo) values ('rua da quinta', '989');

insert into Posto(morada, codigo, codigo_espaco) values ('rua da igreja','898','898');
insert into Posto(morada, codigo, codigo_espaco) values ('rua da quinta', '989','989');

insert into Alugavel(morada, codigo) values ('rua da igreja', '898');
insert into Alugavel(morada, codigo) values ('rua da quinta', '989');

insert into Oferta(morada, codigo, data_inicio, data_fim, tarifa) values ('rua da igreja','898', '2017-11-18', '2017-11-19','300');
insert into Oferta(morada, codigo, data_inicio, data_fim, tarifa) values ('rua da quinta', '989', '2017-11-19', '2017-11-20','200');

insert into Aluga(morada, codigo, data_inicio, nif, numero) values ('rua da igreja', '898', '2017-11-18', '11111', '1');
insert into Aluga(morada, codigo, data_inicio, nif, numero) values ('rua da quinta', '989', '2017-11-19', '22222', '2');

insert into Paga(numero, data, metodo) values ('1','2017-11-18','CASH');
insert into Paga(numero, data, metodo) values ('2','2017-11-19','MB');

INSERT INTO Reserva (numero) VALUES (1);
INSERT INTO Reserva (numero) VALUES (2);

SET time_zone='+00:00';

INSERT INTO Estado(timestamp , estado) VALUES (‘2016-11-18 15:17:56’, ‘aceite’);
INSERT INTO Estado(timestamp , estado) VALUES (‘2016-11-18 17:23:12’, ‘pendente’);

