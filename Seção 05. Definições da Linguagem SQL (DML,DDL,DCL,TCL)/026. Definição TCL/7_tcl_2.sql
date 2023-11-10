--limpando a tabela
delete from cadastro;
--INICIA TRANSACAO

BEGIN�TRANSACTION�
--INSERE REGISTRO
INSERT�INTO�cadastro� VALUES�('Andre', '12341244')�;
--CRIA UM PONTO DE RECUPERACAO
SAVE�TRANSACTION�a1;
--INSERE REGISTRO
INSERT�INTO�cadastro� VALUES�('Joao','12341244')�;
--CRIA UM PONTO DE RECUPERACAO
SAVE�TRANSACTION�a2�;
--INSERE REGISTRO
INSERT�INTO�cadastro�VALUES�('Pedro',�'12341244')�;
--CRIA UM PONTO DE RECUPERACAO
SAVE�TRANSACTION�a3�;

--VERIFICA REGISTROS
SELECT�* FROM���cadastro;

--RESTAURA A TABELA ATE O PONTO A2�
ROLLBACK�TRANSACTION�a2�;

--VERIFICA REGISTROS
SELECT�* FROM���cadastro;

--RETORNA A TABELA NO ESTADO ANTERIOR AO BEGIN TRANSACTION
ROLLBACK ;

--EFETIVA AS INFORMA�OES NA TABELA
COMMIT TRANSACTION;


--VERIFICA REGISTROS
SELECT�* FROM���cadastro;