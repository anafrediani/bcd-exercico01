/*projeto atualizado*/
;
create database tarefa_ana;

use tarefa_ana;
create table consultoria(
num_con bigint not null auto_increment,
nome_con varchar(30) not null,
comissao numeric(10,2),
primary key(num_con)
);

create table cliente (
cod_cli bigint not null auto_increment,
nome_cli varchar(50) not null,
dob datetime not null,
cpf varchar(11) not null unique,
primary key(cod_cli)
);

create table tipofundo(
cod_tipoFundo bigint not null auto_increment,
desc_tipoFundo varchar(30) not null,
primary key(cod_tipoFundo)
);

create table investimento(
num_investimento bigint not null auto_increment,
nome_investimento varchar(60),
cod_tipoFundo bigint not null,
inicio datetime,
ativo_s_n char(1),
primary key(num_investimento),
foreign key (cod_tipoFundo) references tipofundo(cod_tipoFundo) 
);

create table aplicaçao(
num_aplicaçao bigint not null auto_increment,
cod_cli bigint not null,
num_investimento bigint not null,
num_con bigint not null,
data_aplicaçao datetime,
valor_aplicaçao numeric(10,2),
primary key(num_aplicaçao),
foreign key(cod_cli) references cliente(cod_cli),
foreign key(num_investimento) references investimento (num_investimento),
foreign key(num_con) references consultoria(num_con)
);

insert into consultoria (nome_con, comissao) values ("Andre",5), ("joana",7), ("ricardo",4), ("joao",10), ("leone",8);
select *from consultoria;

insert into cliente (nome_cli, dob, cpf) value ("ana", "2005-03-14", 393035), ("gabi","1990-10-04", 030506), ("leo","1999-03-04",789456);
select *from cliente;

insert into tipofundo (desc_tipoFundo) value ("açoes"), ("imobiliarios"),("multimercados"), ("moeda"), ("americanas");
select *from tipofundo;

insert into investimento (nome_investimento, cod_tipoFundo, inicio, ativo_s_n)value ("cash",1,"2022-02-18","s"), ("invest",2,"2023-02-16","n"),("money",3,"2020-03-14","s");
select *from investimento;

insert into aplicaçao (cod_cli,num_investimento, num_con,data_aplicaçao,valor_aplicaçao)value (1,4,5,"2022-10-15",10),(2,6,3,"2023-01-22",8),(3,6,4,"2020-05-22",8),(4,5,5,"2021-07-23",8);
select *from aplicaçao
join cliente on aplicaçao.cod_cli = cliente.cod_cli
join investimento on aplicaçao.num_investimento = investimento.num_investimento
join consultoria on aplicaçao.num_con = consultoria.num_con;
