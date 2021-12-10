RENAME TABLE clientes to cliente;
RENAME TABLE fornecedores to fornecedor;
RENAME TABLE lotes to lote;
RENAME TABLE produtos to produto;
RENAME TABLE produtosvendidos to produto_vendido;
RENAME TABLE tiposproduto to tipo_produto;
RENAME TABLE vendas to venda;
RENAME TABLE vendedores to vendedor;

ALTER TABLE cliente ENGINE=INNODB;
ALTER TABLE fornecedor ENGINE=INNODB;
ALTER TABLE produto ENGINE=INNODB;
ALTER TABLE produto_vendido ENGINE=INNODB;
ALTER TABLE tipo_produto ENGINE=INNODB;
ALTER TABLE venda ENGINE=INNODB;
ALTER TABLE vendedor ENGINE=INNODB;

SHOW CREATE TABLE lote;

CREATE TABLE lote(
	id int AUTO_INCREMENT PRIMARY KEY
	produto_id int(11) DEFAULT NULL,
	nlote VARCHAR(0) NOT NULL DEFAULT '0',
	qtde INT(11) NOT NULL DEFAULT 0
)ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO lote2(nlote, produto_id, qtde) SELECT nlote,codproduto,qtde FROM lote;

truncate table lote2;

alter table lote2 modify nlote varchar(20);

drop table lote;

rename lote2 to lote2;

CREATE TABLE venda (
  id int(11) NOT NULL AUTO_INCREMENT,
  cliente_id int(11) DEFAULT NULL,
  valor_total decimal(15,2) DEFAULT NULL,
  data_venda date DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bairro_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `limite_credito` decimal(10,2) DEFAULT NULL,
  `bloqueado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade_id` int(11) DEFAULT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnpj` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

update cliente c JOIN uf u on(u.sigla = c.uf_sigla)
SET c.uf_id = u.id;

