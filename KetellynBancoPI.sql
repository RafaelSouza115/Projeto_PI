CREATE DATABASE econblood;
use econblood;

create table cadastro_empresa (
  idEmpre INT PRIMARY KEY AUTO_INCREMENT, 
  nomeEmpre varchar(150) not null,
  cnpj varchar(14),
  telefoneEmpre varchar(15) not null,
  emailEmpre varchar(35) unique,
  senhaEmpre varchar(35) not null,
  endeEmpre varchar(45) not null,
  cepEmpre varchar(25)
);

create table doador (
  idDoador INT PRIMARY KEY AUTO_INCREMENT,
  nomeDoador varchar(45) not null,
  dataNascDoa date not null, 
  cpfDoador varchar(20) unique,
  tipoSanguineoDoa varchar(3) not null,
  genero varchar(9) check (genero in ('feminino', 'masculino')),
  emailDoa varchar(70) unique, 
  telefoneDoa varchar(15) not null,
  cepDoa varchar(12),
pesoDoa decimal (3,2) not null,
altura decimal(4,2),
 qtdDoacoes int default 0
);

create table sangue (
  idSangue INT PRIMARY KEY AUTO_INCREMENT,
  tipoSangue varchar(6) not null,
  quantidadeSangue int not null,
  dataRetirada datetime not null,
  dataValidade datetime not null,
  codigoBolsa varchar(25) not null unique,
  Status_Bolsa varchar(25) not null
    check (Status_Bolsa in ('ativa', 'transfundida', 'vencida'))
);

create table usuario (
  idUser INT PRIMARY KEY AUTO_INCREMENT,
  nomeUser varchar(45) not null,
  emailUser varchar(55) not null check (emailUser LIKE '%@%'),
  funcaoUser varchar(12) not null
    check (funcaoUser in ('estagiario', 'enfermeira','adm','operador','tecnico')),
turnoUser varchar(15)
constraint chkturno CHECK (turnoUser in ('manhã','tarde','noite'))
);

create table arduino (
  idArduino INT PRIMARY KEY AUTO_INCREMENT,
  temperaturaArduino varchar(8),
  salaArduino varchar(30),
  dataInstal datetime default current_timestamp,
  quantArdu INT,
  codId varchar(35) not null unique
);

create table alert (
  idAlert int primary key auto_increment,
  problema varchar(25) not null
    check (problema in ('temperatura desregular', 'gerador','refrigeracao')),
  chamado varchar (10) not null 
    check (chamado in ('aberto' , 'fechado')),
  dtCadArdu datetime default current_timestamp,
alertaAler varchar(15) 
constraint chkalerta CHECK (alertaAler in('baixa', 'média', 'alta'))
);

create table sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT, 
  quantSen INT not null,
  dtInstalSen datetime default current_timestamp,
  codIdSen int not null
);

create table manutencao (
  idManutencao int primary key auto_increment,
  equipamento varchar(30) not null,
  descricao varchar(100),
  dataManut datetime default current_timestamp,
  responsavel varchar(45)
);

insert into cadastro_empresa (nomeEmpre, cnpj, telefoneEmpre, emailEmpre, senhaEmpre, endeEmpre, cepEmpre) values
('Hemocentro VidaNova', '12345678000195', '11987654321', 'vida@hemocentro.com', 'senha123', 'Rua das Flores, 100', '01234000'),
('Clinica SanguePuro', '98765432000101', '11911223344', 'contato@sanguepuro.com', 'abc123', 'Av Brasil, 45', '04567000'),
('Banco de Sangue Esperanca', '45678912000155', '11922334455', 'contato@esperanca.com', 'qwe456', 'Rua Central, 500', '01122000'),
('Hemovida Popular', '32165487000120', '11988997766', 'hemovida@pop.com', 'xyz789', 'Av Paulista, 900', '01310900'),
('Clinica BoaSaude', '74125896000177', '11977776666', 'contato@boasaude.com', 'pass123', 'Rua Verde, 22', '03345000');

