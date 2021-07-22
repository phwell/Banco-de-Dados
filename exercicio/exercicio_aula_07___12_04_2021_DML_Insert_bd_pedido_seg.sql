
-- 12-04-2021 - bd_pedido
-- Comandos DML - Insert 

-- tb_vendedor
select * from tb_vendedor; 

insert into tb_vendedor 
(cd_vendedor, vendedor) 
values
(1,'Anibal'); 

-- tb_cliente

select * from tb_cliente;

insert into tb_cliente 
(cd_cliente, cliente)
values
(1, 'Vallu Nascimento'); 


-- tb_veiculo 

select * from tb_veiculo; 

insert into tb_veiculo 
(cd_veiculo, veiculo, valor_veiculo) 
values
(1,'Onix', 52000); 


-- tb_pedido 

select * from tb_pedido; 

insert into tb_pedido 
(nr_pedido, dt_pedido, cd_veiculo, cd_cliente, cd_vendedor, valor_pedido, comissao) 
values
(1,'2019-01-10', 1, 1, 1, 52000, 0); 


-- vendedor

select * from tb_vendedor 

Insert into tb_vendedor
(cd_vendedor, vendedor)
Values
-- (1, 'Anibal'),
(2, 'Antonio de Moraes'), 
(3, 'Barbara Alcantara'), 
(4, 'Deise Castro'),
(5, 'Eider Nascimento')

-- cliente
select * from tb_cliente 

Insert into tb_cliente
(cd_cliente, cliente) 
Values 
--(1, 'Vallu Nascimento'),
(2, 'Rogeria Negreti'),
(3, 'Henrique Silva'),
(4, 'Wellington Alves'),
(5, 'Jose Pereira')


-- veiculo
select * from tb_veiculo 

Insert into tb_veiculo
(cd_veiculo, veiculo, valor_veiculo) 
Values
--(1, 'Onix', 52000),
(2, 'Prisma', 49000),
(3, 'S10', 109000),
(4, 'Cruze', 101000),
(5, 'Spin', 69000),
(6, 'Cobalt', 63000) 


-- Pedido 

select * from tb_pedido 

insert into tb_pedido
(nr_pedido, dt_pedido, cd_veiculo, cd_cliente, cd_vendedor, valor_pedido,comissao)
values
--(1,'2019-01-10',1,2,3,52000,0),
(2,'2019-02-20',2,3,4,49000,0),
(3,'2019-03-30',3,4,5,109000,0),
(4,'2019-04-10',4,5,1,101000,0),
(5,'2019-05-20',5,5,1,69000,0),
(6,'2019-06-30',6,1,2,63000,0),
(7,'2019-07-10',1,4,5,52000,0),
(8,'2019-08-20',1,4,5,52000,0),
(9,'2019-09-30',1,4,5,52000,0),
(10,'2019-10-10',1,4,5,52000,0)


-- Exercicio Gabarito -- DML - DQL

--1 Incluir cliente Pedro N�brega

select * from tb_cliente 

insert into tb_cliente 
(cd_cliente, cliente) 
values
(6,'Pedro N�brega') 


--2 Incluir vendedor Hugo Silva

select * from tb_vendedor 

insert into tb_vendedor 
(cd_vendedor, vendedor) 
values
(6, 'Hugo Silva')

--3 Incluir pedido  - Data= 06-04-2020,  cliente = Pedro N�brega (6), 
--        Vendedor = Hugo Silva (6),  veiculo S10 (3) valor R$109.000,00

select * from tb_pedido 

select * from tb_cliente where cliente like 'P%'

select * from tb_vendedor where vendedor  like 'H%'

select * from tb_veiculo where veiculo like 'S%'

insert into tb_pedido
(nr_pedido, dt_pedido, cd_veiculo, cd_cliente, cd_vendedor, valor_pedido, comissao)
values
(11, '2020-06-04', 3, 6, 6, 109000, 0)

delete tb_pedido 
where nr_pedido = 11;

--4 Alterar cliente Vallu Nascimento (1) para Pedro Nobrega (6) na tabela pedido

select * from tb_cliente 

select * from tb_pedido 

update tb_pedido 
set cd_cliente = 6 
where cd_cliente = 1



--5 Alterar vendedor Anibal para Anibal Santoro

select * from tb_vendedor 


update tb_vendedor

set vendedor = 'Anibal Santoro' 

where cd_vendedor = 1

--6 Alterar o valor do Pedido (1) parar cd_veiculo 4 e valor R$101.000,00

select * from tb_pedido where nr_pedido = 1 

update tb_pedido 
set cd_veiculo = 4, valor_pedido = 101000
where nr_pedido = 1

--7 Excluir Cliente quando o cd_cliente = 1  (v� se � poss�vel ? Explique ? )

select * from tb_cliente 

select * from tb_pedido where cd_cliente = 1

select * from tb_cliente where cd_cliente = 1

delete tb_cliente 
where cd_cliente = 6  -- N�o deixa - fica inconsistente

delete tb_cliente 
where cd_cliente = 1  -- deixa  

--8 Atualizar o valor da comiss�o em 10% do valor da venda

select * from tb_pedido 

update tb_pedido 
set comissao = valor_pedido * 0.1

--9 lista os nr_pedidos, dt_pedido, Cliente, veiculo, valor, comissao

N�o passei o join 



--10 Alterar o valor do pedido, aumentando em 20%

select * from tb_pedido 

update tb_pedido 
set valor_pedido = valor_pedido * 1.2

--11 Alterar a comiss�o do pedido em 5% do valor da venda

select * from tb_pedido 

update tb_pedido 
set comissao = valor_pedido * 0.05



