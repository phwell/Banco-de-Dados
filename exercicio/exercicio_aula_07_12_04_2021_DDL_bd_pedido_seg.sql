

-- Criar o banco de dados (bd_pedido_seg) 

create database bd_pedido_seg;


-- usar o banco de dados (bd_pedido_seg) 

use bd_pedido_seg;

-- criar a tabela (tb_veiculo) 

create table tb_veiculo 
(cd_veiculo int not null primary key, 
veiculo char(50),
valor_veiculo decimal(12,2));

-- criar a tabela (tb_cliente) 

create table tb_cliente
(cd_cliente int not null primary key, 
cliente char(50));


-- criar a tabela (tb_vendedor) 

create table tb_vendedor
(cd_vendedor int not null primary key, 
vendedor char(50));


-- criar a tabela (tb_pedido) 

create table tb_pedido 
(nr_pedido int not null primary key, 
dt_pedido date, 
cd_veiculo int, 
cd_cliente int, 
cd_vendedor int, 
valor_pedido decimal(12,2), 
comissao decimal(12,2));

-- relacionamento entre tb_pedido x tb_veiculo 

alter table tb_pedido 

add constraint fk_veiculo foreign key (cd_veiculo) 

references tb_veiculo (cd_veiculo) ;


-- relacionamento entre tb_pedido x tb_vendedor 

alter table tb_pedido 

add constraint fk_vendedor foreign key (cd_vendedor) 

references tb_vendedor (cd_vendedor) ; 


-- relacionamento entre tb_pedido x tb_cliente

alter table tb_pedido 

add constraint fk_cliente foreign key (cd_cliente) 

references tb_cliente (cd_cliente); 


-- excluir constraint 

alter table tb_pedido 

drop constraint fk_veiculo; 


alter table tb_pedido 

drop constraint fk_vendedor; 


alter table tb_pedido

drop constraint fk_cliente; 

drop table tb_pedido; 

---  OU

-- vou criar a tabela pedido 
-- + os relacionamentos
-- fk_vendedor, fk_cliente, fk_veiculo

create table tb_pedido
(nr_pedido int not null,
dt_pedido date, 
cd_veiculo int, 
cd_cliente int, 
cd_vendedor int, 
valor_pedido decimal(12,2), 
comissao decimal(12,2),

primary key(nr_pedido),

constraint fk_veiculo foreign key (cd_veiculo) references tb_veiculo (cd_veiculo), 

constraint fk_cliente foreign key (cd_cliente) references tb_cliente (cd_cliente),

constraint fk_vendedor foreign key (cd_vendedor) references tb_vendedor (cd_vendedor));









