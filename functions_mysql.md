# Funções

Funções no MySQL são blocos de código que retornam um valor e podem ser reutilizados dentro de consultas SQL.

## Estrutura de uma função no MYSQL

```sql
DELIMITER $$

CREATE FUNCTION nome_funcao(parametro TIPO)
RETURNS TIPO
DETERMINISTIC
BEGIN
    DECLARE variavel TIPO;

    -- lógica
    SET variavel = ...;

    RETURN variavel;
END $$

DELIMITER ;
```

## Exemplo 1
### Função para calcular desconto

```sql
USE db_loja;

DELIMITER $$

CREATE FUNCTION calcular_desconto(valor DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN valor * 0.9;
END $$

DELIMITER ;
```
### Uso

```sql
USE db_loja_a;

SELECT 
    c.nome,
    o.valor,
    calcular_desconto(o.valor) AS valor_com_desconto
FROM clientes c
JOIN ordens_servico o 
    ON c.id_cliente = o.id_cliente;
```

* Junta clientes com suas ordens
* Pega o valor de cada ordem
* Aplica a função em cada linha

## Exemplo de Resultado
| nome        | valor | valor_com_desconto |
| ----------- | ----- | ------------------ |
| João Silva  | 150.00   | 135.00           |
| Maria Souza | 80 | 72.00          |

> Agora a função recebe o valor real de cada ordem de serviço, por isso o resultado muda para cada linha

## Exemplo - Somar e aplicar desconto no total

### Antes crie os INSERTs

```sql
USE db_loja_a;
INSERT INTO ordens_servico (descricao, data_abertura, status_os, valor, id_cliente) VALUES
('Troca de peça', '2026-04-01', 'Concluída', 150.00, 1),
('Manutenção preventiva', '2026-04-02', 'Em andamento', 200.00, 1),
('Instalação de sistema', '2026-04-03', 'Concluída', 300.00, 2),
('Reparo técnico', '2026-04-04', 'Pendente', 120.00, 2),
('Atualização de software', '2026-04-05', 'Concluída', 180.00, 3),
('Diagnóstico', '2026-04-06', 'Em andamento', 90.00, 1),
('Configuração de rede', '2026-04-07', 'Concluída', 250.00, 2);
```



### Quantidadede Ordem de Serviço por Cliente

```sql
USE db_loja_a;
SELECT 
    c.nome,
    COUNT(o.id_os) AS total_ordens
FROM clientes c
LEFT JOIN ordens_servico o 
    ON c.id_cliente = o.id_cliente
GROUP BY c.nome;
```

### Select cliente 3

```sql
USE db_loja_a;

SELECT *
FROM ordens_servico
WHERE id_cliente = 3;
```
## Somar e aplicar desconto no total

```sql
USE db_loja_a;
SELECT 
    c.nome,
    SUM(o.valor) AS total,
    calcular_desconto(SUM(o.valor)) AS total_com_desconto
FROM clientes c
JOIN ordens_servico o 
    ON c.id_cliente = o.id_cliente
GROUP BY c.nome;
```

