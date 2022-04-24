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
        <ul>Ao se especificar NULL permitimos que o campo possa ser 'vazio', caso utilizemos NOT NULL o campo deve, pobrigatóriamente, conter algum valor.</ul>
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
        <li>Sinônimo: DOUBLE PRECISION.</li>
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
