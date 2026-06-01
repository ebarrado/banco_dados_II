# ✅ Respostas — Atividade 2 e 3 (Functions MySQL)

# 🧩 Atividade 2 — Function para Verificar Estoque

## 📌 Requisito

Criar uma FUNCTION:

```sql
fn_verificar_estoque()
```

A função deverá:

- Receber o `ProductID`
- Verificar se o produto possui mais de 10 unidades em estoque
- Retornar:
  - `"ESTOQUE OK"`
  - `"ESTOQUE BAIXO"`

## ✅ Resposta

```sql
DELIMITER $$

CREATE FUNCTION fn_verificar_estoque(p_productid INT)
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN

    DECLARE v_estoque INT;

    SELECT UnitsInStock
    INTO v_estoque
    FROM Products
    WHERE ProductID = p_productid;

    IF v_estoque > 10 THEN
        RETURN 'ESTOQUE OK';
    ELSE
        RETURN 'ESTOQUE BAIXO';
    END IF;

END $$

DELIMITER ;
```



## 🧪 Teste

```sql
SELECT
    ProductName,
    UnitsInStock,
    fn_verificar_estoque(ProductID) AS StatusEstoque
FROM Products;
```


## 📝 Explicação

A função:

1. Recebe o código do produto (`ProductID`);
2. Consulta a quantidade disponível em estoque (`UnitsInStock`);
3. Verifica se o estoque é superior a 10 unidades;
4. Retorna uma classificação para facilitar a análise do estoque.



# 🧩 Atividade 3 — Function para Categoria do Produto

## 📌 Requisito

Criar uma FUNCTION:

```sql
fn_categoria_produto()
```

A função deverá:

- Receber o `ProductID`
- Retornar o nome da categoria do produto


## 🔗 Relações necessárias

```text
Products → Categories
```



## ✅ Resposta

```sql
DELIMITER $$

CREATE FUNCTION fn_categoria_produto(p_productid INT)
RETURNS VARCHAR(50)
DETERMINISTIC

BEGIN

    DECLARE v_categoria VARCHAR(50);

    SELECT c.CategoryName
    INTO v_categoria
    FROM Products p
    INNER JOIN Categories c
        ON p.CategoryID = c.CategoryID
    WHERE p.ProductID = p_productid;

    RETURN v_categoria;

END $$

DELIMITER ;
```


## 🧪 Teste

```sql
SELECT
    ProductName,
    fn_categoria_produto(ProductID) AS Categoria
FROM Products;
```


## 📝 Explicação

A função:

1. Recebe o código do produto (`ProductID`);
2. Localiza a categoria associada ao produto;
3. Utiliza um `INNER JOIN` entre as tabelas `Products` e `Categories`;
4. Retorna o nome da categoria correspondente.


## 📚 Conceitos Trabalhados

| Conceito | Aplicação |
|-----------|------------|
| FUNCTION | Encapsulamento de regras de negócio |
| SELECT INTO | Armazenamento de valores em variáveis |
| IF | Estruturas condicionais |
| INNER JOIN | Relacionamento entre tabelas |
| RETURN | Retorno de resultados |
| Modelagem Relacional | Navegação entre entidades do DER |


## 🎯 Resultado Esperado

Ao concluir estas atividades, o aluno será capaz de:

- Criar Functions no MySQL;
- Utilizar variáveis locais;
- Aplicar estruturas condicionais;
- Trabalhar com relacionamentos entre tabelas;
- Reutilizar lógica de negócio no banco de dados;
- Consultar informações derivadas utilizando Functions.