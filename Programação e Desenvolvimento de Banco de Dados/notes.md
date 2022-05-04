<h1>Bancos de Dados - SQL</h1>
<h2>Modelagem Fisica</h2>
<h3>Prof. Gilberto Fernandes</h3>
<p>Estruturas básicas para consulta:
    <li>SELECT
        <ul>Identifica os campos desejados</ul>
    </li>
    <li>FROM
        <ul>lista as tabelas que serão lidas/consultadas.</ul>
    </li>
    <li>WHERE
        <ul>Estabelece uma condição para o argumento FROM.</ul>
    </li>
    <li>AS
        <ul>Permite renomear a coluna no resultado da query. (nome-antigo AS nome-novo)</ul>
    </li>
    <li>LIKE
        <ul>Determina a correspondência de padrões usando os caracteres % e _
            <li>% - Determina que a partir deste ponto qualquer valor pode ser aceito.</li>
            <li>_ - </li>
        </ul>
    </li>
    <li>ORDER BY
        <ul>É utilizado para ordenar uma listam pode levar ASC ou DESC. É aplicado ao fim da query, antes de seu encerramento, para definir qual coluna será o parametro de ordenação.
            <li>ASC - Ordena de forma ascendente (do menor para o maior ou de A à Z).</li>
            <li>DESC - Ordena de maneira decrescente (do maior para o menor ou de Z à A).</li>
        </ul>
    </li>
    <li>USE
        <ul>Define qual o banco de dados padrão para a consulta.</ul>
    </li>
    <li>SHOW
        <ul>Permite mostrar alguma informação, por exemplo quando associado à TABLES, retorna todas as tabelas do banco.</ul>
    </li>
    <li>TABLES
        <ul>Permite apontar todas as tabelas do banco.</ul>
    </li>
    <li>CHARSET
        <ul>Define quais conjutos de caracteres serão aceitos pelo banco (UTF8, ASCII, ISO, etc)</ul>
    </li>
    <li>COLLATION
        <ul>Define qual o conjunto de regras será utilizado para comparar simbolos no banco. (se diferencia maiusculas e minusculas, se considera espaços e caracteres especiais, etc) há conjuntos de regras padrão para cada CHARSET, por isso é importante respeitar essa relação a fim de evitar erros na gestão e manutenção do banco.</ul>
    </li>
    <li>SHOW DATABASES
        <ul>Exibe todos os bancos de dados dentro do servidor (exceto aqueles que o usuário não possui acesso).</ul>
    </li>
    <li>ALTER
        <ul>PErmite alterar algum parametro como CHARSET ou COLLATION.</ul>
    </li>
    <li>DROP
        <ul>Permite excluir um elemento como um Banco de dados ou TABELA.</ul>
    </li>
    <li>IF EXISTS / IF NOT EXISTS
        <ul>Utilizado para condicionar a realização de uma intrução apenas se houver / não houver, o parametro apontado como banco de dados, tabela, etc.</ul>
    </li>
    <p>
    Existem caracteres especiais dentro da linguagem, sendo eles:
        <li>* - funciona para declarar todo o conteúdo de um argumento, como todas as colunas ou todas as tabelas.</li>
        <li>; - serve para encerrar uma sequencia de argumentos para uma instrução, ele carrega a função de estruturar a sequencia de argumentos e definir a correta aplicação dos mesmos.</li>
        <li></li>
    </p>
<table>
    <tr>
        <td>SELECT nome<br />FROM cidade;</td>
        <td>Retorna os dados da coluna nomes na tabela cidade</td>
    </tr>
    <tr>
        <td>SELECT *<br />FROM cidade;</td>
        <td>Retorna todos os dados na tabela cidade</td>
    </tr>
    <tr>
        <td>SELECT nome, populacao / 2<br />FROM cidade;</td>
        <td>Retorna os dados da coluna nomes e metade dos valores de populacao na tabela cidade</td>
    </tr>
    <tr>
        <td>SELECT nome<br />FROM cidade;</td>
        <td>Retorna os dados da coluna nomes da tabela cidade</td>
    </tr>
    <tr>
        <td>SELECT DISTINCT nome<br />FROM cidade;</td>
        <td>Retorna os dados da coluna nomes, porém somente os um valor de cada caso hajam repetidos, na tabela cidade</td>
    </tr>
    <tr>
        <td>SELECT nome, populacao<br />FROM cidade<br />WHERE populacao < 100000;</td>
        <td>Retorna o nome e a população a partir da tabela cidade, porém somente nos casos onde o valor de população for menor que 100000.</td>
    </tr>
    <tr>
        <td>SELECT nome, populacao<br />FROM cidade <br />WHERE populacao BETWEEN 90000 AND 100000;</td>
        <td>Retorna o nome e a populacao a partir da tabela cidade, porém apenas quando o valor de população está entre 90000 e 100000.</td>
    </tr>
    <tr>
        <td>SELECT nome, populacao AS populacao_da_cidade<br />FROM cidade;</td>
        <td>Retorna os dados da coluna nomes da tabela cidade, porém com a coluna renomeada.</td>
    </tr>
    <tr>
        <td>SELECT C.nome, C.populacao, P.populacao<br />FROM cidade AS C, pais AS P;</td>
        <td>Retorna os dados da coluna nomes da tabela cidade</td>
    </tr>
    <tr>
        <td>CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_nome<br />[create_specification]<br />create_specification:<br />[DEFAULT] CHARACTER SET [=] charset_name | [DEFAULT] COLLATE [=] collation_name;</td>
        <td>Conjunto de instruções para a criação de um banco de dados e seu conjunto de caracteres e regras.</td>
    </tr>
    <tr>
        <td>CREATE DATABASE IF NOT EXISTS db_mundo<br />DEFAULT CHARACTER SET = utf8<br />DEFAULT COLLATE = utf8_general_ci;</td>
        <td>Conjunto de instruções para a criação de um banco de dados chamado db_mundo e aplicação do cunjunto de caracteres e regras UTF8 (universal).</td>
    </tr>
