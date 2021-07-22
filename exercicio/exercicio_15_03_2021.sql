--  Nosso objetivo é criar meu Banco de Dados 
--  bd_rh_Seg

--  Comentários 

--  Criar banco de dados (bd_rh_Seg) 
create database bd_rh_Seg 

-- trabalhar no ambiente (bd_rh_Seg) 
use bd_rh_Seg 

/* Funcionário
   Data de nascimento
   Cargo – 1 funcionário só pode ter 1 cargo 
   setor – 1 funcionário só pode trabalho em 1 setor
   Salário
*/ 

create table tb_funcionario 
(matricula int not null primary key, 
funcionario char(50),
dt_nascimento date, 
cd_cargo int, 
cd_setor int, 
salario decimal(10,2) )

-- criar tabela de (tb_setor) 

create table tb_setor 
(cd_setor int not null primary key, 
setor char(30) )

-- criar tabela (tb_cargo) 

create table tb_cargo 
(cd_cargo int not null primary key, 
cargo char(30) )


-- relacionamento (integridade referencial) 
-- entre tb_funcionario x tb_setor 

alter table tb_funcionario 
add constraint fk_setor foreign key (cd_setor)
references tb_setor (cd_setor) 

-- relacionamento (integridade referencial) 
-- entre tb_funcionario x tb_cargo 
alter table tb_funcionario 
add constraint fk_cargo foreign key  (cd_cargo) 
references tb_cargo (cd_cargo) 




























