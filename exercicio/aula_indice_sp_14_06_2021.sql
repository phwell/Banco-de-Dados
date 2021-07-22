

use bd_pedido_segunda; 

select * from tb_pedido;

select * from tb_cliente; 

show index from tb_cliente; 

create index idx_cliente on tb_cliente (cliente);


Alter table tb_cliente
drop index idx_cliente; 


select * from tb_cliente 
where cd_cliente <8 and cliente like '%Silva';


create index idx_cliente on tb_cliente (cliente); 

-- pesquisa com indice
select P.nr_pedido, P.dt_pedido, P.valor_pedido, 
       C.cliente,
	   V.Vendedor, 
       Vei.Veiculo from tb_pedido P 
	   inner join tb_cliente C 
       on C.cd_cliente = P.cd_cliente 
       inner join tb_vendedor V 
       on V.cd_vendedor = P.cd_vendedor 
       inner join tb_veiculo Vei 
       on Vei.cd_veiculo = P.cd_veiculo
where P.nr_pedido < 20 and C.cliente = 'Vallu Nascimento'; 


create index idx_cliente on tb_cliente (cliente); 

alter table tb_cliente 
drop index idx_cliente; 


-- Primeira stored Procedure
-- lista para gente os 1. registro da tabela tb_pedido e tb_cliente

delimiter $$

create procedure sp_primeiro()

Begin 
   select * from tb_pedido limit 1;
   select * from tb_cliente limit 1;

End $$ 

delimiter ; 

call sp_primeiro(); 


-- fazer uma stored procedure sp_segunda() 
--  nr_pedido, dt_pedido, veiculo
--  nr_pedido, dt_pedido, cliente




delimiter %%

create procedure sp_segunda() 

Begin 

     select P.nr_pedido, P.dt_pedido, V.veiculo from tb_pedido P 
     inner join tb_veiculo V 
     on P.cd_veiculo = V.cd_veiculo; 

     select P.nr_pedido, P.dt_pedido, C.cliente from tb_pedido P 
	 inner join tb_cliente C 
     on P.cd_cliente = C.cd_cliente; 

End %%

delimiter ; 


call sp_segunda();

-- Fazer uma stored procedure sp_terceira 
-- aumentando o valor_pedido em 10%

delimiter ## 

create procedure sp_terceira() 

Begin 
   select nr_pedido, valor_pedido from tb_pedido; 
   
   update tb_pedido 
   set valor_pedido = valor_pedido * 1.1; 
   
   select nr_pedido, valor_pedido from tb_pedido; 
End## 

delimiter ; 

call sp_terceira();


drop procedure sp_terceira; 






