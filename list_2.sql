SELECT descricao, telefone FROM fornecedores WHERE (telefone LIKE '(11)%') or (telefone LIKE '(21)%');
SELECT descricao, cidade, estado AS uf FROM fornecedores WHERE estado IN('SP','RJ','MG');
SELECT * FROM produtos WHERE principio LIKE "______" AND principio NOT LIKE "% %";
SELECT * FROM produtos WHERE principio LIKE "A%" AND principio NOT LIKE "% % % %";
SELECT * FROM clientes WHERE substring(datacadastro, 6, 2) = '11' AND cidade LIKE "M%";
SELECT nome, substring(datacadastro,6,2) as mes, substring(datacadastro,1,4) as ano FROM clientes WHERE cidade != 'NOVA FRIBURGO' AND cidade != "CORDEIRO";
SELECT DISTINCT cidade, bairro FROM clientes WHERE (cidade != '' AND cidade is not null) AND (bairro != '' AND bairro is not null);
SELECT * FROM produtos WHERE pcusto * 0.05 > 30;
SELECT * FROM produtos WHERE estoque != '' AND estoque is not null and apresentacao != '' and NOT (apresentacao is null);
