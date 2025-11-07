USE HotelSaintGermain;

-- =====================================================
-- 1 Visão vBrasileiros
-- =====================================================
CREATE OR REPLACE VIEW vBrasileiros AS
SELECT 
    C.Id AS IdCliente,
    C.Nome AS Nome,
    CB.Cpf AS Documento
FROM Cliente C
JOIN ClienteBrasileiro CB ON C.Id = CB.ClienteId;

-- =====================================================
-- 2 Visão vEstrangeiros
-- =====================================================
CREATE OR REPLACE VIEW vEstrangeiros AS
SELECT 
    C.Id AS IdCliente,
    C.Nome AS Nome,
    CE.Passaporte AS Documento
FROM Cliente C
JOIN ClienteEstrangeiro CE ON C.Id = CE.ClienteId;

-- =====================================================
-- 3 Visão vReservas
-- =====================================================
CREATE OR REPLACE VIEW vReservas AS
SELECT 
    R.Numero AS IdReserva,
    C.Id AS IdCliente,
    C.Nome AS Nome,
    O.QuartoNumero AS Quarto,
    R.Entrada AS DtaEntrada
FROM Reserva R
JOIN Cliente C ON R.ClienteId = C.Id
JOIN Ocupacao O ON R.Numero = O.ReservaNumero
JOIN Quarto Q ON O.QuartoNumero = Q.Numero;

-- =====================================================
-- 4 Visão vConsumos
-- =====================================================
CREATE OR REPLACE VIEW vConsumos AS
SELECT 
    C.Id AS IdCliente,
    Res.Prato AS Consumo,
    Res.Preco AS Valor
FROM Reserva R
JOIN OcupacaoRestaurante ORS ON R.Numero = ORS.ReservaNumero
JOIN Restaurante Res ON ORS.RestauranteId = Res.Id
JOIN Cliente C ON R.ClienteId = C.Id

UNION ALL

SELECT 
    C.Id AS IdCliente,
    F.Item AS Consumo,
    F.Preco AS Valor
FROM Reserva R
JOIN OcupacaoFrigobar OFB ON R.Numero = OFB.ReservaNumero
JOIN Frigobar F ON OFB.FrigobarId = F.Id
JOIN Cliente C ON R.ClienteId = C.Id

UNION ALL

SELECT 
    C.Id AS IdCliente,
    M.Tipo AS Consumo,
    M.Preco AS Valor
FROM Reserva R
JOIN OcupacaoMassagem OM ON R.Numero = OM.ReservaNumero
JOIN Massagem M ON OM.MassagemId = M.Id
JOIN Cliente C ON R.ClienteId = C.Id;

-- =====================================================
-- 5 Consulta: Nome e telefone (usando vBrasileiros)
-- =====================================================
SELECT 
    VB.Nome,
    T.Numero AS Telefone
FROM vBrasileiros VB
JOIN Telefone T ON VB.IdCliente = T.ClienteId
ORDER BY VB.Nome;

-- =====================================================
-- 6 Consulta: Quantidade de estrangeiros (usando vEstrangeiros)
-- =====================================================
SELECT COUNT(*) AS QtdEstrangeiros
FROM vEstrangeiros;

-- =====================================================
-- 7 Consulta: Clientes com entrada prevista para hoje (usando vReservas)
-- =====================================================
SELECT 
    Nome,
    DtaEntrada
FROM vReservas
WHERE DATE(DtaEntrada) = CURDATE()
ORDER BY Nome;

-- =====================================================
-- 8 Consulta: Total consumido por cliente (usando vBrasileiros e vConsumos)
-- =====================================================
SELECT 
    VB.Nome,
    SUM(VC.Valor) AS TotalConsumido
FROM vBrasileiros VB
JOIN vConsumos VC ON VB.IdCliente = VC.IdCliente
GROUP BY VB.Nome
ORDER BY VB.Nome;
