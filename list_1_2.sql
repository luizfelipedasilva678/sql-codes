SELECT * FROM produtos WHERE (pcusto * 1.3 > 8 and pcusto * 1.3 < 10);
SELECT * FROM produtos ORDER by pcusto desc;
SELECT * FROM clientes WHERE datacadastro > '2002-10-1';
SELECT * FROM clientes WHERE datacadastro > '2002-10-1' and datacadastro < '2002-10-16';
SELECT valorTotal FROM vendas WHERE valorTotal * 0.3 > 100.00;
SELECT valorTotal * 0.03 AS comissao FROM vendas;

