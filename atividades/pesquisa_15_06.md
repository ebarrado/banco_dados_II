# Trabalho de Pesquisa — Gatilhos no Banco de Dados: Triggers

## Tema

**O que são Gatilhos — Triggers — e quais são suas aplicações em Banco de Dados?**

## Objetivo

Compreender o conceito de **Trigger**, sua função dentro de um Sistema Gerenciador de Banco de Dados — SGBD — e identificar situações práticas em que esse recurso pode ser utilizado para automatizar ações, validar dados e manter a integridade das informações.

## Orientações para a pesquisa

Você deverá pesquisar e responder aos tópicos abaixo.

## 1. Conceito de Trigger

Explique com suas palavras:

* O que é uma Trigger?
* Em que momento ela é executada?
* Por que ela é chamada de “gatilho”?
* Em quais comandos SQL ela pode ser acionada?

Exemplo de comandos que podem disparar uma Trigger:

* `INSERT`
* `UPDATE`
* `DELETE`


## 2. Funcionamento de uma Trigger

Pesquise e explique:

* O que significa uma Trigger ser executada automaticamente?
* Qual a diferença entre uma Trigger executada **antes** de uma ação e uma Trigger executada **depois** de uma ação?
* O que são Triggers do tipo:

  * `BEFORE INSERT`
  * `AFTER INSERT`
  * `BEFORE UPDATE`
  * `AFTER UPDATE`
  * `BEFORE DELETE`
  * `AFTER DELETE`


## 3. Aplicações práticas de Triggers

Apresente exemplos de situações reais em que Triggers podem ser usadas.

Sugestões de aplicações:

* Registrar histórico de alterações em uma tabela;
* Impedir a exclusão de determinados dados;
* Atualizar automaticamente o estoque após uma venda;
* Validar informações antes de salvar no banco;
* Gerar logs de auditoria;
* Atualizar campos calculados automaticamente;
* Controlar alterações feitas por usuários.


## 4. Exemplo prático

Crie ou pesquise um exemplo simples de Trigger.

O exemplo deve conter:

* Nome da tabela;
* Situação em que a Trigger será usada;
* Código SQL da Trigger;
* Explicação do que o código faz.

Exemplo de situação:

> Quando um produto for vendido, a quantidade em estoque deve ser reduzida automaticamente.



## 5. Vantagens e desvantagens

Pesquise e explique pelo menos **três vantagens** e **três desvantagens** do uso de Triggers.

Exemplos de vantagens:

* Automatização de processos;
* Maior controle sobre os dados;
* Ajuda na integridade das informações.

Exemplos de desvantagens:

* Pode dificultar a manutenção do banco;
* Pode deixar operações mais lentas;
* Pode ser difícil identificar erros quando há muitas Triggers.


## 6. Conclusão

Escreva uma conclusão respondendo:

* Em quais situações vale a pena usar Triggers?
* Por que o uso de Triggers deve ser planejado com cuidado?
* Como esse recurso pode ajudar no desenvolvimento de sistemas?


## Entrega

O trabalho deverá conter:

* Capa;
* Introdução;
* Desenvolvimento com os tópicos solicitados;
* Exemplo prático;
* Conclusão;
* Referências pesquisadas.

## Formato de entrega

O trabalho poderá ser entregue em:

* Documento PDF;
* Documento Word;
* Apresentação em slides;
* Ou conforme orientação do professor.

## Envio

* Envie para o e-mail: barrado.aula@gmail.com

## Critérios de avaliação

| Critério                                  | Pontuação |
| ----------------------------------------- | --------: |
| Explicação correta do conceito de Trigger |       2,0 |
| Descrição dos tipos de Triggers           |       2,0 |
| Aplicações práticas                       |       2,0 |
| Exemplo SQL comentado                     |       2,0 |
| Conclusão e organização do trabalho       |       1,0 |
| Referências e apresentação                |       1,0 |
| **Total**                                 |  **10,0** |

## Questões norteadoras

1. O que é uma Trigger em Banco de Dados?
2. Qual a diferença entre Trigger e Procedure?
3. Uma Trigger precisa ser chamada manualmente?
4. Quais comandos SQL podem disparar uma Trigger?
5. O que significa `BEFORE` e `AFTER` em uma Trigger?
6. Como uma Trigger pode ajudar no controle de estoque?
7. Como uma Trigger pode ser usada para auditoria?
8. Quais cuidados devem ser tomados ao usar Triggers?
9. Quais são as vantagens do uso de Triggers?
10. Quais são as desvantagens do uso de Triggers?
