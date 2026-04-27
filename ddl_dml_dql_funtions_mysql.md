# Laboratório Prático - Estudo de Caso com MySQL


### **Tema**: Sistema de controle de uma escola técnica
### **Objetivo**: Resolver problemas usando DDL, DML, DQL e funções do MySQL.

## **Situação-problema**

Uma escola técnica precisa controlar seus alunos, cursos, matrículas e notas.
O banco deve permitir cadastrar alunos, cursos, realizar matrículas, registrar notas e gerar consultas para análise acadêmica.

### 1. DDL — Criação da estrutura do banco

```sql
CREATE DATABASE escola_tecnica;
USE escola_tecnica;

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_nascimento DATE,
    cidade VARCHAR(80)
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    valor_mensalidade DECIMAL(10,2)
);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    status_matricula VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT,
    nota1 DECIMAL(4,2),
    nota2 DECIMAL(4,2),
    frequencia INT,
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);
```

### 2. DML — Inserção dos dados

```sql
INSERT INTO alunos (nome, email, data_nascimento, cidade) VALUES
('Ana Souza', 'ana@email.com', '2007-03-15', 'Marília'),
('Bruno Lima', 'bruno@email.com', '2006-08-22', 'Garça'),
('Carla Mendes', 'carla@email.com', '2008-01-10', 'Marília'),
('Diego Santos', 'diego@email.com', '2005-11-05', 'Bauru');

INSERT INTO cursos (nome_curso, carga_horaria, valor_mensalidade) VALUES
('Banco de Dados', 80, 250.00),
('Programação Web', 100, 300.00),
('Redes de Computadores', 60, 220.00);

INSERT INTO matriculas (id_aluno, id_curso, data_matricula, status_matricula) VALUES
(1, 1, '2026-04-01', 'Ativa'),
(2, 1, '2026-04-02', 'Ativa'),
(3, 2, '2026-04-03', 'Ativa'),
(4, 3, '2026-04-04', 'Trancada');

INSERT INTO notas (id_matricula, nota1, nota2, frequencia) VALUES
(1, 8.5, 9.0, 90),
(2, 5.0, 6.0, 75),
(3, 7.0, 8.0, 85),
(4, 4.0, 5.5, 60);
```

1. DDL — Criação da estrutura do banco
```sql
CREATE DATABASE escola_tecnica;
USE escola_tecnica;

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_nascimento DATE,
    cidade VARCHAR(80)
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    valor_mensalidade DECIMAL(10,2)
);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    status_matricula VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT,
    nota1 DECIMAL(4,2),
    nota2 DECIMAL(4,2),
    frequencia INT,
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);
```
2. DML — Inserção dos dados

```sql
INSERT INTO alunos (nome, email, data_nascimento, cidade) VALUES
('Ana Souza', 'ana@email.com', '2007-03-15', 'Marília'),
('Bruno Lima', 'bruno@email.com', '2006-08-22', 'Garça'),
('Carla Mendes', 'carla@email.com', '2008-01-10', 'Marília'),
('Diego Santos', 'diego@email.com', '2005-11-05', 'Bauru');

INSERT INTO cursos (nome_curso, carga_horaria, valor_mensalidade) VALUES
('Banco de Dados', 80, 250.00),
('Programação Web', 100, 300.00),
('Redes de Computadores', 60, 220.00);

INSERT INTO matriculas (id_aluno, id_curso, data_matricula, status_matricula) VALUES
(1, 1, '2026-04-01', 'Ativa'),
(2, 1, '2026-04-02', 'Ativa'),
(3, 2, '2026-04-03', 'Ativa'),
(4, 3, '2026-04-04', 'Trancada');

INSERT INTO notas (id_matricula, nota1, nota2, frequencia) VALUES
(1, 8.5, 9.0, 90),
(2, 5.0, 6.0, 75),
(3, 7.0, 8.0, 85),
(4, 4.0, 5.5, 60);
```

### 3. DQL — Consultas para resolução de problemas

