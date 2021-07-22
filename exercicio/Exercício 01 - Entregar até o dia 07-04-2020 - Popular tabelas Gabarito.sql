--01   Aumenta o salario para 6000  do funcionario matricula = 1

update tb_funcionario
set salario = 6000
where matricula = 1
 
--02 	Alterar  os funcionario do setor (administracao) para setor (informatica)  
 
 update tb_funcionario
 set cd_setor = 3
 where cd_setor = 2
--03 	Alterar  os funcionarios com salario acima de 5000 para o cargo de (executivo) 
select * from tb_cargo

update tb_funcionario
set cd_cargo= 7
where salario >5000
 
 select * from tb_funcionario
--04  	Excluir tb_cargo  7 - executivo (vê se é possível ? Explique ? )

delete tb_cargo
where cd_cargo = 7 -- nao foi possivel pois esta sendo utilizada na tb_funcionario
 
--05  	Excluir tb_cargo  5 - advogado (vê se é possível ? Explique ? )

delete tb_cargo
where cd_cargo = 5

--06  	Aumenta o salario dos funcionarios em 20%  

update tb_funcionario
set salario = 1.2* salario

--07  	diminuir o salario dos funcionario em 10%  

update tb_funcionario
set salario = 0.9* salario
 
--08  	Aumenta o salario dos funcionarios em 30%  quando cargo enfermeiro

 update tb_funcionario
set salario = 1.3* salario
where cd_cargo = 1
--09  	Incluir o novo funcionario 
--                           (matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
--                           (7,'Eliane Nobrega', '1975-01-20',  1, 2, 15000) 
 
 insert into tb_funcionario
 (matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
 values
 (7,'Eliane Nobrega', '1975-01-20',  1, 2, 15000) 

-- 10 	Lista todos os funcionarios quando o salario >= 5000
 select * from tb_funcionario
 where salario >=5000
--  11	Lista todos os funcionarios quando o salario >= 6000 e setor de informatica 
 select * from tb_funcionario
 where salario >=6000
 and cd_setor = 3
--12	Lista todos os funcionarios quando o salario >= 7000 e cargo for diferente de (executivo)
 select * from tb_funcionario
 where salario >=7000
 and cd_cargo <> 7