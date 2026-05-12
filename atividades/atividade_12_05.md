# Atividade — Consultas SQL SELECT (Baseado no Diagrama)

Utilizando apenas o diagrama do banco de dados apresentado, desenvolva as consultas SQL solicitadas abaixo.

![alt text](/imagens/bd_northwind.png)

## Objetivo

Praticar:

* SELECT
* WHERE
* ORDER BY
* JOIN
* GROUP BY
* COUNT
* SUM
* AVG
* MAX
* MIN
* Relacionamentos entre tabelas

## Regras
* Todas as consultas devem utilizar o banco conforme o diagrama;
* Utilize nomes claros nos aliases;
* Organize o código SQL;
* Sempre que possível utilize INNER JOIN.

## Atividade 1 — Listar Clientes

Liste:

- Nome da empresa
- Cidade
- País

### Tabela:

- `Customers`

### Requisito:

Ordenar pelo nome da empresa.



## Atividade 2 — Produtos em Estoque

Liste:

- Nome do produto
- Preço
- Quantidade em estoque

### Tabela:

- `Products`

### Requisito:

Mostrar apenas produtos com estoque maior que 0.


## Atividade 3 — Funcionários

Liste:

- Nome completo do funcionário
- Cidade
- País

### Tabela:

- `Employees`

### Requisito:

Criar o nome completo utilizando concatenação.


## Atividade 4 — Pedidos Realizados

Liste:

- Número do pedido
- Data do pedido
- Cidade de entrega
- País de entrega

### Tabela:

- `Orders`

### Requisito:

Ordenar pelos pedidos mais recentes.



## Atividade 5 — Produtos e Categorias

Liste:

- Nome do produto
- Nome da categoria
- Preço

### Tabelas:

- `Products`
- `Categories`

### Requisito:

Utilizar `JOIN`.


## Atividade 6 — Produtos e Fornecedores

Liste:

- Nome do produto
- Nome do fornecedor
- Cidade do fornecedor

### Tabelas:

- `Products`
- `Suppliers`


## Atividade 7 — Clientes e Pedidos

Liste:

- Nome da empresa cliente
- Número do pedido
- Data do pedido

### Tabelas:

- `Customers`
- `Orders`


## Atividade 8 — Funcionário Responsável pelo Pedido

Liste:

- Número do pedido
- Nome do funcionário
- Data do pedido

### Tabelas:

- `Orders`
- `Employees`



## Atividade 9 — Detalhes do Pedido

Liste:

- Número do pedido
- Nome do produto
- Quantidade
- Preço unitário

### Tabelas:

- `OrderDetails`
- `Products`



## Atividade 10 — Total de Produtos

Mostrar:

- Quantidade total de produtos cadastrados.

### Requisito:

Utilizar:

```sql
COUNT()
```

### Tabela:

- `Products`

## # Entrega da Atividade

## O que deve ser entregue

Enviar:

- Arquivo `.sql` contendo todas as consultas;
ou
- Documento PDF com:
  - comandos SQL
  - prints das execuções
  - resultados das consultas


# Organização

O arquivo deverá conter:

- Nome 
- Turma
- Data
- Número da atividade
- Consultas organizadas por exercício



# Exemplo de Organização

```sql
-- Atividade 1
SELECT ...

-- Atividade 2
SELECT ...
```


# Envio

* Enviar os arquivos para:
* 📧 barrado.aula@gmail.com


# Critérios de Avaliação

| Critério | Pontos |
|---|---|
| Uso correto do SELECT | 2 |
| Uso correto de JOIN | 2 |
| Uso correto de filtros | 2 |
| Organização do código SQL | 2 |
| Execução correta das consultas | 2 |

**Total: 10 pontos**

---

# Data de Entrega

* Entregar até 12h - 12/05