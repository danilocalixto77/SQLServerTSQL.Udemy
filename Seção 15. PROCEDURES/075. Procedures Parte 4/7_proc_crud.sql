--DROP TABLE CAD_PESSOA;
USE curso
GO
CREATE TABLE CAD_PESSOA 
(
	ID_PESSOA INT NOT NULL PRIMARY KEY,
    NOME VARCHAR(50),
    EMAIL VARCHAR(30),
    SITUACAO CHAR(1),
    CONSTRAINT CK_SITUA CHECK(SITUACAO IN('B','A'))
);

--DROP PROCEDURE SP_CRUD
--PROCEDURE DE CADASTRO
CREATE PROCEDURE SP_CRUD         
	@V_OPER       CHAR(1), --I INSERIR --A -ATUALIZA --S SELECIONA - D--DELETE
	@V_ID_PESSOA  INTEGER, --CODIGO DA PESSOA
    @V_NOME       VARCHAR(50),
    @V_EMAIL      VARCHAR(30),
	@V_SITUACAO   CHAR(1)
AS
BEGIN 
--declarando variaveis
DECLARE
	@V_SID_PESSOA INTEGER,
	@V_SNOME VARCHAR(50),
	@V_SEMAIL VARCHAR(30),
	@V_SSITUACAO CHAR(1);
BEGIN TRANSACTION  
--verifica operacao de insert
IF (@V_OPER = 'I') 
BEGIN
	IF (@V_ID_PESSOA is null or   @V_ID_PESSOA='' or @V_NOME is null OR @V_NOME='' or  @V_EMAIL is nulL or @V_EMAIL='')
    BEGIN 
		ROLLBACK;
        PRINT 'CAMPOS IMCOMPLETOS';
		GOTO FIM_ERRO
    END
	ELSE
        INSERT INTO CAD_PESSOA(ID_PESSOA, NOME,EMAIL, SITUACAO) VALUES (@v_id_pessoa, @v_NOME, @v_email,'A');
		GOTO FIM_CERTO 
	END
END
--verifica operacao de atualização
IF (@V_OPER = 'A') 
BEGIN
	IF (@V_ID_PESSOA is null or   @V_ID_PESSOA='') 
    BEGIN
		ROLLBACK;
		PRINT 'CAMPOS IMCOMPLETOS';
		GOTO FIM_ERRO
	END
ELSE
	UPDATE CAD_PESSOA 
		SET NOME =ISNULL(@V_NOME,NOME), 
			EMAIL=ISNULL(@V_EMAIL,EMAIL),
			SITUACAO=ISNULL(@V_SITUACAO,SITUACAO)
    WHERE ID_PESSOA = @V_ID_PESSOA;
	GOTO FIM_CERTO
END 
--verifica operacao de delete
IF(@V_OPER = 'D') 
BEGIN
	IF (@V_ID_PESSOA is null or @V_ID_PESSOA='') 
    BEGIN
		ROLLBACK;
		PRINT 'CAMPOS IMCOMPLETOS';
		GOTO FIM_ERRO
	END
	ELSE
		DELETE FROM CAD_PESSOA WHERE ID_PESSOA = @V_ID_PESSOA;
		GOTO FIM_CERTO
END
--verifica operacao de select
IF (@V_OPER = 'S') 
BEGIN
	SELECT @V_SID_PESSOA=a.id_pessoa,@V_SNOME=a.nome,@V_SEMAIL=email,@V_SSITUACAO=situacao
	FROM CAD_PESSOA a 
	WHERE ID_PESSOA = @V_ID_PESSOA;
	PRINT CONCAT('ID: ',@V_SID_PESSOA); 
	PRINT 'Nome: '+@V_SNOME; 
	PRINT 'e-mail: '+@V_SEMAIL; 
	PRINT 'Situacao: '+@V_SSITUACAO; 
	GOTO FIM_CERTO
END
   
FIM_CERTO:
COMMIT; 
PRINT 'DADOS SELECIONADOS,INSERIDOS OU ATUALIZADO COM SUCESSO'; 
GOTO FIM
 
FIM_ERRO:
PRINT 'ALGO DEU ERRADO!!!'; 

FIM:
PRINT 'FINALIZADO!!!'; 


--INSERT
EXECUTE SP_CRUD 'I',1,'JONHY','JONHY@JONHY.COM','A';
EXECUTE SP_CRUD 'I',2,'PETER','PETER@PETER.COM','A';
EXECUTE SP_CRUD 'I',3,'DEREK','DEREK@DEREK.COM','A';

--TESTE
EXECUTE   SP_CRUD 'I',5,NULL,'JP@JP.COM','A';

--SELECT 
EXECUTE SP_CRUD @V_OPER='S',@V_ID_PESSOA=4,@V_NOME=NULL,@V_EMAIL=NULL,@V_SITUACAO=NULL;

--UPDATE
EXECUTE SP_CRUD @V_OPER='A',@V_ID_PESSOA=4,@V_NOME='NUNO',@V_EMAIL='NUNO@NUNO.COM',@V_SITUACAO='A'

--SELECT 
EXECUTE SP_CRUD @V_OPER='S',@V_ID_PESSOA=2,@V_NOME=NULL,@V_EMAIL=NULL,@V_SITUACAO=NULL;

--DELETE
EXECUTE SP_CRUD @V_OPER='D',@V_ID_PESSOA=4,@V_NOME=NULL,@V_EMAIL=NULL,@V_SITUACAO=NULL;

--EXEMPLO
EXECUTE SP_CRUD 'D',4,NULL,NULL,NULL

--SELECT 
EXECUTE SP_CRUD @V_OPER='S',@V_ID_PESSOA=2,@V_NOME=NULL,@V_EMAIL=NULL,@V_SITUACAO=NULL;

SELECT * FROM CAD_PESSOA
