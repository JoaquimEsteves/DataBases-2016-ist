drop table if exists estado;
drop table if exists paga;
drop table if exists aluga;
drop table if exists reserva;
drop table if exists oferta;
drop table if exists posto;
drop table if exists espaco;
drop table if exists fiscaliza;
drop table if exists arrenda;
drop table if exists alugavel;
drop table if exists edificio;
drop table if exists fiscal;
drop table if exists user;


create table user (
    nif varchar(9) ,
    nome varchar(80) ,
    telefone varchar(26) ,
    primary key(nif));

create table fiscal (
    id int   ,
    empresa varchar(255)  ,
    primary key(id));

create table edificio (
    morada varchar(255)   ,
    primary key(morada));

create table alugavel (
    morada varchar(255)  ,
    codigo varchar(255)  ,
    foto varchar(255)  ,
    primary key(morada, codigo),
    foreign key(morada) references edificio(morada)ON DELETE CASCADE ON UPDATE CASCADE);

create table arrenda (
    morada varchar(255)  ,
    codigo varchar(255)  null,
    nif varchar(9)  ,
    primary key(morada, codigo),
    foreign key(morada, codigo) references alugavel(morada, codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(nif) references user(nif) ON DELETE CASCADE ON UPDATE CASCADE);

create table fiscaliza (
    id int  ,
    morada varchar(255)   ,
    codigo varchar(255)   ,
    primary key(id, morada, codigo),
    foreign key(morada, codigo) references arrenda(morada, codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(id) references fiscal(id));

create table espaco (
    morada varchar(255)  ,
    codigo varchar(255)  ,
    primary key(morada, codigo),
    foreign key(morada, codigo) references alugavel(morada, codigo)ON DELETE CASCADE ON UPDATE CASCADE);

create table posto (
    morada varchar(255)  ,
    codigo varchar(255)  ,
    codigo_espaco varchar(255)  ,
    primary key(morada, codigo),
    foreign key(morada, codigo) references alugavel(morada, codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(morada, codigo_espaco) references espaco(morada, codigo) ON DELETE CASCADE ON UPDATE CASCADE);

create table oferta (
    morada varchar(255),
    codigo varchar(255),
    data_inicio date ,
    data_fim date,
    tarifa numeric(19,4)
    primary key(morada, codigo, data_inicio),
    foreign key(morada, codigo) references alugavel(morada, codigo) ON DELETE CASCADE ON UPDATE CASCADE);

create table reserva (
    numero varchar(255) ,
    primary key(numero));

create table aluga (
    morada varchar(255) ,
    codigo varchar(255) ,
    data_inicio date ,
    nif varchar(9) ,
    numero varchar(255) ,
    primary key(morada, codigo, data_inicio, nif, numero),
    foreign key(morada, codigo, data_inicio) references oferta(morada, codigo, data_inicio) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(nif) references user(nif) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(numero) references reserva(numero) ON DELETE CASCADE ON UPDATE CASCADE);

create table paga (
    numero varchar(255) ,
    data timestamp ,
    metodo varchar(255) ,
    primary key(numero),
    foreign key(numero) references reserva(numero) ON DELETE CASCADE ON UPDATE CASCADE);

create table estado (
    numero varchar(255),
    time_stamp timestamp ,
    estado varchar(255),
    primary key(numero, time_stamp),
    foreign key(numero) references reserva(numero) ON DELETE CASCADE ON UPDATE CASCADE);
