-- Criando Banco de Dados
CREATE DATABASE IF NOT EXISTS Oficina_Mecanica;

-- Utilizando o Banco de Dados
USE Oficina_Mecanica;

-- Criando Tabela Cliente


CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    CPF CHAR (11) UNIQUE NOT NULL,
    Email VARCHAR(45),
    Telefone VARCHAR(45)
);
 -- Ajustando CPF
 
 ALTER TABLE Cliente MODIFY CPF VARCHAR (14);
-- Criando Tabela Veículo

CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    Modelo VARCHAR(45) NOT NULL,
    Ano VARCHAR(45),
    Placa VARCHAR(7) unique NOT NULL,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Criando Tabela Equipe

CREATE TABLE Equipe (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY,
    Especialidade VARCHAR(45) NOT NULL
);

-- Criando Tabela Mecanicos

 CREATE TABLE Mecanicos(
	idMecanicos INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45),
    Especialidade VARCHAR(45) NOT NULL,
    Equipe_idEquipe INT,
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe)
);

-- Criando Tabela Ordem de Serviço

CREATE TABLE OrdemServico (
    idOrdemServico INT AUTO_INCREMENT PRIMARY KEY,
    Veiculo_idVeiculo INT,
    Cliente_idCliente INT,
    Equipe_idEquipe INT,
    DataEmissao DATE NOT NULL,
    Valor FLOAT NOT NULL,
    Autorizacao BOOLEAN DEFAULT TRUE,
    Situacao ENUM ('Não Iniciado', 'Em andamento', 'Concluído', 'Cancelado') DEFAULT 'Não Iniciado' NOT NULL,
    PrevisaoConclusao VARCHAR(45),
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe)
);

-- Criando Tabela de Serviços

CREATE TABLE TabelaServicos (
    idTabelaServicos INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL,
    Valor FLOAT NOT NULL
);

-- Criando Tabela Peças

-- Tabela de Peças
CREATE TABLE TabelaPecas (
    idTabelaPecas INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL,
    Valor FLOAT NOT NULL
);

-- Criando relacionamento Ordem de Serviço x Serviços

CREATE TABLE TabelaServicos_has_OrdemServico (
    TabelaServicos_idTabelaServicos INT,
    OrdemServico_idOrdemServico INT,
    PRIMARY KEY (TabelaServicos_idTabelaServicos, OrdemServico_idOrdemServico),
    FOREIGN KEY (TabelaServicos_idTabelaServicos) REFERENCES TabelaServicos(idTabelaServicos),
    FOREIGN KEY (OrdemServico_idOrdemServico) REFERENCES OrdemServico(idOrdemServico)
);

-- Criando relacionamento Ordem de Serviço x Peças

CREATE TABLE OrdemServico_has_TabelaPecas (
    OrdemServico_idOrdemServico INT,
    TabelaPecas_idTabelaPecas INT,
    PRIMARY KEY (OrdemServico_idOrdemServico, TabelaPecas_idTabelaPecas),
    FOREIGN KEY (OrdemServico_idOrdemServico) REFERENCES OrdemServico(idOrdemServico),
    FOREIGN KEY (TabelaPecas_idTabelaPecas) REFERENCES TabelaPecas(idTabelaPecas)
);

-- Consultando tabelas

SHOW TABLES;

-- Persistindo tabela Cliente

INSERT INTO Cliente (Nome, CPF, Email, Telefone) VALUES
('Bob Esponja', '07523916406', 'bob.esponja@toonmail.com', '(71) 5595-1016'),
('Patrick Estrela', '71235890686', 'patrick.estrela@toonmail.com', '(11) 1279-4845'),
('Lula Molusco', '18245796328', 'lula.molusco@toonmail.com', '(71) 7920-2730'),
('Sandy Bochechas', '54362091815', 'sandy.bochechas@toonmail.com', '(11) 2283-5515'),
('Sr. Siriguejo', '61953247873', 'sr..siriguejo@toonmail.com', '(81) 7880-1647'),
('Pernalonga', '57846291319', 'pernalonga@toonmail.com', '(21) 2801-3718'),
('Patolino', '50279384114', 'patolino@toonmail.com', '(84) 0894-9709'),
('Taz Mania', '69147508310', 'taz.mania@toonmail.com', '(11) 0023-9857'),
('Piu-Piu', '61539842070', 'piu-piu@toonmail.com', '(84) 4422-1352'),
('Papa-Léguas', '08425617901', 'papa-leguas@toonmail.com', '(11) 3025-5453');

-- Persistindo tabela Veículo

INSERT INTO Veiculo (Modelo, Ano, Placa, Cliente_idCliente) VALUES
('Fusca', '2015', 'COH3587', 1),
('Chevette', '1982', 'KFS7818', 2),
('Uno com escada', '1976', 'HRZ5969', 3),
('Kombi escolar', '2022', 'RPC4133', 4),
('Brasília', '1992', 'NTW8636', 5),
('Del Rey', '1990', 'HAH5723', 6),
('Marea Turbo', '1989', 'LSS8703', 7),
('Fiat 147', '1983', 'VGF2083', 8),
('Opala Diplomata', '2022', 'QZU1204', 9),
('Gol Quadrado', '1981', 'DOO2386', 10);