</table>

<h2>Criando o Banco de Dados Guia Turistico</h2>
<p>Vamos criar um banco de dados  para guia turístico, nele deve haver:
    <li>Países - contendo nome, continente, área, ano de independencia, população, expectativa de vida, forma de governo, capital, moeda</li>
    <li>Estados - contendo nome, sigla, região e capital.</li>
    <li>Cidades - nome, população, data de criação</li>
    <li>Pontos de interesse turístico</li>
</p>
<h2>Criando Tabelas</h2>
<p>A partir do DER/MER podemos partir à criação do banco de dados físico, podendo assim criar as tabelas e relacionamentos com maior segurança.
<table>
    <tr>
        <td>CREATE TABLE [IF NOT EXISTS] nome_tabela (lista_dos_campos)</td>
        <td>Cria a tabela e os campos (colunas) à ela pertencentes</td>
    </tr>
    <tr>
        <td>nome_campo tipo_campo[tamanho 'int'] [NOT NULL | NULL] [DEFAULT value] [AUTO INCREMENT] [PRIMARY KEY]</td>
        <td>Conjunto de parãmetros para criação do campo</td>
    </tr>
</table>
Aqui temos uma lista de novas entradas que devemos nos atentar:
    <li>NOT NULL | NULL
        <ul>Ao se especificar NULL permitimos que o campo possa ser 'vazio', caso utilizemos NOT NULL o campo deve, obrigatóriamente, conter algum valor.</ul>
    </li>
    <li>DEFAULT value
        <ul>Define um valor padrão para o campo caso nenhuma informação tenha sido passada.</ul>
    </li>
    <li>AUTO INCREMENT
        <td>Define que o campo possui incremento automatico, ou seja, a cada novo registro ele irá gerar um novo valor.</td>
    </li>
    <li>PRIMARY KEY
        <td>Define se o campo é uma chave primaria</td>
    </li>

<h3>Tipos de Dados</h3>
    <p>
        <li>M → define o tamanho máximo de dados aceito, deve ser inteiro e é, geralmente, condicionado ao tipo de dado.</li>
        <li>D → Define a quantidade de dados após a virgula, seu valor máximo é 30 e é condicionado ao tipo de dado DOUBLE / FLOAT.</li>
        <li>UNSIGNED → não aceita numeros negativos (menores que 0).</li>
        <li>ZEROFILL → preenche com a quantidade apontada de zeros à esquerda e, por padrão, recebe o atributo UNSIGNED.</li>
        <li> [ ] → aplica-se á partes opcionais da definição dos tipos.</li>
        <li>SMALLINT [M][UNSIGNED][ZEROFILL] → Aplica-se aos valores inteiros (integer) e compreende o range -32768 à 32767. Caso utilizado junto ao UNSIGNED vai e 0 à 65535.</li>
        <li>INT [M][UNSIGNED][ZEROFILL] → análogo ao anterior, porém compreendendo um intervalo maior, de -2147483648 à 2147483647. Caso sem negativos 0 à 4294967295.</li>
        <li>BIGINT [M][UNSIGNED][ZEROFILL] → segue como os demais porém com um range de -9223372036854775808 à 9223372036854775807.</li>
        <li>FLOAT [(M, D)] [UNSIGNED] [ZEROFILL] → 
        ponto flutuante, de precisão simples. Os valores 
        admissíveis são -3,402823466E+38 a -1,175494351E-
        38, 0 e 1,175494351E-38 a 3,402823466E+38</li>
        <li>DOUBLE [(M, D)] [UNSIGNED] [ZEROFILL] → 
        ponto flutuante de precisão dupla. 
        -1,7976931348623157E+308 a -2,2250738585072014E-
        308,0 
        Sinônimo: DOUBLE PRECISION.</li>
        <li>DATE →
        MySQL exibe no formato 'YYYY-MM-DD'
        Permite números ou strings</li>
        <li>DATETIME [(fsp)] →
        Combinação de data e hora
        formato 'AAAA-MM-DD HH: MM: SS [fracao]'</li>
        <li>TIME [(fsp)] -> 'HH: MM: SS [fração]'</li>
        <li>YEAR [4] -> 'YYYY'</li>
        <li>FSP → Se refere á quantidade de casas aplicadas ao valor milésimos</li>
        <li>VARCHAR (M) [CHARACTER SET charset_name] 
        [COLLATE collation_name] →
        cadeia de comprimento variável.</li>
        <li>CHAR (M) [CHARACTER SET charset_name] 
        [COLLATE collation_name] → cadeia de comprimento fixo.</li>
        <li>ENUM ('valor1', 'valor2', ...) [CHARACTER SET 
        charset_name] [COLLATE collation_name]
        objeto de string que pode ter apenas um valor, 
        escolhido na lista de valores 'valor1', 'valor2', [...], 
        NULO, ou vazio.
        Armazenado como inteiro pelo banco</li>
    </p>
