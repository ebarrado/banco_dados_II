USE db_loja_a;

SELECT c.nome, o.descricao,
DATE_FORMAT(o.data_abertura, '%d/%m/%Y') AS data_formatada
FROM clientes c
JOIN ordens_servico o
ON c.id_cliente = o.id_cliente;