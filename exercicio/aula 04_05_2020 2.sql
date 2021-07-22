use bd_livro01


--1) lista os livros (isbn, titulo,  preco)  que estão acima da média

select isbn, titulo, preco from tb_livro 
where preco > (select avg(preco) media_preco from tb_livro)

----2) lista os livros (preco, titulo, editora)  
--- que os preços estão abaixo da media de precos da editora Thomson
select L.isbn, L.titulo, L.preco, E.editora from tb_livro L
inner join tb_editora E
on L.cd_editora = E.cd_editora 
where L.preco < (select avg(SL1.preco) media_preco_ed from tb_livro SL1 
inner join tb_editora SE1
on SL1.cd_editora = SE1.cd_editora
where SE1.editora like 'thoms%') 


select avg(preco) media_preco_ed from tb_livro where cd_editora = 2

-- 3) lista os livros (Isbn, preco, titulo, genero) em  que os preços 
--     estão acima da media de precos do genero = 3 (engenharia civil)

select L.isbn, L.preco, L.titulo, G.genero from tb_livro L
inner join tb_genero G
on L.cd_genero = G.cd_genero 
where preco > ( select avg(preco) media from tb_livro where cd_genero = 3 )

select avg(preco) media from tb_livro where cd_genero = 3 

---- 4) lista os campos (cd_editora, editora) da tabela editora
--      usando subquery (ano do livros forem de 2014) 

select cd_editora, editora from tb_editora 
where cd_editora in (select cd_editora from tb_livro 
where year(dt_livro) = 2014)


select cd_editora from tb_livro 
where year(dt_livro) = 2014



select cd_editora, isbn, titulo from tb_livro 
where year(dt_livro) = 2014

