-- 01 - DDL: definição de dados (MySQL 8+)
-- Pré-requisito: executar database/biblioteca_didatica.sql.
-- As alterações são feitas SOMENTE em uma tabela de prática.
USE biblioteca_didatica;

-- Atividade 1: criar tabela auxiliar com chave primária.
DROP TABLE IF EXISTS Laboratorio_DDL;
CREATE TABLE Laboratorio_DDL (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
SHOW CREATE TABLE Laboratorio_DDL;

-- Atividade 2: acrescentar campo e inserir exemplo.
ALTER TABLE Laboratorio_DDL ADD COLUMN data_registro DATE NULL;
INSERT INTO Laboratorio_DDL (descricao, data_registro)
VALUES ('Exercício de DDL', '2026-10-16');
SELECT * FROM Laboratorio_DDL;

-- Atividade 3: retirar apenas as linhas, preservando a tabela.
-- TRUNCATE é DDL no MySQL e causa commit implícito; NÃO pode ser desfeito com ROLLBACK.
TRUNCATE TABLE Laboratorio_DDL;
SELECT COUNT(*) AS registros_restantes FROM Laboratorio_DDL;

-- Atividade 4: excluir a tabela auxiliar.
DROP TABLE Laboratorio_DDL;
-- DESAFIO: criar uma tabela Editoras(id_editora, nome, cidade).