</p>
<h2>DML - Manipulação de Dados</h2>
<p>
    <li>INSERT
        <ul>Permite adicionar novas linhas ou registros em uma tabela existente.<br />INSERT INTO nome_tabela (col1, col2) VALUES(15, 2);<br />INSERT INTO nome_tabela (col1, col2) VALUES(15, 2),(1,3);</ul>
    </li>
    <li>UPDATE
        <ul>Atualiza colunas de linhas existentes na tabela nomeada com novos valores (assemelha-se ao FROM). <br />Pode ser aplicado á mais de uma tabela, porém nesses casos não é possivel utilizar o WHERE junto à ORDER BY.</ul>
    </li>
    <li>SET
        <ul>Indica auis colunas modificar e os valores que devem ser fornecidos (assemelha-se ao SELECT).</ul>
    </li>
    <li>LIMIT
        <ul>Permite limitar uma quantidade de ocorrências que serão atingidas pelo UPDATE.</ul>
    </ul>
    <li>DELETE
        <ul>Permite deletar registros de uma tabela com base nos critérios apontados via WHERE.</ul>
    </li>
    <li>FIRST ou AFTER 
        <ul>nome_coluna: adicionar uma coluna 
        a uma posição específica dentro de uma linha da 
        tabela. O padrão é na última linha.
        </ul>
    </li>
    <li>CHANGE
        <ul>Permite alterar um atributo tanto seu nome e alterar seu tipo e configurações.</ul>
    </li>
    <li>MODIFY
        <ul>Permite modificar o atributo, seu tipo e características de dados, porém não o renomeia.</ul>
    </li>
    <li>RENAME
        <ul>Permite renomear um atributo, porém mantendo as caracteríticas inerentes aos dados contidos.</ul>
    </li>
    <li>ALTER TABLE
        <ul>Pode receber ADD, CHANGE, DROP, RENAME. É destinado à alteração estrutural da tabela como colunas, tipos, inclusão ou remoção de um novo atributo/ coluna. </ul>
    </li>
    <li>DROP
        <ul></ul>
    </li>
    É semper importante setar o WHERE quando forem ser realizados UPDATES, de modo a controlar o que será alterado nos dados.
</p>
<h2>Criando Relacionamentos</h2>
<p>
<h3>CONSTRAINTS</h3>
<p>Permitem definir os relacionamentos entre as tabelas</p>
<h4>Criando uma Chave Primaria</h4>
<table>
    <tr>
        <td>CREATE TABLE pessoa  (<br />
        id int NOT NULL PRIMARY KEY,<br />
        nome varchar(255) NOT NULL,<br />
        sobrenome varchar(255),<br />
        idade int );</td>
        <td>Aqui criamos a tabela definindo seus atributos e colunas.</td>
    </tr>
    <tr>
        <td>ALTER TABLE pessoa<br />
        DROP PRIMARY KEY;</td>
        <td>Aqui nós excluímos a chave primaria 'id', porém mantemos o valor. No caso apenas removemos essa característica do atributo.</td>
    </tr>
    <tr>
        <td>ALTER TABLE pessoa<br />
        ADD CONSTRAINT PK_pessoa PRIMARY KEY (id, sobrenome);</td>
        <td>Por fim, através do ALTER, criamos uma nova chave primaria composta utilizando o 'id' junto ao 'sobrenome'. É imporrtante ressaltar que o parâmetro da constraint 'PK_pessoa' se refere á um indice que será criado para listar essa condição, não pode ser utilizado o nome de um atributo existente na tabela.</td>
    </tr>
