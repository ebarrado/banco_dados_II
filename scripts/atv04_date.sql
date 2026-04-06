USE db_loja_a;
# MÊS E ANO
SELECT descricao,
DATE_FORMAT(data_abertura, '%m/%Y') AS mes_ano
FROM ordens_servico;