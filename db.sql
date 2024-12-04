-- Criação do banco de dados
CREATE DATABASE EventoDB;

-- Seleção do banco de dados
USE EventoDB;

-- Criação da tabela Pessoa
CREATE TABLE Pessoa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criação da tabela Notificacao
CREATE TABLE Notificacao (
    id INT PRIMARY KEY AUTO_INCREMENT
);

-- Criação da tabela Local
CREATE TABLE Local (
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    vagas INT NOT NULL
);

-- Criação da tabela Participante
CREATE TABLE Participante (
    id INT PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(20) NOT NULL,
    id_pessoa INT,
    id_notificacao INT,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id),
    FOREIGN KEY (id_notificacao) REFERENCES Notificacao(id)
);

-- Criação da tabela Organizador
CREATE TABLE Organizador (
    id_organizador INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    id_pessoa INT,
    id_notificacao INT,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id),
    FOREIGN KEY (id_notificacao) REFERENCES Notificacao(id)
);

-- Criação da tabela Evento
CREATE TABLE Evento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_organizador INT,
    id_local INT,
    data DATETIME NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    vagas int not null,
    FOREIGN KEY (id_organizador) REFERENCES Organizador(id_organizador),
    FOREIGN KEY (id_local) REFERENCES Local(id_local)
);