# Estudo de Caso

Uma pequena empresa chamada TechSolutions está implantando um sistema para gerenciar clientes, funcionários e ordens de serviço.
Antes de criar tabelas ou inserir dados, é necessário implementar o banco de dados, garantindo organização e preparação do ambiente.

Para começar um sistema devemos planejar o Banco do Dados, primeiro criando o banco e definindo o padrão e somente depois a estrutura

# Etapa 1

## O que é SGBD
É um software responsável por criar, organizar, armazenar, acessar, manipular e proteger os dados de um banco de dados.

### 1️⃣ **SGBD Relacional (SQL)**
Armazena dados em tabelas com linhas e colunas, utilizando SQL para consultas.

| Exemplo | Criador | Tipo de Licença |
|---------|---------|-----------------|
| **MySQL** | Oracle | Open Source |
| **PostgreSQL** | Comunidade Open Source | Open Source |
| **Oracle Database** | Oracle Corporation | Comercial |
| **Microsoft SQL Server** | Microsoft | Comercial |
| **SQLite** | Comunidade Open Source | Open Source |

### 2️⃣ **SGBD Não Relacional (NoSQL)**
Armazena dados em formatos diferentes de tabelas (documentos, grafos, chave-valor).

| Exemplo | Tipo | Uso Comum |
|---------|------|-----------|
| **MongoDB** | Documentos | Aplicações web |
| **Redis** | Chave-Valor | Cache de dados |
| **Neo4j** | Grafos | Redes sociais |
| **Cassandra** | Colunas | Big Data |

---

## ✅ Vantagens do uso de SGBD

- 📊 **Redução de redundância**: Dados não ficam duplicados desnecessariamente
- 🔒 **Maior segurança**: Controle centralizado de permissões
- 🔄 **Compartilhamento de dados**: Múltiplos usuários acessam simultaneamente
- 📈 **Padronização**: Estrutura organizada e consistente
- ⚡ **Eficiência**: Otimização de consultas e índices
- 🔐 **Integridade**: Regras e constraints garantem dados válidos

---

## ❌ Desvantagens

- 💰 **Custo**: Alguns SGBDs comerciais são caros
- 🖥️ **Hardware**: Podem exigir recursos robustos
- 📚 **Complexidade**: Necessidade de conhecimento especializado
- 🔧 **Manutenção**: Requer administração constante

---

## 🖥️ Exemplos Práticos de Uso

### Comandos básicos no MySQL (SGBD Relacional)

```sql
-- Criar banco de dados
CREATE DATABASE escola;

-- Criar tabela
CREATE TABLE alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT
);

-- Inserir dados
INSERT INTO alunos VALUES (1, 'João Silva', 20);

-- Consultar dados
SELECT * FROM alunos;
```

## 📌 Principais Comandos SQL em SGBDs Relacionais

| Categoria | Comandos | Função |
|-----------|----------|--------|
| **DDL** (Definição) | CREATE, ALTER, DROP | Definir estrutura |
| **DML** (Manipulação) | INSERT, UPDATE, DELETE, SELECT | Manipular dados |
| **DCL** (Controle) | GRANT, REVOKE | Controlar permissões |
| **TCL** (Transação) | COMMIT, ROLLBACK | Gerenciar transações |


> Exluir um banco de dados é comum em ambiente de desenvolviment, mas jamais em `produção`sem backup

# Prática Guiada

## Acesso ao SGBD

1. Abra o MySQL Workbench/SQL Server Management Studio
2. Conecte ao servidor
3. Para visualizar bancos de dados existentes, abra uma nova query e execute:

```sql
show databases;
```
ou

```sql
select name from sys.satabases;
```

# Criar um banco de dados

Para criar um banco de dados utilize o comando:

```sql
create database techosolutions_db
```

Depois:

```sql
USE techsolutions_db;
```

## Conferir se o banco de dadps foi criado

```sql
show databases
```

# Excluir um Banco de Dados

```sql
drop database teste_db;
```
## Atividade

1. O que acontece se tentar criar dois bancos com o mesmo nome?

2. Qual o cuidado necessário antes de excluir um banco?

3. Por que separar banco de teste e banco real?

# Etapa 2

## Cenário

```texto
A empresa TechSolutions está implantando um sistema para gerenciar:

Clientes

Funcionários

Ordens de Serviço

Após a criação do banco de dados, a equipe precisa planejar as tabelas, definindo:

Entidades

Atributos

Chaves primárias

Relacionamentos

```

## Planejamento das Tabelas

1. Quais são as principais entidades, encontrada?

## Definição das tabelas - Modelo Conceitual

# Modelagem do Banco de Dados - TechSolutions

