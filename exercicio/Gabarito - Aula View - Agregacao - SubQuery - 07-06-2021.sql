
use bd_livro_seg;


-- 01 Criar view  Vw14_01 que Lista os campos titulo, editora 

create view Vw14_01 as 

select L.titulo, E.editora from tb_livro L 
inner join tb_editora E
on L.cd_editora = E.cd_editora; 

select * from Vw14_01;


-- 02 Criar view  Vw14_02 que Lista o total de livro por editora
-- group by 
-- contar count

create view Vw14_02 as 

select E.editora, count(L.isbn) as qtd from tb_livro L 
inner join tb_editora E 
on L.cd_editora = E.cd_editora
group by E.editora; 

select * from Vw14_02; 


-- 03 Criar uma consulta que faça ROLLBACK – excluir cd_editora = 1 na tb_livro
select * from tb_livro where cd_editora = 1; 
start transaction;
      delete from tb_livro where cd_editora = 1; 
      select * from tb_livro where cd_editora = 1; 
-- commit; 
rollback;
select * from tb_livro where cd_editora = 1; 

-- 04 Criar uma consulta que faça Commit - aumentar o preço do livro em 20%

select isbn, titulo, preco, 
	   (preco * 1.2) as vinte from tb_livro; 

select * from tb_livro;
start transaction;
    update tb_livro 
    set preco = (preco * 1.2);
    
    select * from tb_livro; 
    
commit; 
rollback;
show tables; 
-- 05 Lista os preços dos livros acima da média

-- principal  

select isbn, titulo, preco from tb_livro; 

-- secundaria

select avg(preco) media from tb_livro; 

-- subquery

select isbn, titulo, preco from tb_livro
where preco > (select avg(preco) media from tb_livro) ; 

-- 06 Lista os  livros que estão acima da média da Editora Saraiva (7) 

select * from tb_livro; 

select * from tb_editora ;

select isbn, titulo, preco from tb_livro 
where preco > (select avg(preco) as media_saraiva from tb_livro 
where cd_editora = 7);

select avg(preco) as media_saraiva from tb_livro 
where cd_editora = 7; 




