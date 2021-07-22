use bd_pedido_segunda;

-- 1 – lista os veículos que foram vendidos (veículos, dt_pedido, valor_pedido)

select V.veiculo, P.dt_pedido, P.valor_pedido from tb_pedido P 
inner join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo; 


-- 2 – lista os veículos que NÃO FORAM VENDIDOS (veículos, valor_veiculo)

select V.veiculo, P.nr_pedido from 
tb_pedido P inner join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo;


select V.veiculo, P.nr_pedido from 
tb_pedido P right outer join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo;

select * from tb_veiculo;

insert into tb_veiculo 
(cd_veiculo, veiculo, valor_veiculo) 
values
(7,'IX35', 120000);

-- 2 – lista os veículos que NÃO FORAM VENDIDOS (veículos, valor_veiculo)
select V.veiculo, P.nr_pedido from 
tb_pedido P right outer join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo
where P.nr_pedido is null;


-- 3 – lista os clientes que compraram carros (veículos, cliente)

select V.veiculo, C.cliente from tb_veiculo V
inner join tb_pedido P 
on V.cd_veiculo = P.cd_veiculo 

inner join tb_cliente C 
on P.cd_cliente = C.cd_cliente; 


-- 4 – lista os clientes que NÃO COMPRARAM CARROS (cliente)

select C.cliente, P.nr_pedido from tb_cliente C 
inner join tb_pedido P 
on P.cd_cliente = C.cd_cliente; 

select C.cliente, P.nr_pedido from 
tb_cliente C left outer join tb_pedido P 
on P.cd_cliente = C.cd_cliente; 

-- 4 – lista os clientes que NÃO COMPRARAM CARROS (cliente)
select * from tb_cliente; 

insert into tb_cliente 
(cd_cliente, cliente) 
values
(6, 'Hugo Nobrega'),
(7, 'Isabela Nobrega');

select C.cliente, P.nr_pedido from 
tb_cliente C left outer join tb_pedido P 
on P.cd_cliente = C.cd_cliente
where P.nr_pedido is null; 

-- 6 – lista os vendedores e os carros vendidos (vendedor, veiculo, dt_pedido)

select V.vendedor, VEI.veiculo, P.dt_pedido from tb_vendedor V
inner join tb_pedido P 
on V.cd_vendedor = P.cd_vendedor 

inner join tb_veiculo VEI
on P.cd_veiculo = VEI.cd_veiculo; 


-- 7 – lista os vendedores que NÃO VENDERAM CARROS (Vendedores) 
select V.vendedor, P.nr_pedido from tb_vendedor V
inner join tb_pedido P 
on V.cd_vendedor = P.cd_vendedor ;

select * from tb_vendedor; 

insert into tb_vendedor 
(cd_vendedor, vendedor) 
values
(6,'Vaneza Botelho'),
(7,'Carlos da Silva');

-- 7 – lista os vendedores que NÃO VENDERAM CARROS (Vendedores) 
select V.vendedor, P.nr_pedido from tb_vendedor V
inner join tb_pedido P 
on V.cd_vendedor = P.cd_vendedor ;

-- Alteracao inner para outer

select V.vendedor, P.nr_pedido from 
tb_vendedor V left outer join tb_pedido P 
on V.cd_vendedor = P.cd_vendedor ;

select V.vendedor, P.nr_pedido from 
tb_vendedor V left outer join tb_pedido P 
on V.cd_vendedor = P.cd_vendedor 
where P.nr_pedido is null;






