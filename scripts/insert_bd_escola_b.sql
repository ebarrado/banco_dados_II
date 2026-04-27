USE bd_escola_b;
INSERT INTO alunos (nome, email, data_nascimento, cidade) VALUES
('Ana Souza', 'ana@email.com', '2007-03-15', 'Marília'),
('Bruno Lima', 'bruno@email.com', '2006-08-22', 'Garça'),
('Carla Mendes', 'carla@email.com', '2008-01-10', 'Marília'),
('Diego Santos', 'diego@email.com', '2005-11-05', 'Bauru'),
('Rafael Brito', 'brito@teste.com', '2004-05-25', 'Marília'),
('Marcela Almeida', 'almeida@teste.com', '2006-03-30', 'Bauru'),
('Carla Marcelino', 'carla_marcelino@teste.com', '2006-12-20', 'Marília');

INSERT INTO cursos (nome_curso, carga_horaria, valor_mensalidade) VALUES
('Banco de Dados', 80, 250.00),
('Programação Web', 100, 300.00),
('Redes de Computadores', 60, 220.00), 
('Inteligência Artificial', 40, 150.00),
('Computação em Nuvem', 40, 258.65);

INSERT INTO matriculas (id_aluno, id_curso, data_matricula, status_matricula) VALUES
(1, 1, '2026-04-01', 'Ativa'),
(2, 1, '2026-04-02', 'Ativa'),
(3, 2, '2026-04-03', 'Ativa'),
(4, 3, '2026-04-04', 'Trancada'),
(5, 5, '2026-04-03', 'Ativa'),
(2, 4, '2026-05-20', 'Ativa'),
(2, 3, '2026-04-02', 'Ativa');


INSERT INTO notas (id_matricula, nota1, nota2, frequencia) VALUES
(1, 8.5, 9.0, 90),
(2, 5.0, 6.0, 75),
(3, 7.0, 8.0, 85),
(4, 4.0, 5.5, 60),
(5, 8.0, 9.5, 80),
(6, 10.0, 10.0, 100),
(7, 9.0, 8.5, 60);

