IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ProjetoPim')
BEGIN
    CREATE DATABASE ProjetoPim;
END
GO

USE ProjetoPim;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'estoquista')
BEGIN
    CREATE TABLE estoquista (
        cod_estoquista NVARCHAR(50) PRIMARY KEY, 
        nome_estoquista NVARCHAR(50), 
        email_estoquista NVARCHAR(50)
    );

    INSERT INTO estoquista (cod_estoquista, nome_estoquista, email_estoquista)
    VALUES 
        ('12345E01', 'Bagriel Gomes', 'foicedesangue@gmail.com'),
        ('23456E02', 'Junino Nono', 'junino@gmail.com'),
        ('34567E03', 'Trigre Triste', 'sopadeletrinhas@gmail.com'),
        ('45678E04', 'Isa Freitas', 'Freire123@gmail.com');
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'gerente')
BEGIN
    CREATE TABLE gerente (
        cod_gerente NVARCHAR(50), 
        nome_gerente NVARCHAR(50), 
        email_gerente NVARCHAR(50)
    );

    INSERT INTO gerente (cod_gerente, nome_gerente, email_gerente)
    VALUES 
        ('03495G01', 'Anabell Beliske', 'foicedesangue@gmail.com'),
        ('98765G02', 'Anya Thopson', 'violinodotempo@gmail.com');
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'produtor')
BEGIN
    CREATE TABLE produtor (
        cod_produtor NVARCHAR(50) PRIMARY KEY, 
        nome_produtor NVARCHAR(50), 
        email_produtor NVARCHAR(50)
    );

    INSERT INTO produtor (cod_produtor, nome_produtor, email_produtor)
    VALUES 
        ('03495P01', 'Julian Fernandes', 'subinoonibus@gmail.com'),
        ('13568P02', 'Samuel Souza', 'enderring@gmail.com'),
        ('65493P03', 'João Cardoso', 'barrodeferro@gmail.com'),
        ('02495P04', 'Ryun Sun Lee', 'dronedecombate@gmail.com');
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'estoque')
BEGIN
    CREATE TABLE Estoque(
        CodigoEstoque NVARCHAR(4),
        NumeroEstoque INTEGER PRIMARY KEY,
        SementesArmazenadas NVARCHAR(50),
        DataColheita DATE,
        QuantidadeArmazenada DECIMAL(6,2)
    );

    INSERT INTO Estoque (CodigoEstoque, NumeroEstoque, SementesArmazenadas, DataColheita, QuantidadeArmazenada)
    VALUES
        ('457', 1, 'Espinafre', '2024-09-05', 50.00),
        ('921', 2, 'Funcho', '2024-06-12', 20.00),
        ('0', 3, 'Vazio', '01-01-0001', 0.00),
        ('0', 4, 'Vazio', '01-01-0001', 0.00),
        ('582', 5, 'Pimentão', '2024-12-05', 10.00),
        ('741', 6, 'Pepino', '2024-09-05', 15.00); 
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Terreno')
BEGIN
    CREATE TABLE Terreno(
        Id INT PRIMARY KEY,
        SementePlantada NVARCHAR(50),
        QuantidadePlantada DECIMAL(6,2),
        DataPlantada DATE,
        PHAtualSolo DECIMAL(4,2),
        UmidadeTerreno DECIMAL(5,2),
        TemperaturaAtual DECIMAL(5,2)
    );

    INSERT INTO Terreno (Id, SementePlantada, QuantidadePlantada, DataPlantada, PHAtualSolo, UmidadeTerreno, TemperaturaAtual)
    VALUES
        (1, 'Espinafre', 1234.00, '2024-10-01', 6.50, 9.00, 18.0),
        (2, 'Funcho', 1000.00, '2024-10-02', 6.00, 8.00, 21.0),
        (3, 'Vazio', 0.00, '01-01-0001', 0, 0, 0),   
        (4, 'Vazio', 0.00, '01-01-0001', 0, 0, 0),  
        (5, 'Pimentão', 1100.00, '2024-10-05', 6.40, 6.00, 25.0),
        (6, 'Pepino', 950.00, '2024-10-06', 6.40, 7.00, 25.0);
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Fornecedor')
BEGIN
    CREATE TABLE Fornecedor (
        Id INT PRIMARY KEY,
        cnpj_fornecedor VARCHAR(18),
        nome_fornecedor VARCHAR(100) NOT NULL,
        endereco_fornecedor VARCHAR(255) NOT NULL
    );

    INSERT INTO Fornecedor (Id, cnpj_fornecedor, nome_fornecedor, endereco_fornecedor)
    VALUES 
        (1, '23482856/0001-09', 'Rogério', 'Rua J, 76'),
        (2, '53197725/0001-88', 'Rodrigo', 'Rua D,46'),
        (3, '71148200/0001-34', 'Ambessa', 'Rua F, 01'),
        (4, '00000000/0000-00', 'Vazio', 'Vazio'),
        (5, '00000000/0000-00', 'Vazio', 'Vazio'),
        (6, '00000000/0000-00', 'Vazio', 'Vazio'); 
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Sementes')
BEGIN
    CREATE TABLE Sementes (
        Id INT PRIMARY KEY IDENTITY(1,1),
        TipoSemente NVARCHAR(50),
        UmidadeSemente DECIMAL(5,2),
        PHIdeal DECIMAL(4,2),
        TemperaturaIdeal DECIMAL(5,2)
    );

    INSERT INTO Sementes (TipoSemente, UmidadeSemente, PHIdeal, TemperaturaIdeal)
    VALUES
        ('Espinafre', 9.00, 6.50, 18.0),
        ('Funcho', 8.00, 6.00, 21.0),
        ('Tomate', 6.00, 6.40, 24.0),
        ('Melão', 8.00, 6.50, 26.0),
        ('Pimentão', 6.00, 6.40, 25.0),
        ('Pepino', 7.00, 6.40, 25.0);
END
GO

-- Seleção dos dados
SELECT * FROM Terreno;
SELECT * FROM Fornecedor;
SELECT * FROM Estoquista;
SELECT * FROM Gerente;
SELECT * FROM Produtor;
SELECT * FROM Sementes;
SELECT * FROM Estoque;