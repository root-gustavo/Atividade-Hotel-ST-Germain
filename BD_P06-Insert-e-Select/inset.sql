-- =====================================================
-- Inserção de dados
-- =====================================================

USE HotelSaintGermain;

-- ----------------------
-- Clientes
-- ----------------------
INSERT INTO Cliente (Id, Nome, Sexo, DtaNasc) VALUES
(1, 'Ana Silva', 'Feminino', '1990-05-12'),
(2, 'Carlos Souza', 'Masculino', '1985-11-20'),
(3, 'Beatriz Lima', 'Feminino', '1992-08-03'),
(4, 'Diego Alves', 'Masculino', '1988-03-15'),
(5, 'Fernanda Rocha', 'Feminino', '1995-07-25'),
(6, 'John Doe', 'Masculino', '1987-02-15'),
(7, 'Alice Smith', 'Feminino', '1990-06-20'),
(8, 'Robert Brown', 'Masculino', '1985-09-10'),
(9, 'Emma Wilson', 'Feminino', '1992-12-01'),
(10, 'David Johnson', 'Masculino', '1989-03-05');

-- ----------------------
-- Clientes Brasileiros
-- ----------------------
INSERT INTO ClienteBrasileiro (ClienteId, Cpf, Rg, Rua, Numero, Cidade, Estado, Cep) VALUES
(1, 12345678901, 12345678, 'Rua A', 100, 'Curitiba', 'PR', 80010000),
(2, 23456789012, 23456789, 'Rua B', 200, 'Curitiba', 'PR', 80020000),
(3, 34567890123, 34567890, 'Rua C', 300, 'São Paulo', 'SP', 01030000),
(4, 45678901234, 45678901, 'Rua D', 400, 'Rio de Janeiro', 'RJ', 20040000),
(5, 56789012345, 56789012, 'Rua E', 500, 'Belo Horizonte', 'MG', 30050000);

-- ----------------------
-- Clientes Estrangeiros
-- ----------------------
INSERT INTO ClienteEstrangeiro (ClienteId, Passaporte) VALUES
(6, 'P1234567'),
(7, 'P2345678'),
(8, 'P3456789'),
(9, 'P4567890'),
(10, 'P5678901');

-- ----------------------
-- Telefones
-- ----------------------
INSERT INTO Telefone (ClienteId, Numero) VALUES
(1, 41999990001),
(2, 41999990002),
(3, 11988880003),
(4, 21977770004),
(5, 31966660005);

-- ----------------------
-- Gerentes
-- ----------------------
INSERT INTO Gerente (Matricula, Nome) VALUES
(101, 'João Pereira'),
(102, 'Maria Santos'),
(103, 'Pedro Oliveira'),
(104, 'Luciana Costa'),
(105, 'Fernando Lima');

-- ----------------------
-- Quartos
-- ----------------------
INSERT INTO Quarto (Numero, Andar, Tipo, Descricao, VlrDiaria) VALUES
(101, 1, 'Simples', 'Quarto simples com cama de casal', 120.00),
(102, 1, 'Duplo', 'Quarto duplo com duas camas', 150.00),
(201, 2, 'Suíte', 'Suíte com varanda', 200.00),
(202, 2, 'Suíte', 'Suíte com vista para o mar', 220.00),
(301, 3, 'Luxo', 'Quarto luxo com banheira', 300.00);

-- ----------------------
-- Restaurante
-- ----------------------
INSERT INTO Restaurante (Id, Prato, Preco) VALUES
(1, 'Feijoada', 45.00),
(2, 'Churrasco', 60.00),
(3, 'Salada', 30.00),
(4, 'Pizza', 50.00),
(5, 'Sushi', 70.00);

-- ----------------------
-- Frigobar
-- ----------------------
INSERT INTO Frigobar (Id, Item, Preco) VALUES
(1, 'Coca-Cola', 8.00),
(2, 'Água Mineral', 5.00),
(3, 'Chocolate', 12.00),
(4, 'Snack', 10.00),
(5, 'Suco', 7.00);

-- ----------------------
-- Massagem
-- ----------------------
INSERT INTO Massagem (Id, Tipo, Preco) VALUES
(1, 'Relaxante', 80.00),
(2, 'Terapêutica', 100.00),
(3, 'Pedras Quentes', 120.00),
(4, 'Shiatsu', 90.00),
(5, 'Aromaterapia', 110.00);

