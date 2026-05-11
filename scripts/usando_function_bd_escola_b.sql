USE bd_escola_b;
SELECT 
    alunos.nome,
    cursos.nome_curso,
    calcular_media(notas.nota1, notas.nota2) AS media,
    notas.frequencia,
    verificar_situacao(calcular_media(notas.nota1, notas.nota2),  notas.frequencia) AS situacao
FROM notas
INNER JOIN matriculas ON notas.id_matricula = matriculas.id_matricula
INNER JOIN alunos ON matriculas.id_aluno = alunos.id_aluno
INNER JOIN cursos ON matriculas.id_curso = cursos.id_curso;