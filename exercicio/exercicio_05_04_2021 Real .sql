
-- aula dia 05-04-2021


-- abrir o banco de dados bd_livro_seg

use bd_livro_seg


select * from tb_genero 

insert into tb_genero 
(cd_genero, genero) 
values 
(1,'computacao') 


select * from tb_editora 

insert into tb_editora 
(cd_editora, editora) 
values 
(1, 'novatec') 


select * from tb_livro 

insert into tb_livro 
(isbn, titulo, cd_editora, cd_genero, preco, dt_livro) 
values
(1,'Banco de Dados', 1, 1, 300, '2019-02-10')


-- excluir todas informados das tabelas 

tb_editora 

select * from tb_editora 
delete tb_editora 
where cd_editora < 10

tb_genero 

select * from tb_genero 

delete tb_genero 
where cd_genero < 10 


tb_livro 

select * from tb_livro 

delete tb_livro 
where isbn = 1

delete tb_livro 
where isbn < 20


-- incluir um bloco de registro

select * from tb_genero 

insert into tb_genero 
(cd_genero, genero) 
values
(1, 'Computacao'),
(2, 'Medicina'),
(3, 'Engenharia'),
(4, 'Juridico'),
(5 , 'Arquitetura'), 
(6, 'Biologia'), 
(7, 'Mecatronica') 


select * from tb_editora 

insert into tb_editora 
(cd_editora, editora) 
values
(1, 'novatec'),
(2, 'amazon'), 
(3, 'coopmed'), 
(4, 'livraria florence'), 
(5 , 'blucher'), 
(6,'Mundial'), 
(7,'saraiva'), 
(8,'Editora Forum'),
(9, 'Dickens')

select * from tb_livro 

insert into tb_livro 
(isbn, titulo, cd_editora, cd_genero, preco, dt_livro) 
values
(1,'banco de dados',1,1, 300, '10-02-2019'), 
(2,'Engenharia de Software',1,1, 350, '10-03-2019'), 
(3,'Ortopedia',3,2, 310, '10-04-2019'), 
(4,'Cardiologia',4,2, 320, '10-05-2019'), 
(5,'Estrutura Predial',5,3, 200, '10-06-2019'), 
(6,'Estrutura Hidraulica',6,3, 300, '10-07-2019'), 
(7,'Direito Penal',7,4, 150, '10-08-2019'), 
(8,'Direito Civil',8,4, 200, '10-09-2019'), 
(9,'Cores ',7,5, 200, '10-10-2019'), 
(10, 'Paisagismo ',8,5, 250, '10-11-2019'), 
(11,'Virus',9,6, 300, '10-12-2019'), 
(12,'Bacteria',9,6, 300, '10-12-2019')


-- exercicio 

-- 1)  Listar  a cd_editora = 1  na tabela tb_livro

select * from tb_livro 
where cd_editora = 1 

-- 2)  Listar o cd_genero = 2 na tabela tb_livro

select * from tb_livro 
where cd_genero = 2 

-- 3)  Excluir cd_editora  = 1 na tabela tb_editora

delete tb_editora 
where cd_editora = 1 

-- O SGBD não deixa para não gerar inconsistência

-- 4) Excluir cd_genero = 1 na tabela tb_genero

delete tb_genero 
where cd_genero = 1

-- O SGBD não deixa para não gerar inconsistência


-- 5)  Alterar na tabela tb_livro  isbn = 1  preco (400)

select * from tb_livro 
where isbn = 1 

update tb_livro 
set preco = 400 
where isbn = 1 


-- 6)  Alterar – aumentar os precos do tb_livro em 10%

select * from tb_livro 

update tb_livro 
set preco = preco * 1.1 


update tb_livro 
set preco = preco + (preco * 0.1) 

-- 7)  Listar a tabela (tb_livro)  preco > 300

select * from tb_livro 
where preco > 300 

-- Listar a tabela (tb_livro)  preco maior ou igual 330

select * from tb_livro 
where preco >= 330 

-- Listar a tabela (tb_livro)  preco menor  330

select * from tb_livro 
where preco < 330 


-- Listar a tabela (tb_livro)  preco menor e igual  330

select * from tb_livro 
where preco <= 330 

-- 8)  Listar a tabela (tb_livro)   cd_editora  < 5

select * from tb_livro 
where cd_editora < 5


