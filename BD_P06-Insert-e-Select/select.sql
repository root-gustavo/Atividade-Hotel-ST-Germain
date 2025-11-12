-- 1. Nome e sexo de todos os clientes por ordem alfabética

SELECT Nome, Sexo FROM Cliente ORDER BY Nome ASC;

-- 2. CPF e CEP de todos os clientes brasileiros residentes em Curitiba
SELECT C.Cpf, C.Cep
FROM ClienteBrasileiro C
WHERE C.Cidade = 'Curitiba';

-- 3. Número de todos os quartos por ordem decrescente de andar e crescente de diária
SELECT Numero
FROM Quarto
ORDER BY Andar DESC, VlrDiaria ASC;

-- 4. Número de todos os quartos com diária entre R$ 100 e R$ 150
SELECT Numero
FROM Quarto
WHERE VlrDiaria BETWEEN 100 AND 150;

-- 5. Todas as reservas de um determinado cliente (ex: ClienteId = 1)
SELECT *
FROM Reserva
WHERE ClienteId = 1;

-- 6. Números dos quartos que já foram ocupados (sem repetir)
SELECT DISTINCT QuartoNumero
FROM Ocupacao;

-- 7. Números das reservas aprovadas pelo gerente (sem repetir)
SELECT DISTINCT ReservaNumero
FROM Aprovacao;

-- 8. Reservas que fizeram uso do restaurante (sem repetir)
SELECT DISTINCT ReservaNumero
FROM OcupacaoRestaurante;

-- 9. Reservas pagas em dinheiro (sem repetir)
SELECT DISTINCT PO.ReservaNumero
FROM PagamentoOcupacao PO
JOIN TipoPagamento TP ON PO.TipoPagamentoId = TP.Id
WHERE TP.Descricao = 'Dinheiro';
