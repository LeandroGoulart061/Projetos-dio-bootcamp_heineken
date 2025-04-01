create database e_commerce;

use e_commerce;

SHOW TABLES;

drop table Fornecedor;
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(45),
    CNPJ VARCHAR(45)
);

drop table produto;
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45),
    Valor VARCHAR(45)
);

drop table DisponibilizandoProduto;
CREATE TABLE DisponibilizandoProduto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
    );
   
drop table Terceiro;
CREATE TABLE Terceiro (
    idTerceiro INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(45),
    Local VARCHAR(45)
);

drop table ProdutosPorVendedor;
CREATE TABLE ProdutosPorVendedor (
    Terceiro_idTerceiro INT,
    Produto_idProduto INT,
    Quantidade INT,
    Valor VARCHAR(45),
    PRIMARY KEY (Terceiro_idTerceiro, Produto_idProduto),
    FOREIGN KEY (Terceiro_idTerceiro) REFERENCES Terceiro(idTerceiro),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);
 
 drop table Estoque;
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Localizacao VARCHAR(45)
);

drop table ProdutoHasEstoque;
CREATE TABLE ProdutoHasEstoque (
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    Quantidade INT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

drop table Cliente;
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Identificacao VARCHAR(45),
    Endereco VARCHAR(45),
    Tipo VARCHAR(2)
);

drop table PessoaFisica;
CREATE TABLE PessoaFisica (
    CPF VARCHAR(11) PRIMARY KEY,
    DataNascimento DATE,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

Drop table PessoaJuridica;
CREATE TABLE PessoaJuridica (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RazaoSocial VARCHAR(45),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

Drop table MeioDePagamento;
CREATE TABLE MeioDePagamento (
    idMeioDePagamento INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(45),
    Bandeira VARCHAR(45),
    Numero VARCHAR(45),
    Validade DATE,
    NomeTitular VARCHAR(45),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

drop table pedido;
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    Status VARCHAR(45),
    Descricao VARCHAR(45),
    Cliente_idCliente INT,
    MeioDePagamento_idMeioDePagamento INT,
    Frete FLOAT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (MeioDePagamento_idMeioDePagamento) REFERENCES MeioDePagamento(idMeioDePagamento)
);

drop table RelacaoPedidoProduto;
CREATE TABLE RelacaoPedidoProduto (
    Pedido_idPedido INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

drop table entrega;
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    CodigoRastreio VARCHAR(45),
    Status VARCHAR(45),
    Preco DECIMAL(10,2),
    Estoque_idEstoque INT,
    Pedido_idPedido INT,
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

INSERT INTO Fornecedor (RazaoSocial, CNPJ) VALUES
('Fornecedor A', '12345678000101'),
('Fornecedor B', '98765432000199'),
('Fornecedor C', '11223344000177'),
('Fornecedor D', '55667788000166'),
('Fornecedor E', '99887766000122'),
('Fornecedor F', '44332211000155');

INSERT INTO Produto (Categoria, Descricao, Valor) VALUES
('Eletrônicos', 'Fone Bluetooth', '199.90'),
('Informática', 'Mouse Gamer', '149.90'),
('Moda', 'Tênis Casual', '299.90'),
('Casa', 'Liquidificador', '179.90'),
('Beleza', 'Secador de Cabelo', '259.90'),
('Esporte', 'Bola de Futebol', '99.90');

INSERT INTO DisponibilizandoProduto (Fornecedor_idFornecedor, Produto_idProduto) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6);

INSERT INTO Terceiro (RazaoSocial, Local) VALUES
('Vendedor A', 'São Paulo'),
('Vendedor B', 'Rio de Janeiro'),
('Vendedor C', 'Belo Horizonte'),
('Vendedor D', 'Porto Alegre'),
('Vendedor E', 'Curitiba'),
('Vendedor F', 'Fortaleza');

INSERT INTO ProdutosPorVendedor (Terceiro_idTerceiro, Produto_idProduto, Quantidade, Valor) VALUES
(1, 1, 10, '210.00'),
(2, 2, 5, '160.00'),
(3, 3, 8, '320.00'),
(4, 4, 12, '190.00'),
(5, 5, 6, '270.00'),
(6, 6, 20, '110.00');

INSERT INTO Estoque (Localizacao) VALUES
('Centro SP'),
('Centro RJ'),
('Centro MG'),
('Centro RS'),
('Centro PR'),
('Centro CE');

INSERT INTO ProdutoHasEstoque (Produto_idProduto, Estoque_idEstoque, Quantidade) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 40),
(4, 4, 25),
(5, 5, 15),
(6, 6, 60);

INSERT INTO Cliente (Nome, Identificacao, Endereco, Tipo) VALUES
('Maria Silva', '12345678900', 'Rua A, 100', 'PF'),
('João Souza', '98765432100', 'Rua B, 200', 'PF'),
('Empresa XPTO', '11223344556677', 'Av. Central, 300', 'PJ'),
('Empresa Alpha', '22334455667788', 'Rua C, 400', 'PJ'),
('Carlos Lima', '11122233344', 'Rua D, 500', 'PF'),
('Ana Costa', '55566677788', 'Rua E, 600', 'PF');

INSERT INTO PessoaFisica (CPF, DataNascimento, Cliente_idCliente) VALUES
('12345678900', '1990-05-20', 1),
('98765432100', '1985-10-10', 2),
('11122233344', '1992-03-15', 5),
('55566677788', '1988-07-25', 6),
('33344455566', '1991-09-30', NULL), -- exemplo incompleto
('44455566677', '1980-01-05', NULL);

INSERT INTO PessoaJuridica (CNPJ, RazaoSocial, Cliente_idCliente) VALUES
('11223344556677', 'Empresa XPTO Ltda.', 3),
('22334455667788', 'Empresa Alpha SA', 4),
('33445566778899', 'Empresa Beta Ltda.', NULL),
('44556677889900', 'Empresa Gama SA', NULL),
('55667788990011', 'Empresa Delta ME', NULL),
('66778899001122', 'Empresa Epsilon', NULL);

INSERT INTO MeioDePagamento (Tipo, Bandeira, Numero, Validade, NomeTitular, Cliente_idCliente) VALUES
('Crédito', 'Visa', '4111111111111111', '2026-12-01', 'Maria Silva', 1),
('Crédito', 'Mastercard', '5500000000000004', '2025-06-01', 'João Souza', 2),
('Débito', 'Elo', '6500000000000000', '2024-11-01', 'Carlos Lima', 5),
('Crédito', 'Amex', '370000000000002', '2027-02-01', 'Ana Costa', 6),
('Crédito', 'Visa', '4111111111111112', '2025-08-01', 'XPTO Ltda.', 3),
('Débito', 'Mastercard', '5500000000000005', '2026-04-01', 'Alpha SA', 4);

INSERT INTO Pedido (Status, Descricao, Cliente_idCliente, MeioDePagamento_idMeioDePagamento, Frete) VALUES
('Processando', 'Pedido 001', 1, 1, 20.00),
('Aprovado', 'Pedido 002', 2, 2, 15.00),
('Enviado', 'Pedido 003', 3, 5, 50.00),
('Entregue', 'Pedido 004', 4, 6, 30.00),
('Cancelado', 'Pedido 005', 5, 3, 0.00),
('Processando', 'Pedido 006', 6, 4, 10.00);

INSERT INTO RelacaoPedidoProduto (Pedido_idPedido, Produto_idProduto, Quantidade) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 4),
(4, 4, 1),
(5, 5, 3),
(6, 6, 1);

