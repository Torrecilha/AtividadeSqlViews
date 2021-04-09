CREATE DATABASE DBEmpresa;

CREATE TABLE Cliente ( 
cod_cli INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
endereco VARCHAR(201) NOT NULL, 
cidade VARCHAR(20) NOT NULL, 
telefone VARCHAR(9) NOT NULL,
);

CREATE TABLE Departamento (
cod_depto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(20) NOT NULL,
ramal INT(2) NOT NULL,
);

CREATE TABLE Funcionario (
cod_func INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(20),
cod_depto INT REFERENCES departamento(cod_depto)
data_admissao DATE,
cargo VARCHAR(20),
salario REAL,
PRIMARY KEY (cod_func),
cod_depto REFERENCES departamento(cod_depto)
);

CREATE TABLE Venda (
cod_venda INT NOT NULL AUTO_INCREMENT,
data DATE NOT NULL,
cod_cli INT,
PRIMARY KEY (cod_venda),
FOREIGN KEY (cod_cli) REFERENCES cliente(cod_cli),
FOREIGN KEY (cod_depto) REFERENCES funcionario(cod_depto)
); 

CREATE TABLE Categoria (
cod_cat INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(200),
PRIMARY KEY (cod_cat)
);

CREATE TABLE Produto (
cod_prod INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(200),
preco REAL NOT NULL,
estoque VARCHAR(200),
cod_cat INT,
PRIMARY KEY (cod_prod),
FOREIGN KEY (cod_cat) REFERENCES categoria(cod_cat)
);

CREATE TABLE Itens (
qtde INT,
cod_venda INT,
cod_prod INT,
FOREIGN KEY (cod_venda) REFERENCES venda(cod_venda),
FOREIGN KEY (cod_prod) REFERENCES produto(cod_prod)
);

INSERT INTO CLIENTE(nome, endereco, cidade, telefone) VALUES ('Renan', 'Rua Banana', 'São Paulo', '955555555');
INSERT INTO CLIENTE(nome, endereco, cidade, telefone) VALUES ('Fernando', 'Rua Laranja', 'São Paulo', '911111111');
INSERT INTO CLIENTE(nome, endereco, cidade, telefone) VALUES ('Mariana', 'Rua Uva', 'São Paulo', '977777777');

INSERT INTO PRODUTO(nome, ramal) VALUES ('tereza de fátima silva','2');
INSERT INTO PRODUTO(cod_prod, descricao, preço) VALUES ('tereza de fátima silva','2');
INSERT INTO Departamento(nome, ramal) VALUES ('Financeiro','01');
INSERT INTO Departamento(nome, ramal) VALUES ('Vendas','03');

INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Eveline Braga Caetano','03/10/03','Atendente','2500,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Aron Sequeira Morgado','27/01/15','Atendente','2500,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Aleksandra Lousã Infante','15/08/12','Atendente','2500,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Malika Cortês Gonçalves','11/06/14','Atendente','2500,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Edna Laureano Vilarinho','19/07/14','Atendente','2500,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Lola Rosado Sabala','04/02/13','Gerente','5000,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Martin Paranhos Gouveia','30/04/00','Admnistrador','3200,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Filipa Lameirinhas Clementino','16/05/20','Admnistrador','3200,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Alma Rios Serro','08/02/18','Auxiliar Administrativo','2200,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Ariela Covilhã Colaço','05/04/17','Profissional de Recursos Humanos','4000,00');
INSERT INTO Funcionario(nome, data_admissao, cargo, salario) VALUES ('Lília Carvalhal Carvalho','','Profissional de Recursos Humanos','4000,00');

INSERT INTO Categoria(descricao) VALUES ('Papelaria');
INSERT INTO Categoria(descricao) VALUES ('Eletronicos');
INSERT INTO Categoria(descricao) VALUES ('Comida');
INSERT INTO Categoria(descricao) VALUES ('Higiene');