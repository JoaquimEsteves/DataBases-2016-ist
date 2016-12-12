DROP TABLE IF EXISTS reserva;
DROP TABLE IF EXISTS user_dimension;
DROP TABLE IF EXISTS local_dimension;
DROP TABLE IF EXISTS tempo_dimension;
DROP TABLE IF EXISTS data_dimension;



CREATE TABLE user_dimension (
        nif varchar(9) NOT NULL UNIQUE,
        nome varchar(80) NOT NULL,
        telefone varchar(26) NOT NULL,
        primary key(nif));

CREATE TABLE local_dimension (
        local_id integer NOT NULL UNIQUE,
        posto varchar(255) NOT NULL,
        espaco varchar(255) NOT NULL,
        edificio varchar(255) NOT NULL UNIQUE,
        primary key (local_id));

CREATE TABLE tempo_dimension (
        tempo_id integer NOT NULL UNIQUE,
        hora integer,
        minuto integer,
        primary key (tempo_id));

CREATE TABLE data_dimension (
        data_id integer NOT NULL UNIQUE,
        dia integer,
        semana integer,
        mes varchar(255),
        ano integer,
        semestre integer,
        primary key(data_id));

CREATE TABLE reserva (
        numero varchar(255) NOT NULL UNIQUE,
        nif varchar(9) NOT NULL UNIQUE,
        local_id integer NOT NULL UNIQUE,
        tempo_id integer NOT NULL UNIQUE,
        data_id integer NOT NULL UNIQUE,
        estado varchar(255) NOT NULL,
        montante numeric(19,4) NOT NULL,
        duracao integer,
        primary key(numero, nif, local_id, tempo_id, data_id),
        foreign key (nif) references user_dimension(nif)ON DELETE CASCADE,
        foreign key (local_id) references local_dimension(local_id)ON DELETE CASCADE,
        foreign key (tempo_id) references tempo_dimension(tempo_id)ON DELETE CASCADE,
        foreign key (data_id) references data_dimension(data_id)ON DELETE CASCADE);

