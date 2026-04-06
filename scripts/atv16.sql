USE db_loja_a;

SELECT c.nome, o.valor
FROM clientes c
JOIN ordens_servico o
ON c.id_cliente = o.id_cliente;
