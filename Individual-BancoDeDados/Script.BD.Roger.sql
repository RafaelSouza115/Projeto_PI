CREATE DATABASE IceBlood;

USE IceBlood;

CREATE TABLE Cadastro_empresa (
Id_Empresa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_Empresa VARCHAR(30) NOT NULL,
Cnpj_Empresa VARCHAR(20) NOT NULL UNIQUE,
Cep_Empresa VARCHAR(10) NOT NULL,
Endereco_Empresa VARCHAR(30) NOT NULL,
Telefone_Empresa VARCHAR(15) NOT NULL,
Email_Empresa VARCHAR(30) NOT NULL UNIQUE, 
Senha_Empresa VARCHAR(20) NOT NULL ,
Responsavel_Empresa VARCHAR(30) NOT NULL,
CONSTRAINT chk_email_empresa CHECK (Email_Empresa LIKE '%@%')
);

CREATE TABLE Sensor (
Id_Sensor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Codigo_Sensor VARCHAR(30) UNIQUE, 
Tipo VARCHAR(30) NOT NULL,
Local_Instalado VARCHAR(30) NOT NULL,
Status_sensor VARCHAR(30) NOT NULL,
Dt_Instalacao DATE NOT NULL,
CONSTRAINT chk_status_sensor CHECK (Status_sensor IN ('Ativo', 'Inativo'))
);

CREATE TABLE Medicao_temperatura (
Id_medicao INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Id_Equipamento VARCHAR(30) NOT NULL UNIQUE,
Temperatura DECIMAL(3,1) NOT NULL,
Data_Time DATETIME NOT NULL,
Usuario_responsavel VARCHAR(30) NOT NULL
);

CREATE TABLE Doador (
Id_Doador INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_Doador VARCHAR(30) NOT NULL,
Idade_Doador INT NOT NULL,
Genero_doador VARCHAR(20) NOT NULL,
Cpf_Doador VARCHAR(11) NOT NULL UNIQUE,
Endereco_Doador VARCHAR(30) NOT NULL,
Email_Doador VARCHAR(30) NOT NULL UNIQUE,
Data_doacao DATE NOT NULL,
Quantidade_sangue DECIMAL(4,3) NOT NULL,
Doencas_Doador VARCHAR(50) NOT NULL,
CONSTRAINT chk_email_doador CHECK ( Email_Doador LIKE '%@%')
);

CREATE TABLE Bolsas_Sangue (
IdBolsa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Codigo_bolsa VARCHAR(30) NOT NULL UNIQUE,
Tipo_Sangue VARCHAR(10) NOT NULL,
Dt_Coleta DATE NOT NULL,
Dt_Validade DATE NOT NULL,
Status_Bolsa VARCHAR(30)
CONSTRAINT chk_status_bolsa CHECK (Status_Bolsa IN ('Armazenada', 'Transfundida', 'Vencida'))
);


CREATE TABLE Alerta (
Id_Alerta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Data_hora_alerta DATETIME NOT NULL,
Status_Alerta VARCHAR(30) NOT NULL,
Local_Alerta VARCHAR(30) NOT NULL,
Nivel_Alerta VARCHAR(30) NOT NULL,
Descricao_Alerta VARCHAR(30) NOT NULL,
CONSTRAINT chk_status_alerta CHECK (Status_alerta IN ('Aberto', 'Em andamento', 'Fechado')),
CONSTRAINT chk_descricao_alerta CHECK (Descricao_Alerta IN ('Acima do Ideal!', 'Abaixo do Ideal!')),
CONSTRAINT chk_nivel_alerta CHECK (Nivel_Alerta IN ('Baixo', 'Médio', 'Alto'))
);

CREATE TABLE Usuario (
Id_Usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_Usuario VARCHAR(30) NOT NULL,
Email_Usuario VARCHAR(30) NOT NULL UNIQUE,
Senha VARCHAR(30) NOT NULL,
Nivel_Acesso VARCHAR(30) NOT NULL,
CONSTRAINT chk_email_usuario CHECK (Email_Usuario LIKE '%@%'),
CONSTRAINT chk_nivel_acesso CHECK ( Nivel_Acesso IN ('Admin', 'Operador', 'Enfermeira/o'))
);

USE IceBlood;

-- INSERTS

INSERT INTO Cadastro_empresa 
(Nome_Empresa, Cnpj_Empresa, Cep_Empresa, Endereco_Empresa, Telefone_Empresa, Email_Empresa, Senha_Empresa, Responsavel_Empresa)
VALUES
('Hemocentro SP', '12345678000199', '01000-000', 'Av. Paulista, 1000', '11987654321', 'contato@hemosp.com', 'senha123', 'Dr. Silva'),
('VidaSaude LTDA', '98765432000188', '02000-000', 'Rua das Flores, 200', '1122334455', 'info@vidasaude.com', 'vida2025', 'Ana Costa'),
('SangueBom ONG', '45678912000177', '03000-000', 'Praça Central, 50', '11911223344', 'ong@sanguebom.org', 'doar@123', 'Carlos Mendes');


