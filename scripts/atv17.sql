USE db_loja_a;


SELECT clientes .nome, COUNT(ordens_servico.id_os) AS total
FROM clientes 
JOIN ordens_servico 
ON clientes .id_cliente = ordens_servico.id_cliente
GROUP BY clientes .nome
HAVING total > 1;


