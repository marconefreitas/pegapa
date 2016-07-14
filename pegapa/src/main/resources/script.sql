drop database if exists pegapa;
create database pegapa;
use pegapa
create table usuario(
	cod_user integer not null auto_increment,
	nome varchar(70) not null,
	cnpj varchar(14),
	cpf varchar(11),
	telefone varchar(11) not null,
	email varchar(50) not null unique,
	senha varchar(15) not null,
	perfil integer not null, 
	primary key(cod_user)
);