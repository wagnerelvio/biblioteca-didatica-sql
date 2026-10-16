-- Versao para MySQL online: usa o banco ja fornecido pelo ambiente.
-- 05 - DTL/TCL: transações (MySQL 8+, tabelas InnoDB)
-- Pré-requisito: executar database/biblioteca_didatica.sql.
-- Todos os exemplos são revertidos para preservar os dados da turma.

-- Atividade 1: transação e ROLLBACK.
SELECT id_livro, exemplares_disponiveis FROM Livros WHERE id_livro = 2;
START TRANSACTION;
UPDATE Livros SET exemplares_disponiveis = exemplares_disponiveis + 5
WHERE id_livro = 2;
SELECT id_livro, exemplares_disponiveis FROM Livros WHERE id_livro = 2;
ROLLBACK;
SELECT id_livro, exemplares_disponiveis FROM Livros WHERE id_livro = 2;

-- Atividade 2: SAVEPOINT e reversão parcial.
START TRANSACTION;
UPDATE Livros SET exemplares_disponiveis = exemplares_disponiveis + 1
WHERE id_livro = 3;
SAVEPOINT etapa_1;
UPDATE Livros SET exemplares_disponiveis = exemplares_disponiveis + 7
WHERE id_livro = 4;
SELECT id_livro, exemplares_disponiveis FROM Livros WHERE id_livro IN (3,4);
ROLLBACK TO SAVEPOINT etapa_1;
SELECT id_livro, exemplares_disponiveis FROM Livros WHERE id_livro IN (3,4);
ROLLBACK;

-- Atividade 3: exemplo de empréstimo atômico.
-- O procedimento confirma que existe estoque disponível antes de inserir.
-- É um exercício ilustrativo; aplicativos reais devem tratar concorrência e erros.
START TRANSACTION;
SELECT exemplares_disponiveis FROM Livros WHERE id_livro = 1 FOR UPDATE;
UPDATE Livros SET exemplares_disponiveis = exemplares_disponiveis - 1
WHERE id_livro = 1 AND exemplares_disponiveis > 0;
SELECT ROW_COUNT() AS livros_baixados;
-- Execute o INSERT seguinte somente se livros_baixados = 1.
INSERT INTO Emprestimos (id_livro, id_usuario, data_emprestimo, data_devolucao)
VALUES (1, 2, '2026-10-16', NULL);
SELECT * FROM Emprestimos WHERE id_livro = 1 AND id_usuario = 2;
ROLLBACK;

-- DESAFIO: testar COMMIT em uma cópia restaurável da base,
-- pois COMMIT torna permanentes as mudanças.
