-- ** 1 passo
-- acessar bd_pedido_segunda
use bd_pedido_segunda; 

-- ** 2 passo
-- criar a tabela log

create table tb_log
 (nr_pedido int,
 dt_operacao date,
 tp_operacao varchar(30));
 
 
 -- ** 3 passo 
 -- Criar uma trigger 
 -- quando inserir na tabela pedido -- executar um insert na tabela log 
 
 
 delimiter $$ 
 
 create trigger tr_ins_pedido after insert on tb_pedido for each row
 
 Begin 
 
    insert tb_log
    (nr_pedido, dt_operacao, tp_operacao) 
    values
    (new.nr_pedido, curdate(),  'Inserir Pedido');
 
 end$$ 
 
 delimiter ;
 
 select * from tb_log;
 
 insert into tb_pedido
 (nr_pedido, dt_pedido, cd_veiculo, cd_cliente, cd_vendedor, valor_pedido, comissao)
 values
 (12, '2020-11-20',1,1,2, 52000, 5200);
 
 select * from tb_pedido; 
 
 select * from tb_log; 
 
 
  -- ** 4 passo 
 -- Criar uma trigger 
 -- quando alterar o registro na tabela pedido 
 -- executar um insert na tabela log (alteracao realizada na tb_pedido) 
 
 
 delimiter ##
 
 create trigger tr_upd_pedido after update on tb_pedido for each row
 
 begin 
 
    insert into tb_log
    (nr_pedido, dt_operacao, tp_operacao) 
    values
    (old.nr_pedido, curdate(), 'alteracao pedido');
 
 end ##
 
 delimiter ; 
 
 drop trigger tr_upd_pedido; 
 
 select * from tb_log; 
 
 select * from tb_pedido 
 where nr_pedido = 1; 
 
 update tb_pedido 
 set dt_pedido = curdate() 
 where nr_pedido = 1;

select * from tb_log; 
 
 
   -- ** 5 passo 
 -- Criar uma trigger 
 -- quando Excluir o registro na tabela pedido 
 -- executar um insert na tabela log (Exclusao realizada na tb_pedido) 
 
 
 delimiter %%
 
 create trigger tr_exc_pedido after delete on tb_pedido for each row
 
 Begin 
    insert into tb_log 
    (nr_pedido, dt_operacao, tp_operacao) 
    values
    (old.nr_pedido, curdate(), 'Exclusao pedido');
 
 
 End %% 
 
 delimiter ;
 
 select * from tb_log; 
 
 select * from tb_pedido; 
 
 delete from tb_pedido 
 where nr_pedido = 2; 
 
 
 
 
 
 
 
 
 
 
 
 