#### Problema 1 — Listar alunos matriculados com seus cursos

```sql
SELECT 
    alunos.nome,
    cursos.nome_curso,
    matriculas.status_matricula
FROM matriculas
INNER JOIN alunos ON matriculas.id_aluno = alunos.id_aluno
INNER JOIN cursos ON matriculas.id_curso = cursos.id_curso;
```

#### Problema 3 — Mostrar situação final do aluno

```sql

SELECT 
    alunos.nome,
    cursos.nome_curso,
    ROUND((notas.nota1 + notas.nota2) / 2, 2) AS media,
    notas.frequencia,
    CASE
        WHEN ROUND((notas.nota1 + notas.nota2) / 2, 2) >= 6 
             AND notas.frequencia >= 75 THEN 'Aprovado'
        WHEN notas.frequencia < 75 THEN 'Reprovado por frequência'
        ELSE 'Reprovado por nota'
    END AS situacao
FROM notas
INNER JOIN matriculas ON notas.id_matricula = matriculas.id_matricula
INNER JOIN alunos ON matriculas.id_aluno = alunos.id_aluno
INNER JOIN cursos ON matriculas.id_curso = cursos.id_curso;
```

### 4. Uso de funções em MySQL

#### Função UPPER() — nomes em letras maiúsculas

```sql
SELECT 
    UPPER(nome) AS nome_maiusculo,
    cidade
FROM alunos;
```

#### Função LOWER() — e-mails em letras minúsculas

```sql
SELECT 
    nome,
    LOWER(email) AS email_minusculo
FROM alunos;
```

#### Função YEAR() — ano de nascimento
```sql
SELECT 
    nome,
    YEAR(data_nascimento) AS ano_nascimento
FROM alunos;
```
#### Função TIMESTAMPDIFF() — calcular idade
```sql
SELECT 
    nome,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM alunos;
```

#### Função COUNT() — quantidade de alunos por cidade
```sql 
SELECT 
    cidade,
    COUNT(*) AS total_alunos
FROM alunos
GROUP BY cidade;
```
#### Função AVG() — média geral das notas

```sql
SELECT 
    ROUND(AVG((nota1 + nota2) / 2), 2) AS media_geral
FROM notas;

```

## Desafio
1. Liste apenas os alunos da cidade de Marília.
2. Mostre os alunos com média maior ou igual a 7.
3. Mostre quantos alunos existem em cada curso.
4. Mostre o valor total previsto de mensalidades por curso.

# Criação de Functins no MySQL

No MySQL, uma FUNCTION é um bloco de código que recebe valores, processa uma regra e retorna um resultado.

Ela é útil quando uma regra será usada várias vezes, por exemplo:

* calcular média;
* calcular idade;
* definir situação do aluno;
* aplicar desconto;
* formatar textos.

### **Antes de criar functions&&

```sql
DELIMITER $$
```

O `DELIMITER` é usado para trocar temporariamente o finalizador do comando.

Como a function usa vários `;` internamente, trocamos o finalizador para `$$`.

## Function 1 — Calcular média do aluno

```sql
CREATE FUNCTION calcular_media(n1 DECIMAL(4,2), n2 DECIMAL(4,2))
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
    RETURN ROUND((n1 + n2) / 2, 2);
END$$
```

### Explicação

| Parte                            | Explicação                                                         |
| -------------------------------- | ------------------------------------------------------------------ |
| `CREATE FUNCTION calcular_media` | Cria uma função chamada `calcular_media`                           |
| `n1` e `n2`                      | Parâmetros recebidos pela função                                   |
| `RETURNS DECIMAL(4,2)`           | Define que a função retorna um número decimal                      |
| `DETERMINISTIC`                  | Indica que, com os mesmos valores, o resultado será sempre o mesmo |
| `RETURN`                         | Devolve o resultado calculado                                      |
#### **Como usar**

```sql
SELECT calcular_media(8.5, 9.0) AS media;
```

## Function 2 — Verificar situação do aluno

