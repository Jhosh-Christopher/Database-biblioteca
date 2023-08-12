# https://dbdiagram.io/d/64c44e9e02bd1c4a5ee2f213
-- Criação do banco de dados "biblioteca" caso não exista
CREATE DATABASE IF NOT EXISTS `biblioteca`;

-- Utiliza o banco de dados "biblioteca"
USE `biblioteca`;

-- Tabela para armazenar informações sobre autores de livros
CREATE TABLE `autores` (
  `id_autores` INT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `nacionalidade` VARCHAR(100),
  `data_nascimento` DATE
);

-- Tabela para armazenar informações sobre livros
CREATE TABLE `livros` (
  `id_livros` INT PRIMARY KEY,
  `titulo` VARCHAR(255) NOT NULL,
  `id_autores` INT,
  `ano_publicacao` INT NOT NULL,
  `isbn` VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela para armazenar informações sobre usuários da biblioteca
CREATE TABLE `usuarios` (
  `id_usuarios` INT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL
);

-- Tabela para armazenar informações sobre empréstimos de livros
CREATE TABLE `emprestimos` (
  `id_emprestimos` INT PRIMARY KEY,
  `id_usuarios` INT,
  `id_livros` INT,
  `data_emprestimo` DATE NOT NULL,
  `data_devolucao` DATE,
  `devolvido` BOOLEAN DEFAULT false
);

-- Tabela para armazenar informações sobre usuários bloqueados
CREATE TABLE `bloqueados` (
  `id_bloqueados` INT PRIMARY KEY,
  `id_usuarios` INT,
  `motivo` VARCHAR(255) NOT NULL,
  `data_bloqueio` DATE NOT NULL
);

-- Tabela para armazenar informações sobre prazos de devolução
CREATE TABLE `prazos` (
  `id_prazos` INT PRIMARY KEY,
  `id_emprestimos` INT,
  `data_vencimento` DATE NOT NULL
);

-- Adiciona chave estrangeira na tabela "livros" referenciando a tabela "autores"
ALTER TABLE `livros` ADD FOREIGN KEY (`id_autores`) REFERENCES `autores` (`id_autores`);

-- Adiciona chave estrangeira na tabela "emprestimos" referenciando a tabela "usuarios"
ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

-- Adiciona chave estrangeira na tabela "emprestimos" referenciando a tabela "livros"
ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id_livros`);

-- Adiciona chave estrangeira na tabela "bloqueados" referenciando a tabela "usuarios"
ALTER TABLE `bloqueados` ADD FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

-- Adiciona chave estrangeira na tabela "prazos" referenciando a tabela "emprestimos"
ALTER TABLE `prazos` ADD FOREIGN KEY (`id_emprestimos`) REFERENCES `emprestimos` (`id_emprestimos`);