INSERT INTO Sensor (Codigo_Sensor, Tipo, Local_Instalado, Status_sensor, Dt_Instalacao)
VALUES
('SENS-001', 'Temperatura', 'Freezer 1', 'Ativo', '2025-01-01'),
('SENS-002', 'Temperatura', 'Freezer 2', 'Inativo', '2025-02-01'),
('SENS-003', 'Umidade', 'Sala 3', 'Ativo', '2025-03-01');

INSERT INTO Medicao_temperatura (Id_Equipamento, Temperatura, Data_Time, Usuario_responsavel)
VALUES
('EQP-001', 4.5, '2025-08-30 10:30:00', 'João'),
('EQP-002', 8.2, '2025-08-30 11:00:00', 'Maria'),
('EQP-003', 3.8, '2025-08-30 11:30:00', 'Pedro');


INSERT INTO Doador (Nome_Doador, Idade_Doador, Genero_doador, Cpf_Doador, Endereco_Doador, Email_Doador, Data_doacao, Quantidade_sangue, Doencas_Doador)
VALUES
('Lucas Pereira', 28, 'Masculino', '12345678901', 'Rua A, 10', 'lucas@gmail.com', '2025-08-20', 0.450, 'Nenhuma'),
('Fernanda Souza', 34, 'Feminino', '98765432100', 'Av. B, 200', 'fernanda@hotmail.com', '2025-08-25', 0.500, 'Hipertensão'),
('Carlos Lima', 42, 'Masculino', '45612378955', 'Rua C, 30', 'carlos@yahoo.com', '2025-08-28', 0.470, 'Diabetes');


INSERT INTO Bolsas_Sangue (Codigo_bolsa, Tipo_Sangue, Dt_Coleta, Dt_Validade, Status_Bolsa)
VALUES
('BLS-001', 'A+', '2025-08-20', '2025-09-20', 'Armazenada'),
('BLS-002', 'O-', '2025-08-15', '2025-09-15', 'Transfundida'),
('BLS-003', 'B+', '2025-07-30', '2025-08-30', 'Vencida');

INSERT INTO Alerta (Data_hora_alerta, Status_Alerta, Local_Alerta, Nivel_Alerta, Descricao_Alerta)
VALUES
('2025-08-30 12:00:00', 'Aberto', 'Freezer 1', 'Alto', 'Acima do Ideal!'),
('2025-08-30 12:30:00', 'Em andamento', 'Freezer 2', 'Médio', 'Abaixo do Ideal!'),
('2025-08-30 13:00:00', 'Fechado', 'Sala 3', 'Baixo', 'Acima do Ideal!');

INSERT INTO Usuario (Nome_Usuario, Email_Usuario, Senha, Nivel_Acesso)
VALUES
('João Admin', 'joao@iceblood.com', 'admin123', 'Admin'),
('Maria Operadora', 'maria@iceblood.com', 'operadora456', 'Operador'),
('Pedro Enfermeiro', 'pedro@iceblood.com', 'enf789', 'Enfermeira/o');

-- UPDATES

UPDATE Sensor
SET Status_sensor = 'Ativo'
WHERE Codigo_Sensor = 'SENS-002';

UPDATE Medicao_temperatura
SET Temperatura = 5.0
WHERE Id_Equipamento = 'EQP-001';

UPDATE Bolsas_Sangue
SET Status_Bolsa = 'Armazenada'
WHERE Codigo_bolsa = 'BLS-003';

UPDATE Alerta
SET Status_Alerta = 'Fechado'
WHERE Id_Alerta = 1;

UPDATE Usuario
SET Senha = 'novaSenha2025'
WHERE Id_Usuario = 2;

-- ALTER TABLE

ALTER TABLE Cadastro_empresa
ADD COLUMN Site_Empresa VARCHAR(50);

ALTER TABLE Cadastro_empresa
MODIFY COLUMN Endereco_Empresa VARCHAR(100) NOT NULL;

ALTER TABLE Doador
ADD COLUMN Observacao VARCHAR(100);


ALTER TABLE Cadastro_empresa
MODIFY COLUMN Telefone_Empresa VARCHAR(20) NOT NULL;

ALTER TABLE Cadastro_empresa
CHANGE COLUMN Senha_Empresa SenhaLogin VARCHAR(20) NOT NULL;