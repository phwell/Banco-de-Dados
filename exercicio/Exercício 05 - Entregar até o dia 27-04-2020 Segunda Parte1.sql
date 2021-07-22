use bd_livro01 

select * from tb_livro 
--ENTREGAR 27/04
--01) lista a quantidade de livros
select titulo, count(titulo) qtd from tb_livro
group by titulo 

--02) lista a média dos preços dos livros
select avg(preco) Media_preco_livros from tb_livro

--03) lista o preço maior do livro 
select top 1 titulo, preco from tb_livro 
order by preco desc

--04) lista o preço menor do livro da editora (thomson)  = 2
select top 1 titulo, E.editora, preco from tb_livro L
inner join tb_editora E
on E.cd_editora = L.cd_editora 
where E.cd_editora = 2 
order by preco 


--05) lista o total de livros por editora
select E.editora, count(L.titulo) qtd from tb_livro L
inner join tb_editora E
on L.cd_editora = E.cd_editora
group by E.editora 
order by qtd desc
 

--06) lista o total de livros por genero
select * from tb_genero 
select G.genero, count(L.titulo) qtd from tb_livro L 
inner join tb_genero G
on G.cd_genero = L.cd_genero 
group by G.genero 
order by qtd desc 

--07) Lista o titulo, ano do livro, editor
select * from tb_livro 
select L.titulo, year(L.dt_livro) ano_do_livro, E.editora from tb_livro L
inner join tb_editora E
on E.cd_editora = L.cd_editora 


--08) Lista o titulo, quantos meses tem o livro, genero
select L.titulo, G.genero,
datediff(month, dt_livro, getdate()) qtd_mes_passou from tb_livro L
inner join tb_genero G
on G.cd_genero = L.cd_genero 

--09) Lista o titulo, quantos dias tem o livro,  editor
select L.titulo,
datediff(day, dt_livro, getdate()) qtd_dia_passou from tb_livro L

--10) Lista titulo, valor do livro,  valor do livro + 100,  20% a mais no valor do livro
select titulo, preco,(preco+100) preco_mais_100, (preco*1.2) '20%' from tb_livro 
