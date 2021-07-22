create database bd_pedido_01

use bd_pedido_01 
create table tb_cliente
(cd_cliente int not null primary key,
cliente varchar(50))

create table tb_veiculo
(cd_veiculo int not null primary key, 
veiculo char(50), 
valor_veiculo money) 

create table tb_vendedor
(cd_vendedor int not null primary key,
vendedor varchar(50))

create table tb_pedido
(nr_pedido int not null primary key, 
dt_pedido date, 
cd_veiculo int, 
cd_cliente int, 
cd_vendedor int, 
valor_pedido money, 
comissao money) 
-- veiculo
alter table tb_pedido
add constraint fk_veiculo foreign key (cd_veiculo) 
references tb_veiculo (cd_veiculo) 

-- cliente
alter table tb_pedido
add constraint fk_cliente foreign key (cd_cliente) 
references tb_cliente (cd_cliente) 

-- vendedor
alter table tb_pedido
add constraint fk_vendedor foreign key (cd_vendedor) 
references tb_vendedor (cd_vendedor) 
-- vendedor
Insert into tb_vendedor
(cd_vendedor, vendedor)
Values
(1, 'Anibal'),
(2, 'Antonio de Moraes'), 
(3, 'Barbara Alcantara'), 
(4, 'Deise Castro'),
(5, 'Eider Nascimento')

-- cliente
Insert into tb_cliente
(cd_cliente, cliente) 
Values 
(1, 'Vallu Nascimento'),
(2, 'Rogeria Negreti'),
(3, 'Henrique Silva'),
(4, 'Wellington Alves'),
(5, 'Jose Pereira')

-- veiculo
Insert into tb_veiculo
(cd_veiculo, veiculo, valor_veiculo) 
Values
(1, 'Onix', 52000),
(2, 'Prisma', 49000),
(3, 'S10', 109000),
(4, 'Cruze', 101000),
(5, 'Spin', 69000),
(6, 'Cobalt', 63000) 

insert into tb_pedido
(nr_pedido, dt_pedido, cd_veiculo, cd_cliente, cd_vendedor, valor_pedido,comissao)
values
(1,'2019-01-10',1,2,3,52000,0),
(2,'2019-02-20',2,3,4,49000,0),
(3,'2019-03-30',3,4,5,109000,0),
(4,'2019-04-10',4,5,1,101000,0),
(5,'2019-05-20',5,5,1,69000,0),
(6,'2019-06-30',6,1,2,63000,0),
(7,'2019-07-10',1,4,5,52000,0),
(8,'2019-08-20',1,4,5,52000,0),
(9,'2019-09-30',1,4,5,52000,0),
(10,'2019-10-10',1,4,5,52000,0)

select* from tb_pedido 

--exercicio

--1 Incluir cliente Pedro Nóbrega

select * from tb_cliente 
insert into tb_cliente (cd_cliente,cliente) values (6,'Pedro Nobrega') 

--2 Incluir vendedor Hugo Silva
select * from tb_vendedor
insert into tb_vendedor (cd_vendedor, vendedor) values(6, 'Hugo Silva')

---3 Incluir pedido  - Data= 06-04-2020,  cliente = Pedro Nóbrega, Vendedor = Hugo Silva,  veiculo S10 valor R$109.000,00

select * from tb_pedido 
insert into tb_pedido
(nr_pedido, dt_pedido, cd_veiculo, cd_cliente, cd_vendedor, valor_pedido ,comissao)
values
(11,'2020-04-06', 3,6,6,109000, 0)

--4 Alterar cliente Vallu Nascimento para Carlos Nascimento na tabela pedido
select * from tb_cliente 
update tb_cliente set cliente = 'Carlos Nascimento'
where cd_cliente = 1


--5 Alterar vendedor Anibal para Anibal Santoro
select * from tb_vendedor 
update tb_vendedor set vendedor = 'Anibal Santoro'
where cd_vendedor = 1

--6 Alterar o valor do Pedido 1 parar cd_veiculo 4 e valor R$101.000,00
select * from tb_pedido 
update tb_pedido set valor_pedido = '101000'
where nr_pedido = 1

--7 Excluir Cliente quando o cd_cliente = 1  (vê se é possível ? Explique ? )
select * from tb_cliente 
delete from tb_cliente
where cd_cliente = 1

--8 Atualizar o valor da comissão em 10% do valor da venda

update tb_pedido
set comissao = valor_pedido * 0.1



--9 lista os nr_pedidos, dt_pedido, Cliente, veiculo, valor, comissao
select nr_pedido, dt_pedido, cd_cliente, cd_veiculo, valor_pedido, comissao  from tb_pedido 

--10 lista os pedidos dos clientes que começa o nome com well 
select P.nr_pedido, P.dt_pedido, P.valor_pedido, C.cliente from tb_pedido P
inner join tb_cliente C 
on P.cd_cliente = C.cd_cliente 
where C.cliente like 'Well%' 

--11 Alterar o valor do pedido, aumentando em 20%
update tb_pedido
set valor_pedido = valor_pedido * 1.2
 
--12 Alterar a comissão do pedido em 5% do valor da venda
update tb_pedido
set comissao = valor_pedido * 0.05

--13 lista o cd_cliente = 4 e cd_veiculo = 1 trazendo nome do cliente e veiculo
select C.cliente, V.veiculo from tb_pedido P 
inner join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo
inner join tb_cliente C
on C.cd_cliente = P.cd_cliente 
where P.cd_cliente = 4 and V.cd_veiculo = 1

--14 lista o cd_cliente = 4 ou cd_veiculo = 1 trazendo nome do cliente e veiculo
select C.cliente, V.veiculo from tb_pedido P 
inner join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo
inner join tb_cliente C
on C.cd_cliente = P.cd_cliente 
where P.cd_cliente = 4 or V.cd_veiculo = 1


