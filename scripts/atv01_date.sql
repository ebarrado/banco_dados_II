USE db_loja_a;

# Liste todas as ordens mostrando a data formatada no padrão brasileiro.

SELECT descricao, DATE_FORMAT(data_abertura, '%d/%m/%Y') AS data_br
FROM ordens_servico;