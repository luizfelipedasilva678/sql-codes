SELECT c.nome, v.data_venda 
from cliente c 
JOIN venda v ON (c.id = v.cliente_id) 
WHERE v.valor_total > (SELECT AVG(valor_total) from venda);

SELECT descricao 
FROM produto 
WHERE preco_custo >= (SELECT MAX(preco_custo) from produto);

SELECT c.nome, sum(v.valor_total) as 'total_em_compras'
FROM cliente c
JOIN venda v ON (c.id = v.cliente_id)
WHERE substring(v.data_venda, 1,4) = '2006'
GROUP BY c.nome
ORDER BY v.valor_total DESC
LIMIT 0, 10

SELECT p.descricao, SUM(pv.quantidade) as 'quantidade'
FROM produto p
JOIN produto_vendido pv ON(p.id = pv.produto_id)
JOIN venda v ON(pv.venda_id = v.id)
WHERE substring(v.data_venda, 1, 4) = '2006'
GROUP BY p.descricao
HAVING quantidade > 10
ORDER BY quantidade DESC 
LIMIT 5

SELECT f.nome, COUNT(p.fornecedor_id) as produtos_cadastrados
FROM fornecedor f
JOIN produto p ON(f.id = p.fornecedor_id)
JOIN cidade c ON(f.cidade_id = c.id)
JOIN uf ON(uf.id = c.uf_id)
WHERE uf.sigla = 'SP'
GROUP BY f.id
HAVING COUNT(p.fornecedor_id) > 5
ORDER BY COUNT(p.fornecedor_id) DESC
LIMIT 10;
