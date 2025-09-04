CREATE DATABASE pi;
use pi;

CREATE TABLE cadastro_empresa(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
empresa VARCHAR(45) NOT NULL,
cnpj VARCHAR(14) UNIQUE NOT NULL,
Cep VARCHAR(10) NOT NULL,
Endereco VARCHAR(50) NOT NULL,
Telefone VARCHAR(18) NOT NULL,
Email VARCHAR(50) NOT NULL UNIQUE, 
Senha VARCHAR(30) NOT NULL ,
Responsavel VARCHAR(40) NOT NULL
);
INSERT INTO cadastro_empresa(empresa,cnpj,Cep,Endereco,Telefone,Email,Senha,Responsavel)VALUES
('Notredame', '47069055000111','58421695','Av.Lombato','(95)3832-4846','notre@gmail.com','notre123', 'José'),
('BioMedic', '35905575000138','74464000','Rua.Cantares','(86)3453-6457','bio@gmail.com','bio123', 'Clara'),
('Colsan','80569378000140','65918093','Av.Salomao','(69)3174-5515','col@gmail.com','colsan123', 'Roberto'),
('Albert Einstein','72045806000107','85303315','Rua.Flores','(11)2650-2871','albert@gmail.com','albert123', 'Silvia'),
('Hospital São Paulo','77231432000138','69900098','Av.Salavino','(12)3263-2732','HSP@gmail.com','sp123','Pedro');
SELECT * FROM cadastro_empresa;
-- ------------------------------------------------------------------------------------------------ --
CREATE TABLE Sensor (
Id INT PRIMARY KEY AUTO_INCREMENT,
codigosensor VARCHAR(30) UNIQUE, 
tipo VARCHAR(30) NOT NULL,
local_instalado VARCHAR(30) NOT NULL,
status_sensor VARCHAR(30) NOT NULL,
dtinstalacao DATE,
CONSTRAINT chkstatus_sensor CHECK (status_sensor IN ('Ativo', 'Inativo'))
);
INSERT INTO Sensor(codigosensor,tipo,local_instalado,status_sensor,dtinstalacao) VALUES
('32pb452','Sensor de Temperatura','Câmara de Bolsas Sanguíneas','Inativo', NULL);
-- ------------------------------------------------------------------------------------------ --
CREATE TABLE Medicao_temperatura (
id INT PRIMARY KEY AUTO_INCREMENT,
Codigo_Equipamento VARCHAR(30) NOT NULL,
Temperatura DECIMAL(3,1) NOT NULL,
Data_Armazenada VARCHAR(10),
Usuario_responsavel VARCHAR(30) NOT NULL
);
INSERT INTO Medicao_temperatura(Codigo_Equipamento,Temperatura,Data_Armazenada,Usuario_responsavel)VALUES
('RESP-01',8.0,'01-09-2025','Tom Jobim'),
('RESP-02',4.3,'10-08-2025','Maria'),
('RESP-03',3.8,'13-06-2025','Pedro'),
('RESP-04',5.1,'03-07-2025','Cleber'),
('RESP-5',2.2,'16-08-2025','Kelly');
SELECT * FROM Medicao_temperatura;
UPDATE Medicao_temperatura SET Codigo_Equipamento = 'RESP-05'
WHERE id = 5;
-- ------------------------------------------------------------------------------------- - 
CREATE TABLE Doador (
id INT PRIMARY KEY AUTO_INCREMENT,
nomeDoador VARCHAR(30) NOT NULL,
idadeDoador INT NOT NULL,
generoDoador VARCHAR(20) NOT NULL,
cpfDoador VARCHAR(11) NOT NULL UNIQUE,
enderecoDoador VARCHAR(30) NOT NULL,
emailDoador VARCHAR(30) NOT NULL UNIQUE,
dataDoacao VARCHAR(10),
quantidadeSangue VARCHAR(8),
doencasDoador VARCHAR(50) NOT NULL,
CONSTRAINT chkgenero
CHECK(generoDoador IN('Masculino','Feminino'))
);
INSERT INTO Doador(nomeDoador,idadeDoador,generoDoador,cpfDoador,enderecoDoador,emailDoador,dataDoacao,quantidadeSangue,doencasDoador) VALUES
('Pedro',18,'Masculino','452.275-23','Av.Brasilia','pedro@gmail.com','20-07-2025','450ml','Nenhuma'),
('Larissa',23,'Feminino','432.345-10','Rua.Catanduva','Larissa@gmail.com','07-08-2025','450ml','Nenhuma'),
('Carlos',28,'Masculino','434.567-09','Av.Piraporinha','Carlos@gmail.com',NULL,NULL,'Nenhuma');
-- ----------------------------------------------------------------------------------------------- --
CREATE TABLE Alerta (
id INT PRIMARY KEY AUTO_INCREMENT,
horaAlerta DATETIME NOT NULL, --  DEFAULT CURRENT_TIMESTAMP -- 
statusAlerta VARCHAR(45) NOT NULL,
nivelAlerta VARCHAR(40) NOT NULL,
descricaoAlerta VARCHAR(20) NOT NULL,
statusGerador VARCHAR(8) NOT NULL,
CONSTRAINT chkstatusAlerta CHECK (statusAlerta IN ('Aberto', 'Em andamento...', 'Resolvido')),
CONSTRAINT chknivelAlerta CHECK (nivelAlerta IN ('Baixo', 'Moderado', 'Grave!')),
CONSTRAINT chkdescricaoAlerta CHECK (descricaoAlerta IN ('Acima do Ideal!', 'Abaixo do Ideal!')),
CONSTRAINT chkstatusGerador CHECK (statusGerador In ('Acionado!', 'Suspenso'))
);
ALTER TABLE Alerta MODIFY COLUMN statusGerador VARCHAR(10);
INSERT INTO Alerta(horaAlerta,statusAlerta,nivelAlerta,descricaoAlerta,statusGerador) VALUES
('2025-08-11 22:13:08', 'Resolvido', 'Baixo', 'Abaixo do Ideal!', 'Suspenso'),
('2025-07-22 08:36:46', 'Resolvido', 'Moderado', 'Acima do Ideal!', 'Acionado!'),
('2025-06-05 15:23:02', 'Em andamento...', 'Baixo', 'Abaixo do Ideal!', 'Suspenso');



