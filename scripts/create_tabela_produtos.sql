CREATE DATABASE db_loja;
USE db_loja;
CREATE TABLE tb_produtos(
 id_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 nome_produto VARCHAR(50) NOT NULL,
 categoria VARCHAR(20) NOT NULL,
 valor_produto DOUBLE NOT NULL,
 qtd_produto INT NOT NULL
)