USE `biblioteca`;

INSERT INTO `autores` 	VALUES
(1,'RENATA NOELI','BRASILEIRA','1978-05-09'),
(2,'REGINA CELIA','BRASILEIRA','1958-02-17'),
(3,'JOSEPH CHRISTOPHER','BRASILEIRA','2000-02-18'),
(4,'JULIANA PRISCILA','BRASILEIRA','1997-01-15'),
(5,'DEISE LUCIDE','BRASILEIRA','1530-05-23');

INSERT INTO `livros` VALUES
(6,'A melhor mãe do mundo',1,1998,'1234560001'),
(7,'Dona Ofélia',2,1970,'1234560002'),
(8,'Darius e Draven',3,2012,'1234560003'),
(9,'O boneco da Michele',4,2005,'1234560004'),
(10,'A culpa é do governo',5,1695,'1234560005');

INSERT INTO `usuarios` VALUES
(11,'Jorge Nim','JN@email.com'),
(12,'Maic Osasco','MO@email.com'),
(13,'Jureq Fazourro','JF@email.com'),
(14,'Alys Star','AS@email.com'),
(15,'Sunrise Silva','SS@email.com');


INSERT INTO `emprestimos` VALUES
(20,11,6,'2023-04-25','2023-05-23',false),
(21,12,7,'2023-04-26','2023-05-24',false),
(22,13,8,'2023-04-27','2023-05-25',false),
(23,14,9,'2023-04-28','2023-05-26',false),
(24,15,10,'2023-04-29','2023-05-27',false);

INSERT INTO `prazos` VALUES
(100,20,'2023-08-09'),
(110,21,'2023-08-10'),
(120,22,'2023-08-11'),
(130,23,'2023-08-12'),
(140,24,'2023-08-13');

INSERT INTO `bloqueados` VALUES
(30,11,'roubou','2023-06-1'),
(31,12,'roubou','2023-06-2'),
(32,13,'roubou','2023-06-3'),
(33,14,'roubou','2023-06-4'),
(34,15,'roubou','2023-06-5');

