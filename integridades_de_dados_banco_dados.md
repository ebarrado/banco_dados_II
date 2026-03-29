# Integridade de Dados em Banco de Dados

A integridade de dados garante que as informações armazenadas no banco sejam:

* ✔ Corretas
* ✔ Consistentes
* ✔ Confiáveis
* ✔ Sem duplicidade indevida

## Tipos de Integridade de Dados

### 1. 🧩 Integridade de Entidade

Toda tabela deve ter uma chave primária (PRIMARY KEY)

```sql
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);
```
### 2. 🔗 Integridade Referencial

Garante relacionamento correto entre tabelas

* Uma chave estrangeira (FOREIGN KEY) deve existir na tabela relacionada

```sql
CREATE TABLE ordens_servico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
```

* ✔ Não permite:

* Inserir referência inexistente
* Excluir dados que estão sendo usados

### 3. 📏 Integridade de Domínio

Garante valores válidos nos campos

* ✔ Regras comuns:
* Tipo de dado correto
* Tamanho definido
* Valores permitidos

```sql
nome VARCHAR(100) NOT NULL
valor DECIMAL(10,2)
```
* ✔ Evita:
* Texto em campo numérico
* Campos obrigatórios vazios

#### 4. 🚫 Integridade de Restrição (Constraints)

Define regras específicas para os dados

Exemplos:
#### ✔ NOT NULL
```sql
✔ NOT NULL
```
#### ✔ UNIQUE
```sql
email VARCHAR(100) UNIQUE
```
#### ✔ DEFAULT
```sql
ativo BIT DEFAULT 1
```
| Problema         | Exemplo                       |
| ---------------- | ----------------------------- |
| Dados duplicados | Dois clientes com mesmo email |
| Dados órfãos     | Ordem sem cliente             |
| Dados inválidos  | Texto em campo numérico       |
| Perda de dados   | DELETE sem controle           |
