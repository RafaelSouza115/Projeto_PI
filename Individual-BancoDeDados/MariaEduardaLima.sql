-- Criação do banco de dados do projeto
CREATE DATABASE Projeto_pi;
USE Projeto_pi;

-- ================= EMPRESA =================
-- Armazena os dados da instituição (hospital, clínica, hemocentro).

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(50) NOT NULL,
    userEmpresa VARCHAR(40) NOT NULL,
    senhaEmpresa VARCHAR(90) NOT NULL,
    emailEmpresa VARCHAR(60) NOT NULL,
    cnpjEmpresa VARCHAR(15) NOT NULL,
    cepEmpresa VARCHAR(15),
    logradouroEmpresa VARCHAR(50),
    numeroEmpresa VARCHAR(20),
    bairroEmpresa VARCHAR(30),
    cidade VARCHAR(50),
    estadoEmpresa VARCHAR(20),
    ufEmpresa CHAR(2)
);

-- ================= TELEFONE EMPRESA =================
-- Telefones adicionais para contato, suporte ou emergência.
CREATE TABLE TelefoneEmpresa (
    idTelefoneEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    numeroTelefoneEmpresa VARCHAR(20) NOT NULL,
    dtCadastroTelefoneEmpresa DATE
);

-- ================= USUÁRIO =================
-- Representa pessoas que terão acesso ao sistema (administrador ou técnico).
-- A distinção por nível de acesso garante maior segurança no gerenciamento.
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(100) NOT NULL,
    senhaUsuario VARCHAR(100) NOT NULL,
    dtCadastro DATE,
    acessoCadastro VARCHAR(40) NOT NULL,
    CONSTRAINT chkAcesso CHECK (acessoCadastro IN ('Administrador', 'Técnico'))
);

-- ================= DOADOR =================
-- Armazena informações sobre os doadores de sangue. É importante para rastrear a origem de cada coleta.

