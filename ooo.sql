create database bd_clientes;
use bd_clientes;

create table tbl_clientes(
codigo int not null primary key auto_increment,
nome varchar(40) not null,
sexo char(1) not null);

insert into tbl_clientes (nome,sexo)
values("Gigi", "F"),("Giu", "F"),("Gab", "M");

select * from tbl_clientes;

DELIMITER $$
CREATE PROCEDURE sp_lista_clientes(IN opcao INT)
BEGIN
	IF opcao = 0 THEN
		SELECT * FROM tbl_clientes WHERE sexo = 'F';
    ELSEIF opcao = 1 THEN
		SELECT * FROM tbl_clientes WHERE sexo = 'M';
    ELSE
		SELECT * FROM tbl_clientes;
    END IF;
END $$
DELIMITER ;

SHOW PROCEDURE STATUS;

#Lista de sexo Feminino
CALL sp_lista_clientes(0);
#Lista de sexo Masculino
CALL sp_lista_clientes(1);
#Lista de Todos
CALL sp_lista_clientes(2);

#Exemplo 2 stored procedure
DELIMITER $$

CREATE PROCEDURE so_busca_cliente_por_nome(IN nome_parcial VARCHAR(100))
BEGIN
	SELECT * FROM tbl_clientes
    WHERE nome LIKE CONCAT('%', nome_parcial, '%');
END $$

DELIMITER ;

CALL so_busca_cliente_por_nome('A