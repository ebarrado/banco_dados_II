USE db_loja_a;

#INSERT CLIENTES
INSERT INTO clientes (nome, email, telefone, cidade, ativo) VALUES
('João Silva', 'joao.silva@email.com', '14999990001', 'Marília', 1),
('Maria Souza', 'maria.souza@email.com', '14999990002', 'Bauru', 1),
('Carlos Oliveira', 'carlos.oliveira@email.com', '14999990003', 'Assis', 1),
('Ana Pereira', 'ana.pereira@email.com', '14999990004', 'Garça', 1),
('Lucas Santos', 'lucas.santos@email.com', '14999990005', 'Marília', 1),
('Fernanda Lima', 'fernanda.lima@email.com', '14999990006', 'Pompéia', 1),
('Ricardo Alves', 'ricardo.alves@email.com', '14999990007', 'Tupã', 1),
('Juliana Rocha', 'juliana.rocha@email.com', '14999990008', 'Ourinhos', 1),
('Bruno Costa', 'bruno.costa@email.com', '14999990009', 'Lins', 1),
('Patrícia Gomes', 'patricia.gomes@email.com', '14999990010', 'Jaú', 1);

#INSERT ORDEM SERVIÇO
INSERT INTO ordens_servico (descricao, 
							data_abertura, 
							status_os, 
							valor, 
							id_cliente) VALUES
('Manutenção de computador', '2026-03-01', 'Aberta', 150.00, 1),
('Instalação de software', '2026-03-02', 'Concluída', 80.00, 2),
('Troca de HD por SSD', '2026-03-03', 'Em andamento', 300.00, 3),
('Limpeza de notebook', '2026-03-04', 'Concluída', 120.00, 4),
('Configuração de rede', '2026-03-05', 'Aberta', 200.00, 5),
('Formatação de PC', '2026-03-06', 'Concluída', 100.00, 6),
('Instalação de impressora', '2026-03-07', 'Em andamento', 90.00, 7),
('Backup de dados', '2026-03-08', 'Concluída', 110.00, 8),
('Atualização de sistema', '2026-03-09', 'Aberta', 70.00, 9),
('Remoção de vírus', '2026-03-10', 'Concluída', 130.00, 10);