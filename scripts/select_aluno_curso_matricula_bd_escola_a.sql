USE escola_tecnica;
SELECT 
    alunos.nome AS Aluno,
    cursos.nome_curso As Curso,
    matriculas.status_matricula AS Matricula
FROM matriculas
INNER JOIN alunos ON matriculas.id_aluno = alunos.id_aluno
INNER JOIN cursos ON matriculas.id_curso = cursos.id_curso;