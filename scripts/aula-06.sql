use cadastro;

describe pessoas;

alter table pessoas
add column profissao varchar(10);

alter table pessoas
drop column profissao;

select * from pessoas;

alter table pessoas
add column profissao varchar(10) after nome;

alter table pessoas
add column codigo int first;

alter table pessoas
modify profissao varchar(20) not null default '';

alter table pessoas
change column profissao prof varchar(20);

alter table pessoas
rename to gafanhotos;

describe pessoas;
describe gafanhotos;

create table if not exists gafanhotos (test int);

create table if not exists cursos(
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totaulas int unsigned,
ano year default '2016'
) default charset utf8mb4;

alter table cursos
add column id int primary key first;

describe cursos;

create table if not exists teste(
id int primary key auto_increment,
nome varchar(30),
idade int
) default charset utf8mb4;

insert into teste value
('1','Pedro','22'),
('2','Maria','12'),
('3','Maricota','77');

select * from teste;

drop table if exists alunos;
drop table if exists teste;
