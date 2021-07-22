
-- 01 lista os veiculos vendidos por ordem de dt_pedido – os mais recentes
select * from tb_pedido

select v.veiculo, p.dt_pedido from 
tb_pedido p inner join tb_veiculo v 
on p.cd_veiculo = v.cd_veiculo 
order by p.dt_pedido desc

-- 02 lista 3 primeiros registros,  cliente e dt_pedido (compra) – os mais antigos pedidos

select top 3 c.cliente, p.dt_pedido from tb_pedido p
inner join tb_cliente c 
on p.cd_cliente = c.cd_cliente
order by p.dt_pedido 


-- 03 lista o vendedor e o veiculo, cujo o nome do vendedor termina com a letra (a) 

select vn.vendedor, v.veiculo from  tb_pedido p
inner join tb_vendedor vn
on p.cd_vendedor = vn.cd_vendedor
 inner join tb_veiculo v
 on p.cd_veiculo = v.cd_veiculo
 where vendedor like '%a' 

-- 04 lista veiculo vendido, o cliente que comprou e o vendedor que vendeu em que o valor é acima de 100.000,00

select v.veiculo, c.cliente, vn.vendedor from tb_pedido p
inner join tb_cliente c 
on p.cd_cliente = c.cd_cliente
inner join tb_veiculo v
on p.cd_veiculo = v.cd_veiculo
inner join tb_vendedor vn
on p.cd_vendedor = vn.cd_vendedor
where p.valor_pedido > 100000

-- 05 lista o veiculos vendidos usando o distinct 

select distinct veiculo from tb_veiculo

-- 06 lista os nomes dos clientes e os veiculos quando o cliente começa  (well) ou carro (onix) 
select * from tb_cliente 

select C.cliente, V.veiculo from tb_pedido P
inner join tb_cliente C
on C.cd_cliente = P.cd_cliente
inner join tb_veiculo V
on V.cd_veiculo = P.cd_veiculo
where C.cliente like 'well%'
or V.veiculo like '%onix%'

-- 07 lista o nome dos clientes que compraram o veiculo (só não repetir o nome) 

select distinct c.cliente, v.veiculo from tb_pedido p 
inner join tb_cliente c
on c.cd_cliente = p.cd_cliente 
inner join tb_veiculo v
on p.cd_veiculo = v.cd_veiculo 


-- 08 lista os veiculos, valores e o desconto de 30% 

alter table tb_pedido
add desconto int

update tb_pedido
set desconto = valor_pedido * 0.3

select VE.veiculo, P.valor_pedido, P.desconto from tb_pedido P
inner join tb_veiculo VE
on VE.cd_veiculo = P.cd_veiculo

-- 09 lista o produto cartesiano entre cliente e veiculo 

select c.cliente, v.veiculo from 
tb_cliente c cross join  tb_veiculo v 

-- 10 lista o produto cartesiano entre veiculo e cliente 

select v.veiculo, c.cliente from
tb_veiculo v cross join tb_cliente c

-- 11 atualizar a comissão de vendas em 20% do carro Onix
select * from tb_veiculo 
select * from tb_pedido 

update tb_pedido
set comissao = comissao * 1.2
where cd_veiculo = 1

-- 12 atualizar o desconto desconto de 40% para os clientes  (2 - Rogeria Negreti, 3 -Henrique Silva, 4 - Wellington Alves) 

select * from tb_pedido
select * from tb_cliente

update tb_pedido
set desconto = valor_pedido * 0.4
where cd_cliente = 2

update tb_pedido
set desconto = valor_pedido * 0.4
where cd_cliente = 3

update tb_pedido
set desconto = valor_pedido * 0.4
where cd_cliente = 4 
   
-- 13  lista os vendedores que nunca venderam 
select * from tb_pedido  

select V.vendedor,P.dt_pedido from tb_pedido P
right outer join tb_vendedor V
on P.cd_vendedor = V.cd_vendedor
where P.cd_vendedor is null

-- 14  lista os veículos que não foram vendidos (se tem?) 

select V.veiculo, P.valor_pedido from tb_pedido P
right outer join tb_veiculo V
on V.cd_veiculo = P.cd_veiculo
where P.valor_pedido is null

-- 15  lista os clientes que compraram sem repetir o nome

select distinct C.cliente, V.veiculo from tb_pedido P
inner join tb_cliente C
on P.cd_veiculo = C.cd_cliente
inner join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo
