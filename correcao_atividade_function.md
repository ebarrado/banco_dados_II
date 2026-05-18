## Atividade 1 — Function para calcular valor total do pedido
Requisito:

Criar uma FUNCTION chamada: `fn_total_pedido()`

Ela deverá:

* Receber o ID do pedido
* Somar:
  * preço do produto
  * quantidade
  * desconto
  * Retornar o valor total do pedido

## Criando **SELECT**

```sql
SELECT 
    od.OrderID,
    SUM(
        (od.UnitPrice * od.Quantity) - 
        ((od.UnitPrice * od.Quantity) * od.Discount)
    ) AS TotalPedido
FROM [Order Details] od
WHERE od.OrderID = 10248
GROUP BY od.OrderID;
```

## Na tabela Order Details:

* UnitPrice → preço do produto
* Quantity → quantidade
* Discount → desconto (valor decimal)
* Exemplo:
    * 0.10 = 10%
    * 0.20 = 20%

### Fórmula usada

```text
(Preço × Quantidade) - Desconto
(UnitPrice * Quantity) -
((UnitPrice * Quantity) * Discount)
```

---
# Criação da FUNCTION `fn_total_pedido` no MySQL

## Objetivo

Criar uma FUNCTION chamada:

```sql
fn_total_pedido
```

Essa função deverá:

- Receber o ID de um pedido
- Calcular o valor total do pedido
- Considerar:
  - preço do produto
  - quantidade
  - desconto
- Retornar o valor total calculado

---

# Código da FUNCTION

```sql
CREATE FUNCTION fn_total_pedido(p_OrderID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

    DECLARE v_Total DECIMAL(10,2);

    SELECT 
        SUM(
            (UnitPrice * Quantity) -
            ((UnitPrice * Quantity) * Discount)
        )
    INTO v_Total
    FROM order_details
    WHERE OrderID = p_OrderID;

    RETURN v_Total;

END;
```

---

# Explicação Linha por Linha

---

# 1. CREATE FUNCTION

```sql
CREATE FUNCTION fn_total_pedido
```

Cria uma FUNCTION chamada:

```sql
fn_total_pedido
```

---

# 2. Parâmetro da FUNCTION

```sql
(p_OrderID INT)
```

Define o parâmetro recebido pela função.

---

## Explicando

| Elemento | Significado |
|---|---|
| p_ | convenção para parâmetro |
| OrderID | código do pedido |
| INT | número inteiro |

---

## Exemplo de uso

```sql
SELECT fn_total_pedido(10248);
```

Nesse caso:

```sql
p_OrderID = 10248
```

---

# 3. RETURNS

```sql
RETURNS DECIMAL(10,2)
```

Define o tipo de dado retornado pela FUNCTION.

---

## DECIMAL(10,2)

Significa:

| Parte | Significado |
|---|---|
| 10 | total de números |
| 2 | casas decimais |

---

## Exemplo

```text
1250.75
```

---

# 4. DETERMINISTIC

```sql
DETERMINISTIC
```

Informa ao MySQL que:

```text
A FUNCTION sempre retorna o mesmo resultado
para a mesma entrada.
```

---

## Exemplo

Se passar:

```sql
10248
```

sempre retornará o mesmo total do pedido.

---

# 5. BEGIN

```sql
BEGIN
```

Inicia o bloco de comandos da FUNCTION.

---

# 6. DECLARE

```sql
DECLARE v_Total DECIMAL(10,2);
```

Cria uma variável local chamada:

```sql
v_Total
```

Essa variável armazenará o valor total do pedido.

---

# Convenção usada

| Prefixo | Significado |
|---|---|
| p_ | parâmetro |
| v_ | variável |

---

# 7. SELECT com SUM()

```sql
SELECT 
    SUM(
        (UnitPrice * Quantity) -
        ((UnitPrice * Quantity) * Discount)
    )
```

Realiza o cálculo do valor total do pedido.

---

# Fórmula utilizada

```text
(Preço × Quantidade) - Desconto
```

---

# Explicando o cálculo

## Valor bruto

```sql
(UnitPrice * Quantity)
```

Calcula:

```text
Preço × Quantidade
```

---

## Valor do desconto

```sql
((UnitPrice * Quantity) * Discount)
```

Calcula o desconto aplicado.

---

## Valor final do item

```text
Valor bruto - desconto
```

---

# 8. INTO

```sql
INTO v_Total
```

Armazena o resultado do cálculo dentro da variável:

```sql
v_Total
```

---

# 9. FROM

```sql
FROM order_details
```

Tabela utilizada no cálculo.

Essa tabela contém:

- produtos do pedido
- quantidade
- preço
- desconto

---

# 10. WHERE

```sql
WHERE OrderID = p_OrderID;
```

Filtra apenas os itens do pedido informado.

---

## Exemplo

Se:

```sql
p_OrderID = 10248
```

A consulta ficará:

```sql
WHERE OrderID = 10248
```

---

# 11. RETURN

```sql
RETURN v_Total;
```

Retorna o valor final calculado pela FUNCTION.

---

# 12. END

```sql
END;
```

Finaliza a FUNCTION.

---

# Exemplo de Execução

## Consultar um pedido específico

```sql
SELECT fn_total_pedido(10248);
```

---

# Consultar vários pedidos

```sql
SELECT 
    OrderID,
    fn_total_pedido(OrderID) AS TotalPedido
FROM orders;
```

---

# Resultado Esperado

| OrderID | TotalPedido |
|---|---|
| 10248 | 440.00 |
| 10249 | 1863.40 |
| 10250 | 1552.60 |

---

# Resumo Geral

| Comando | Função |
|---|---|
| CREATE FUNCTION | cria a função |
| RETURNS | define retorno |
| DECLARE | cria variável |
| SUM() | soma valores |
| INTO | guarda valor na variável |
| WHERE | filtra pedido |
| RETURN | retorna resultado |
