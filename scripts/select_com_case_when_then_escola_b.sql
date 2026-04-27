USE bd_escola_b;
SELECT 
    alunos.nome,
    cursos.nome_curso,
    ROUND((notas.nota1 + notas.nota2) / 2, 2) AS media,
    notas.frequencia,
    CASE
        WHEN ROUND((notas.nota1 + notas.nota2) / 2,2) >= 6 
             AND notas.frequencia >= 75 THEN 'Aprovado'
        WHEN notas.frequencia < 75 THEN 'Reprovado por frequência'
        ELSE 'Reprovado por nota'
    END AS situacao
FROM notas
INNER JOIN matriculas ON notas.id_matricula = matriculas.id_matricula
INNER JOIN alunos ON matriculas.id_aluno = alunos.id_aluno
INNER JOIN cursos ON matriculas.id_curso = cursos.id_curso;