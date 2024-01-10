-- Criando índices em Banco de Dados --
show databases;
use company_constraints;

show tables;
desc employee;
desc departament;
desc dept_locations;

-- A criação do índice pode ser criada via ALTER TABLE ou CREATE Statement, como segue o exemplo: 
-- ALTER TABLE customer ADD UNIQUE index_email(email); 
-- CREATE INDEX index_ativo_hash ON exemplo(ativo) USING HASH; 

alter table employee add index employee_salary(Salary);
alter table employee add index employee_department(Dno);
alter table employee add index employee_name(Fname);
alter table employee add index father_mother_code(Essn);
alter table dependent add index relation_dependent(Relationship);
alter table project add index project_location(Plocation);
alter table departament add index mgr_start_at_dept_idx(Mgr_start_date);
alter table departament add index dept_create_dt_idx(Dept_create_date);

-- Qual o departamento com maior número de pessoas? --
select count(*) as Qtd_Pessoas, Dnumber, Dname, Dept_create_date
	from departament d
	left join employee e on e.Dno = d.Dnumber
    group by Dnumber 
    order by Qtd_Pessoas desc;


-- Quais são os departamentos por cidade? 
select Dnumber, Dname, Dlocation 
	from dept_locations
    natural join departament
    order by Dnumber desc;


-- Relação de empregrados por departamento 
select Dnumber, Dname, concat(Fname, ' ', Minit, ' ', Lname) as Employee_Name
	from Employee e
    left join Departament d
    on e.Dno = d.Dnumber
    order by d.Dnumber desc;






















































































