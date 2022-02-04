create database transacao;
use trasacao;
create table conta(
    id int auto_increment primary key,  
    nome_ cliente varchar(20),
    saldo decimal(10,2) default 0
) engine = INNODB;
insert into conta values (1, 'João', 1000), (2, 'Maria', 1000);

set session autocommit = 0;
set @valorASerTransferido = 555;

update conta set = saldo - @valorASerTransferido 
where id = 1;
update conta set saldo + @valorASerTransferido
where id = 2;

--rollback;
commit;

select saldo from conta;

set session autocommit = 1;
