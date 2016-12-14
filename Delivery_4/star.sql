DROP TABLE IF EXISTS reservation_fact;
DROP TABLE IF EXISTS user_dimension;
DROP TABLE IF EXISTS local_dimension;
DROP TABLE IF EXISTS time_dimension;
DROP TABLE IF EXISTS date_dimension;
DROP TABLE IF EXISTS status_dimension;

CREATE TABLE user_dimension (
        user_nif varchar (9) NOT NULL UNIQUE,
        user_name varchar (80) NOT NULL,
        user_telephone varchar (26) NOT NULL,
        primary key(user_nif));

CREATE TABLE local_dimension (
        local_id integer NOT NULL UNIQUE,
        local_building varchar (255) NOT NULL,
        local_post varchar (255) DEFAULT 'NO POSTO AVAILABLE',
        local_space varchar (255) DEFAULT 'NO ESPACO AVAILABLE',
        payed_amount numeric (19,4) NOT NULL,
        primary key (local_id));

CREATE TABLE time_dimension (
        time_id integer NOT NULL UNIQUE,
        time_hour integer NOT NULL,
        time_minute integer NOT NULL,
        primary key (time_id));

CREATE TABLE date_dimension (
        date_id timestamp NOT NULL UNIQUE,
        date_day varchar (255),
        date_week varchar (255),
        date_month varchar (255),
        date_year varchar (255),
        date_semester varchar (255),
        primary key(date_id));

CREATE TABLE status_dimension (
        status_id integer NOT NULL UNIQUE,
        status varchar(255));

CREATE TABLE reservation_fact (
        reservation_id varchar (255) NOT NULL UNIQUE,
        user_nif varchar (9) NOT NULL,
        local_id integer NOT NULL,
        time_id integer NOT NULL,
        date_id timestamp NOT NULL,
        status_id integer NOT NULL,
        duration_in_days integer NOT NULL,
        primary key (reservation_id, user_nif, local_id, time_id, date_id, status_id),
        foreign key (user_nif)  references user_dimension (user_nif),
        foreign key (local_id)  references local_dimension (local_id),
        foreign key (time_id)   references time_dimension (time_id),
        foreign key (date_id)   references date_dimension (date_id),
        foreign key (status_id) references status_dimension (status_id));
