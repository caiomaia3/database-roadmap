use cadastro;
select carga, count(nome) from cursos
group by carga;

select totaulas, count(nome) from cursos
group by totaulas order by count(nome) desc;

select carga, count(nome) from cursos
group by carga
having count(nome) > 3 order by count(nome) desc;

select carga, count(*) from cursos
where carga > (select avg(carga) from cursos)
group by carga;

select avg(carga) from cursos;

-- Exercícios

desc gafanhotos;

-- 1)
select profissao, count(nome) from gafanhotos
group by profissao order by profissao;

-- 2)
select count(nome) from gafanhotos
where nascimento > '2005-01-01';

select sexo,count(nome) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

-- 3)
select nacionalidade, count(nome) from gafanhotos
where nacionalidade != 'brasil' 
group by nacionalidade
having count(nome)>3;

select nacionalidade, count(nome) from gafanhotos
group by nacionalidade
having nacionalidade != 'brasil' and count(nome)>3;

-- 4)

select avg(altura) from gafanhotos;

select  count(nome) from gafanhotos
where peso > '100';

select altura, count(peso) from gafanhotos
where peso > '100' and altura > (select avg(altura) from gafanhotos)
group by altura;

select  altura from gafanhotos
where peso > '100';

select altura, count(peso) from gafanhotos
where peso > '100' 
group by altura
having altura > (select avg(altura) from gafanhotos);

