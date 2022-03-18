/*~~~~~~~~~~~~~~~~~~~~~~ Criação do BD(Data Definition Language = DDL) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

create database cadastro
default character set utf8mb4
default collate utf8mb4_general_ci;

/*~~~~~~~~~~~~~~~~~~~~~ Criação da tabela(Data Definition Language = DDL) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

create table pessoas (
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum("M","F"),
peso decimal (5,2),
altura decimal(3,2),
nacionalidade varchar(20) default "Brasil",
primary key (id)
)default charset = utf8;

#Se não existe vai criar ...
create table if not exists cursos(
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totalAulas int unsigned,
ano year default "2022"
) default charset = utf8;

create table if not exists apagar(
id int,
nome varchar(10),
idade int
);

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Apagar tabela ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

drop table if exists apagar;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Inserir valores(Data Manipulation Language = DML) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

insert into pessoas
(id,nome,nascimento,sexo,peso,altura,nacionalidade)
values
(DEFAULT,"Solange", "1952-12-30","F","50.2","1.61",DEFAULT);

insert into pessoas values
(DEFAULT,"Ronaldo", "1952-12-30","M","102.2","1.80",DEFAULT),
(DEFAULT,"Israis", "1980-07-16","M","100.2","1.89","USA"),
(DEFAULT,"Robson", "1999-04-29","M","60.2","1.60",default);

insert into apagar value
("1","Marcos","20"),
("2","Pedro","22"),
("3","Islendio","50");

insert into cursos value
("1","HTML4","CURSO DE HTML5","40","37","2014"),
("2","ALGORITMOS","LOGICA DE PROGRAMACAO","20","15","2014"),
("3","PHOTOSHOP","DICAS DE PHOTOSHOP CC","10","8","2014"),
("4","PGP","CURSO DE PHP PARA INICIANTES","40","20","2010"),
("5","JARVA","INTRODUCAO A LINGUAGEM JAVA","10","29","2000"),
("6","MYSQL","BANCO DE DAOS MYSQL","30","15","2016"),
("7","WORD","CURSO COMPLETO DE WORD","30","15","2016"),
("8","SAPATEADO","DANCAS RITMICAS","40","30","2018"),
("9","COZINHA ARABE","APRENDA A FAZER KIBS","40","30","2018"),
("10","YOUTUBER","GERAR POLEMICA E GANHAR INSCRITOS","5","2","2018");

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Modificar Linhas Incorretas ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

update cursos
set nome = "Java", ano = "2014" , carga = "40"
where id = "5" 
limit 1;

update cursos
set ano = "2028", carga = "00"
where ano = "2050"
limit 1;

update cursos
set ano  = "2018"
where id = "3"
limit 1;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Apagar Linhas(DML) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

delete from cursos
where id = "9"
limit 1;

#Apaga todas as linhas
truncate table cursos;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Mostrar tabelas ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

select * from colaboradores;

select * from cursos;
desc cursos;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Add Colunas(Data Definition Language = DDL) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

alter table pessoas
add column codigo int first;

alter table pessoas
add column profissao varchar(20) not null after nome;
/*add column profissao varchar(10);*/

alter table cursos
add column id int first;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Alterar Colunas ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

alter table pessoas
modify column profissao varchar(20) not null default '';

alter table cursos
add primary key (id);

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Alterar nome da coluna ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

alter table pessoas
change column profissao prof varchar(20);

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Apagar Coluna ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

alter table pessoas
drop column profissao;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Alterar nome da Tabela ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

alter table pessoas
rename to colaboradores;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Ordenar colunas por ... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

#Ordem da coluna de cima para baixo
select * from cursos order by nome;

#De baixo para cima
select * from cursos order by desc nome;




