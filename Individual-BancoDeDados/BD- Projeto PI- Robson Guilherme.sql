create database Sprint1;
use sprint1;
create table CadastroEmpresa(
idCadastro int primary key auto_increment,
nomeEmpresa varchar(40),
cnpjEmpresa varchar(40),
endereçoEmpresa varchar(40),
telefoneEmpresa varchar(15),
emailEmpresa varchar(40) not null unique,
responsavelEmpresa varchar (40) not null,
senhaEmpresa varchar(40)not null,
cepEmpresa char(9),
dtCadastroEmpresa datetime default current_timestamp
);


create table CadasrtroArduino(
idArduino int primary key auto_increment,
nomeArduino varchar(40),
salaArduino varchar(40),
CodIdentificação varchar(40),
dtCadastroArduino datetime default current_timestamp
);


create table alert(
problema varchar(40),
constraint chkProblema
check(problema('temperatura baixa','gerador', 'refrigeradores')),
alerta varchar (40),
constraint chkAlerta
check(alerta in('baixa', 'média', 'alta')),
chamado varchar(40),
constraint chkChamado
check(chamado in('aberto','fechado')),
dtCadastroArduino datetime default current_timestamp);

create table sensores(
idSensor int primary key auto_increment,
nomeSensor varchar(40),
statussSensor varchar(40),
constraint chkStatus
checK (statuss in ('Ativo','Inativo')),
dtInstalação datetime default current_timestamp);

create table doador(
idDoador int primary key auto_increment,
nomeDoador varchar(40),
dtnDoador date,
generoDoador varchar(40),
cpfDoador varchar(40),
endereçoDoador varchar(40),
emailDoador varchar(40),
constraint chkEmailDoador
check (chkEmailDoador like '%@%'),
tipoDeSangueDoador varchar(2),
dtDoação datetime default current_timestamp,
doencas varchar(40));
  

create table login(
idLogin int primary key auto_increment,
emailLogin varchar(40),
constraint chkEmailLogin
check (emailLogin like '%@%'),
senhaLogin varchar(40),
tipoConta varchar (40),
constraint chkTipo
check (tipoConta in('local','administradir')));