INSERT INTO Entrega (CodigoRastreio, Status, Preco, Estoque_idEstoque, Pedido_idPedido) VALUES
('BR123456789SP', 'Em Trânsito', 20.00, 1, 1),
('BR987654321RJ', 'Entregue', 15.00, 2, 2),
('BR1122334455MG', 'Postado', 50.00, 3, 3),
('BR2233445566RS', 'Entregue', 30.00, 4, 4),
('BR3344556677PR', 'Cancelado', 0.00, 5, 5),
('BR4455667788CE', 'A Caminho', 10.00, 6, 6);

SHOW TABLES; 

SELECT * FROM entrega;

---- consultas ----

 -- Total de pedidos e valor de frete por cliente
SELECT 
    c.Nome,
    COUNT(p.idPedido) AS TotalPedidos,
    SUM(p.Frete) AS TotalFrete
FROM Cliente c
JOIN Pedido p ON p.Cliente_idCliente = c.idCliente
GROUP BY c.Nome;

 -- Produtos mais vendidos
SELECT 
    pr.Descricao AS Produto,
    SUM(rpp.Quantidade) AS QuantidadeVendida,
    SUM(rpp.Quantidade * ppv.Valor) AS ValorTotalVendido
FROM RelacaoPedidoProduto rpp
JOIN Produto pr ON pr.idProduto = rpp.Produto_idProduto
JOIN ProdutosPorVendedor ppv ON ppv.Produto_idProduto = rpp.Produto_idProduto
GROUP BY pr.Descricao
ORDER BY ValorTotalVendido DESC;

-- Pedidos com status de entrega

SELECT 
    p.idPedido,
    c.Nome,
    e.CodigoRastreio,
    e.Status AS StatusEntrega
FROM Entrega e
JOIN Pedido p ON e.Pedido_idPedido = p.idPedido
JOIN Cliente c ON p.Cliente_idCliente = c.idCliente;

-- Valor total de produtos vendidos por pedido

SELECT 
    p.idPedido,
    c.Nome,
    SUM(pv.Valor * rpp.Quantidade) AS ValorTotalProdutos
FROM Pedido p
JOIN Cliente c ON c.idCliente = p.Cliente_idCliente
JOIN RelacaoPedidoProduto rpp ON rpp.Pedido_idPedido = p.idPedido
JOIN ProdutosPorVendedor pv ON pv.Produto_idProduto = rpp.Produto_idProduto
GROUP BY p.idPedido, c.Nome;

--- Total de produtos ofertados por fornecedor

SELECT 
    f.RazaoSocial,
    COUNT(dp.Produto_idProduto) AS ProdutosOferecidos
FROM Fornecedor f
JOIN DisponibilizandoProduto dp ON dp.Fornecedor_idFornecedor = f.idFornecedor
GROUP BY f.RazaoSocial;

 
