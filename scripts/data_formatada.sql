USE db_loja_a;

select
descricao,
DATE_FORMAT(data_abertura, '%d/%m/%Y') AS DATA_FORMATADA
FROM ordens_servico