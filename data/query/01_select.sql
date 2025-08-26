SELECT * FROM clientes;

SELECT *,
    CASE
        WHEN QtdePontos > 500 THEN 'ALTO'
    ELSE 'BAIXO' END AS NivelPontos
FROM clientes;

-- Selecionar clientes com Email cadastrado
SELECT DISTINCT IdCliente
FROM clientes
WHERE FlEmail = 1
;

-- Selecionar todas as transacoes de 50 pontos
SELECT *
FROM transacoes
WHERE QtdePontos = 50;

-- selecionar todos os clientes com mais de 500 pontos
SELECT DISTINCT IdCliente
FROM clientes
WHERE QtdePontos > 500;

-- selecionar produtos que contem churn no nome
SELECT DISTINCT DescProduto
FROM produtos
WHERE DescProduto LIKE '%churn%'
;

-- Lista de transações com apenas 1 ponto;
SELECT DISTINCT IdTransacao
FROM transacoes
WHERE QtdePontos = 1;

--Lista de pedidos realizados no fim de semana
SELECT *
FROM transacoes
WHERE strftime('%w', datetime(SUBSTR(DtCriacao, 1, 19))) IN ('0', '6');

-- Lista de clientes com 0 (zero) pontos;
SELECT DISTINCT IdCliente
FROM clientes
WHERE QtdePontos = 0;

-- Lista de clientes com 100 a 200 pontos (inclusive ambos);
SELECT DISTINCT IdCliente, QtdePontos
FROM clientes
WHERE QtdePontos BETWEEN 100 AND 200;

-- Lista de produtos com nome que começa com “Venda de”;
SELECT DISTINCT DescProduto
FROM produtos
WHERE DescProduto LIKE 'Venda de%';

-- Lista de produtos com nome que termina com “Lover”;
SELECT DISTINCT DescProduto
FROM produtos
WHERE DescProduto LIKE '%Lover';

-- Lista de produtos que são “chapéu”;
SELECT DISTINCT DescProduto, DescCateogriaProduto
FROM produtos
WHERE DescProduto like '%chapéu%';

-- Lista de transações com o produto “Resgatar Ponei”;
SELECT DISTINCT tp.IdTransacao
FROM transacao_produto tp
LEFT JOIN produtos p ON p.IdProduto = tp.IdProduto
WHERE p.DescProduto = 'Resgatar Ponei';


-- Listar todas as transações adicionando uma coluna nova sinalizando “alto”, “médio” e “baixo” para o valor dos pontos [<10 ; <500; >=500]
SELECT *,
    CASE
        WHEN QtdePontos < 10 THEN 'BAIXO'
        WHEN QtdePontos < 500 THEN 'MEDIO'
    ELSE 'ALTO' END AS NivelPontos
FROM transacoes;