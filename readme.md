# Formação SLQ Server 2017 Desenvolvedor Expert SQL e T-SQL
  > Escola: **Udemy** - Professor: **André Rosa - Udemy**

## Conteúdo do Curso

### Seção 01: Introdução
    - 001 Apresentação do Instrutor
    - 002 Introdução - Abertura

### Seção 02: Preparando e Instalando o Ambiente
    - 003 Instalando .net Framework 3.5
    - 004 Instalando SQL SERVER 2017
    - 005 Instalando SQL SERVER MANAGEMENT STUDIO (SSMS)
    - 006 Restaurando Databases para as aulas

  - Seção 03: Seção 03. Conceitos Teóricos de Banco de dados
    - 007 Conceitos de Banco de dados
    - 008 Conceitos de Banco de dados relacional
    - 009 Modelo Entidade Relacionamento
      > MER Modelo Entidade Relacionamento
       
      > Tipos: Forte, Fraca e Associativa
        - Forte: Entidade que não dependem de outra para existirem (Ex: Produto).
        - Fraca: Entidade que depende de outra para existirem (Vendas).
        - Associativa: Entidade que surge devivada da necessidade de se associar informações de mais de uma entidade(Ex: Aluno, Curso, CursoAluno).
        
    - 010 Cardinalidade
      > Tipos: 1 para 1 (1-1), 1 para muitos (1-N) e Muitos para Muitos (N-N).
       
    - 011 ACID e CRUD
      > ACID
        - Atomicidade: Uma transação é uma unidade em que ou ela é executada em sua totalidade ou nada será executado.

        - Consistência: Uma transação deve manter a consistência do banco de dados.

        - Isolamento: Uma transação não pode se tornar visível para outros usuário até que ela se conclua na sua totalidade. Cada transação é única e não deve haver interferência de uma transação em outra.

        - Durabilidade: Trasações executadas e concluídas devem permanecer gravadas no banco de maneira definitiva até que outra transação seja executada independente do período de temmpo.

      > CRUD
        - Create(Criar)
        - Read(Ler)
        - Update(Atualizar)
        - Delete(Apagar)

    - 012 Historico SQL e SGBD
      > Linguagem de consulta interativa (Query AdHoc): que é a executação de comandos de consulta diretamente em ferramentas front-end que retornam os dados instantaneamente. Ex: SSMS - SQL Server Management Studio

  - Seção 04: Linguagem SQL e T-SQL
    - 013 Tipos de Dados

    - 014 Constraints
      > Tipos de Constraints:
        - NOT NULL
        - UNIQUE
        - PRIMARY KEY
        - FOREIGN KEY
        - DEFAULT
        - INDEX CHECK

    - 015 Operadores de Comparação
      > A operações comuns as linguagens (=, <, >, <>, !=, !>, !<).

      > Ainda com relação as comparações o Collate define como as consulta serão descritas.
        - Case Sensitive (CA) distinguindo entre maíusculas e minúsculas.
        - Case Insensitive (CI) não distinguindo entre maíusculas e minúsculas.
        - Accent Sensitive (AS) diferencia a letra acentuada.
        - Accent Insensitive (AI) não diferencia a letra acentuada.


    - 016 Operadores Aritméticos
      > Operadores Soma(+), Subtração(-), Multiplicação(*), Divisão(/), Módulo (%)

    - 017 Operadores Lógicos e Filtros Parte 1
      > AND, OR, LIKE, BETWEEN, IN, NOT, ANY, EXISTS, HAVING.


    - 018 Operadores Lógicos e Filtros Parte 2
      > Like coringa [] 

  - Seção 05. Definições da Linguagem SQL (DML,DDL,DCL,TCL)
    - 019 Introdução
      > DML
        - SELECT
        - INSERT
        - UPDATE
        - DELETE
      
      > DDL
        - CREATE
        - ALTER
        - DROP
        - TRUNCATE

      > DCL
        - GRANT
        - REVOKE
        - DENY

      > TCL
        - BEGIN TRANSACTION
        - COMMIT
        - SAVE TRANSACTION
        - ROLLBACK

    - 020 Definição DML

    - 021 Definição DDL Parte 1

    - 022 Definição DDL Parte 2
      > Para alteração de objetos ou nomes de colunas ou nomes de tabelas.

      > EXEC Sp_rename 'colaborador.endereco', 'ender', 'COLUMN' 
    
      > EXEC Sp_rename   'colaborador','FUNC';

    - 023 Definição DCL Grant
      > Procedures nativado SQL Server e comandos para para adicionar e conceder acessos a usuários: 
        ```
        exec master.dbo.sp_addlogin 'UsrTeste','SenhaTeste';

        --Adiocnar
        EXEC sp_grantdbaccess 'UsrTeste';

        --EXEC sp_revokedbaccess 'UsrTeste';

        --Concedendo Acesso DE ATUALIZACAO PARA UsrTeste.
        GRANT UPDATE ON FUNCIONARIOS TO UsrTeste; 

        --Concedendo Acesso DE INSERT PARA UsrTeste.
        GRANT INSERT ON FUNCIONARIOS TO UsrTeste; 

        --Concedendo Acesso DE Leitura PARA UsrTeste.
        GRANT SELECT ON FUNCIONARIOS TO UsrTeste;

        --Concedendo Acesso DE DELETE PARA UsrTeste.
        GRANT DELETE ON FUNCIONARIOS TO UsrTeste;
        ```

      > Comando para modificar usuário corrente para outro usuario e retornar:
        ```
        --ALTERANDO USUARIO LOGADO
        SETUSER 'UsrTeste'

        --VERIFICANDO USUARIO LOGADO
        select CURRENT_USER

        --RETOANR PARA USUARIO CORRENTE
        SETUSER 
        ```

    - 024 Definição DCL Revoke
      > Comandos para para revogar acessos a usuários: 
        ```
        --REVOGANDO Acesso DE ATUALIZACAO UsrTeste.
        REVOKE UPDATE ON FUNCIONARIOS to UsrTeste; 

        -- REVOGANDO Acesso DE inserção UsrTeste.
        REVOKE INSERT ON FUNCIONARIOS TO UsrTeste; 

        -- REVOGANDO Acesso DE Leitura UsrTeste.
        REVOKE SELECT ON FUNCIONARIOS TO UsrTeste; 

        --REVOGA DIREITO DE EXECUCAO DA PROC TESTE_PROC PARA UsrTeste.
        REVOKE EXECUTE ON testproc TO UsrTeste ;
        ```


    - 025 Definição DCL Deny
      > Comandos para para negar acessos a usuários: 
        ```
        --NEGANDO Acesso DE ATUALIZACAO UsrTeste.
        DENY UPDATE ON FUNCIONARIOS TO UsrTeste; 

        -- NEGANDO Acesso DE ATUALIZACAO UsrTeste.
        DENY INSERT ON FUNCIONARIOS TO UsrTeste;
 
        -- NEGANDO Acesso DE Leitura UsrTeste.
        DENY SELECT ON FUNCIONARIOS TO UsrTeste;

        --NEGA ACESSO A EXECUSSAO DE PROCEDURE
        DENY EXECUTE ON testproc TO UsrTeste;
        ```

    - 026 Definição TCL
      > Comandos de controle transacional.

  - Seção 06: Union e Subquerys
    - 027 Union e Union all
      > Union agrupa informações.

      > Union All lista todos.

    - 028 Subquery
      > São subconsultas aninhadas seja ela de um select com outro select ou com algum outro DML (Update, Delete, Insert).

  - Seção 07: JOINS
    - 029 jOINS Parte 1

    - 030 jOINS Parte 2

  - Seção 08:Funções SQL
    - 031 Funçoes de agregação Parte 1
      > AVG, MIN, MAX, SUM, COUNT STDEV, STDEVP, GROUPING, GROUPING_ID, VAR, VARP

    - 032 Funçoes de agregação Parte 2
      > WITH ROLLUP totaliza o group by.

    - 033 Funções de Classificação
      > RANK, NTILE DENSE_RANK, ROW_NUMBER

    - 034 Funções Lógicas
      > CHOOSE, IIF

    - 035 Funções de Matemáticas
      > ABS, RAND, ROUND, POWER, SQRT

    - 036 Funções de Matemáticas
      > SELECT TOP

    - 037 Funcões de Conversão Parte 1
      > CAST, CONVERT PARSE, TRY_CAST, TRY_CONVERT, TRY_PARSE

    - 038 Funcões de Conversão Parte 2

    - 039 Funções de Caracteres Parte 1
      > ASCII, LTRIM

    - 040 Funções de Caracteres Parte 2
      > STR, CONCAT, CONCAT_WS

    - 041 Funções de Caracteres Parte 3
      > REPLASE, REPLICATE, LEFT, UPPER, SUBSTRING,  REVERSE

    - 042 Funções de Caracteres Parte 4
      > LEN, DATALENGHT, RIGHT, LOWER, RTRIM
      
  - Seção 09. Funções de Data e hora
    - 043 Data e hora do sistema
      > SYSDATETIME, SYSDATETIMEOFFSET, SYSUTCDATETIME,  CURRENT_TIMESTAMP, GETDATE, GETUTCDATE

    - 044 DATEPART
      > DATENAME, DATEPART, DAY, MONTH, YEAR, DATETIMEFROMPARTS

    - 045 DATEADD e DATEDIFF

    - 046 Formatando Datas

  - Seção 10: Expressões
    - 047 CASE

    - 048 NULLIF e ISNULL

    - 049 COALESCE

  - Seção 11: Views e Temp Table
    
    - 050 Views

    - 051 Temp Table
      > Tabelas/Entidades criadas na data base TempDB e podem ser **Locais** ou **Globais**

      > Tabelas **Locais** indentificado por #

      > Tabelas **Globais** indentificado por ##

    - 052 Siga em frente ! Vamos até o final!

  - Seção 12: Extensão Transact-SQL

    - 053 Estrutura IF

    - 054 Estrutura While

    - 055 Populando tabela com While.

    - 056 TRY .. CATCH Tratando erros
      > Funções de sistema que podem retornar:
        - ERROR_NUMBER(), ERROR_SEVERITY(), ERROR_STATE(), ERROR_PROCEDURE(), ERROR_LINE(), ERROR_MESSAGE()

  - Seção 13. CURSORES
    - 057 Introdução a Cursores 
      > São áreas em memórias compostas por linhas e colunas, destinadas a armazenar o resultado de uma consulta (select) podendo retornar de **ZERO** a **N LINHAS**.
  
      > Um cursor não pode ter o mesmo nome de um objeto do SQL.

      > E o cursor é inicialmente criado pelo comando **DECLARE CURSOS**. Os cursores podem ser definidos como qualquer bloco T-SQL (procedures, functions, triggers...).

      > O cursor é uma operação que requer bastante recurso, pois cada operação determinada demanda uma viagem de ida e volta através da rede.

      > Parâmetros dos Cursores:
        - **LOCAL / GLOBAL**: É usado para definir como funcionará as tabelas temporárias sendo @local ou @@global.
        - **FORWARD_ONLY / SCROLL**: Indica a rolagem para o cursor.
        - **STATIC / KEYSE / DYNAMIC / FAST_FOWARD**: Usado para definir o tipo de cursor a ser criado.
        - **READ_ONLY / SCROLL_LOCKS / OPTIMISTIC**: Indica o tipo de bloqueio que as linhas terão. Se as linhas sofrerão atualização e se os usuários poderão utilizar esses resultados.
        
    
    


    - 058 Exemplo Cursores 1
    - 059 Exemplo Cursores 2
    - 060 Exemplo Cursores 3
    - 061 Exemplo Cursores 4
    - 062 Exemplo Cursores 5
    - 063 Exemplo Cursores 6
    - 064 Exemplo Cursores 7


  - Seção 15. PROCEDURES
    - 072 Procedures Parte 1
    - 073 Procedures Parte 2
    - 074 Procedures Parte 3
    - 075 Procedures Parte 4

  - Seção 16. TRIGGERS
    - 076 Introdução
    - 077 Triggers Parte 1
    - 078 Triggers Parte 2
    - 079 Triggers Parte 3

  - Seção 99. Extras



