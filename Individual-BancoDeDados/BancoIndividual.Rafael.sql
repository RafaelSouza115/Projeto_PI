CREATE DATABASE ecomblood;
USE ecomblood;

CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    contato VARCHAR(15) NOT NULL
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    permissao VARCHAR(20) NOT NULL,
    CONSTRAINT chk_permissao CHECK (permissao IN ('Admin', 'Operador', 'Visualizador'))
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
    id_doador INT NOT NULL, 
    tipo_sanguineo CHAR(3) NOT NULL,
    validade DATE NOT NULL,
    quantidade_ml INT NOT NULL,
    stats VARCHAR(20) NOT NULL,
    CONSTRAINT chk_tipo_sanguineo_bolsa CHECK (tipo_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
	CONSTRAINT chk_stats_bolsa CHECK (stats IN ('Armazenada', 'Transfundida', 'Vencida'))
);

CREATE TABLE Alerta (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    id_arduino INT NOT NULL, 
    tipo_alerta VARCHAR(30) NOT NULL,
    dt_hora DATETIME NOT NULL,
    stats VARCHAR(20) NOT NULL
	CONSTRAINT chk_stats_alerta CHECK (stats IN ('Ativo', 'Resolvido')),
	CONSTRAINT chk_tipo_alerta CHECK (tipo_alerta IN ('Alta temperatura', 'Baixa temperatura', 'Falha sensor'))
);
