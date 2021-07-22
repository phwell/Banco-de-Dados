-- excluir banco de dados 
use master 

drop database bd_livro_seg 


-- Comandos de DDL - Linguagem de Definição de Dados 
--  criar meu banco de dados 

create database bd_livro_seg

-- acessar meu banco de dados 

use bd_livro_seg 

-- criar a tabela (tb_editora) 

create table tb_editora
(cd_editora int not null primary key, 
editora char(30) )

-- criar a tabela (tb_genero) 

create table tb_genero 
(cd_genero int not null primary key,
genero char(30) )

-- criar a tabela (tb_livro) 

create table tb_livro 
(isbn int not null primary key,
titulo char(50), 
cd_editora int,
cd_genero int, 
preco decimal(12,2) )


--  SQL Server MS 

create table tb_livro 
(isbn int not null primary key,
titulo char(50), 
cd_editora int,
cd_genero int, 
preco money )


-- relacionamento (integridade referencial) 

-- entre tb_livro x tb_editora 

alter table tb_livro 
add constraint fk_editora foreign key (cd_editora) 
references tb_editora (cd_editora) 


-- entre tb_livro x tb_genero 

alter table tb_livro 
add constraint fk_genero foreign key (cd_genero) 
references tb_genero (cd_genero) 


-- criar um campo dt_livro - date - tabela tb_livro 





--  incluir tb_genero 

select * from tb_genero 

insert into tb_genero 
(cd_genero, genero) 
values 
(1 , 'Computacao'),
(2 , 'Medicina'), 
(3 , 'Engenharia'), 
(4 , 'Direito') 


-- vou deletar tudo 
delete tb_genero 
where cd_genero < 5 

-- vou alterar  
update tb_genero 
set genero = 'Juridico' 
where cd_genero = 4








