
CREATE TABLE Reserva (
numero integer,
primary key(numero));

CREATE TABLE User (
nif integer,
nome varchar(50),
telefone varchar(25),
primary key (nif));

CREATE TABLE Fiscal (
id integer,
empresa varchar (50),
primary key (id));

CREATE TABLE Edificio (
morada varchar(50),
primary key (morada));

CREATE TABLE Reserva (
numero integer,
primary key(numero));

CREATE TABLE Alugavel(
morada varchar(50),
codigo integer,
foto BLOB,
primary key (morada, codigo),
foreign key (morada) references Edificio (morada));

CREATE TABLE Arrenda (
morada varchar(50),
codigo integer,
nif integer,
primary key (morada, codigo),
foreign key (morada, codigo) references Alugavel (morada, codigo),
foreign key (nif) references User(nif));

CREATE TABLE Fiscaliza (
id integer,
morada varchar(50),
codigo integer,
primary key (id, morada, codigo),
foreign key (id) references Fiscal (id),
foreign key (morada, codigo) references Arrenda (morada, codigo));
 
CREATE TABLE Espaco(
morada varchar(50),
codigo integer,
primary key (morada, codigo),
foreign key (morada, codigo) references Alugavel (morada, codigo));

CREATE TABLE Posto (
morada varchar(50),
codigo integer,
codigo_espaco integer,
primary key (morada, codigo),
foreign key (morada, codigo) references Alugavel (morada, codigo),
foreign key (morada, codigo_espaco) references Espaco(morada, codigo));

CREATE TABLE Oferta(
morada varchar(50),
codigo integer,
data_inicio date,
data_fim date,
tarifa double,
primary key (morada, codigo, data_inicio),
foreign key (morada, codigo) references Alugavel (morada, codigo));

CREATE TABLE Aluga (
morada varchar(50),
codigo integer,
data_inicio date,
nif integer,
numero integer,
primary key(morada, codigo, data_inicio, nif, numero),
foreign key (morada, codigo, data_inicio) references Oferta (morada, codigo, data_inicio),
foreign key (nif) references User (nif),
foreign key (numero) references Reserva (numero));

CREATE TABLE Paga (
numero integer,
data date,
metodo varchar (25),
primary key (numero),
foreign key (numero) references Reserva (numero));

CREATE TABLE Estado (
numero integer,
timestamp timestamp,
estado varchar(20),
primary key (numero, timestamp),
foreign key (numero) references Reserva (numero));

