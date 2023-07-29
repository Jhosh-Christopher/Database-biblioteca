	# https://dbdiagram.io/d/64c44e9e02bd1c4a5ee2f213

	CREATE TABLE `livros` (
	  `id` INT PRIMARY KEY AUTO_INCREMENT,
	  `titulo` VARCHAR(255) NOT NULL,
	  `autor` VARCHAR(100) NOT NULL,
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
	  `id_usuario` INT,
	  `id_livro` INT,
	  `data_emprestimo` DATE NOT NULL,
	  `data_devolucao` DATE,
	  `devolvido` BOOLEAN DEFAULT false
	);

	CREATE TABLE `bloqueados` (
	  `id` INT PRIMARY KEY AUTO_INCREMENT,
	  `id_usuario` INT,
	  `motivo` VARCHAR(255) NOT NULL,
	  `data_bloqueio` DATE NOT NULL
	);

	CREATE TABLE `prazos` (
	  `id` INT PRIMARY KEY AUTO_INCREMENT,
	  `id_emprestimo` INT,
	  `data_vencimento` DATE NOT NULL
	);

	ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

	ALTER TABLE `emprestimos` ADD FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`);

	ALTER TABLE `bloqueados` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

	ALTER TABLE `prazos` ADD FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimos` (`id`);
