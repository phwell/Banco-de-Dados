use bd_pedido_01
-- 01 Criar view  Vw01 que Lista o nr_pedido, cliente por ordem de cliente

create view Vw01 as
select P.nr_pedido,
	   C.cliente 
from tb_pedido P
inner join tb_cliente C
on P.cd_cliente=C.cd_cliente

select * from Vw01
order by cliente

-- 02 Criar view  Vw02 que Lista o nr_pedido, vendedor por ordem comissao 

create view Vw02 as
select P.nr_pedido,
	   V.vendedor,
	   P.comissao
from tb_pedido P
inner join tb_vendedor V
on P.cd_vendedor=V.cd_vendedor


select * from Vw02
order by comissao

-- 03 Criar view  Vw03 que Lista o nr_pedido, veiculo, comissao por ordem de Maior comissao

create view Vw03 as
select P.nr_pedido,
	   V.veiculo,
	   P.comissao
from tb_pedido P
inner join tb_veiculo V
on P.cd_veiculo=V.cd_veiculo

select * from Vw03
order by comissao desc

-- 04 Criar view  Vw04 que Lista o nr_pedido, cliente, veiculo por ordem de cliente 

create view Vw04 as
select P.nr_pedido,
	   C.cliente,
	   V.veiculo 
from tb_pedido P
inner join tb_cliente C
on P.cd_cliente=C.cd_cliente
inner join tb_veiculo V
on P.cd_veiculo=V.cd_veiculo

select * from Vw04
order by cliente 

-- 05 Criar view  Vw05 que Lista o nr_pedido, veiculo, vendido antes do Mês 07

create view Vw05 as
select P.nr_pedido,
	   V.veiculo
from tb_pedido P
inner join tb_veiculo V
on P.cd_veiculo=V.cd_veiculo
where month(P.dt_pedido) < 7

select * from Vw05

-- 06 Criar view  Vw06 que Lista a quantidade de comissao por vendedor

create view Vw06 as
select count(P.comissao) qtd_comissao,
	   V.vendedor
from tb_pedido P
inner join tb_vendedor V
on P.cd_vendedor=V.cd_vendedor
group by V.vendedor

select * from Vw06

-- 07 Criar view  Vw07 que Lista a quantidade de comissao por veiculo

create view Vw07 as
select count(P.comissao) qtd_comissao,
	   V.veiculo
from tb_pedido P
inner join tb_veiculo V
on P.cd_veiculo=V.cd_veiculo
group by V.veiculo

select * from Vw07

-- 08 Criar view  Vw08 que Lista a quantidade de valor_vendido por cliente
drop view Vw08
create view Vw08 as
select  C.cliente,count(P.valor_pedido) qtd_valor  
from tb_pedido P
inner join tb_cliente C
on P.cd_cliente=C.cd_cliente
group by C.cliente

select * from Vw08

-- 09 Criar view  Vw09 que Lista a quantidade de vendas por cliente

create view Vw09 as
select C.cliente, count(P.nr_pedido) qtd_vendas 
from tb_pedido P
inner join tb_cliente C
on P.cd_cliente=C.cd_cliente
group by C.cliente

select * from Vw09

-- 10 Criar view  Vw10 que Lista a quantidade de vendas por vendedor

create view Vw10 as
select V.vendedor, count(P.nr_pedido) qtd_vendas
from tb_pedido P
inner join tb_vendedor V
on P.cd_vendedor=V.cd_vendedor
group by V.vendedor

select * from Vw10
-- 11 Criar view  Vw11 que Lista a quantidade de vendas por veiculo

create view Vw11 as
select V.veiculo, count(P.nr_pedido) qtd_vendas
from tb_pedido P
inner join tb_veiculo V
on P.cd_veiculo=V.cd_veiculo
group by V.veiculo

select * from Vw11

-- 12 Criar view  Vw12 que Lista os veiculos que nunca foram vendidos

create view Vw12 as
select V.veiculo,
	   P.valor_pedido
from tb_pedido P
right outer join tb_veiculo V
on V.cd_veiculo = P.cd_veiculo
where P.valor_pedido is null

select * from Vw12

-- 13 Criar view  Vw13 que Lista os vendedores que nunca venderam em 2020

drop view Vw13
create view Vw13 as
select V.vendedor,
	   P.dt_pedido
from tb_pedido P
right outer join tb_vendedor V
on V.cd_vendedor = P.cd_vendedor
where year(P.dt_pedido) <> 2020
or  year(P.dt_pedido) is null

select * from Vw13

-- 14 Criar view  Vw14 que Lista os veiculos que nunca foram vendidos no mês 06

drop view Vw14
create view Vw14 as
select V.veiculo,
	   P.dt_pedido
from tb_pedido P
right outer join tb_veiculo V
on V.cd_veiculo = P.cd_veiculo
where month(P.dt_pedido) <> 06
or MONTH(P.dt_pedido) is null

select * from Vw14

-- 15 criar uma consulta que faça ROLLBACK - deletar todos os pedidos do mês 10

select * from tb_pedido
where month(dt_pedido) = 10

begin transaction

delete tb_pedido
where month(dt_pedido) = 10

rollback
-- 16 criar uma consulta que faça ROLLBACK - aumentar o valor da comissao em 50%

select comissao from tb_pedido

begin transaction
update tb_pedido
set comissao = comissao * 1.5

rollback

-- 17 criar uma consulta que faça ROLLBACK - aumentar o valor dos veiculos (tb_veiculo) em 20%
select valor_veiculo from tb_veiculo

begin transaction

update tb_veiculo
set valor_veiculo = valor_veiculo *1.2

rollback

-- 18 criar uma consulta que faça COMMIT - incluir 2 novos vendedores (Sergio Farias) (Roberto Silva)
select * from tb_vendedor

begin transaction
insert into tb_vendedor
(cd_vendedor,vendedor)
values
(9,'Sergio Farias'),
(10, 'Roberto Silva')

commit

-- 19 criar uma consulta que faça COMMIT - incluir 2 novos veiculos (BMW x1, valor 207000,00) 
--                                                                  (BMW x2, valor 250000,00)

select * from tb_veiculo

begin transaction
insert into tb_veiculo
(cd_veiculo, veiculo,valor_veiculo)
values
(7,'BMW x1',207000),
(8,'BMW x2',250000)

commit

-- 20 criar uma consulta que faça COMMIT - alterar a comissao em 10% a mais

select * from tb_pedido

begin transaction
update tb_pedido
set comissao = comissao * 1.1

commit