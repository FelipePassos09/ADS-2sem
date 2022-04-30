Sua tarefa é elaborar um pequeno banco de dados contendo ao menos 2 tabelas. É esperado que este projeto seja coerente, partindo de uma motivação (requisitos) que você irá definir livremente.

A sua contribuição deverá ser registrada nesse fórum da seguinte maneira:

Objetivo: Descreva brevemente o objetivo do banco de dados criado, e qual tipo de solução isso poderia se aplicar. (Ex.: Meu projeto possui as tabelas Aluno e Curso, natural em um sistema escolar)

Script SQL: Script SQL: Escreva o script para criação do banco de dados e das tabelas, identificando os atributos, tipos, chaves primária/estrangeira etc., conforme aprendemos na disciplina!


Banco de dados com log de eventos voltado à apontamento e gestão do processo de de vendas em uma agência de viagens.

Tabelas: 3

Tabela 1: eventos{
    id: auto-increment, prymary key, integer, 9 digi;
    evento: char, 30 dig, obrigatory;
    descricao: char, 100 dig, opt;
    data_evento: datetime, YYYY/dd/mm HH:mm:ss;
    custo: float, 2 dig;
    agente: char, 10 dig, obrigatory;
    macro_atividade: char, 30 dig, obrigatory, list ['VENDA','ALTERAÇÃO','CANCELAMENTO'];
    transacao: foreign-key (transacao[id])
    cliente: foreign-key (cliente[id])
}

Tabela 2: cliente{
    id: auto-increment, prymary key, integer, 9 digi;
    cliente: char, 30 dig, obrigatory;
    telefone: int, 15 dig, opt;
    e-mail: char, 100 dig, opt;
}

Tabela 3: trasacao{
    id: auto-increment, prymary key, integer, 9 digi;
    valor: float, SUM(eventos[custo]);
    cliente: char, 30 dig, obrigatory;
    eventos: foreign-key ()
}