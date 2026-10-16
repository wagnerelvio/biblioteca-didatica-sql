-- 02 - DML: inserção, atualização e exclusão (MySQL 8+)
-- Pré-requisito: executar database/biblioteca_didatica.sql.
-- Exemplos protegidos por transação: ROLLBACK restaura o estado inicial.
USE biblioteca_didatica;
START TRANSACTION;

-- Atividade 1: INSERT em tabela de usuários.
INSERT INTO Usuarios (nome, email)
VALUES ('Aluno Exemplo', 'aluno.exemplo@exemplo.com');
SELECT * FROM Usuarios WHERE email = 'aluno.exemplo@exemplo.com';

-- Atividade 2: UPDATE limitado pela chave primária.
SELECT id_livro, titulo, exemplares_disponiveis FROM Livros WHERE id_livro = 1;
UPDATE Livros SET exemplares_disponiveis = exemplares_disponiveis + 2
WHERE id_livro = 1;
SELECT id_livro, titulo, exemplares_disponiveis FROM Livros WHERE id_livro = 1;

-- Atividade 3: DELETE apenas do registro recém-criado.
DELETE FROM Usuarios WHERE email = 'aluno.exemplo@exemplo.com';
SELECT COUNT(*) AS encontrados FROM Usuarios
WHERE email = 'aluno.exemplo@exemplo.com';

-- Não confirmar as alterações neste exercício.
ROLLBACK;
SELECT id_livro, titulo, exemplares_disponiveis FROM Livros WHERE id_livro = 1;
-- DESAFIO: inserir um novo livro com autor e categoria existentes.
