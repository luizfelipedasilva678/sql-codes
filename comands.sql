CREATE DATABASE empresa CHARSET=utf8 COLLATE=utf8_unicode_ci;
USE empresa;

CREATE TABLE IF NOT EXISTS funcionario(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    salario DECIMAL(9,2) NOT NULL DEFAULT 980.00,
    INDEX idx_funcionario__nome(nome)
)ENGINE=INNODB
CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

DESCRIBE funcionario;

DROP IF EXISTS funcionario;

ALTER TABLE funcionario ADD COLUMN datanascimento DATE AFTER sexo,
ADD COLUMN departamento VARCHAR(30) NOT NULL DEFAULT "Vendas" AFTER salario

ALTER TABLE funcionario CHANGE COLUMN datanascimento data_nascimento DATE;
ALTER TABLE funcionario DROP COLUMN departamento;

RENAME TABLE funcionario TO empregados;
ALTER TABLE funcionario DROP INDEX idx_funcionario__nome;
SHOW INDEX FROM  funcionario;

ALTER TABLE empregados ADD UNIQUE INDEX idx_funcionario__nome(nome);
SHOW INDEX FROM empregados;

INSERT INTO empregados(nome, sexo, data_nascimento, salario)
VALUES ('Pedro', 'M', '1980-10-30', 3500.00),
       ('Paulo', 'M', '1980-10-30', 3500.00),
       ('Joana', 'F', '1980-10-30', 3500.00)

SELECT * FROM empregados;
SELECT nome FROM empregados;

/*-------------------------------------*/

SELECT id, nome, sexo FROM empregados WHERE (sexo='M') AND (nome='Pedro');
SELECT nome FROM empregados WHERE (salario > 2000);
SELECT nome from empregados ORDER BY nome ASC;
SELECT * FROM empregados ORDER BY nome LIMIT 2;
DELETE from empregados WHERE id = 1;
UPDATE empregados SET nome = 'Maria' WHERE nome = 'Joana';
SELECT DISTINCT nome from empregados;
SELECT data_nascimento FROM empregados WHERE substring(data_nascimento, 6,2 ) IN ('10', '11');
SELECT nome, sexo, CONCAT(SUBSTRING(data_nascimento, 6,2),'/', SUBSTRING(data_nascimento, 1,4)) AS 'mês/ano' from empregados;
