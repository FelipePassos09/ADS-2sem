<h1>Java - Linguagem Orientada à Objetos</h1>
<h2>Métodos Construtores</h2>
<p>É obrigatória e deve sempre possuir o mesmo nome da classe referente, no caso do java ele é descrito por new, e tem por finalidade armazenar em memória o objeto instanciado(criado) da classe.<br />O java é case sensitive, ou seja, é importante se atentar ás letras maiúsculas e minusculas.</p>
<h2>Classificação dos construtores:</h2>
<p>
<li>Construtor padrão:
    <ul>
        <li>Implicito
            <ul>Não possui nenhum código nem argumentos.</ul>
        </li>
        <li>Explicito
            <ul>Possui código mas não leva argumentos<br />public Triangulo(){}</ul>
        </li>
    </ul>
</li>
<li>Não padrão
    <ul>
        <li>Explicito
            <ul>Possui código e também leva argumentos<br />public Triangulo(int arg){}</ul>
        </li>
    </ul>
</li>
</p>
<h2>Sorecarga de Métodos</h2>
<p>Diz de classes onde os métodos possuem os mesmos nomes mas diferem em seus argumentos, nesse caso definindo a característica de polimorfismo.</p>
<h2>Sobreposição</h2>
<p>Se diz de uma classe que contém outra classe, ou seja, que ao ser acionaad altera ou sobrepõe o comportamento de uma outra classe predefinia. Exemplo:
<table>
    <td>public class color{ <br/>string cor;<br/>string azul(){<br/>return "cyan";<br/>}}<br/><br/>
    public class ArcoIris extends color{<br/>@Override<br/>String azul(){<br/>return "marine"<br/>}}
    </td>
</table>
Nesse exemplo podemos ver que temos a superclasse ArcoIris que possui a classe color.azul, que, por sua vez, também era uma classe.
</p>
<h2>Operador Ternario</h2>
<p></p>
<h2>Operações Sincronas e Assíncronas</h2>
<h3>Operações Sincronas</h3>
<p>Somente são efetuadas após um comando ou ação que defina o final da operação, exemplo um botão de salvar ou um step de finalização do algoritmo.</p>
<h3>Operações Assincronas</h3>
<p>São definidas por ações efetuadas em tempo de execução, sem necessidade de um salvamento ou final de algoritmo. Comumente utilizadas em sites ou softwares dinâmicos.</p>
<h2>Modificadores</h2>
<p>São utilizados para realizar o encapsulamento dentro da classe sendo definidas por:
<li>Public
    <ul></ul>
</li>
<li>Private
    <ul></ul>
</li>
<li>Default
    <ul></ul>
</li>
</p>