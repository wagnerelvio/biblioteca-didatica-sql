# Biblioteca Didática SQL

Base fictícia para aulas de SQL, compatível com **MySQL 8.0+** (tabelas InnoDB).

## Como usar
1. No MySQL Workbench, execute `database/biblioteca_didatica.sql` (ele **exclui e recria** o banco `biblioteca_didatica`).
2. Confira as contagens: 8 autores, 5 categorias, 15 livros, 10 usuários e 12 empréstimos (50 registros).
3. Execute individualmente os arquivos em `exercicios/`, na sequência desejada.
4. Para voltar ao estado original, execute novamente o script principal.

- **01-DDL.sql**: criar, alterar, truncar e excluir uma tabela auxiliar. Atenção: DDL pode fazer commit implícito.
- **02-DML.sql**: inserir, atualizar e excluir dados, usando ROLLBACK para preservar a base.
- **03-DQL.sql**: SELECT, filtros, JOIN, agregação e subconsulta.
- **04-DCL.sql**: gerenciar permissões; comandos administrativos comentados e exigem privilégios.
- **05-DTL.sql**: transações, ROLLBACK, SAVEPOINT e empréstimo ilustrativo.

Os dados são fictícios. Não publique credenciais reais.
