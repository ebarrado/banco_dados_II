# Situação-Problema

A empresa deseja automatizar algumas regras do sistema utilizando FUNCTIONS no MySQL.

Você foi contratado como desenvolvedor de banco de dados para implementar essas funcionalidades.

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

## Atividade 2 — Function para verificar estoque
Requisito

Criar uma FUNCTION: `fn_verificar_estoque()`

A função deverá:

* Receber o ProductID

Verificar:

* se o produto possui mais de 10 unidades

Retornar:

* "ESTOQUE OK"
* "ESTOQUE BAIXO"

## Atividade 3 — Function para Categoria do Produto

Requisito:

Criar uma FUNCTION:

```sql
fn_categoria_produto()
```

A função deverá:

- Receber o `ProductID`
- Retornar o nome da categoria do produto


## 🔗 Relações necessárias

```text
Products -> Categories
```


## Atividade 4 — Function para Calcular Frete Grátis

Requisito:

Criar uma FUNCTION:

```sql
fn_frete_gratis()
```



###  Regras de Negócio

| Valor do Pedido | Resultado |
|---|---|
| >= 500 | FRETE GRÁTIS |
| < 500 | FRETE COBRADO |

###  Entrada

A função deverá receber:

```text
OrderID
```

###  ⚠️ Importante

A função deve utilizar a FUNCTION criada anteriormente:

```sql
fn_total_pedido()
```

## Atividade 5 — Function para Nível do Cliente

Requisito:

Criar uma FUNCTION:

```sql
fn_nivel_cliente()
```

### Critérios

| Total de Compras | Nível |
|---|---|
| > 10000 | PREMIUM |
| > 5000 | GOLD |
| > 1000 | SILVER |
| restante | BRONZE |


###  Entrada

A função deverá receber:

```text
CustomerID
```



### A função deve

- Somar todos os pedidos do cliente
- Retornar o nível do cliente

###  Tabelas envolvidas

```text
Customers
Orders
OrderDetails
```

## Atividade 6 — Function para Tempo de Entrega

### Requisito

Criar uma FUNCTION:

```sql
fn_tempo_entrega()
```

###  A função deverá

- Receber `OrderID`
- Calcular diferença entre:
  - `OrderDate`
  - `ShippedDate`
- Retornar quantidade de dias

---

###  Função MySQL recomendada

```sql
DATEDIFF()
```


### Tabela utilizada

```text
Orders
```


## Atividade 7 — Dashboard SQL

### Requisito

Crie uma consulta final utilizando as FUNCTIONS criadas anteriormente.



### Objetivo

Construir um mini dashboard SQL contendo:

- Pedido
- Cliente
- Valor total
- Frete
- Tempo de entrega
- Nível do cliente

### Exemplo esperado

```sql
SELECT
    o.OrderID,
    c.CompanyName,
    fn_total_pedido(o.OrderID) AS TotalPedido,
    fn_frete_gratis(o.OrderID) AS Frete,
    fn_tempo_entrega(o.OrderID) AS DiasEntrega,
    fn_nivel_cliente(c.CustomerID) AS NivelCliente
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;
```

## Atividade 8 — Function de Comissão do Funcionário

###  Requisito

Criar:

```sql
fn_comissao_funcionario()
```



###  Regras

| Total vendido | Comissão |
|---|---|
| > 50000 | 10% |
| > 20000 | 5% |
| restante | 2% |

---

## 📥 Entrada

A função deverá receber:

```text
EmployeeID
```


###  A função deverá

- Somar todas as vendas do funcionário
- Calcular a comissão
- Retornar o percentual correspondente

### Tabelas envolvidas

```text
Employees
Orders
OrderDetails
```



## Atividade 9 — Produtos Mais Vendidos

###  Requisito

Criar uma FUNCTION que:

- Receba `ProductID`
- Retorne:
  - `"MAIS VENDIDO"`
  - `"VENDA NORMAL"`



###  Critério

A classificação deve ser baseada na quantidade total vendida do produto.

###  Tabelas envolvidas

```text
Products
OrderDetails
```

# 📌 Entrega Esperada

Todos deverão entregar:

- Scripts SQL das FUNCTIONS
- Consultas de teste
- Dashboard SQL final funcionando


# 🚀 Competências Desenvolvidas

- SQL Avançado
- JOINs
- Functions MySQL
- Regras de negócio
- Manipulação de dados
- Agregações
- Relatórios SQL
- Modelagem relacional
- Performance SQL
- Organização de código