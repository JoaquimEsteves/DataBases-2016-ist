drop procedure if exists query_1;


delimiter //
/*Queries literally copy pasted from the manuscript*/
create procedure query_1()
	begin
		select A.nif from arrenda A
		inner join fiscaliza F on A.morada = F.morada and A.codigo = F.codigo
		group by A.nif
		having count(distinct F.id) = 1;
	end //
delimiter ;

/*Allow profiling*/
set profiling=1;

/*Show performance before indices*/
call query_1;
/*Create example indices*/
create index address_index using btree on arrenda(morada);
create index code_index using btree on arrenda(codigo);
call query_1();

/*Results show that the creation of primary and foreign key indices is quite frankly not worth it*/
show index from arrenda;

show profiles;
