# Criação Banco de Dados - `db_loja`

1. Crie a base de dados - **db_loja** 
2. Crie as tabelas:
* Clientes
* Ordem de Serviços

```sql
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
```

3. Crie os **INSERTS** para a tabela **Clientes** e **Ordem de Serviços**

```sql
USE db_loja_a;

#INSERT CLIENTES
INSERT INTO clientes (nome, email, telefone, cidade, ativo) VALUES
('João Silva', 'joao.silva@email.com', '14999990001', 'Marília', 1),
('Maria Souza', 'maria.souza@email.com', '14999990002', 'Bauru', 1),
('Carlos Oliveira', 'carlos.oliveira@email.com', '14999990003', 'Assis', 1),
('Ana Pereira', 'ana.pereira@email.com', '14999990004', 'Garça', 1),
('Lucas Santos', 'lucas.santos@email.com', '14999990005', 'Marília', 1),
('Fernanda Lima', 'fernanda.lima@email.com', '14999990006', 'Pompéia', 1),
('Ricardo Alves', 'ricardo.alves@email.com', '14999990007', 'Tupã', 1),
('Juliana Rocha', 'juliana.rocha@email.com', '14999990008', 'Ourinhos', 1),
('Bruno Costa', 'bruno.costa@email.com', '14999990009', 'Lins', 1),
('Patrícia Gomes', 'patricia.gomes@email.com', '14999990010', 'Jaú', 1);

#INSERT ORDEM SERVIÇO
INSERT INTO ordens_servico (descricao, 
							data_abertura, 
							status_os, 
							valor, 
							id_cliente) VALUES
('Manutenção de computador', '2026-03-01', 'Aberta', 150.00, 1),
('Instalação de software', '2026-03-02', 'Concluída', 80.00, 2),
('Troca de HD por SSD', '2026-03-03', 'Em andamento', 300.00, 3),
('Limpeza de notebook', '2026-03-04', 'Concluída', 120.00, 4),
('Configuração de rede', '2026-03-05', 'Aberta', 200.00, 5),
('Formatação de PC', '2026-03-06', 'Concluída', 100.00, 6),
('Instalação de impressora', '2026-03-07', 'Em andamento', 90.00, 7),
('Backup de dados', '2026-03-08', 'Concluída', 110.00, 8),
('Atualização de sistema', '2026-03-09', 'Aberta', 70.00, 9),
('Remoção de vírus', '2026-03-10', 'Concluída', 130.00, 10);
```
4. Liste todos os clientes
5. Mostre apenas nome e cidade dos clientes
6. Liste todas as ordens de serviço
7. Clientes da cidade de São Paulo
8. Ordens com valor maior que 500
9. Clientes ativos
10. Clientes em ordem alfabética
11. Ordens do maior valor para o menor
12. Quantidade de clientes
13. Valor médio das ordens
14. Maior valor de ordem
15. Mostrar nome do cliente + descrição da ordem
16. Mostrar cliente + valor da ordem
17. Mostrar total de ordens por cliente
18. Mostrar clientes que possuem mais de 1 ordem
