CREATE DATABASE HotelSaintGermain;
USE HotelSaintGermain;

-- Tabela Cliente
CREATE TABLE Cliente (
    Id INT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    DtaNasc DATE
);

-- Tabela ClienteBrasileiro
CREATE TABLE ClienteBrasileiro (
    ClienteId INT PRIMARY KEY,
    Cpf BIGINT,
    Rg BIGINT,
    Rua VARCHAR(255),
    Numero INT,
    Cidade VARCHAR(255),
    Estado VARCHAR(100),
    Cep BIGINT,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

-- Tabela ClienteEstrangeiro
CREATE TABLE ClienteEstrangeiro (
    ClienteId INT PRIMARY KEY,
    Passaporte VARCHAR(50),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

-- Tabela Telefone
CREATE TABLE Telefone (
    ClienteId INT,
    Numero BIGINT,
    PRIMARY KEY (ClienteId, Numero),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

-- Tabela Gerente
CREATE TABLE Gerente (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(255)
);

-- Tabela Quarto
CREATE TABLE Quarto (
    Numero INT PRIMARY KEY,
    Andar INT,
    Tipo VARCHAR(50),
    Descricao VARCHAR(255),
    VlrDiaria DECIMAL(10,2)
);

-- Tabela Reserva
CREATE TABLE Reserva (
    Numero INT PRIMARY KEY,
    ClienteId INT,
    QuartoNumero INT,
    Entrada DATETIME,
    Periodo INT,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (QuartoNumero) REFERENCES Quarto(Numero)
);

-- Tabela Aprovacao
CREATE TABLE Aprovacao (
    ReservaNumero INT PRIMARY KEY,
    GerenteMatricula INT,
    DataHora DATETIME,
    FOREIGN KEY (ReservaNumero) REFERENCES Reserva(Numero),
    FOREIGN KEY (GerenteMatricula) REFERENCES Gerente(Matricula)
);

-- Tabela Ocupacao
CREATE TABLE Ocupacao (
    ReservaNumero INT PRIMARY KEY,
    QuartoNumero INT,
    Entrada DATETIME,
    Saida DATETIME,
    FOREIGN KEY (ReservaNumero) REFERENCES Reserva(Numero),
    FOREIGN KEY (QuartoNumero) REFERENCES Quarto(Numero)
);

-- Tabela Restaurante
CREATE TABLE Restaurante (
    Id INT PRIMARY KEY,
    Prato VARCHAR(255),
    Preco DECIMAL(10,2)
);

-- Tabela Frigobar
CREATE TABLE Frigobar (
    Id INT PRIMARY KEY,
    Item VARCHAR(255),
    Preco DECIMAL(10,2)
);

-- Tabela Massagem
CREATE TABLE Massagem (
    Id INT PRIMARY KEY,
    Tipo VARCHAR(255),
    Preco DECIMAL(10,2)
);

-- Tabela OcupacaoRestaurante
CREATE TABLE OcupacaoRestaurante (
    ReservaNumero INT,
    RestauranteId INT,
    DataHora DATETIME,
    Quantidade INT,
    PRIMARY KEY (ReservaNumero, RestauranteId, DataHora),
    FOREIGN KEY (ReservaNumero) REFERENCES Reserva(Numero),
    FOREIGN KEY (RestauranteId) REFERENCES Restaurante(Id)
);

-- Tabela OcupacaoFrigobar
CREATE TABLE OcupacaoFrigobar (
    ReservaNumero INT,
    FrigobarId INT,
    DataHora DATETIME,
    Quantidade INT,
    PRIMARY KEY (ReservaNumero, FrigobarId, DataHora),
    FOREIGN KEY (ReservaNumero) REFERENCES Reserva(Numero),
    FOREIGN KEY (FrigobarId) REFERENCES Frigobar(Id)
);

-- Tabela OcupacaoMassagem
CREATE TABLE OcupacaoMassagem (
    ReservaNumero INT,
    MassagemId INT,
    DataHora DATETIME,
    Produtos VARCHAR(255),
    PRIMARY KEY (ReservaNumero, MassagemId, DataHora),
    FOREIGN KEY (ReservaNumero) REFERENCES Reserva(Numero),
    FOREIGN KEY (MassagemId) REFERENCES Massagem(Id)
);

-- Tabela TipoPagamento
CREATE TABLE TipoPagamento (
    Id INT PRIMARY KEY,
    Descricao VARCHAR(100)
);

-- Tabela PagamentoOcupacao
CREATE TABLE PagamentoOcupacao (
    ReservaNumero INT PRIMARY KEY,
    TipoPagamentoId INT,
    DataHora DATETIME,
    ValorTotal DECIMAL(10,2),
    FOREIGN KEY (ReservaNumero) REFERENCES Reserva(Numero),
    FOREIGN KEY (TipoPagamentoId) REFERENCES TipoPagamento(Id)
);