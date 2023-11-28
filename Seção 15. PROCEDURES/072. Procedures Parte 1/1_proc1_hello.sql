--Retornar apenas o conteúdo estático
--drop procedure PROC_OLA
use curso
CREATE PROCEDURE PROC_OLA
AS
BEGIN
	SELECT 'O FAMOSO Ola Mundo!'
END


--Executando Procedure
EXECUTE PROC_OLA



create procedure proc_teste
as
begin

  Print 'Teestando com o print o Olá mundo!'

end


exec proc_teste