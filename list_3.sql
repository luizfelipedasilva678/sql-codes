SELECT * FROM clientes WHERE (datacadastro BETWEEN '2004-01-10' AND '2005-12-20') AND (bairro = 'CENTRO') AND cidade IN ('NOVA FRIBURGO', 'CORDEIRO', 'CANTAGALO', 'BOM JARDIM') AND (endereco != "" AND endereco is not null)

SELECT * FROM clientes WHERE cidade IN ('CORDEIRO', 'ITAOCARA', 'CANTAGALO')  AND (endereco = "" OR endereco is null)

SELECT f.descricao as 'fornecedor' , p.descricao, p.estoque FROM fornecedores f JOIN produtos p ON (f.CodFornecedor = p.codfornecedor)

SELECT f.descricao as 'fornecedor' , p.descricao as 'nome_produto' , p.estoque FROM fornecedores f RIGHT OUTER JOIN produtos p ON (f.CodFornecedor = p.codfornecedor);

SELECT f.descricao as 'fornecedor' , p.descricao as 'nome_produto' , p.estoque FROM fornecedores f LEFT OUTER JOIN produtos p ON (f.CodFornecedor = p.codfornecedor);

SELECT 
CONCAT(substring(v.datavenda, 9,2), '/', substring(v.datavenda, 6,2), '/', substring(v.datavenda, 1,4)) as 'data_venda', 
c.nome as 'nome_cliente', 
vend.NOME as 'nome_vendedor', 
vend.COMISSAO as 'valor_comissao'
FROM vendas v
JOIN clientes c ON(v.CodCliente = c.CodCliente)
JOIN vendedores vend ON(vend.CodVendedor = c.codvendedor)
WHERE substring(v.datavenda,1,4) = '2006';

SELECT 
p.descricao, 
f.descricao, 
(p.pcusto * 1.25) as 'preco_venda',
((p.pcusto * 0.25) - p.pcusto) as 'lucro'
FROM produtos p
JOIN fornecedores f ON (p.codfornecedor = f.CodFornecedor)
JOIN tiposproduto t on (p.codtipo = t.CodTipo)
WHERE f.estado = 'SP' AND t.descricao = "MEDICAMENTOS";

SELECT c.nome, (SELECT vend.NOME FROM vendedores vend WHERE c.codvendedor = vend.CodVendedor) FROM clientes c

SELECT 
p.descricao as 'nome_produto',
c.cidade
FROM produtos p
JOIN produtosvendidos pv ON (p.CodProduto = pv.codproduto)
JOIN vendas v ON(v.CodVendas = pv.codvendas)
JOIN clientes c ON(c.CodCliente = v.CodCliente)
WHERE c.cidade = "Nova Friburgo"

SELECT 
*, 
vend.NOME
FROM vendas v
JOIN clientes c ON(v.CodCliente = c.CodCliente)
JOIN vendedores vend ON(vend.CodVendedor = c.codvendedor)
WHERE substring(vend.NOME, 1,1) = 'P' 


SELECT 
p.descricao as 'nome_produto',
f.descricao as 'nome_fornecedor',
v.datavenda as 'data_venda',
c.nome      as 'cliente',
ve.NOME     as 'vendedor'
FROM produtos p 
JOIN fornecedores f ON (p.codfornecedor = f.CodFornecedor)
JOIN produtosvendidos pv ON (pv.codproduto = p.CodProduto)
JOIN vendas v ON (v.CodVendas = pv.codvendas)
JOIN clientes c ON (c.CodCliente = v.CodCliente)
JOIN vendedores ve ON (ve.CodVendedor = c.codvendedor)
WHERE substring(v.datavenda,6,2) IN ('06','08','10')
