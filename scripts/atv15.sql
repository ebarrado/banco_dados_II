USE db_loja_a;
SELECT clientes.nome, ordens_servico.descricao
FROM clientes 
JOIN ordens_servico
ON clientes.id_cliente = ordens_servico.id_cliente;
