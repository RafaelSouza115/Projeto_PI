CREATE DATABASE iceblood;
USE iceblood;

CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(150) NOT NULL,
    cnpj_empresa CHAR(14) NOT NULL,
    endereco_empresa VARCHAR(200) NOT NULL,
    CEP_empresa VARCHAR(200) NOT NULL,
    contato_empresa VARCHAR(15) NOT NULL,
    email_empresa VARCHAR(50) UNIQUE NOT NULL,
    senha_empresa VARCHAR(30) NOT NULL,
    dt_cadastro_empresa DATETIME,
    responsavel_empresa VARCHAR(30),
	CONSTRAINT chk_email_empresa CHECK (email_empresa LIKE '%@%')
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL,
    email_usuario VARCHAR(100) UNIQUE NOT NULL,
    senha_usuario VARCHAR(50) NOT NULL,
    cargo_usuario VARCHAR(50) NOT NULL,
    permissao_usuario VARCHAR(20) NOT NULL
    CONSTRAINT chk_permissao_usuario CHECK (permissao_usuario IN ('Admin', 'Operador', 'Visualizador'))
	CONSTRAINT chk_email_usuario CHECK (email_usuario LIKE '%@%')
);

CREATE TABLE Arduino (
    id_arduino INT AUTO_INCREMENT PRIMARY KEY,
    local_instalado_arduino VARCHAR(100) NOT NULL,
    stats_arduino VARCHAR(20) NOT NULL,
    temperatura_arduino DECIMAL(5,2) NOT NULL,
    dt_hora_arduino DATETIME NOT NULL,
    CONSTRAINT chk_stats_arduino_arduino CHECK (stats_arduino IN ('Ativo', 'Inativo', 'Manutenção'))
);

CREATE TABLE Doador (
    id_doador INT AUTO_INCREMENT PRIMARY KEY,
    nome_doador VARCHAR(100) NOT NULL,
    cpf_doador CHAR(11) UNIQUE NOT NULL,
    tipo_sanguineo_doador CHAR(3) NOT NULL,
    dt_nascimento_doador DATE NOT NULL,
    contato_doador VARCHAR(15) NOT NULL,
    CONSTRAINT chk_tipo_sanguineo_doador CHECK (tipo_sanguineo_doador IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'))
);

CREATE TABLE Bolsa_Sangue (
    id_bolsa INT AUTO_INCREMENT PRIMARY KEY,
    doador_bolsa VARCHAR(50), 
    tipo_sanguineo_bolsa CHAR(3) NOT NULL,
    validade_bolsa DATE NOT NULL,
    dt_doacao_bolsa DATETIME,
    quantidade_ml_bolsa INT NOT NULL,
    stats_bolsa VARCHAR(20) NOT NULL,
    CONSTRAINT chk_tipo_sanguineo_bolsa CHECK (tipo_sanguineo_bolsa IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
	CONSTRAINT chk_stats_bolsa CHECK (stats_bolsa IN ('Armazenada', 'Transfundida', 'Vencida'))
);

CREATE TABLE Alerta (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    id_arduino INT NOT NULL, 
    tipo_alerta VARCHAR(30) NOT NULL,
    statusGerador_alerta VARCHAR (30),
    gravidadeAlerta_alerta VARCHAR (30),
    dt_hora_alerta DATETIME NOT NULL,
    status_alerta VARCHAR(20) NOT NULL
	CONSTRAINT chk_stats_alerta CHECK (status_alerta IN ('Manunencao', 'Resolvido')),
	CONSTRAINT chk_tipo_alerta CHECK (tipo_alerta IN ('Alta temperatura', 'Baixa temperatura', 'Falha sensor')),
	CONSTRAINT chk_tipo_gravidade_alerta CHECK (gravidade_alerta IN ('Baixa', 'Media', 'Alta')),
    CONSTRAINT chk_Gerador_alerta CHECK(status_Gerador_alerta IN('Acionado','Suspenso'))
);



INSERT INTO empresa VALUES 
	(default, 'Homocentro Cruz Azul', '38657298000180', 'Rua Alexandre Fleming', '13424-052', '1425534589', 'hemocruzazul@hotmail.com.br', 'cruz2356', '2023-04-12', 'Joelma da Conceição Cruz'),
	(default, 'Hospital de Taipas', '57054046000100', 'Rua Rabat', '06654-726', '1526184864', 'hosptaipas@hotmail.com.br', 'cruz2356', '2025-08-10', 'Paulo Henrique Carino Luques'),
	(default, 'Homocentro RP', '18317618000480', 'Rua Tasman', '09750-360', '1230118142', 'hemocentrorp@gmail.com.br', 'senha300', '2020-08-21', 'Levi Borner Bilé'),
    (default, 'Hospital Santa Tech', '23417618000481', 'Avenida Paulista', '06815-400', '1432168192', 'hopsst@.com.br', 'hosps127', '2022-09-08', 'José Antônio Figueiredo'),
	(default, 'Accenture', '18317618000145', 'Alameda das Glicínias', '13342-021', '1727266666', 'eletronicos.marques@geradornv.com.br', 'senha123', '2018-06-01', 'Fellipe Tavares Annunziato');


-- SELECT NA TABELA EMPRESA USANDO 'AS'
SELECT
	id_empresa  AS 'Id Empresa',
    nome AS 'Nome Empresa',
    cnpj AS 'CNPJ',
    endereco AS 'Endereço',
    CEP AS 'CEP',
    email AS 'E-mail',
    senha AS 'Senha',
    dt_cadastro AS 'Data Cadastro Empresa',
    responsavel AS 'Responsável'
FROM empresa;

INSERT INTO Usuario (nome_usuario, email_usuario, senha_usuario, cargo_usuario, permissao_usuario)  VALUES  
('Roger', 'rogerelias@gmail.com',' #elias1234', 'medico', 'Admin'),
('Victor', 'victorgui@gmail.com','#guimaraes', 'Enfermeiro', 'Visualizador'),
('Maria', 'maria157s@gmail.com','ma2234', 'Medica', 'Operador'),
('Robson', 'robson177@gmail.com','robb@', 'Medico', 'Admin'); 
