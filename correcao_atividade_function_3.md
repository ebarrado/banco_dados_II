#  Atividade 4 — Function para Calcular Frete Grátis

## Requisito

Criar uma FUNCTION:

```sql
fn_frete_gratis()
```

A função deverá:

- Receber o `OrderID`
- Verificar o valor total do pedido
- Retornar:
  - `"FRETE GRÁTIS"`
  - `"FRETE COBRADO"`
# Atividade 5 — Function para Nível do Cliente

## Requisito

Criar uma FUNCTION:

```sql
fn_nivel_cliente()
```

A função deverá:

- Receber o `CustomerID`
- Somar todos os pedidos realizados pelo cliente
- Retornar o nível do cliente de acordo com o valor total de compras

---

## 📋 Critérios

| Total de Compras | Nível |
|------------------|---------|
| > 10000 | PREMIUM |
| > 5000 | GOLD |
| > 1000 | SILVER |
| restante | BRONZE |

---

## 📥 Entrada

A função deverá receber:

```text
CustomerID
```

---

## 📌 A função deve

- Somar todos os pedidos do cliente
- Considerar os itens dos pedidos
- Aplicar os descontos existentes
- Classificar o cliente conforme as regras definidas

---

## 🔗 Tabelas Envolvidas

```text
Customers
Orders
OrderDetails
```

---

## ✅ Resposta

```sql
DELIMITER $$

CREATE FUNCTION fn_nivel_cliente(p_customerid VARCHAR(5))
RETURNS VARCHAR(20)
DETERMINISTIC

BEGIN

    DECLARE v_total DECIMAL(10,2);

    SELECT SUM(
        (od.UnitPrice * od.Quantity) -
        ((od.UnitPrice * od.Quantity) * od.Discount)
    )
    INTO v_total
    FROM Orders o
    INNER JOIN OrderDetails od
        ON o.OrderID = od.OrderID
    WHERE o.CustomerID = p_customerid;

    IF v_total > 10000 THEN
        RETURN 'PREMIUM';

    ELSEIF v_total > 5000 THEN
        RETURN 'GOLD';

    ELSEIF v_total > 1000 THEN
        RETURN 'SILVER';

    ELSE
        RETURN 'BRONZE';

    END IF;

END $$

DELIMITER ;
```

---

## 🧪 Teste

```sql
SELECT
    CustomerID,
    CompanyName,
    fn_nivel_cliente(CustomerID) AS NivelCliente
FROM Customers;
```

---

## 🔍 Exemplo de Resultado

| CustomerID | Empresa | Nível |
|------------|----------|--------|
| ALFKI | Alfreds Futterkiste | PREMIUM |
| ANATR | Ana Trujillo Emparedados | GOLD |
| BERGS | Berglunds snabbköp | SILVER |
| BLAUS | Blauer See Delikatessen | BRONZE |

---

## 📝 Explicação

A função:

1. Recebe o identificador do cliente (`CustomerID`);
2. Localiza todos os pedidos realizados pelo cliente;
3. Soma o valor total dos itens vendidos;
4. Aplica os descontos registrados em cada item;
5. Calcula o valor total comprado pelo cliente;
6. Classifica o cliente conforme os critérios estabelecidos;
7. Retorna o nível correspondente.

---

## 📚 Conceitos Trabalhados

| Conceito | Aplicação |
|-----------|------------|
| FUNCTION | Encapsulamento da regra de negócio |
| JOIN | Relacionamento entre tabelas |
| SUM() | Soma das compras |
| IF / ELSEIF | Estruturas condicionais |
| Variáveis Locais | Armazenamento temporário |
| Agregação | Totalização de vendas |
| RETURN | Retorno do resultado |

---

## 🎯 Resultado Esperado

Ao concluir esta atividade, o aluno será capaz de:

