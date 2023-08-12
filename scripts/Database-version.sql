# https://dbdiagram.io/d/64c44e9e02bd1c4a5ee2f213
CREATE DATABASE IF NOT EXISTS `biblioteca`;
use `biblioteca`;
CREATE TABLE `autores` (
  `id_autores` INT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `nacionalidade` VARCHAR(100),
  `data_nascimento` DATE
);

CREATE TABLE `livros` (
  `id_livros` INT PRIMARY KEY,
  `titulo` VARCHAR(255) NOT NULL,
  `id_autores` INT,
  `ano_publicacao` INT NOT NULL,
  `isbn` VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE `usuarios` (
  `id_usuarios` INT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE `emprestimos` (
  `id_emprestimos` INT PRIMARY KEY,
  `id_usuarios` INT,
  `id_livros` INT,
  `data_emprestimo` DATE NOT NULL,
  `data_devolucao` DATE,
  `devolvido` BOOLEAN DEFAULT false
);

CREATE TABLE `bloqueados` (
  `id_bloqueados` INT PRIMARY KEY,
  `id_usuarios` INT,
  `motivo` VARCHAR(255) NOT NULL,
  `data_bloqueio` DATE NOT NULL
);

CREATE TABLE `prazos` (
  `id_prazos` INT PRIMARY KEY,
  `id_emprestimos` INT,
  `data_vencimento` DATE NOT NULL
);

ALTER TABLE `livros` ADD FOREIGN KEY (`id_autores`) REFERENCES `autores` (`id_autores`);

ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id_livros`);

ALTER TABLE `bloqueados` ADD FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

ALTER TABLE `prazos` ADD FOREIGN KEY (`id_emprestimos`) REFERENCES `emprestimos` (`id_emprestimos`);