CREATE TABLE Doador (
    idDoador INT PRIMARY KEY AUTO_INCREMENT,
    nomeDoador VARCHAR(60) NOT NULL,
    dtNascDoador DATE NOT NULL,
    sexoDoador CHAR(1) CHECK (sexoDoador IN ('M','F')),
    cpfDoador VARCHAR(15) NOT NULL,
    tipoSanguineoDoador VARCHAR(3),
    CONSTRAINT chkTipoDoador CHECK (tipoSanguineoDoador IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    emailDoador VARCHAR(60),
    telefoneDoador VARCHAR(20),
    logradouro VARCHAR(60),
    bairroDoador VARCHAR(30),
    numeroDoador VARCHAR(20),
    doencasDoador VARCHAR(50),
    dtCadastro DATE,
    statusDoador VARCHAR(20) CHECK (statusDoador IN ('Ativo','Inativo'))
);


-- ================= COLETA DE SANGUE =================
-- Cada doação gera uma coleta, que posteriormente dará origem a bolsas.
CREATE TABLE ColetaSangue (
    idColetaSangue INT PRIMARY KEY AUTO_INCREMENT,
    dtColetaSangue DATETIME NOT NULL,
    qtdeColetaSangue DECIMAL(4,2)
);

-- ================= BOLSA DE SANGUE =================
-- Cada coleta é armazenada em bolsas que precisam de controle rigoroso.

CREATE TABLE BolsaSangue (
    idBolsaSangue INT PRIMARY KEY AUTO_INCREMENT,
    codigoBolsaSangue VARCHAR(100) UNIQUE NOT NULL,
    tipoSanguineoBolsaSangue VARCHAR(20),
    CONSTRAINT chkTipoSanguineo CHECK (
        tipoSanguineoBolsaSangue IN ('A', 'B', 'AB', 'O', 'A+', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    dtValidadeBolsaSangue DATE NOT NULL,
    statusBolsaSangue VARCHAR(30),
    CONSTRAINT chkStatusBolsa CHECK (statusBolsaSangue IN ('Ativa', 'Desativada'))
);


-- ================= ALERTA =================
-- Quando há problema de temperatura ou armazenamento, o sistema gera alertas.

CREATE TABLE Alerta (
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    dtHoraAlerta DATETIME,
    statusAlerta VARCHAR(30) NOT NULL,
    nivelAlerta VARCHAR(30) NOT NULL,
    descricaoAlerta VARCHAR(30) NOT NULL,
    CONSTRAINT chkStatusAlerta CHECK (statusAlerta IN ('Aberto', 'Em andamento', 'Fechado')),
    CONSTRAINT chkDescricaoAlerta CHECK (descricaoAlerta IN ('Acima do Ideal!', 'Abaixo do Ideal!')),
    CONSTRAINT chkNivelAlerta CHECK (nivelAlerta IN ('Baixo', 'Médio', 'Alto'))
);

-- ================= SENSOR =================

CREATE TABLE Sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    codigoSensor VARCHAR(30) UNIQUE, 
    TipoSensor VARCHAR(30) NOT NULL,
    statusSensor VARCHAR(30) NOT NULL,
    DtInstalacaoSensor DATETIME,
    CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('Ativo', 'Inativo'))
);

-- ================= TEMPERATURA =================
-- Registra leituras feitas pelos sensores, indicando se o ambiente está dentro da faixa ideal.
-- Esses dados permitem acionar alertas e gerar históricos de monitoramento.
CREATE TABLE Temperatura (
    idTemperatura INT PRIMARY KEY AUTO_INCREMENT,
    equipamentoTemperatura VARCHAR(30) NOT NULL,
    temperatura DECIMAL(3,1) NOT NULL,
    DtTime DATETIME,
    responsavelTemperatura VARCHAR(30) NOT NULL
);







-- INSERINDO UMA EMPRESA
INSERT INTO Empresa (nomeEmpresa, userEmpresa, senhaEmpresa, emailEmpresa, cnpjEmpresa, cepEmpresa, logradouroEmpresa, numeroEmpresa, bairroEmpresa, cidade, estadoEmpresa, ufEmpresa)
VALUES
('Hemocentro São Paulo', 'hsp_admin', 'senha123', 'contato@hsp.com', '12345678000199', '01000-000', 'Av. Paulista', '1000', 'Bela Vista', 'São Paulo', 'São Paulo', 'SP');

-- INSERINDO TELEFONE EMPRESA
INSERT INTO TelefoneEmpresa (numeroTelefoneEmpresa, dtCadastroTelefoneEmpresa)
VALUES
('(11) 3333-4444', '2025-09-01'),
('(11) 98888-7777', '2025-09-01');

-- INSERINDO USUÁRIO
INSERT INTO Usuario (nomeUsuario, senhaUsuario, dtCadastro, acessoCadastro)
VALUES
('João Silva', 'senhaAdmin', '2025-09-01', 'Administrador'),
('Maria Oliveira', 'senhaTec', '2025-09-01', 'Técnico');

-- INSERINDO DOADOR
INSERT INTO Doador (nomeDoador, dtNascDoador, sexoDoador, cpfDoador, tipoSanguineoDoador, emailDoador, telefoneDoador, logradouro, bairroDoador, numeroDoador, doencasDoador, dtCadastro, statusDoador)
VALUES
('Carlos Pereira', '1990-05-20', 'M', '12345678901', 'O+', 'carlos@email.com', '(11) 99999-1111', 'Rua das Flores', 'Centro', '45', 'Nenhuma', '2025-09-01', 'Ativo'),
('Ana Souza', '1985-09-15', 'F', '98765432100', 'A-', 'ana@email.com', '(11) 98888-2222', 'Av. Brasil', 'Jardim', '200', 'Hipertensão', '2025-09-01', 'Ativo'),
('João Lima', '1992-11-02', 'M', '10293847566', 'B+', 'joao@email.com', '(11) 97777-3333', 'Rua Nova', 'Bela Vista', '150', 'Diabetes', '2025-09-01', 'Inativo');


-- COLETA DE SANGUE
INSERT INTO ColetaSangue (dtColetaSangue, qtdeColetaSangue)
VALUES
('2025-09-01 09:30:00', 0.45),
('2025-09-02 10:00:00', 0.50);

-- BOLSA DE SANGUE
INSERT INTO BolsaSangue (codigoBolsaSangue, tipoSanguineoBolsaSangue, dtValidadeBolsaSangue, statusBolsaSangue)
VALUES ('BSA12345', 'O+', '2025-12-01', 'Ativa');


-- SENSOR
INSERT INTO Sensor (codigoSensor, TipoSensor, statusSensor, DtInstalacaoSensor)
VALUES
('LM035', 'Temperatura', 'Ativo', '2025-08-01 08:00:00');

-- TEMPERATURA
INSERT INTO Temperatura (equipamentoTemperatura, temperatura, DtTime, responsavelTemperatura)
VALUES
('Freezer A', 4.5, '2025-09-01 14:00:00', 'Maria Oliveira');

-- ALERTA
INSERT INTO Alerta (dtHoraAlerta, statusAlerta, nivelAlerta, descricaoAlerta)
VALUES
('2025-09-01 18:05:00', 'Aberto', 'Alto', 'Acima do Ideal!'),
('2025-09-01 22:10:00', 'Fechado', 'Médio', 'Abaixo do Ideal!');





-- 1. Listar todas as bolsas de sangue
SELECT codigoBolsaSangue, tipoSanguineoBolsaSangue, statusBolsaSangue FROM BolsaSangue;

-- 2. Listar doadores ativos
SELECT nomeDoador, tipoSanguineoDoador, statusDoador FROM Doador
	WHERE statusDoador = 'Ativo';

-- 3. Listar todos os usuários
SELECT * FROM Usuario;

-- 4. Listar temperaturas registradas
SELECT * FROM Temperatura;

-- 5. Listar empresas
SELECT * FROM Empresa;

-- 6. Temperaturas muito altas (acima de 7 °C)
SELECT equipamentoTemperatura, temperatura, DtTime, responsavelTemperatura FROM Temperatura
	WHERE temperatura > 7.0;

-- 7. Temperaturas muito baixas (abaixo de 3 °C)
SELECT equipamentoTemperatura, temperatura, DtTime, responsavelTemperatura FROM Temperatura
	WHERE temperatura < 3.0;