## 📋 Estrutura das Tabelas

| Entidade | Atributos | Chave Primária | Relacionamentos |
|----------|-----------|----------------|-----------------|
| **CLIENTES** | • id_cliente<br>• nome<br>• cpf_cnpj<br>• email<br>• telefone<br>• endereco<br>• data_cadastro<br>• tipo_pessoa (F/J) | id_cliente | • Um cliente pode ter várias Ordens de Serviço (1:N) |
| **FUNCIONARIOS** | • id_funcionario<br>• nome<br>• cpf<br>• cargo<br>• email<br>• telefone<br>• data_contratacao<br>• salario<br>• especialidade | id_funcionario | • Um funcionário pode executar várias Ordens de Serviço (1:N) |
| **ORDENS_SERVICO** | • id_os<br>• numero_os<br>• data_abertura<br>• data_conclusao<br>• descricao<br>• valor_total<br>• status (aberta/execução/concluída)<br>• id_cliente (FK)<br>• id_funcionario (FK) | id_os | • Pertence a um Cliente (N:1)<br>• Executada por um Funcionário (N:1) |

## 🔗 Resumo dos Relacionamentos

```texto
CLIENTES 1 ──── N ORDENS_SERVICO
FUNCIONARIOS 1 ──── N ORDENS_SERVICO
```

## 📊 Detalhamento das Cardinalidades

| Relacionamento | Tipo | Descrição |
|----------------|------|-----------|
| Clientes → Ordens_Servico | 1 : N | Um cliente pode solicitar várias ordens de serviço, mas cada ordem pertence a apenas um cliente |
| Funcionarios → Ordens_Servico | 1 : N | Um funcionário pode executar várias ordens de serviço, mas cada ordem é executada por apenas um funcionário |


# – Implementação Física das Tabelas (Prática Guiada)

## Selecione o Banco de Dados

```sql
USE techsolutions_db;
```

## Criar a tabela Clientes

```sql
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100)
);
```
## Criar tabela Funcionarios

```sql
CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(20)
);
```
## Criar tabela OrdemServico

```sql
CREATE TABLE ordem_servico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    data_abertura DATE NOT NULL,
    descricao TEXT,
    id_cliente INT,
    id_funcionario INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);
```

# Etapa 3

# Atividade Prática

## Estudo de Caso - Sistema de Gestão para Clínica Médica "Vida Saudável"

A Clínica Médica "Vida Saudável" está em processo de digitalização e precisa de um sistema para gerenciar suas operações diárias. Atualmente, toda a gestão é feita em planilhas e papéis, causando perda de informações e retrabalho.

### Cenário Atual:
- A clínica possui **médicos** de diversas especialidades
- Atende **pacientes** particulares e de convênios
- Realiza **consultas** diariamente
- Emite **receitas** médicas
- Controla **exames** solicitados

### Requisitos do Sistema:
1. Cadastro completo de médicos com suas especialidades
2. Cadastro de pacientes com histórico médico
3. Agendamento e registro de consultas
4. Controle de receitas médicas emitidas
5. Registro de exames solicitados e seus resultados

---

## 🎯 PARTE 1: ANÁLISE INICIAL (2,0 pontos)

Com base no estudo de caso, responda:

1. **Quais são as entidades principais que você identifica no sistema?**

2. **Quais informações (atributos) seriam essenciais para cada entidade?**

## 🎯 PARTE 2: MODELAGEM CONCEITUAL (2,5 pontos)

Preencha a tabela abaixo com o planejamento das tabelas:

| Entidade | Atributos | Chave Primária | Chaves Estrangeiras | Relacionamentos |
|----------|-----------|----------------|---------------------|-----------------|

## 🎯 PARTE 3: DIAGRAMA DE RELACIONAMENTOS (1,5 pontos)

Desenhe (ou descreva) como seriam os relacionamentos entre as tabelas:

* **Descreva os relacionamentos**

## 🎯 PARTE 4: CRIAÇÃO DO BANCO DE DADOS (4,0 pontos)

### 4.1 Crie o script SQL para criar o banco de dados: (1,0 ponto)
```sql
-- Escreva o comando para criar o banco de dados
```

### 4.2 Crie as tabelas com seus respectivos campos e constraints: (2,0 pontos)

### 4.3 Comandos de manipulação: (1,0 ponto)

```sql
-- a) Inserir um médico (0,2 pontos)


-- b) Inserir um paciente (0,2 pontos)


-- c) Listar todos os médicos (0,2 pontos)


-- d) Buscar consultas de um paciente específico (0,2 pontos)


-- e) Atualizar o telefone de um paciente (0,2 pontos)
```