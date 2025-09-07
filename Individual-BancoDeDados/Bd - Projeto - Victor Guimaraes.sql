
CREATE TABLE Empresa(
idEmpresa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nomeEmpresa VARCHAR(45),
CNPJ CHAR(18),
contato VARCHAR(14),
email VARCHAR(40),
senha VARCHAR(40),
data_inicio DATE,
CEP_Empresa CHAR(9),
numeroEndereco INT
);

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
NomeUsuario VARCHAR(45),
funcao CHAR(3),
CHECK (funcao = 'fun' or 'adm')
);

CREATE TABLE Unidade(
idUnidade INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nomeUnidade VARCHAR(45),
CEP_Unidade CHAR(9),
Numero_endereco INT
);

CREATE TABLE Doador (
idDoador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
NomeDoador VARCHAR (50),
idadeDoador INT,
cpfDoador VARCHAR (11) NOT NULL UNIQUE,
generoDoador VARCHAR(30),
emailDoador VARCHAR(40),
cepDoador CHAR(9),
dataDoacao DATE NOT NULL,
doencasDoador VARCHAR(50),
CONSTRAINT chkGenero CHECK(generoDoador IN('M', 'F'))
);

CREATE TABLE Bolsas_Sangue (
IdBolsa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
codigoBolsa VARCHAR(30) NOT NULL UNIQUE,
tipoSangue VARCHAR(10) NOT NULL
CONSTRAINT chkTipoSangue CHECK(tipoSangue IN('A+', 'A-','B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
dtColeta DATE NOT NULL,
dtValidade DATE NOT NULL,
statusBolsa VARCHAR(30)
CONSTRAINT chk_status_bolsa CHECK (statusBolsa IN ('Armazenada', 'Transfundida', 'Vencida'))
);


CREATE TABLE Alerta (
idAlerta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
dataHoraAlerta DATETIME NOT NULL,
numeroSensor VARCHAR(8),
tempCelsius INT,
statusAlerta VARCHAR(30) NOT NULL,
localAlerta VARCHAR(30),
nivelAlerta VARCHAR(30),
descricaoAlerta VARCHAR(30) NOT NULL,
CONSTRAINT chkStatusAlerta CHECK (statusAlerta IN ('Aberto', 'Em andamento', 'Fechado')),
CONSTRAINT chkDescricaoAlerta CHECK (descricaoAlerta IN ('Acima do Ideal!', 'Abaixo do Ideal!')),
CONSTRAINT chkNivelAlerta CHECK (nivelAlerta IN ('Baixo', 'Médio', 'Alto'))
);






