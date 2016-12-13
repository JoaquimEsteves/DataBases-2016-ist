drop procedure if exists query_2; 

delimiter //
/*Queries literally copy pasted from the manuscript*/
create procedure query_2()
	begin
		select distinct P.morada, P.codigo_espaco from posto P
		where (P.morada, P.codigo_espaco) not in (
			select P.morada, P.codigo_espaco from posto P
			natural join aluga A
			natural join estado E where E.estado = 'aceite');
		end //
delimiter ;

/*Allow profiling*/
set profiling=1;

/*Show performance before indices*/
call query_2:
/*Create example indices*/
create index state_index using btree on estado(estado);
call query_2();

/*Results show that the resulting speedup */
show index from estado;

show profiles;
