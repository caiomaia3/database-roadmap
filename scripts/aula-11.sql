use cadastro;
select * from gafanhotos;

select * from cursos
order by nome desc;

select nome,carga,ano from cursos;

select ano,nome,carga from cursos
order by ano, nome;

select nome,carga from cursos
where ano='2016'
order by nome;

select nome,descricao from cursos
where ano <= '2015'
order by nome;


select nome, ano from cursos
where ano between '2014' and '2016'
order by ano desc, nome;


select nome, descricao, ano from cursos
where ano in ('2014','2016')
order by ano;

select * from cursos
where carca > 35 and carga < 30
order by nome;