create database bd_exports;
use bd_exports;

CREATE TABLE departamento (
	id INT PRIMARY KEY auto_increment not null,
    nome varchar(50),
    localizaca varchar(50),
    orcamento decimal(10,2)
    
    );
    
 insert into departamento(nome, localizaca, orcamento)
	values("Marceline","rua x",15000.00),
		  ("Thiago","rua y",10000.00),
          ("Giulia","rua z",11000.00),
          ("Gabriel","rua x",20000.00),
          ("Giovanna","rua y",25000.00);
show variables like 'secure_file_priv';


SELECT * FROM departamento
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
fields terminated by ',' enclosed by '"'
lines terminated by '\n';


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

-- inicio da tansacao
START TRANSACTION;

-- Aumentar o orçameto do departamento de TI em 1000
UPDATE departamento SET orcamento = orcamento + 1000.00 WHERE nome = 'TI';

-- Aumentar o orçameto do departamento de Financeiro em 1000
UPDATE departamento SET orcamento = orcamento + 1000.00 WHERE nome = 'Financeiro';

-- Confirmar a transção
COMMIT;

