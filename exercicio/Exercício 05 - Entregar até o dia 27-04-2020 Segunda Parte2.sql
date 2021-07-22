
use bd_pedido_01 

select * from tb_pedido 
--ENTREGAR 27/04
-- 11) Lista a média das vendas antes do mês 07
select * from tb_pedido 
select avg(valor_pedido) Media_vendas_antes_mes7 from tb_pedido 
where month(dt_pedido) <= 7

-- 12) Lista o valor total da vendas depois do mês 06
select * from tb_pedido 
select sum(valor_pedido) Total_vendas_depois_mes6 from tb_pedido
where month(dt_pedido) > 6

-- 13) Lista a média das compras por cliente
select cliente, count(C.cliente) qtd from tb_pedido P
inner join tb_cliente C
on P.cd_cliente = C.cd_cliente		
group by C.cliente


-- 14) Lista o veículo vendido, ano do pedido
select * from tb_veiculo
select V.veiculo, year(P.dt_pedido) ano_pedido from tb_pedido P
inner join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo 


-- 15) Lista o veículo vendido, quantidade de meses tem a compra
select V.veiculo, P.dt_pedido,
datediff(month, dt_pedido, getdate()) qtd_mes_passou from tb_pedido P
inner join tb_veiculo V
on P.cd_veiculo = V.cd_veiculo

-- 16) Lista os veículos e a somatória das comissões por veiculo
select V.veiculo, sum(P.comissao) somatoria_comissoes from tb_pedido P
inner join tb_veiculo V
on V.cd_veiculo = P.cd_veiculo
group by V.veiculo 



-- 17) Lista os vendedores e a somatória das comissões por vendedor 
select * from tb_pedido 
select VD.vendedor, sum(P.comissao) somatoria_comissao from tb_pedido P 
inner join tb_vendedor VD
on VD.cd_vendedor = P.cd_vendedor 
group by VD.vendedor 

-- 18) Lista os clientes e quantidade de compras realizadas
select cliente, count(C.cliente) qtd from tb_pedido P
inner join tb_cliente C
on P.cd_cliente = C.cd_cliente
group by C.cliente


-- 19) Lista o menor valor vendido
select top 1 V.veiculo, P.valor_pedido from tb_pedido P
inner join tb_veiculo V
on V.cd_veiculo = P.cd_veiculo 
order by P.valor_pedido  


--20) Lista nr_pedido, comissao e classificacao
--     Classificacao - (< 4000 = normal)  (>=4000 e <5000 = Boa) (> 5000 = Otima)
select nr_pedido, comissao,
	case 
		when comissao < 4000 then 'normal'
		when comissao >= 4000 and comissao < 5000 then 'boa'
	else 'otima'  
	end classificacao 
from tb_pedido 

		
		
		 