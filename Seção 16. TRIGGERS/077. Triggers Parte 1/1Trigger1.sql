--drop trigger TG_aud_sal
use curso
go
--## TRIGGER PARA UNICO REGISTRO
CREATE TRIGGER      
	TG_aud_sal		--NOME DA TRIGGER 
	on SALARIO		--TABELA QUE SER� ACIONADA
	after UPDATE	--AFTER : APOS A EXECU플O DO COMANDO UPDATE. A플O/COMANDO DML QUE ACIONAR� A TRIGGER : UPDATE. 
as
Begin		
	declare @sal_antigo decimal(10,2)
	declare @sal_novo decimal(10,2)
	declare @matricula int
			
	select @matricula  = (select matricula from inserted)
	select @sal_antigo = (select SALARIO from deleted)
	select @sal_novo   = (select SALARIO from inserted)
							
	insert into auditoria_salario 
	values 
		(@matricula, isnull(@sal_antigo,0), @sal_novo, SYSTEM_USER, getdate())
end	

--TESTANDO TRIGGER
update salario set salario ='2500' where matricula='1'
update salario set salario ='3000' where matricula='2'
update salario set salario ='3500' where matricula='3'
update salario set salario ='4000' where matricula='4'

SELECT * FROM SALARIO
select * from auditoria_salario;

--verificando problema problema
update salario set salario=salario*1.10;