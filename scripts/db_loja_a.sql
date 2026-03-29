CREATE DATABASE IF NOT EXISTS db_loja_a;
USE db_loja_a;
CREATE TABLE IF NOT EXISTS  clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cidade VARCHAR(60),
    ativo BIT NOT NULL DEFAULT 1
);
CREATE TABLE IF NOT EXISTS ordens_servico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    data_abertura DATE NOT NULL,
    status_os VARCHAR(30) NOT NULL,
    valor DECIMAL(10,2),
    id_cliente INT NOT NULL,
    CONSTRAINT fk_cliente_os
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
