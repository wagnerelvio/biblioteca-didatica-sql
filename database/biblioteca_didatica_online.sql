-- Versao para MySQL online: usa o banco ja fornecido pelo ambiente.
-- BANCO DIDATICO DE BIBLIOTECA - MySQL 8.0+
-- Execute em ambiente de testes. O banco de mesmo nome sera recriado.

CREATE TABLE Autores (
 id_autor INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE Categorias (
 id_categoria INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(80) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE Livros (
 id_livro INT PRIMARY KEY AUTO_INCREMENT,
 titulo VARCHAR(150) NOT NULL,
 id_autor INT NOT NULL,
 id_categoria INT NOT NULL,
 ano_publicacao INT NOT NULL,
 exemplares_disponiveis INT NOT NULL DEFAULT 1,
 CONSTRAINT fk_livro_autor FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
 CONSTRAINT fk_livro_categoria FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
 CONSTRAINT chk_exemplares CHECK (exemplares_disponiveis >= 0)
) ENGINE=InnoDB;
CREATE TABLE Usuarios (
 id_usuario INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100) NOT NULL,
 email VARCHAR(120) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE Emprestimos (
 id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
 id_livro INT NOT NULL,
 id_usuario INT NOT NULL,
 data_emprestimo DATE NOT NULL,
 data_devolucao DATE NULL,
 CONSTRAINT fk_emp_livro FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
 CONSTRAINT fk_emp_usuario FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
 CONSTRAINT chk_datas CHECK (data_devolucao IS NULL OR data_devolucao >= data_emprestimo)
) ENGINE=InnoDB;

INSERT INTO Autores (nome) VALUES
 ('Machado de Assis'),('Clarice Lispector'),('Jorge Amado'),('Carlos Drummond de Andrade'),
 ('Cecilia Meireles'),('Graciliano Ramos'),('Lima Barreto'),('Rachel de Queiroz');
INSERT INTO Categorias (nome) VALUES
 ('Romance'),('Contos'),('Poesia'),('Literatura Brasileira'),('Classicos');
INSERT INTO Livros (titulo,id_autor,id_categoria,ano_publicacao,exemplares_disponiveis) VALUES
 ('Dom Casmurro',1,5,1899,3),('Memorias Postumas de Bras Cubas',1,5,1881,2),
 ('A Hora da Estrela',2,1,1977,4),('Lacos de Familia',2,2,1960,2),
 ('Capitaes da Areia',3,1,1937,3),('Gabriela, Cravo e Canela',3,1,1958,2),
 ('Alguma Poesia',4,3,1930,3),('Sentimento do Mundo',4,3,1940,2),
 ('Romanceiro da Inconfidencia',5,3,1953,2),('Viagem',5,3,1939,2),
 ('Vidas Secas',6,1,1938,3),('Sao Bernardo',6,1,1934,2),
 ('Triste Fim de Policarpo Quaresma',7,5,1915,3),('O Quinze',8,1,1930,3),
 ('Memorial de Aires',1,5,1908,2);
INSERT INTO Usuarios (nome,email) VALUES
 ('Ana Silva','ana@exemplo.com'),('Bruno Costa','bruno@exemplo.com'),
 ('Carla Souza','carla@exemplo.com'),('Daniel Lima','daniel@exemplo.com'),
 ('Eduarda Rocha','eduarda@exemplo.com'),('Felipe Alves','felipe@exemplo.com'),
 ('Gabriela Santos','gabriela@exemplo.com'),('Hugo Martins','hugo@exemplo.com'),
 ('Isabela Ferreira','isabela@exemplo.com'),('Joao Pereira','joao@exemplo.com');
INSERT INTO Emprestimos (id_livro,id_usuario,data_emprestimo,data_devolucao) VALUES
 (1,1,'2026-09-01','2026-09-10'),(3,2,'2026-09-02','2026-09-12'),
 (5,3,'2026-09-03',NULL),(7,4,'2026-09-04','2026-09-15'),
 (11,5,'2026-09-05',NULL),(2,6,'2026-09-06','2026-09-14'),
 (6,7,'2026-09-07',NULL),(9,8,'2026-09-08','2026-09-17'),
 (12,9,'2026-09-09',NULL),(14,10,'2026-09-10','2026-09-20'),
 (4,1,'2026-09-11',NULL),(15,3,'2026-09-12','2026-09-22');

-- Verificação inicial: 8 autores, 5 categorias, 15 livros, 10 usuários e 12 empréstimos.
SELECT 'Autores' AS tabela, COUNT(*) AS total FROM Autores
UNION ALL SELECT 'Categorias', COUNT(*) FROM Categorias
UNION ALL SELECT 'Livros', COUNT(*) FROM Livros
UNION ALL SELECT 'Usuarios', COUNT(*) FROM Usuarios
UNION ALL SELECT 'Emprestimos', COUNT(*) FROM Emprestimos;
