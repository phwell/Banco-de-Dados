

use master 

Create database bd_rh_seg

use bd_rh_seg

create table tb_funcionario
(matricula int not null primary key,
funcionario char(50),
dt_nascimento date,
cd_setor int,
cd_cargo int,
salario money)

create table tb_cargo
(cd_cargo int not null primary key,
cargo char(20))

create table tb_setor 
(cd_setor int not null primary key,
setor char(30))

alter table tb_funcionario
add constraint fk_setor foreign key (cd_setor) 
references tb_setor (cd_setor)

alter table tb_funcionario
add constraint fk_cargo foreign key (cd_cargo) 
references tb_cargo (cd_cargo)

insert into tb_setor (cd_setor, setor) values (1, 'Enfermaria') 

insert into tb_setor (cd_setor, setor) values (2, 'Administracao') 

insert into tb_setor (cd_setor, setor) values (3, 'Informatica') 

insert into tb_setor (cd_setor, setor) values (4, 'Engenharia') 

insert into tb_setor (cd_setor, setor) values (5, 'Juridico') 

insert into tb_setor (cd_setor, setor) values (6, 'Logistica') 

insert into tb_setor (cd_setor, setor) values (7, 'Presidencia')


insert into tb_cargo (cd_cargo, cargo) values (1, 'Enfermeiro(a)') 

insert into tb_cargo (cd_cargo, cargo) values (2, 'Administrador(a)') 

insert into tb_cargo (cd_cargo, cargo) values (3, 'Analista') 

insert into tb_cargo (cd_cargo, cargo) values (4, 'Engenheiro(a)') 

insert into tb_cargo (cd_cargo, cargo) values (5, 'Advogado(a)') 

insert into tb_cargo (cd_cargo, cargo) values (6, 'Gerente') 

insert into tb_cargo (cd_cargo, cargo) values (7, 'Executivo(a)') 


insert into tb_funcionario  (matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
Values  (1,'Ana Clara', '1977-07-05',  5, 1, 3000) 

insert into tb_funcionario (matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
Values  (2,'Patricia Azevedo', '1944-07-04', 1, 1, 4000) 

insert into tb_funcionario  (matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
values
(3,'Jose Maria', '1971-05-10', 3, 1, 6000) 

insert into tb_funcionario  (matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
Values  (4,'Sonia Abrantes', '1979-05-29',  4, 1, 7000) 

insert into tb_funcionario  (matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
Values  (5,'Valdir Reinaldo', '1960-09-22',  2, 2, 16000) 

insert into tb_funcionario   (matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
Values  (6,'Jose Alberto', '1955-01-13',  2, 2, 15000) 
