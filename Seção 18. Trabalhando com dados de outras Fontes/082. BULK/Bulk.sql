use curso

--drop table produto
create table produto
   (cod nvarchar(5),
    nome nvarchar(20)
)


--Exemplo de Bulk Insert
BULK INSERT produto 
--FROM 'C:\EAD\SQL SERVER DEV\Scripts\17_BULK\carga\produto.txt'
from 'D:\Danilo\Cursos\Udemy\FormaçãoSQLServer2017DesenvolvedorExpertSQLeT-SQL\Seção 18. Trabalhando com dados de outras Fontes\082. BULK\carga\produto.txt'
WITH        (
	codepage='ACP',  -- { 'ACP' | 'OEM' | 'RAW' | 'code_page' } ] 
    DATAFILETYPE = 'char',   --      { 'char' | 'native'| 'widechar' | 'widenative' } ]         
	fieldterminator='|',               
	rowterminator='\n',               
	maxerrors = 0,               
	fire_triggers,             
    firstrow = 1,               
 	lastrow = 15
	     ) ;

--VERFICANDO DADOS IMPORTADOS
select *  from produto
--DELETANDO ARQUIVOS
delete from produto


