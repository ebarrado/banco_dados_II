# Banco e dados Relacional **SELECT**

Instrução **SELECT** é a mais importante em banco de dados relacional. Serve para realizar **consulta (busca) dados** armazenados nas tabelas

## Banco de Dados Relacional

Banco de dados relacional é um banco de dados que organiza dado em tabela (linhas e colunas) e permite relacionar as tabelas entre si.

### Exemplos:
* Clientes
* Pedidos
* Produtos

## Estrutura Básica

```sql
SELECT coluna1, coluna2
FROM nome_da_tabela;
```

### Exemplo:

```sql
SELECT nome, email
FROM clientes;
```

## Selecionar todos os dados

```sql
SELECT * FROM clientes;
```

## Filtrar dados (WHERE)

```sql
SELECT nome, cidade
FROM clientes
WHERE cidade = 'São Paulo';
```

## Ordenar resultados (ORDER BY)

```sql
SELECT nome, idade
FROM clientes
ORDER BY idade DESC;
```
* Ordena (ASC = crescente | DESC = decrescente)

## Buscar valores únicos (DISTINCT)

```sql
SELECT DISTINCT cidade
FROM clientes;
```

* Remove duplicados

## Limitar resultados (LIMIT)

```sql
SELECT * FROM clientes
LIMIT 5;
```
* Retorna apenas os primeiros registros

## Relacionar tabelas (JOIN)

```sql
SELECT clientes.nome, pedidos.descricao
FROM clientes
JOIN pedidos
ON clientes.id_cliente = pedidos.id_cliente;
```
* Junta dados de várias tabelas

## Funções de agregação

| Função    | Descrição       |
| --------- | --------------- |
| `COUNT()` | Conta registros |
| `SUM()`   | Soma valores    |
| `AVG()`   | Média           |
| `MAX()`   | Maior valor     |
| `MIN()`   | Menor valor     |

Exemplo:

```sql
SELECT COUNT(*) FROM clientes;
```
## Agrupar dados (GROUP BY)

```sql
SELECT cidade, COUNT(*) as total
FROM clientes
GROUP BY cidade;
```
* Agrupa resultados

## Filtrar grupos (HAVING)

```sql
SELECT cidade, COUNT(*) as total
FROM clientes
GROUP BY cidade
HAVING total > 5;
```
* Filtra após agrupamento

## Exemplos Práticos criados em aula

```sql
USE db_ecommercef;
SELECT * FROM tb_produtos;
```


```sql
USE db_ecommerce;

#TOTAL EM REAIS EM ESTOQUE
SELECT CONCAT('R$ ', SUM(preco * estoque)) 
AS 'Total R$'
FROM tb_produtos
```

```sql
USE db_ecommerce;

#SOMA DA QUANTIDADE EM ESTOQUE

SELECT SUM(estoque) AS total_produtos 
FROM tb_produtos;
```

```sql
USE db_ecommerce;
#CONTAGEM TODOS DE PRODUTOS NA TABELA
SELECT COUNT(*) FROM tb_produtos;
```


## Formatação de Datas em Banco de Dados

A formatação de datas serve para exibir ou manipular datas no formato desejado.

👉 Exemplo:
Banco guarda → 2026-03-29
Usuário vê → 29/03/2026

## Formato padrão (bancos relacionais)

A maioria dos bancos usa o padrã
```text
YYYY-MM-DD
```
## Formatação por banco

### MySQL – DATE_FORMAT()
```sql
SELECT DATE_FORMAT(data_abertura, '%d/%m/%Y') AS data_formatada
FROM ordens_servico;
```

```sql
USE db_loja_a;

SELECT
descricao,
DATE_FORMAT(data_abertura, '%d/%m/%Y') AS DATA_FORMATADA
FROM ordens_servico
```

### Principais códigos:

| Código | Significado | Exemplo |
| ------ | ----------- | ------- |
| `%d`   | dia         | 29      |
| `%m`   | mês         | 03      |
| `%Y`   | ano         | 2026    |
| `%H`   | hora        | 14      |
| `%i`   | minutos     | 30      |


```sql
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y %H:%i') AS agora;
```
## Convertendo texto para data

```sql
SELECT STR_TO_DATE('29/03/2026', '%d/%m/%Y');
```

| Ação                   | Função                             |
| ---------------------- | ---------------------------------- |
| Formatar data          | `DATE_FORMAT`, `TO_CHAR`, `FORMAT` |
| Converter texto → data | `STR_TO_DATE`                      |
| Padrão banco           | `YYYY-MM-DD`                       |

