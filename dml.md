# DML - Data Manipulation Language

DML (Data Manipulation Language) = Linguagem de Manipulação de Dados

👉 Serve para mexer nos dados dentro das tabelas

## Principais comandos DML

| Comando  | Função          |
| -------- | --------------- |
| `SELECT` | Consultar dados |
| `INSERT` | Inserir dados   |
| `UPDATE` | Atualizar dados |
| `DELETE` | Excluir dados   |

## 🛠️ 1. INSERT — Inserir dados

```sql
INSERT INTO tabela (colunas)
VALUES (valores);
```

## 🔍 2. SELECT — Consultar dados

```sql
SELECT colunas
FROM tabela;
```

#### Recursos importantes

* WHERE → filtro
* ORDER BY → ordenação
* GROUP BY → agrupamento
* JOIN → relacionamento

## ❌ 4. DELETE — Excluir dados

```sql
DELETE FROM tabela
WHERE condição;
```

## ✔ UPDATE com cálculo

```sql
UPDATE ordens_servico
SET valor = valor * 1.1
WHERE status_os = 'aberto';
```

## ✔ DELETE com condição
```sql
DELETE FROM ordens_servico
WHERE valor < 100;
```e a




