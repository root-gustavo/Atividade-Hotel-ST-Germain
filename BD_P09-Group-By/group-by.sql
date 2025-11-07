USE HotelSaintGermain;

-- =====================================================
-- 1 Contar quantos clientes existem no hotel
-- =====================================================
SELECT COUNT(*) AS TotalClientes
FROM Cliente;

-- =====================================================
-- 2 Listar os clientes e contar quantos telefones cada um possui
-- =====================================================
SELECT C.Nome, COUNT(T.Numero) AS QtdTelefones
FROM Cliente C
LEFT JOIN Telefone T ON C.Id = T.ClienteId
GROUP BY C.Nome;

-- =====================================================
-- 3 Listar estado e cidade, contando quantos clientes há em cada cidade
-- =====================================================
SELECT CB.Estado, CB.Cidade, COUNT(*) AS QtdClientes
FROM ClienteBrasileiro CB
GROUP BY CB.Estado, CB.Cidade
ORDER BY CB.Estado, CB.Cidade;

-- =====================================================
-- 4 Contar quantos quartos existem no hotel, agrupando por andar
-- =====================================================
SELECT Andar, COUNT(*) AS QtdQuartos
FROM Quarto
GROUP BY Andar
ORDER BY Andar;

-- =====================================================
-- 5 Apresentar o valor médio das diárias dos quartos
-- =====================================================
SELECT AVG(VlrDiaria) AS MediaDiarias
FROM Quarto;

-- =====================================================
-- 6 Valor médio das diárias agrupado por andar
-- =====================================================
SELECT Andar, AVG(VlrDiaria) AS MediaDiariaPorAndar
FROM Quarto
GROUP BY Andar
ORDER BY Andar;

-- =====================================================
-- 7 Tipo de quarto e quantidade de quartos de cada tipo
-- =====================================================
SELECT Tipo, COUNT(*) AS QtdQuartos
FROM Quarto
GROUP BY Tipo
ORDER BY Tipo;

-- =====================================================
-- 8 Valor médio das diárias agrupado por tipo
-- =====================================================
SELECT Tipo, AVG(VlrDiaria) AS MediaDiariaPorTipo
FROM Quarto
GROUP BY Tipo
ORDER BY Tipo;

-- =====================================================
-- 9 Contar quantas reservas foram feitas no último ano
-- =====================================================
SELECT COUNT(*) AS ReservasUltimoAno
FROM Reserva
WHERE YEAR(Entrada) = YEAR(DATE_SUB(NOW(), INTERVAL 1 YEAR));

-- =====================================================
-- 10 Data de entrada e quantidade de ocupações no último ano (agrupado)
-- =====================================================
SELECT DATE(O.Entrada) AS DataEntrada, COUNT(*) AS QtdOcupacoes
FROM Ocupacao O
WHERE YEAR(O.Entrada) = YEAR(DATE_SUB(NOW(), INTERVAL 1 YEAR))
GROUP BY DATE(O.Entrada)
ORDER BY DataEntrada;

-- =====================================================
-- 11 Data de saída e valor total das ocupações agrupado por data
-- =====================================================
SELECT DATE(O.Saida) AS DataSaida, SUM(PO.ValorTotal) AS ValorTotalOcupacoes
FROM Ocupacao O
JOIN PagamentoOcupacao PO ON O.ReservaNumero = PO.ReservaNumero
GROUP BY DATE(O.Saida)
ORDER BY DataSaida;

-- =====================================================
-- 12 Valor médio dos pratos do restaurante
-- =====================================================
SELECT AVG(Preco) AS MediaPrecoPratos
FROM Restaurante;

-- =====================================================
-- 13 Valor total pago em ocupações no ano atual
-- =====================================================
SELECT SUM(ValorTotal) AS ValorTotalAnoAtual
FROM PagamentoOcupacao
WHERE YEAR(DataHora) = YEAR(NOW());

-- =====================================================
-- 14 Número da reserva e valor total consumido em restaurante por reserva
-- =====================================================
SELECT ORest.ReservaNumero, SUM(R.Preco * ORest.Quantidade) AS TotalRestaurante
FROM OcupacaoRestaurante ORest
JOIN Restaurante R ON ORest.RestauranteId = R.Id
GROUP BY ORest.ReservaNumero
ORDER BY ORest.ReservaNumero;

-- =====================================================
-- 15 Pagamentos do último ano e valor total pago, agrupado por tipo
-- =====================================================
SELECT TP.Descricao AS TipoPagamento, SUM(PO.ValorTotal) AS ValorTotal
FROM PagamentoOcupacao PO
JOIN TipoPagamento TP ON PO.TipoPagamentoId = TP.Id
WHERE YEAR(PO.DataHora) = YEAR(DATE_SUB(NOW(), INTERVAL 1 YEAR))
GROUP BY TP.Descricao
ORDER BY TP.Descricao;

-- =====================================================
-- 16 Tipo de pagamento e quantidade de reservas pagas no mês atual
-- =====================================================
SELECT TP.Descricao AS TipoPagamento, COUNT(PO.ReservaNumero) AS QtdReservas
FROM PagamentoOcupacao PO
JOIN TipoPagamento TP ON PO.TipoPagamentoId = TP.Id
WHERE YEAR(PO.DataHora) = YEAR(NOW())
  AND MONTH(PO.DataHora) = MONTH(NOW())
GROUP BY TP.Descricao;

-- =====================================================
-- 17 Menor valor pago em ocupações no mês passado
-- =====================================================
SELECT MIN(ValorTotal) AS MenorValorMesPassado
FROM PagamentoOcupacao
WHERE YEAR(DataHora) = YEAR(DATE_SUB(NOW(), INTERVAL 1 MONTH))
  AND MONTH(DataHora) = MONTH(DATE_SUB(NOW(), INTERVAL 1 MONTH));

-- =====================================================
-- 18 Maior valor pago em ocupações no ano corrente
-- =====================================================
SELECT MAX(ValorTotal) AS MaiorValorAnoAtual
FROM PagamentoOcupacao
WHERE YEAR(DataHora) = YEAR(NOW());
