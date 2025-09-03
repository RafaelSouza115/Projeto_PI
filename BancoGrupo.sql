CREATE DATABASE iceblood;
USE iceblood;

CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    CEP VARCHAR(200) NOT NULL,
    contato VARCHAR(15) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(30) NOT NULL,
    dt_cadastro DATETIME,
    responsavel VARCHAR(30),
	CONSTRAINT chk_email CHECK (email LIKE '%@%')
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    permissao VARCHAR(20) NOT NULL
    CONSTRAINT chk_permissao CHECK (permissao IN ('Admin', 'Operador', 'Visualizador'))
	CONSTRAINT chk_email CHECK (email LIKE '%@%')
);

CREATE TABLE Arduino (
    id_arduino INT AUTO_INCREMENT PRIMARY KEY,
    local_instalado VARCHAR(100) NOT NULL,
    stats VARCHAR(20) NOT NULL,
    id_empresa INT NOT NULL,
    temperatura DECIMAL(5,2) NOT NULL,
    dt_hora DATETIME NOT NULL,
    CONSTRAINT chk_stats_arduino CHECK (stats IN ('Ativo', 'Inativo', 'Manutenção'))
);

CREATE TABLE Doador (
    id_doador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    tipo_sanguineo CHAR(3) NOT NULL,
    dt_nascimento DATE NOT NULL,
    contato VARCHAR(15) NOT NULL,
    CONSTRAINT chk_tipo_sanguineo CHECK (tipo_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'))
);

CREATE TABLE Bolsa_Sangue (
    id_bolsa INT AUTO_INCREMENT PRIMARY KEY,
    doador VARCHAR(50), 
    tipo_sanguineo CHAR(3) NOT NULL,
    validade DATE NOT NULL,
    dt_doacao DATETIME,
    quantidade_ml INT NOT NULL,
    stats VARCHAR(20) NOT NULL,
    CONSTRAINT chk_tipo_sanguineo_bolsa CHECK (tipo_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
	CONSTRAINT chk_stats_bolsa CHECK (stats IN ('Armazenada', 'Transfundida', 'Vencida'))
);

CREATE TABLE Alerta (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    arduino INT NOT NULL, 
    tipo_alerta VARCHAR(30) NOT NULL,
    statusGerador VARCHAR (30),
    gravidadeAlerta VARCHAR (30),
    dt_hora DATETIME NOT NULL,
    statusAlerta VARCHAR(20) NOT NULL
	CONSTRAINT chk_stats_alerta CHECK (statusAlerta IN ('Manunencao', 'Resolvido')),
	CONSTRAINT chk_tipo_alerta CHECK (tipo_alerta IN ('Alta temperatura', 'Baixa temperatura', 'Falha sensor')),
	CONSTRAINT chk_tipo_gravidadeAlerta CHECK (gravidadeAlerta IN ('Baixa', 'Media', 'Alta')),
    CONSTRAINT chkGerador CHECK(statusGerador IN('Acionado','Suspenso'))
);