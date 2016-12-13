DROP TABLE IF EXISTS reservation_fact;
DROP TABLE IF EXISTS user_dimension;
DROP TABLE IF EXISTS local_dimension;
DROP TABLE IF EXISTS time_dimension;
DROP TABLE IF EXISTS date_dimension;


CREATE TABLE user_dimension (
        nif varchar(9) NOT NULL UNIQUE,
        nome varchar(80) NOT NULL,
        telefone varchar(26) NOT NULL,
        primary key(nif));

CREATE TABLE local_dimension (
        local_id integer NOT NULL UNIQUE,
        edificio varchar(255) NOT NULL ,
        posto varchar(255) DEFAULT 'NO POSTO AVAILABLE',
        espaco varchar(255) DEFAULT 'NO ESPACO AVAILABLE',
        primary key (local_id));

CREATE TABLE time_dimension (
        tempo_id integer NOT NULL UNIQUE,
        hora integer,
        minuto integer,
        primary key (tempo_id));

CREATE TABLE date_dimension (
        data_id integer NOT NULL UNIQUE,
        dia integer,
        semana integer,
        mes varchar(255),
        ano integer,
        semestre integer,
        primary key(data_id));

CREATE TABLE reservation_fact (
        numero varchar(255) NOT NULL UNIQUE,
        nif varchar(9) NOT NULL,
        local_id integer NOT NULL,
        tempo_id integer NOT NULL,
        data_id integer NOT NULL,
        estado varchar(255) NOT NULL,
        duracao integer NOT NULL,
        primary key(numero, nif, local_id, tempo_id, data_id),
        foreign key (nif) references user_dimension(nif) ON DELETE CASCADE,
        foreign key (local_id) references local_dimension(local_id) ON DELETE CASCADE,
        foreign key (tempo_id) references time_dimension(tempo_id) ON DELETE CASCADE,
        foreign key (data_id) references date_dimension(data_id) ON DELETE CASCADE);