- Criar Functions mais complexas;
- Trabalhar com múltiplas tabelas relacionadas;
- Utilizar agregações com `SUM()`;
- Aplicar regras de classificação de clientes;
- Reutilizar lógica de negócio no banco de dados;
- Desenvolver relatórios e indicadores utilizando MySQL.


## 📋 Regras de Negócio

| Valor do Pedido | Resultado |
|----------------|------------|
| >= 500 | FRETE GRÁTIS |
| < 500 | FRETE COBRADO |


## 📥 Entrada

A função deverá receber:

```text
OrderID
```

---

## ⚠️ Importante

A função deve utilizar a FUNCTION criada anteriormente:

```sql
fn_total_pedido()
```




## ✅ Resposta

```sql
DELIMITER $$

CREATE FUNCTION fn_frete_gratis(p_orderid INT)
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN

    DECLARE v_total DECIMAL(10,2);

    SET v_total = fn_total_pedido(p_orderid);

    IF v_total >= 500 THEN
        RETURN 'FRETE GRÁTIS';
    ELSE
        RETURN 'FRETE COBRADO';
    END IF;

END $$

DELIMITER ;
```




## 🧪 Teste

```sql
SELECT
    OrderID,
    fn_total_pedido(OrderID) AS TotalPedido,
    fn_frete_gratis(OrderID) AS Frete
FROM Orders;
```



## 📝 Explicação

A função:

1. Recebe o identificador do pedido (`OrderID`);
2. Chama a função `fn_total_pedido()` para obter o valor total do pedido;
3. Verifica se o valor retornado é maior ou igual a R$ 500,00;
4. Aplica a regra de negócio:
   - Valor ≥ 500 → **FRETE GRÁTIS**
   - Valor < 500 → **FRETE COBRADO**
5. Retorna o resultado da análise.




## 🔍 Exemplo de Funcionamento

| OrderID | Total do Pedido | Resultado |
|----------|----------------|------------|
| 10248 | 440.00 | FRETE COBRADO |
| 10250 | 1550.00 | FRETE GRÁTIS |
| 10260 | 890.00 | FRETE GRÁTIS |




## 📚 Conceitos Trabalhados

| Conceito | Aplicação |
|-----------|------------|
| FUNCTION | Reutilização de código |
| IF | Estruturas condicionais |
| Variáveis Locais | Armazenamento temporário |
| Chamada de Function | Uso da `fn_total_pedido()` |
| Regras de Negócio | Automação de decisões |
| RETURN | Retorno de resultados |

# Atividade 6 — Function para Tempo de Entrega

## Requisito

Criar uma FUNCTION:

```sql
fn_tempo_entrega()
```

A função deverá:

- Receber o `OrderID`
- Calcular a diferença entre:
  - `OrderDate`
  - `ShippedDate`
- Retornar a quantidade de dias entre a data do pedido e a data de envio.



## 📥 Entrada

A função deverá receber:

```text
OrderID
```


## 🛠️ Função MySQL Recomendada

```sql
DATEDIFF()
```


## 🔗 Tabela Utilizada

```text
Orders
```



## ✅ Resposta

```sql
DELIMITER $$

CREATE FUNCTION fn_tempo_entrega(p_orderid INT)
RETURNS INT
DETERMINISTIC

BEGIN

    DECLARE v_dias INT;

    SELECT DATEDIFF(ShippedDate, OrderDate)
    INTO v_dias
    FROM Orders
    WHERE OrderID = p_orderid;

    RETURN v_dias;

END $$

DELIMITER ;
```



## 🧪 Teste

```sql
SELECT
    OrderID,
    OrderDate,
    ShippedDate,
    fn_tempo_entrega(OrderID) AS DiasEntrega
FROM Orders;
```

---

## 🔍 Exemplo de Resultado

| OrderID | OrderDate | ShippedDate | DiasEntrega |
|----------|------------|------------|--------------|
| 10248 | 1996-07-04 | 1996-07-16 | 12 |
| 10249 | 1996-07-05 | 1996-07-10 | 5 |
| 10250 | 1996-07-08 | 1996-07-12 | 4 |



