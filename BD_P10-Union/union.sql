USE HotelSaintGermain;

-- =====================================================
-- 1 Lista unificada: Nome e Documento (CPF ou Passaporte)
-- =====================================================
SELECT 
    C.Nome AS Nome,
    CB.Cpf AS Documento
FROM Cliente C
JOIN ClienteBrasileiro CB ON C.Id = CB.ClienteId

UNION

SELECT 
    C.Nome AS Nome,
    CE.Passaporte AS Documento
FROM Cliente C
JOIN ClienteEstrangeiro CE ON C.Id = CE.ClienteId;

-- =====================================================
-- 2 Lista unificada: Nome, Documento (RG ou Passaporte) e Data de Nascimento
-- =====================================================
SELECT 
    C.Nome AS Nome,
    CB.Rg AS Documento,
    C.DtaNasc AS DataNascimento
FROM Cliente C
JOIN ClienteBrasileiro CB ON C.Id = CB.ClienteId

UNION

SELECT 
    C.Nome AS Nome,
    CE.Passaporte AS Documento,
    C.DtaNasc AS DataNascimento
FROM Cliente C
JOIN ClienteEstrangeiro CE ON C.Id = CE.ClienteId;

-- =====================================================
-- 3 Lista unificada: Todos os consumos dos clientes
-- =====================================================

-- Restaurante -> Prato e Valor
-- Frigobar    -> Produto e Valor
-- Massagem    -> Tipo e Valor

SELECT 
    C.Nome AS Cliente,
    Res.Prato AS Consumo,
    Res.Preco AS Valor
FROM Reserva R
JOIN OcupacaoRestaurante ORS ON R.Numero = ORS.ReservaNumero
JOIN Restaurante Res ON ORS.RestauranteId = Res.Id
JOIN Cliente C ON R.ClienteId = C.Id

UNION ALL

SELECT 
    C.Nome AS Cliente,
    F.Item AS Consumo,
    F.Preco AS Valor
FROM Reserva R
JOIN OcupacaoFrigobar OFB ON R.Numero = OFB.ReservaNumero
JOIN Frigobar F ON OFB.FrigobarId = F.Id
JOIN Cliente C ON R.ClienteId = C.Id

UNION ALL

SELECT 
    C.Nome AS Cliente,
    M.Tipo AS Consumo,
    M.Preco AS Valor
FROM Reserva R
JOIN OcupacaoMassagem OM ON R.Numero = OM.ReservaNumero
JOIN Massagem M ON OM.MassagemId = M.Id
JOIN Cliente C ON R.ClienteId = C.Id;
