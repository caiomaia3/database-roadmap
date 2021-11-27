use cadastro;
select * from cursos
where nome like 'a%' or nome like 'p%';

select * from cursos
where nome not like '%a%';

select * from cursos
where nome like 'PH%P';

select * from cursos
where nome like 'PH%P_';

select * from gafanhotos
where nome like '%_silva%';


select * from cursos
where nome not like 'ph%p%';


select distinct nacionalidade from gafanhotos
order by nacionalidade;

select distinct carga from cursos
order by carga desc;

select count(*) from cursos;

select count(*) from cursos
where carga > 40;

select count(nome) from cursos;

select max(carga) from cursos;

select count(carga) from cursos
where carga = '60';

select  min(totaulas) from cursos
where ano = '2016';

select nome, totaulas from cursos
where idcurso between 1 and 10 ;


desc cursos;

-- Lista de Exercícios
-- 1)
select * from gafanhotos
where sexo = 'F';

-- 2)
select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento desc;
 
 -- 3)
 select * from gafanhotos
 where sexo='M' and profissao = 'programador';
 
 -- 4)
 select * from gafanhotos
where sexo = 'F' and nacionalidade='Brasil' and nome like 'J%';

-- 5)
select nome, nacionalidade from gafanhotos
where sexo='M' and nacionalidade != 'brasil' and peso < 100 and nome like '_silv_';

-- 6)
select max(altura) from gafanhotos
where sexo='M' and nacionalidade = 'Brasil';

-- 7)
select avg(peso) from gafanhotos;

-- 8)
select  min(peso) from gafanhotos
where sexo='F' and nacionalidade != 'Brasil'
and nascimento between '1990-01-01' and '2000-12-31';

-- 9 )
select  count(altura) from gafanhotos
where sexo='F' and altura > '1.90';
