-- 04 - DCL: controle de privilégios (MySQL 8+)
-- Execute SOMENTE em instância de laboratório, com conta administradora.
-- Por segurança, todos os comandos administrativos estão comentados.
-- NÃO publique senhas reais no GitHub.
-- Pré-requisito: executar database/biblioteca_didatica.sql.
USE biblioteca_didatica;

-- Atividade 1: criar uma conta didática usando uma senha escolhida pelo instrutor.
-- Substitua SENHA_FORTE_DEFINIDA_LOCALMENTE antes de executar.
-- CREATE USER 'aluno_biblioteca'@'localhost'
-- IDENTIFIED BY 'SENHA_FORTE_DEFINIDA_LOCALMENTE';

-- Atividade 2: permitir apenas consultas na tabela Livros.
-- GRANT SELECT ON biblioteca_didatica.Livros TO 'aluno_biblioteca'@'localhost';

-- Atividade 3: verificar os privilégios concedidos.
-- SHOW GRANTS FOR 'aluno_biblioteca'@'localhost';

-- Atividade 4: remover a permissão.
-- REVOKE SELECT ON biblioteca_didatica.Livros FROM 'aluno_biblioteca'@'localhost';

-- Atividade 5: encerrar o laboratório removendo a conta de testes.
-- DROP USER 'aluno_biblioteca'@'localhost';

-- DESAFIO: conceder SELECT somente para Autores e Categorias.
-- ATENÇÃO: GRANT/REVOKE e CREATE/DROP USER não são desfeitos por ROLLBACK.