## 📝 Explicação

A função:

1. Recebe o identificador do pedido (`OrderID`);
2. Busca as datas `OrderDate` e `ShippedDate` na tabela `Orders`;
3. Utiliza a função `DATEDIFF()` para calcular a diferença em dias;
4. Armazena o resultado na variável `v_dias`;
5. Retorna a quantidade de dias necessários para o envio do pedido.


## 📚 Como funciona o DATEDIFF()

Sintaxe:

```sql
DATEDIFF(data_final, data_inicial)
```

Exemplo:

```sql
SELECT DATEDIFF('2026-06-10', '2026-06-01');
```

Resultado:

```text
9
```

Ou seja, existem 9 dias entre as duas datas.



## 📚 Conceitos Trabalhados

| Conceito | Aplicação |
|-----------|------------|
| FUNCTION | Reutilização de código |
| DATEDIFF() | Cálculo entre datas |
| SELECT INTO | Armazenamento em variável |
| Variáveis Locais | Manipulação de dados |
| RETURN | Retorno de resultado |
| Manipulação de Datas | Análise temporal |

# 📊 Atividade 7 — Dashboard SQL

## 📌 Requisito

Criar uma consulta SQL utilizando todas as FUNCTIONS desenvolvidas nas atividades anteriores.



## 🎯 Objetivo

Construir um mini dashboard SQL contendo as seguintes informações:

- Pedido
- Cliente
- Valor total do pedido
- Status do frete
- Tempo de entrega
- Nível do cliente



## 🧠 Functions Utilizadas

| Function | Finalidade |
|-----------|------------|
| fn_total_pedido() | Calcula o valor total do pedido |
| fn_frete_gratis() | Verifica se o pedido possui frete grátis |
| fn_tempo_entrega() | Calcula os dias entre pedido e envio |
| fn_nivel_cliente() | Classifica o cliente por volume de compras |

---

## 🔗 Tabelas Envolvidas

```text
Customers
Orders
```

Relacionamento:

```text
Customers (1) -------- (N) Orders
```


## ✅ Resposta

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



## 🧪 Exemplo de Resultado

| Pedido | Cliente | Total Pedido | Frete | Dias Entrega | Nível Cliente |
|----------|----------|----------|----------|----------|----------|
| 10248 | Alfreds Futterkiste | 440.00 | FRETE COBRADO | 12 | PREMIUM |
| 10249 | Ana Trujillo Emparedados | 1863.40 | FRETE GRÁTIS | 5 | GOLD |
| 10250 | Berglunds snabbköp | 1552.60 | FRETE GRÁTIS | 4 | SILVER |



## 📝 Explicação

A consulta:

1. Busca os pedidos na tabela `Orders`;
2. Relaciona os clientes através da tabela `Customers`;
3. Calcula o valor total de cada pedido utilizando a função `fn_total_pedido()`;
4. Verifica se o pedido possui frete grátis através da função `fn_frete_gratis()`;
5. Calcula o tempo de entrega utilizando a função `fn_tempo_entrega()`;
6. Classifica o cliente através da função `fn_nivel_cliente()`;
7. Exibe todas as informações em formato de dashboard.


## 🚀 Versão Avançada do Dashboard

Adicionar também:

- Funcionário responsável
- Categoria do produto
- Status do estoque

```sql
SELECT
    o.OrderID,
    c.CompanyName,
    CONCAT(e.FirstName, ' ', e.LastName) AS Funcionario,
    p.ProductName,
    fn_categoria_produto(p.ProductID) AS Categoria,
    fn_verificar_estoque(p.ProductID) AS Estoque,
    fn_total_pedido(o.OrderID) AS TotalPedido,
    fn_frete_gratis(o.OrderID) AS Frete,
    fn_tempo_entrega(o.OrderID) AS DiasEntrega,
    fn_nivel_cliente(c.CustomerID) AS NivelCliente
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
INNER JOIN Employees e
    ON o.EmployeeID = e.EmployeeID
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID
INNER JOIN Products p
    ON od.ProductID = p.ProductID;
```



