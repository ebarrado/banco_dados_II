USE db_ecommerce2;

#TOTAL EM REAIS EM ESTOQUE
SELECT CONCAT('R$ ', SUM(preco * estoque)) 
AS 'Total R$'
FROM tb_produtos