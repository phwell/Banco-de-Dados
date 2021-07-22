--1) lista os livros (isbn, titulo, média_preco, preco)  que estão acima da média

select avg(preco) media from tb_livro


select * from tb_livro where 
preco > (select avg(preco) media from tb_livro)

--2) lista os livros (preco, titulo, editora)  que os preços estão abaixo da media de precos da editora Thomson

select avg(preco) media_genero from tb_livro
where cd_genero = 3

select * from tb_livro 
select * from tb_genero 
select L.preco, titulo, E.editora from tb_livro L 
inner join tb_editora E
on L.cd_editora = E.cd_editora 
where L.preco < (select avg(preco) media_thomson from tb_livro
where cd_editora = 2)

--3) lista os livros (Isbn, preco, titulo, genero) em  que os preços 
-- estão acima da media de precos do genero = 3 (engenharia civil)



select L.isbn, L.preco, titulo, E.editora from tb_livro L 
inner join tb_editora E
on L.cd_editora = E.cd_editora 
where L.preco > (select avg(preco) media_genero from tb_livro
where cd_genero = 3)

select * from tb_livro 
select * from tb_editora 
-- 4) lista os campos (cd_editora, editora) da tabela editora
--    usando subquery (ano do livros forem de 2014) 

select cd_editora, editora from tb_editora
where cd_editora in (select distinct cd_editora from tb_livro 
where year(dt_livro) = 2014)


-- 5) Lista os campos cd_genero, genero da tabela genero  
--    usando subquery (mes 01 e 02 da dt_livro)

select cd_genero, genero from tb_genero
where cd_genero in (select distinct cd_genero from tb_livro 
where month(dt_livro) in (1,2))

-- 6) lista os campos (precos,genero, preco) subquery (menores preços por genero) 
select L.isbn, G.genero, L.preco from tb_livro L
inner join tb_genero G 
on L.cd_genero = G.cd_genero 
where L.preco in (select min(L.preco) from tb_genero G
inner join tb_livro L 
on L.cd_genero = G.cd_genero 
group by G.genero)