## 📚 Conceitos Trabalhados

| Conceito | Aplicação |
|-----------|------------|
| JOIN | Relacionamento entre tabelas |
| FUNCTION | Reutilização de regras de negócio |
| Dashboard SQL | Visualização de indicadores |
| Relatórios | Consolidação de informações |
| Modelagem Relacional | Navegação entre entidades |
| Alias (AS) | Melhorar a visualização dos resultados |


# Atividade 8 — Function de Comissão do Funcionário

## Requisito

Criar uma FUNCTION:

```sql
fn_comissao_funcionario()
```

A função deverá:

- Receber o `EmployeeID`
- Somar todas as vendas realizadas pelo funcionário
- Calcular a comissão
- Retornar o percentual correspondente



## 📋 Regras de Negócio

| Total Vendido | Comissão |
|---------------|-----------|
| > 50000 | 10% |
| > 20000 | 5% |
| restante | 2% |



## 📥 Entrada

A função deverá receber:

```text
EmployeeID
```

---

## 📌 A função deverá

- Identificar todos os pedidos realizados pelo funcionário;
- Somar o valor total vendido;
- Aplicar a regra de comissão;
- Retornar o percentual correspondente.



## 🔗 Tabelas Envolvidas

```text
Employees
Orders
OrderDetails
```



## 🔗 Relacionamentos

```text
Employees
    │
    └── EmployeeID
            │
            ▼
Orders
    │
    └── OrderID
            │
            ▼
OrderDetails
```



## ✅ Resposta

```sql
DELIMITER $$

CREATE FUNCTION fn_comissao_funcionario(p_employeeid INT)
RETURNS VARCHAR(10)
DETERMINISTIC

BEGIN

    DECLARE v_total DECIMAL(10,2);

    SELECT SUM(
        (od.UnitPrice * od.Quantity) -
        ((od.UnitPrice * od.Quantity) * od.Discount)
    )
    INTO v_total
    FROM Orders o
    INNER JOIN OrderDetails od
        ON o.OrderID = od.OrderID
    WHERE o.EmployeeID = p_employeeid;

    IF v_total > 50000 THEN
        RETURN '10%';

    ELSEIF v_total > 20000 THEN
        RETURN '5%';

    ELSE
        RETURN '2%';

    END IF;

END $$

DELIMITER ;
```



## 🧪 Teste

```sql
SELECT
    EmployeeID,
    FirstName,
    LastName,
    fn_comissao_funcionario(EmployeeID) AS Comissao
FROM Employees;
```


## 🔍 Exemplo de Resultado

| EmployeeID | Funcionário | Comissão |
|------------|-------------|-----------|
| 1 | Nancy Davolio | 10% |
| 2 | Andrew Fuller | 5% |
| 3 | Janet Leverling | 2% |



## 📝 Explicação

A função:

1. Recebe o identificador do funcionário (`EmployeeID`);
2. Localiza todos os pedidos realizados por esse funcionário;
3. Soma o valor total das vendas utilizando os itens dos pedidos;
4. Considera os descontos aplicados em cada item;
5. Calcula o total vendido;
6. Verifica em qual faixa de comissão o funcionário se enquadra;
7. Retorna o percentual correspondente.


## 📚 Conceitos Trabalhados

| Conceito | Aplicação |
|-----------|------------|
| FUNCTION | Encapsulamento da regra de negócio |
| JOIN | Relacionamento entre tabelas |
| SUM() | Totalização de vendas |
| IF / ELSEIF | Estruturas condicionais |
| Agregação | Cálculo do total vendido |
| Variáveis Locais | Armazenamento temporário |
| RETURN | Retorno do resultado |