select * from cadastro_empresa;

insert into usuario (nomeUser, emailUser, funcaoUser, turnoUser) values
('Marcos Rocha', 'marcos@empresa.com', 'adm','manha'),
('Juliana Costa', 'juliana@empresa.com', 'enfermeira','tarde'),
('Paulo Lima', 'paulo@empresa.com', 'operador','noite'),
('Ana Ferreira', 'ana@empresa.com', 'tecnico','manha'),
('Roberta Dias', 'roberta@empresa.com', 'estagiario','tarde'),
('Lucas Martins', 'lucas@empresa.com', 'operador','noite');

select * from usuario;

INSERT INTO doador (nomeDoador,dataNascDoa,cpfDoador,tipoSanguineoDoa,genero,emailDoa,telefoneDoa,cepDoa,pesoDoa, altura, qtdDoacoes) VALUES
('Carlos Almeida', '1990-05-12', '12345678901', 'O+', 'masculino', 'carlos@email.com', '11955556666', '01310000', 78.5, 1.75, 2),
('Fernanda Silva', '1987-11-30', '98765432100', 'A-', 'feminino', 'fernanda@email.com', '11944443333', '02220000', 62.0, 1.63, 5),
('Kitty Wayne', '1995-07-20', '45678912300', 'B+', 'masculino', 'kitty@email.com', '11933332222', '04567000', 85.2, 1.80, 1),
('Mariana Costa', '2000-01-15', '78912345677', 'O-', 'feminino', 'mariana@email.com', '11966667777', '01234000', 58.9, 1.60, 3),
('Rafael Gomes', '1992-09-09', '32165498712', 'AB+', 'masculino', 'rafael@email.com', '11988889999', '03345000', 90.0, 1.82, 4);

alter table doador modify column pesoDoa decimal(5,2);

select * from doador;

insert into sangue (tipoSangue, quantidadeSangue, dataRetirada, dataValidade, codigoBolsa, Status_Bolsa) values
('O+', 450, '2025-09-01 10:00:00', '2025-10-01 10:00:00', 'BOLSA001', 'ativa'),
('A-', 500, '2025-09-02 11:30:00', '2025-10-02 11:30:00', 'BOLSA002', 'ativa'),
('B+', 450, '2025-09-03 09:15:00', '2025-10-03 09:15:00', 'BOLSA003', 'ativa'),
('O-', 480, '2025-09-01 14:00:00', '2025-10-01 14:00:00', 'BOLSA004', 'transfundida'),
('AB+', 460, '2025-09-02 16:45:00', '2025-10-02 16:45:00', 'BOLSA005', 'vencida');

select * from sangue;

insert into arduino (temperaturaArduino, salaArduino, quantArdu, codId) values
('4C', 'Sala 01', 2, 'ARD001'),
('5C', 'Sala 02', 3, 'ARD002'),
('3C', 'Sala 03', 1, 'ARD003'),
('6C', 'Sala 04', 2, 'ARD004');

select * from arduino;

insert into alert (problema, chamado, alertaAler) values
('temperatura desregular', 'aberto','alta'),
('gerador', 'fechado','media'),
('refrigeracao', 'aberto','alta'),
('temperatura desregular', 'fechado','baixa');

select * from alert;

insert into sensor (quantSen, codIdSen) values
(4, 101),
(3, 102),
(5, 103),
(2, 104);

select * from sensor;

insert into manutencao (equipamento, descricao, responsavel) values
('Refrigerador 01', 'Troca de filtro de ar', 'Carlos Silva'),
('Arduino ARD001', 'Atualizacao de firmware', 'Paulo Lima'),
('Sensor 103', 'Recalibragem de leitura', 'Ana Ferreira'),
('Refrigerador 02', 'Verificacao de vazamento', 'Juliana Santos');

select * from manutencao;