</table>
<h4>Criando uma Chave Estrangeira</h4>
<table>
    <tr>
        <td>
            ALTER TABLE nome_tabela<br />
            ADD [CONSTRAINT [símbolo]] FOREIGN KEY<br />
            [index_nome] (index_col_nome, ...)<br />
            REFERENCES nome_tabela (index_col_nome,...)<br />
            [ON DELETE referências]<br />
            [ON UPDATE referências]<br />
        </td>
        <td>Diferente do que ocorre com as chaves primarias, as chaves estrangeiras recebem alguns argumentos a mais para especificar suas ligações, nesse caso també precisamos definir algumas características para essa chave a fim de estabelecer as ações desencadeadas pela mesma.</td>
    </tr>
</table>
<li>FOREIGN KEY
    <ul>Se refere á chave estrangeira propriamente dita, ela pode levar um nome(index) para que seja listada pelo banco.</ul>
</li>
<li>REFERENCES
    <ul>É o conjunto de referências que definirão a chave estrangeira como qual o atributo ela receberá, quais ações ela desencadeará e quais restrições ela definirá.</ul>
</li>
<li>ON DELETE
    <ul>Define os comportamentos a partir de uma ação de exclusão na tabela</ul>
</li>
<li>ON UPDATE
    <ul>Define os comportamentos a partir de uma ação de exclusão na tabela quando</ul>
</li>
<li>RESTRICT
    <ul>Rejeita a operação de alteração ou exclusão da tabela pai</ul>
</li>
<li>CASCADE
    <ul>Permite excluir ou alterar a linha da tabela pai em função da tabela filha e vice e versa.</ul>
</li>
<li>SET NULL
    <ul>Exclui ou atualiza as informaçoes da tabela pai e define como null os valores de chave estrangeira para a tabela filha.</ul>
</li>
<li>TRUNCATE
    <ul>Esvazia completamente uma tabela ou atributo porém mantém suas características e/ou atributos. Diferente do DELETE, o truncate limpa o espaço de armazenamento e também é mais performatico ao realizar a deleção dos dados.</ul>
</li>
</p>
<h2>Consultas Avançadas</h2>
<h3>JOIN, INNER JOIN e LEFT/RIGHT JOIN</h3>
<p>
    As instruções JOIN são destinadas à unir duas ou mais tabelas a partir de uma consulta. Basicamente elas estabelecem as referencias a partir de um select e unem em uma nova instância os dados a partir da paridade de chaves primarias e .
    <li>INNER
        <ul>Esta instrução traz apenas os dados que estão dentro da intersecção de ambas as tabelas, ou seja, em que haja a relação correta de chaves em ambas as tabelas.</ul>
    </li>
    <li>LEFT / RIGHT
        <ul>Esta instrução realiza a junção externa, nesse caso retornando os resultados mesmo que não haja a paridade de chaves, retornando as linhas vazias de acordo com o parâmetro utilizado (LEFT ou RIGHT)</ul>
    </li>
</p>
<h2>Consultas com Funções</h2>
<p>
    <li>COUNT
        <ul>Permite realizar uma contagem a partir de um SELECT. Se utilizado o DISTINCT ele também desconsiderará as repetições de ocorr~encias na coluna definida.</ul>
    </li>
    <li>MIN / MAX
        <ul>Permite retornar o menor e maior valor da coluna e tabela alvo</ul>
    </li>
    <li>AVG
        <ul>Permite retornar o valor médio da coluna e tabela alvo</ul>
    </li>
    <li>GROUP BY
        <ul>Agrupa os resultados a partir de uma coluna, somando os resultados a partir dos valores dessa coluna, retornando apenas um registro com o total referente ao grupo.</ul>
    </li>
    <li>AS
        <ul>Permite retornar em um atributo personalizado o resultado da instrução.</ul>
    </li>
    <li>ON
        <ul>Permite definir a paridade que será levada em consideração no JOIN.</ul>
    </li>
</p>
<h2>Consultas Combinadas</h2>
<p>Podemos realizar o aninhamento de consultas, para isso utilizamos um conectivo como IN, NOT IN
    <li>IN
        <ul>Define uma relação de pertenciamento á instrução, ou seja, ao setarmos dentro de um WHERE que o valor resultado do SELECT deve IN dentro de outro SELECT, isso significa que no resultado final retornará apenas os valores que pertenção á ambos os resultados.</ul>
    </ul>
    <li>NOT IN
        <ul>Assim como no anterior essa instrução define o NÃO pertencimento .</ul>
    </ul>
    <h3>Operadores Matemáticos</h3>
    <p>Usamos operadores matemáticos para realizar análises lógicas e retornar o resultado esperado, nesse caso precisamos sempre usar a instrução SOME depois do operador para poder retornar corretamente o resultado.
    </p>
</p>