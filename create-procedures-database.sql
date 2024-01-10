-- Utilização de procedures para manipulação de dados em Banco de Dados 
show databases;
use company_constraints;

show tables;
desc employee;
desc departament;
desc dept_locations;

select * from departament;

-- Criar uma procedure que possua as instruções de inserção, remoção e atualização de dados no banco de dados. 
-- As instruções devem estar dentro de estruturas condicionais (como CASE ou IF).  
-- Além das variáveis de recebimento das informações, a procedure deverá possuir uma variável de controle. 
-- Essa variável de controle irá determinar a ação a ser executada. Ex: opção 1 – select, 2 – update, 3 – delete. 

delimiter //
create procedure new_departament(
	Dname_a varchar(30),
    Dnumber_a int,
    Mgr_ssn_a int,
    Mgr_start_date_a date,
    Dept_create_date_a date)

begin
	insert into departament (Dname, Dnumber, Mgr_ssn, Mgr_start_date, Dept_create_date)
    values(Dname_a, Dnumber_a, Mgr_ssn_a, Mgr_start_date_a, Dept_create_date_a);
end //
delimiter ;

drop procedure new_departament;
call new_departament('Financial', 6, 987654321, null, null);

delimiter //
create procedure data_manipulation(
	num int,
    dpt_num int,
    in dept_loc varchar(40)
)

begin
	case num
		when 1 then
			insert into departament(Dnumber,Dname,Dept_create_date) 
			values (dpt_num,dept_loc,current_date());
            select * from company.departament;            
		when 2 then 
			delete from departament where Dnumber = dpt_num;
			select * from company.departament;  
		when 3 then
			update departament set Dname = 'Research' where Dnumber = dept_num;
			select * from company.departament;
		else
			select * from company.departament;
	end case;
end //
delimiter ;

drop procedure data_manipulation;
call data_manipulation(null,null,'');
