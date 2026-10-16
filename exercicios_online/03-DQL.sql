-- Versao para MySQL online: usa o banco ja fornecido pelo ambiente.
-- 03 - DQL: consultas de dados (MySQL 8+)
-- Pré-requisito: executar database/biblioteca_didatica.sql.
-- Todas as atividades são somente leitura.

-- Atividade 1: consulta básica e ordenação.
SELECT id_livro, titulo, ano_publicacao FROM Livros ORDER BY titulo;

-- Atividade 2: filtros e operadores.
SELECT titulo, ano_publicacao FROM Livros
WHERE ano_publicacao BETWEEN 1930 AND 1960 ORDER BY ano_publicacao;

-- Atividade 3: junção de três tabelas.
SELECT l.titulo, a.nome AS autor, c.nome AS categoria
FROM Livros AS l
INNER JOIN Autores AS a ON l.id_autor = a.id_autor
INNER JOIN Categorias AS c ON l.id_categoria = c.id_categoria
ORDER BY a.nome, l.titulo;

-- Atividade 4: livros ainda não devolvidos.
SELECT e.id_emprestimo, u.nome AS leitor, l.titulo, e.data_emprestimo
FROM Emprestimos e
JOIN Usuarios u ON u.id_usuario = e.id_usuario
JOIN Livros l ON l.id_livro = e.id_livro
WHERE e.data_devolucao IS NULL
ORDER BY e.data_emprestimo;

-- Atividade 5: GROUP BY, HAVING e COUNT.
SELECT a.nome AS autor, COUNT(*) AS quantidade
FROM Livros l JOIN Autores a ON a.id_autor = l.id_autor
GROUP BY a.id_autor, a.nome
HAVING COUNT(*) >= 2
ORDER BY quantidade DESC, autor;

-- Atividade 6: subconsulta.
SELECT titulo, ano_publicacao FROM Livros
WHERE ano_publicacao < (SELECT AVG(ano_publicacao) FROM Livros)
ORDER BY ano_publicacao;

-- DESAFIO: identificar leitores com dois ou mais empréstimos.