## 🚀 Consulta Avançada

Exibir também o valor total vendido pelo funcionário:

```sql
SELECT
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS Funcionario,

    SUM(
        (od.UnitPrice * od.Quantity) -
        ((od.UnitPrice * od.Quantity) * od.Discount)
    ) AS TotalVendido,

    fn_comissao_funcionario(e.EmployeeID) AS Comissao

FROM Employees e

INNER JOIN Orders o
    ON e.EmployeeID = o.EmployeeID

INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID

GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName;
```

# Atividade 9 — Produtos Mais Vendidos

## Requisito

Criar uma FUNCTION que:

- Receba o `ProductID`
- Retorne:
  - `"MAIS VENDIDO"`
  - `"VENDA NORMAL"`



## 📋 Critério

A classificação deverá ser baseada na quantidade total vendida do produto.

### Regra adotada

| Quantidade Vendida | Classificação |
|-------------------|---------------|
| >= 500 | MAIS VENDIDO |
| < 500 | VENDA NORMAL |

> Obs.: O valor **500** pode ser ajustado conforme a necessidade do negócio.



## 📥 Entrada

A função deverá receber:

```text
ProductID
```

---

## 🔗 Tabelas Envolvidas

```text
Products
OrderDetails
```



## 🔗 Relacionamento

```text
Products
    │
    └── ProductID
            │
            ▼
OrderDetails
```



## ✅ Resposta

```sql
DELIMITER $$

CREATE FUNCTION fn_status_produto(p_productid INT)
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN

    DECLARE v_total_vendido INT;

    SELECT SUM(Quantity)
    INTO v_total_vendido
    FROM OrderDetails
    WHERE ProductID = p_productid;

    IF v_total_vendido >= 500 THEN
        RETURN 'MAIS VENDIDO';
    ELSE
        RETURN 'VENDA NORMAL';
    END IF;

END $$

DELIMITER ;
```



## 🧪 Teste

```sql
SELECT
    ProductID,
    ProductName,
    fn_status_produto(ProductID) AS StatusProduto
FROM Products;
```


## 🔍 Exemplo de Resultado

| ProductID | Produto | Status |
|------------|----------|----------|
| 1 | Chai | MAIS VENDIDO |
| 2 | Chang | VENDA NORMAL |
| 3 | Aniseed Syrup | MAIS VENDIDO |



## 📝 Explicação

A função:

1. Recebe o identificador do produto (`ProductID`);
2. Consulta todas as vendas registradas na tabela `OrderDetails`;
3. Soma a quantidade total vendida utilizando `SUM(Quantity)`;
4. Compara o resultado com o limite estabelecido;
5. Retorna a classificação correspondente.



## 📚 Conceitos Trabalhados

| Conceito | Aplicação |
|-----------|------------|
| FUNCTION | Encapsulamento de regras de negócio |
| SUM() | Soma das quantidades vendidas |
| IF | Estrutura condicional |
| Agregação | Totalização de vendas |
| Variáveis Locais | Armazenamento temporário |
| RETURN | Retorno do resultado |



## 🚀 Consulta Avançada

Exibir a quantidade vendida juntamente com a classificação:

```sql
SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS QuantidadeVendida,
    fn_status_produto(p.ProductID) AS StatusProduto
FROM Products p
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName;
```



## ⭐ Desafio Bônus

Modificar a função para retornar três categorias:

| Quantidade Vendida | Classificação |
|-------------------|---------------|
| > 1000 | CAMPEÃO DE VENDAS |
| > 500 | MAIS VENDIDO |
| restante | VENDA NORMAL |

### Exemplo

```sql
IF v_total_vendido > 1000 THEN
    RETURN 'CAMPEÃO DE VENDAS';
ELSEIF v_total_vendido > 500 THEN
    RETURN 'MAIS VENDIDO';
ELSE
    RETURN 'VENDA NORMAL';
END IF;
```