-- ----------------------
-- Tipo de Pagamento
-- ----------------------
INSERT INTO TipoPagamento (Id, Descricao) VALUES
(1, 'Dinheiro'),
(2, 'Cartão de Crédito'),
(3, 'Pix'),
(4, 'Transferência'),
(5, 'Cheque');

-- ----------------------
-- Reservas
-- ----------------------
INSERT INTO Reserva (Numero, ClienteId, QuartoNumero, Entrada, Periodo) VALUES
(1001, 1, 101, '2025-11-01 14:00:00', 3),
(1002, 2, 102, '2025-11-02 12:00:00', 2),
(1003, 3, 201, '2025-11-03 15:00:00', 5),
(1004, 4, 202, '2025-11-04 13:00:00', 1),
(1005, 5, 301, '2025-11-05 16:00:00', 4);

-- ----------------------
-- Aprovações
-- ----------------------
INSERT INTO Aprovacao (ReservaNumero, GerenteMatricula, DataHora) VALUES
(1001, 101, '2025-10-30 10:00:00'),
(1002, 102, '2025-10-31 11:00:00'),
(1003, 103, '2025-11-01 12:00:00'),
(1004, 104, '2025-11-02 13:00:00'),
(1005, 105, '2025-11-03 14:00:00');

-- ----------------------
-- Ocupações
-- ----------------------
INSERT INTO Ocupacao (ReservaNumero, QuartoNumero, Entrada, Saida) VALUES
(1001, 101, '2025-11-01 14:00:00', '2025-11-04 11:00:00'),
(1002, 102, '2025-11-02 12:00:00', '2025-11-04 12:00:00'),
(1003, 201, '2025-11-03 15:00:00', '2025-11-08 11:00:00'),
(1004, 202, '2025-11-04 13:00:00', '2025-11-05 12:00:00'),
(1005, 301, '2025-11-05 16:00:00', '2025-11-09 11:00:00');

-- ----------------------
-- OcupacaoRestaurante
-- ----------------------
INSERT INTO OcupacaoRestaurante (ReservaNumero, RestauranteId, DataHora, Quantidade) VALUES
(1001, 1, '2025-11-01 19:00:00', 2),
(1002, 2, '2025-11-02 20:00:00', 1),
(1003, 3, '2025-11-04 18:00:00', 3),
(1004, 4, '2025-11-04 19:30:00', 2),
(1005, 5, '2025-11-06 20:00:00', 1);

-- ----------------------
-- OcupacaoFrigobar
-- ----------------------
INSERT INTO OcupacaoFrigobar (ReservaNumero, FrigobarId, DataHora, Quantidade) VALUES
(1001, 1, '2025-11-02 10:00:00', 1),
(1002, 2, '2025-11-02 15:00:00', 2),
(1003, 3, '2025-11-04 12:00:00', 1),
(1004, 4, '2025-11-04 16:00:00', 1),
(1005, 5, '2025-11-06 09:00:00', 2);

-- ----------------------
-- OcupacaoMassagem
-- ----------------------
INSERT INTO OcupacaoMassagem (ReservaNumero, MassagemId, DataHora, Produtos) VALUES
(1001, 1, '2025-11-02 15:00:00', 'Óleo'),
(1002, 2, '2025-11-03 16:00:00', 'Creme'),
(1003, 3, '2025-11-05 14:00:00', 'Toalha'),
(1004, 4, '2025-11-05 15:00:00', 'Óleo Essencial'),
(1005, 5, '2025-11-07 13:00:00', 'Velas Aromáticas');

-- ----------------------
-- PagamentoOcupacao
-- ----------------------
INSERT INTO PagamentoOcupacao (ReservaNumero, TipoPagamentoId, DataHora, ValorTotal) VALUES
(1001, 1, '2025-11-04 12:00:00', 360.00),
(1002, 2, '2025-11-04 13:00:00', 300.00),
(1003, 3, '2025-11-08 12:00:00', 1000.00),
(1004, 4, '2025-11-05 13:00:00', 220.00),
(1005, 1, '2025-11-09 12:00:00', 1200.00);