# https://dbdiagram.io/d/64c44e9e02bd1c4a5ee2f213
CREATE DATABASE IF NOT EXISTS `biblioteca`;
use `biblioteca`;
CREATE TABLE `autores` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `nacionalidade` VARCHAR(100),
  `data_nascimento` DATE
);

CREATE TABLE `livros` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `id_autor` INT,
  `ano_publicacao` INT NOT NULL,
  `isbn` VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE `usuarios` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE `emprestimos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id_usuarios` INT,
  `id_livro` INT,
  `data_emprestimo` DATE NOT NULL,
  `data_devolucao` DATE,
  `devolvido` BOOLEAN DEFAULT false
);

CREATE TABLE `bloqueadosemprestimos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id_usuarios` INT,
  `motivo` VARCHAR(255) NOT NULL,
  `data_bloqueio` DATE NOT NULL
);

CREATE TABLE `prazos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id_emprestimo` INT,
  `data_vencimento` DATE NOT NULL
);

ALTER TABLE `livros` ADD FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id`);

ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id`);

ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`);

ALTER TABLE `bloqueados` ADD FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id`);

ALTER TABLE `prazos` ADD FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimos` (`id`);
