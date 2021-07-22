

select * from tb_pedido 

--1 Incluir cliente Pedro Nóbrega

select * from tb_cliente 

delete tb_cliente 
where cd_cliente = 6 


insert into tb_cliente 
(cd_cliente, cliente) 
values
(7, 'Pedro Nóbrega') 

delete tb_cliente 
where cd_cliente = 7 



--2 Incluir vendedor Hugo Silva

select * from tb_vendedor 

insert into tb_vendedor 
(cd_vendedor, vendedor) 
values
(7,'Hugo Silva') 

delete tb_vendedor 
where cd_vendedor = 7 

--3 Incluir pedido  - Data= 06-04-2020,  
/*cliente = Pedro Nóbrega  = 6, 
Vendedor = Hugo Silva = 6,  
veiculo S10 = 3
valor  R$109.000,00 */

select * from tb_cliente 
where cliente like 'Pedro%'

select * from tb_cliente 
where cliente like '%edr%'

select * from tb_vendedor 
where vendedor like '%silva%'

select * from tb_veiculo 
where veiculo like '%s%'

/*cliente = Pedro Nóbrega  = 6, 
Vendedor = Hugo Silva = 6,  
veiculo S10 = 3
valor  R$109.000,00 */

select * from tb_pedido 
insert into tb_pedido 
(nr_pedido, dt_pedido, cd_veiculo, cd_cliente, cd_vendedor, valor_pedido, comissao) 
values 
(12, '2020-06-04', 3, 6, 6, 109000,0)

delete tb_pedido 
where nr_pedido = 12

--4 Alterar cliente Vallu Nascimento para Carlos Nascimento na tabela pedido
select * from tb_cliente 

insert into tb_cliente 
(cd_cliente, cliente) 
values
(7, 'Vallu Nascimento') 

--4 Alterar cliente Vallu Nascimento para Carlos Nascimento na tabela Cliente

update tb_cliente 
set cliente = 'Carlos Nascimento' 
where cd_cliente = 7 

select * from tb_cliente 



--5 Alterar vendedor Anibal para Anibal Santoro

select * from tb_vendedor 

update tb_vendedor 
set vendedor = 'Anibal 1' 
where cd_vendedor = 1

update tb_vendedor 
set vendedor = 'Anibal Santoro'
where cd_vendedor = 1 


--6 Alterar o valor do Pedido 1 parar cd_veiculo 4 e valor R$101.000,00

select * from tb_pedido 
where nr_pedido = 1 

update tb_pedido 
set cd_veiculo = 4, valor_pedido = 101000
where nr_pedido = 1 


--7 Excluir Cliente quando o cd_cliente = 4  (vê se é possível ? Explique ? )
select * from tb_cliente 
insert into tb_cliente 
(cd_cliente, cliente) 
values
(1, 'Bruna Stefany') 

select * from tb_cliente 

select * from tb_pedido 

delete tb_cliente 
where cd_cliente = 4

-- R2 : O SGBD não deixa, por ter a regra de integridade referencial 


--8 Atualizar o valor da comissão em 10% do valor da venda
select * from tb_pedido 

update tb_pedido 
set comissao = 0 

update tb_pedido 
set comissao = valor_pedido * 0.1


--9 lista os nr_pedidos, dt_pedido, Cliente, veiculo, valor, comissao


--10 Alterar o valor do pedido, aumentando em 20%
select * from tb_pedido 

update tb_pedido 
set valor_pedido = valor_pedido * 1.2



--11 Alterar a comissão do pedido em 5% do valor da venda

select * from tb_pedido 

update tb_pedido 
set comissao = 0 


update tb_pedido 
set comissao = valor_pedido * 0.05
