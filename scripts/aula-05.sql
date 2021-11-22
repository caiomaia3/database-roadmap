use cadastro;
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
('1','Godofredo','1984-01-02','M','78.5','1.83','Brasil');

select * from pessoas;

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Maria','1999-12-30','F','55.2','1.65','Portugal');

insert into pessoas
(id,nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default,'Creuza','1920-12-30','F','50.2','1.65',default);

insert into pessoas values
(default,'Aldagiza','1930-11-2','F','63.2','1.75','Irlanda');

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default,'Ana','1975-12-22','F','52.3','1.45','EUA'),
(default,'Pedro','2000-07-15','M','52.3','1.45','Basil'),
(default,'Maria','1999-05-30','F','75.9','1.70','Portugal');
