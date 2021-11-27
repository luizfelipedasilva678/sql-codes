SELECT descricao, endereco FROM fornecedores WHERE estado = 'SP' AND (cidade IN('DIADEMA','BARUERI'));
SELECT * FROM fornecedores WHERE estado = 'SP' and (cidade != 'BROTAS' AND cidade != 'SAO PAULO');
SELECT descricao, telefone FROM fornecedores WHERE (estado IN ('MG','SP')) AND (cidade != '');
SELECT * FROM fornecedores ORDER BY descricao LIMIT 4,8;
SELECT descricao, pcusto, pcusto * 1.3 AS preco_custo_aumentado FROM produtos WHERE estoque > 0;
SELECT descricao, pcusto, estoque, ((pcusto * 1.25) * estoque) AS balanco from produtos;
