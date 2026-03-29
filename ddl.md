# DDL - (Data Definition Language) - Linguagem de Definição de Dados

Serve para criar e estruturar o banco de dados, ou seja, mexe na estrutura, não nos dados.

## Principais comandos DDL

| Comando    | Função                            |
| ---------- | --------------------------------- |
| `CREATE`   | Criar tabelas ou banco            |
| `ALTER`    | Alterar estrutura                 |
| `DROP`     | Excluir estrutura                 |
| `TRUNCATE` | Apagar todos os dados rapidamente |



## Criação de Tabela (DDL)

Antes da DML, precisamos da tabela:

## 1. 📦 CREATE (criar tabela)

```sql
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50),
    data_cadastro DATE
);
```

## 2. ✏️ ALTER (alterar tabela)

Adicionar coluna:

```sql
ALTER TABLE clientes
ADD telefone VARCHAR(20);
```


## 3.  INSERT (Inserir dados)

✔ Inserção simples

```sql
INSERT INTO clientes (nome, email, cidade, data_cadastro)
VALUES ('Ana Souza', 'ana@email.com', 'São Paulo', '2026-03-29');
✔ Inserindo vários registros
INSERT INTO clientes (nome, email, cidade, data_cadastro)
VALUES 
('Carlos Lima', 'carlos@email.com', 'Marília', '2026-03-20'),
('Juliana Alves', 'juliana@email.com', 'Bauru', '2026-03-22');

```
## 4. ❌ DROP (excluir tabela)

```sql
DROP TABLE clientes;
```

⚠️ Remove tudo: estrutura + dados

## 5. ⚡ TRUNCATE (limpar tabela)

```sql
TRUNCATE TABLE clientes;
```

* ✔ Apaga todos os dados
* ✔ Mantém a estrutura