-- Persistindo tabela Equipe

INSERT INTO Equipe (Especialidade) VALUES
('Elétrica'),
('Suspensão'),
('Motor'),
('Freios'),
('Pintura'),
('Funilaria'),
('Ar Condicionado'),
('Câmbio'),
('Injeção Eletrônica'),
('Diagnóstico');

-- Persistindo tabela Mecanicos

INSERT INTO Mecanicos (Nome, Endereco, Especialidade, Equipe_idEquipe) VALUES
('Zé Colmeia Turbo', 'Loteamento Correia, 8, Morro Dos Macacos, 634', 'Ar Condicionado', 1),
('Jerry Soldador', 'Pátio de Melo, 398, Mantiqueira, 65988232 Fre', 'Câmbio', 2),
('Pica-Pau Pistola', 'Passarela de Lima, 98, Betânia, 04996394 da R', 'Pintura', 3),
('Ligeirinho Biela', 'Rodovia de Santos, 47, Madre Gertrudes, 45932', 'Motor', 4),
('Ligeirinho Biela', 'Campo de Correia, 21, Barreiro, 30840705 Viei', 'Suspensão', 5),
('Zé Colmeia Turbo', 'Campo Sarah Farias, Santa Rita De Cássia, 813', 'Injeção Eletrônica', 6),
('Pateta Embreagem', 'Alameda Alícia da Costa, 26, Nova Granada, 55', 'Freios', 7),
('Jerry Soldador', 'Loteamento Nascimento, Itatiaia, 81786-653 Ca', 'Funilaria', 8),
('Jerry Soldador', 'Favela Viana, Braúnas, 54231-641 Azevedo / PB', 'Injeção Eletrônica', 9),
('Ligeirinho Biela', 'Rodovia de Cardoso, Grajaú, 82453750 da Mota ', 'Elétrica', 10);

-- Persistindo tabela Ordem de Serviço

INSERT INTO OrdemServico (Veiculo_idVeiculo, Cliente_idCliente, Equipe_idEquipe, DataEmissao, Valor, Autorizacao, Situacao, PrevisaoConclusao) VALUES
(1, 1, 10, '2025-03-28', 1107.64, 1, 'Não Iniciado', '2025-04-15'),
(2, 2, 6, '2025-03-26', 2660.42, 0, 'Em andamento', '2025-04-01'),
(3, 3, 1, '2025-03-19', 874.44, 1, 'Não Iniciado', '2025-04-04'),
(4, 4, 8, '2025-03-12', 2484.87, 1, 'Em andamento', '2025-04-14'),
(5, 5, 8, '2025-03-09', 2851.18, 1, 'Concluído', '2025-04-05'),
(6, 6, 9, '2025-03-02', 2642.81, 0, 'Em andamento', '2025-04-02'),
(7, 7, 9, '2025-03-02', 2314.74, 1, 'Concluído', '2025-04-14'),
(8, 8, 7, '2025-03-24', 2986.42, 0, 'Cancelado', '2025-04-09'),
(9, 9, 9, '2025-03-17', 1464.16, 1, 'Em andamento', '2025-04-03'),
(10, 10, 2, '2025-03-31', 1146.64, 1, 'Em andamento', '2025-04-12');

-- Persistindo Tabela Serviços

INSERT INTO TabelaServicos (Descricao, Valor) VALUES
('Troca de óleo', 55.39),
('Alinhamento', 580.88),
('Balanceamento', 94.16),
('Revisão geral', 100.55),
('Troca de correia', 73.56),
('Limpeza de bico', 297.82),
('Reparo no motor', 435.62),
('Diagnóstico eletrônico', 258.86),
('Troca de pastilha', 414.06),
('Recarga de ar', 454.43);

-- Persistindo tabela Peças

INSERT INTO TabelaPecas (Descricao, Valor) VALUES
('Filtro de óleo', 879.09),
('Vela de ignição', 1063.56),
('Amortecedor', 708.41),
('Correia dentada', 321.88),
('Pastilha de freio', 588.65),
('Radiador', 512.19),
('Bateria', 149.42),
('Alternador', 804.42),
('Sensor de rotação', 450.99),
('Bomba de combustível', 516.88);

-- Persistindo tabela Serviços x Ordem de Serviço

INSERT INTO TabelaServicos_has_OrdemServico (TabelaServicos_idTabelaServicos, OrdemServico_idOrdemServico) VALUES
(7, 1),
(5, 2),
(9, 3),
(1, 4),
(4, 5),
(6, 6),
(2, 7),
(3, 8),
(8, 9),
(10, 10);

-- Persistindo Tabela Ordem de Serviço x Peças

INSERT INTO OrdemServico_has_TabelaPecas (OrdemServico_idOrdemServico, TabelaPecas_idTabelaPecas) VALUES
(1, 10),
(2, 2),
(3, 5),
(4, 6),
(5, 3),
(6, 4),
(7, 9),
(8, 8),
(9, 1),
(10, 7);

-- CONSULTAS

