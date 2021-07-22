

select * from tb_funcionario where cd_setor = 1 and cd_cargo = 1

select * from tb_funcionario where cd_setor = 1 or cd_cargo = 1

select * from tb_funcionario 
-- salario de 5000 ate 10 000

select * from tb_funcionario where salario between 5000 and 10000

select * from tb_funcionario 
where 
salario >= 5000 and 
salario <= 10000

select * from tb_funcionario 

select * from tb_funcionario 
where funcionario like 'j%'

select * from tb_funcionario 
where funcionario like '%a'

select * from tb_funcionario 
where funcionario like '%az%'

-- cd_setor 1 e 3

select * from tb_funcionario 
where cd_setor in (1,3)

select * from tb_funcionario 
where cd_setor = 1 or cd_setor = 3 

select * from tb_funcionario order by cd_setor, funcionario 

select cd_setor, funcionario from tb_funcionario order by cd_setor, funcionario 

select * from tb_funcionario order by funcionario desc

select cd_setor, funcionario from tb_funcionario order by  cd_setor, funcionario desc

select top(3) * from tb_funcionario order by matricula desc

select * from tb_funcionario 
 

select matricula, funcionario from tb_funcionario 

select str(matricula) as codigo, funcionario from tb_funcionario 

select str(matricula) ra, funcionario from tb_funcionario F

select 'Matricula = ' + str(matricula) as RA, funcionario from tb_funcionario 

select 'Matricula = ' + ltrim(str(matricula)) as RA, funcionario from tb_funcionario 

select funcionario, matricula from tb_funcionario 

select funcionario + ' Matricula = ' + str(matricula) from tb_funcionario 

select rtrim(funcionario) + 'Matricula = '+ ltrim(str(matricula)) from tb_funcionario 

select rtrim(funcionario) + ' - Matricula = '+ ltrim(str(matricula)) from tb_funcionario 

select rtrim(funcionario) + ' - Matricula = '+ ltrim(str(matricula)) 
as NomeMatricula from tb_funcionario 

select * from tb_funcionario 

select cd_setor from tb_funcionario 

-- comando para não repetir

select distinct cd_setor from tb_funcionario 