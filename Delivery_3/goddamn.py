import uuid
from datetime import date
import random
import time    

def my_random_string(string_length=10):
     """Returns a random string of length string_length."""
     random = str(uuid.uuid4()) # Convert UUID format to a Python string.
     random = random.upper() # Make all characters uppercase.
     random = random.replace("-","") # Remove the UUID '-'.
     return random[0:string_length] # Return the random string.

"""DROP PROCEDURE IF EXISTS populate_all;


DELIMITER $$

CREATE PROCEDURE populate_all()
BEGIN
    DECLARE morada varchar(255);
    DECLARE codigo varchar(255);
    DECLARE nif varchar(9);
    DECLARE data_inicio date;
    DECLARE numero varchar(255);
    DECLARE time_stamp timestamp;
    DECLARE ce varchar(255);
    
    SET @i = 0;
    SET @pivot_ts = '2013-01-15 22:15:45';
    SET @max_span = 432000;
    SET @bias = SIGN(-0.5 + RAND());
    SET @id = 45;
    
    WHILE @i < 1000
    DO
    
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO ce;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO morada;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO codigo;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO nif;
        SELECT SUBSTRING(MD5(RAND()) FROM 1 FOR 10) INTO numero;
        SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(@pivot_ts) + ( @bias * (FLOOR(RAND()*@max_span)) )) INTO time_stamp;
        SELECT FLOOR(7 + (RAND() * 5)) INTO data_inicio;
        
        INSERT INTO edificio(morada) VALUES(morada);
        INSERT INTO user(nif) VALUES(nif);
        INSERT INTO fiscal(id) VALUES(@id);
        INSERT INTO alugavel(morada, codigo) VALUES(morada, codigo);
        INSERT INTO arrenda(morada, codigo,nif) VALUES(morada, codigo,nif);
        INSERT INTO fiscaliza(id, morada, codigo) VALUES(id, morada, codigo);
        
        INSERT INTO oferta(morada, codigo, data_inicio) VALUES(morada, codigo, data_inicio);
        
        INSERT INTO reserva(numero) VALUES(numero);
        INSERT INTO estado(numero, time_stamp) VALUES(numero, time_stamp);
        INSERT INTO aluga(morada, codigo, data_inicio, nif, numero) VALUES(morada, codigo,data_inicio, nif,numero);
        INSERT INTO espaco(morada, codigo) VALUES(morada, codigo);
        INSERT INTO posto(morada, codigo, codigo_espaco) VALUES(morada, ce, codigo);
        
        SET @i = @i+1;
        SET @id = @id+2;
        
    END WHILE;
END;
$$

DELIMITER ;
"""
start_date = date.today().replace(day=1, month=1).toordinal()
end_date = date.today().toordinal()
random_day = date.fromordinal(random.randint(start_date, end_date)).strftime('%Y-%m-%d')


#strsplit = str1.splitlines()
my_id = 1;
possible_states = ['Aceite', 'Pago']
print "START THE CYCLE FAM"
for i in range(0,1):
        morada = my_random_string(255)
        codigo = my_random_string(255)
        nif = my_random_string(9)
        my_id += 1
        data_inicio = random_day
        numero = my_random_string(255)
        timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
        #code_space = my_random_string(255)
        print "INSERT INTO edificio(morada) VALUES('"+morada+"');"
        print "INSERT INTO user(nif) VALUES('"+nif+"');"
        print "INSERT INTO fiscal(id) VALUES("+str(my_id)+");"
        print "INSERT INTO alugavel(morada, codigo) VALUES('"+morada+"','"+codigo+"');"
        print "INSERT INTO arrenda(morada, codigo,nif) VALUES('"+morada+"','"+ codigo+"','"+nif+"');"
        print "INSERT INTO fiscaliza(id, morada, codigo) VALUES("+str(my_id)+",'"+ morada+"','"+ codigo+"');"
        print "INSERT INTO oferta(morada, codigo, data_inicio) VALUES('"+morada+"','"+ codigo+"','"+ data_inicio+"',"+str(my_id)+".00);"
        print "INSERT INTO reserva(numero) VALUES('"+numero+"');"
        print "INSERT INTO estado(numero, time_stamp) VALUES('"+numero+"','"+ timestamp+"','"+random.choice(possible_states)+"');"
        print "INSERT INTO aluga(morada, codigo, data_inicio, nif, numero) VALUES('"+morada+"','"+ codigo+"','"+data_inicio+"','"+ nif+"','"+numero+"');"
        print "INSERT INTO espaco(morada, codigo) VALUES('"+morada+"', '"+codigo+"');"
        codigo_espaco = codigo
        codigo = my_random_string(255)
        print "INSERT INTO posto(morada, codigo, codigo_espaco) VALUES('"+morada+"','"+ codigo_espaco+"', '"+codigo+"');"