```sql
CREATE FUNCTION verificar_situacao(media DECIMAL(4,2), frequencia INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    IF media >= 6 AND frequencia >= 75 THEN
        RETURN 'Aprovado';
    ELSEIF frequencia < 75 THEN
        RETURN 'Reprovado por frequência';
    ELSE
        RETURN 'Reprovado por nota';
    END IF;
END$$
```

### Explicação

Essa função recebe a média e a frequência do aluno e retorna a situação final.

| Regra                                                     | Resultado                |
| --------------------------------------------------------- | ------------------------ |
| Média maior ou igual a 6 e frequência maior ou igual a 75 | Aprovado                 |
| Frequência menor que 75                                   | Reprovado por frequência |
| Média menor que 6                                         | Reprovado por nota       |


### **Como usar**

```sql
SELECT verificar_situacao(7.5, 80) AS situacao;
```

## Function 3 — Calcular idade do aluno

```sql
CREATE FUNCTION calcular_idade(data_nasc DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, data_nasc, CURDATE());
END$$
```

## Explicação

Essa função recebe a data de nascimento e retorna a idade atual do aluno.

```sql
SELECT calcular_idade('2007-03-15') AS idade;
```

## Function 4 — Aplicar desconto na mensalidade

```sql
CREATE FUNCTION aplicar_desconto(valor DECIMAL(10,2), percentual DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN valor - (valor * percentual / 100);
END$$
```

### Explicação

Essa função recebe:

* o valor da mensalidade;
* o percentual de desconto.

E retorna o valor final com desconto.

```sql
SELECT aplicar_desconto(300.00, 10) AS valor_com_desconto;
```

Depois das functions, volte o delimitador ao normal:

```sql
DELIMITER ;
```

## 8. Usando as Functions nas consultas


### Consulta 1 — Média e situação usando function

```sql
SELECT 
    alunos.nome,
    cursos.nome_curso,
    notas.nota1,
    notas.nota2,
    calcular_media(notas.nota1, notas.nota2) AS media,
    notas.frequencia,
    verificar_situacao(
        calcular_media(notas.nota1, notas.nota2),
        notas.frequencia
    ) AS situacao
FROM notas
INNER JOIN matriculas ON notas.id_matricula = matriculas.id_matricula
INNER JOIN alunos ON matriculas.id_aluno = alunos.id_aluno
INNER JOIN cursos ON matriculas.id_curso = cursos.id_curso;
```

### Consulta 2 — Idade dos alunos usando function
```sql

SELECT 
    nome,
    data_nascimento,
    calcular_idade(data_nascimento) AS idade
FROM alunos;
```

### Consulta 3 — Mensalidade com desconto

```sql
SELECT 
    nome_curso,
    valor_mensalidade,
    aplicar_desconto(valor_mensalidade, 10) AS valor_com_10_porcento_desconto
FROM cursos;
```

## Desafio com Functions

Crie uma function chamada classificar_frequencia.

Ela deve receber a frequência do aluno e retornar:

| Frequência   | Classificação |
| ------------ | ------------- |
| 90 ou mais   | Excelente     |
| 75 até 89    | Suficiente    |
| Menor que 75 | Insuficiente  |


## Entrega dos Desafios (04/05)

Você deverá entregar:

1. Script SQL com a criação do banco e tabelas.
2. Inserts com os dados de teste.
3. Consultas resolvendo os problemas.
4. Prints dos resultados no MySQL Workbench.
5. Uma breve explicação de cada comando usado.

Envie em um documento do Word com nome_completo, turma, comandos e descrições para o e-mail: barrado.aula@gmail.com

Pessoal importante:

Ao enviar um e-mail coloque em **para** o e-mail do `destinatário`, em **assunto** `o assunto do que se trata o seu e-mail`. Exemplo > `atividade ddl_dml_dql_functions`.
Em **mensagem** adicione alguma mensagem. Exemplo > `Bom dia/Boa tarde, segue atividade referente a criação de banco de dados....` e anexe o documento `.docx`