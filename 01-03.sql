CREATE TABLE tbTeste 
(codigo number (2),
nome number (10))

--ALTERANDO UMA TABELA EXISTENTE

--Incluindo nova coluna:
ALTER TABLE tbTeste ADD dt_nasc DATE;

--Incluindo nova coluna com regra
ALTER TABLE tbTeste ADD cep char(8) NOT NULL;

--Incluindo a primary key na coluna código
ALTER TABLE tbTeste ADD CONSTRAINT pk_cod PRIMARY KEY (codigo);

--Modificando apenas o tipo de dados
ALTER TABLE tbTeste MODIFY nome VARCHAR(10);

--Modificando tamanho e tipo ao mesmo tempo
ALTER TABLE tbTeste MODIFY nome NUMBER(10);

--Eliminando uma regra
ALTER TABLE tbTeste DROP CONSTRAINT pk_cod;

--Elimina uma tabela
ALTER TABLE tbTeste DROP COLUMN nome;

--Renomeando uma coluna
ALTER TABLE tbTeste RENAME COLUMN codigo TO cod_cliente;

DESC tbTeste;

--Eliminando uma tabela
DROP TABLE tbTeste;

--Eliminando os relacionamentos e depois a tabela
DROP TABLE tbTeste CASCADE CONSTRAINTS;

--Mostra todas as constraints da tabela tbteste
SELECT constraint_name FROM user_constraints WHERE table_name = 'TBTESTE';

--Operadores aritméticos: + - * / ()
--Operadores relacionais: > >= < <= = != ou <>
--Operadores lógicos: AND, OR e NOT

--Gravar tudo que foi feito como insert, update e delete
COMMIT;

--Desfazer tudo o que foi feito até o último commit
ROLLBACK;

--Pré-commit: savepoint

create table produto_tb 
(cod_prod number(4) constraint prod_cod_pk primary key, 
unidade varchar2(3),descricao varchar2(20),val_unit number(10,2))

insert into produto_tb values ('25','KG','Queijo','0.97');
insert into produto_tb values ('31','BAR','Chocolate','0.87');
insert into produto_tb values ('78','L','Vinho','2.00');
insert into produto_tb values ('22','M','Linho','0.11');
insert into produto_tb values ('30','SAC','Acucar','0.30');
insert into produto_tb values ('53','M','Linha','1.80');
insert into produto_tb values ('13','G','Ouro','6.18');
insert into produto_tb values ('45','M','Madeira','0.25');
insert into produto_tb values ('87','M','Cano','1.97');
insert into produto_tb values ('77','M','Papel','1.05');

SELECT * FROM produto_tb

commit;

--Alterando todos os val_unit para 1 na tabela
UPDATE produto_tb SET val_unit = 1;

--Alterando somente os val_unit caso a unidade de medida seja 'M'
UPDATE produto_tb SET val_unit = 2
WHERE unidade = 'M';

--Atualizando em 15% a mais o preço dos produtos de codigo maior que 30.
UPDATE produto_tb SET val_unit = val_unit + (val_unit * 0.15)
WHERE cod_prod > 30;

--Atualizar o nome do produto queijo para queijo de minas
UPDATE produto_tb SET descricao = 'Queijo Minas'
WHERE descricao = 'Queijo';

--Zerando o preço dos produtos açúcar, madeira e linha
UPDATE produto_tb SET val_unit = 0
WHERE descricao = 'Acucar' OR descricao = 'Madeira' OR descricao = 'Linha';