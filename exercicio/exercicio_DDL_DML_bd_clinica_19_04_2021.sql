

drop database bd_clinica_seg 



-- criar o banco de dados bd_clinica_seg

create database bd_clinica_seg

-- utilizar bd_clinica_seg 

use bd_clinica_seg 

-- criar a tabela tb_paciente 

create table tb_paciente
(matricula int not null primary key, 
paciente char(50), 
telefone char(11), 
endereco char(30)) 


-- criar a tabela tb_exame 

create table tb_exame 
(cd_exame int not null primary key, 
exame char(30)) 


-- criar a tabela tb_convenio 

create table tb_convenio 
(cd_convenio int not null primary key, 
convenio char(30)) 

-- criar a tabela de rl_exame_paciente


create table rl_exame_paciente 
(cd_exame int not null, 
cd_convenio int not null, 
matricula int not null, 
dt_exame date not null, 

primary key (cd_exame, cd_convenio, matricula, dt_exame) )



-- criar o relacionamento entre rl_exame_paciente x tb_paciente


alter table rl_exame_paciente 
add constraint fk_paciente foreign key (matricula) 
references tb_paciente (matricula) 


-- criar o relacinamento entre rl_exame_paciente x tb_convenio 

alter table rl_exame_paciente 
add constraint fk_convenio foreign key (cd_convenio) 
references tb_convenio (cd_convenio) 


-- criar o relacionamento entre rl_exame_paciente x tb_exame

alter table rl_exame_paciente 
add constraint fk_exame foreign key (cd_exame) 
references tb_exame (cd_exame) 


alter table rl_exame_paciente 
drop constraint fk_exame 


alter table rl_exame_paciente 
drop constraint fk_convenio 

alter table rl_exame_paciente 
drop constraint fk_paciente 


drop table rl_exame_paciente 


-- criar de uma s� a tabela de relacionamento 

create table rl_exame_paciente 
(cd_exame int not null, 
cd_convenio int not null, 
matricula int not null, 
dt_exame date not null, 

primary key (cd_exame, cd_convenio, matricula, dt_exame), 

constraint fk_exame foreign key (cd_exame) references tb_exame (cd_exame), 

constraint fk_convenio foreign key (cd_convenio) references tb_convenio (cd_convenio), 

constraint fk_matricula foreign key (matricula) references tb_paciente (matricula) )

-- Tabela de exame 


select * from tb_exame 

insert into tb_exame 
(cd_exame, exame) 
values
(1,'Mamografia'),
(2,'Desintometria �ssea' ),
(3,'RM - Resson�ncia Magn�tica' ),
(4,'Tomografia Computadorizada' ),
(5,'Ultra-sonografia' ),
(6,'Ecografia tridimensional'), 
(7,'Ecodopler' )

-- tabela de convenio 

select * from tb_convenio 

insert into tb_convenio 
(cd_convenio, convenio) 
values
(1,'Qualicorp'),
(2,'Allianz' ),
(3,'Cassi' ),
(4,'Bradesco' ) 


-- tabela tb_paciente 

select * from tb_paciente

insert into tb_paciente 
(matricula, paciente, telefone, endereco)
values
(1,'Joao','22101010','Rua 10'),
(2,'Maria','22101011','Rua 11' ),
(3,'Carlos','22101012','Rua 12' ),
(4,'Paula','22101013','Rua 13' ),
(5,'Ricardo','22101014' ,'Rua 14'),
(6,'Hugo','22101015','Rua 15'), 
(7,'Pedro' ,'22101016','Rua 16')


-- tabela de relacionamento - rl_exame_paciente

select * from rl_exame_paciente

insert into rl_exame_paciente
(cd_exame, cd_convenio, matricula, dt_exame)
values
(1,1,1,  '2021-01-01'),
(2,2,2,  '2021-01-02'),
(3,3,3,  '2021-01-03'),
(4,1,4,  '2021-01-04'),
(5,2,1,  '2021-01-05'),
(6,3,2,  '2021-01-06'),
(7,1,3,  '2021-01-07'),
(1,1,4,  '2021-01-08')


-- Exercicio 

--1 Incluir exame PCR

select * from tb_exame 

insert into tb_exame 
(cd_exame, exame) 
values
(8,'PCR') 




--2 Alterar a dt_exame para 2021-04-11 matricula = 1

select * from rl_exame_paciente 

update rl_exame_paciente 
set dt_exame = '2021-04-11' 
where matricula = 1 




--3 Excluir cd_exame = 7 (tb_exame) (v� se � poss�vel ? Explique ? )

select * from rl_exame_paciente

delete tb_exame 
where cd_exame = 7 

-- R. N�o deixou excluir, por causa da integridade referencial 


--4 Excluir cd_exame = 7 (rl_exame_paciente) (v� se � poss�vel ? Explique ? )

delete rl_exame_paciente 
where cd_exame = 7 

R: N�o atingiu a regra de integridade referencial 



--5 lista rl_exame_paciente quando cd_exame = 1

select * from rl_exame_paciente 
where cd_exame = 1 











