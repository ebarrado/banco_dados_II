USE db_loja_a;
# 
SELECT descricao, data_abertura
FROM ordens_servico
WHERE data_abertura >= '2026-03-01';