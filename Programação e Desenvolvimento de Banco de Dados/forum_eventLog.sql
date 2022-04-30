CREATE DATABASE tur_eventLog
	DEFAULT CHARSET = utf8
    DEFAULT COLLATE = utf8_general_ci;

USE tur_eventlog;

CREATE TABLE IF NOT EXISTS cliente(
	id INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(30) NOT NULL,
    telefone INT(15) UNSIGNED NULL,
    e_mail VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS evento (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    evento VARCHAR (30) NOT NULL,
    descricao VARCHAR (100) NULL,
    data_evento DATETIME NOT NULL,
    custo FLOAT NOT NULL,
    agente VARCHAR (10) DEFAULT'adm' NOT NULL,
    macro_atividade ENUM ('VENDA','ALTERAÇÃO','CANCELAMENTO')
);

ALTER TABLE evento
ADD cliente INT;

ALTER TABLE evento
ADD CONSTRAINT cod_cliente 
FOREIGN KEY (cliente)
REFERENCES cliente(id);

ALTER TABLE evento
DROP COLUMN venda;

INSERT INTO cliente (cliente, telefone, e_mail)
VALUES ('NEW WORLD CORP', '1112345648','corp.nw@nwcorporate.com');

INSERT INTO evento (evento, descricao, data_evento, custo, agente, macro_atividade, cliente)
VALUES ('RESERVA DE HOTEL', 'Reserva de hotel em SP, dias 5 e 6/06.', '2022/12/04 14:32:26', '389.50','JOSE', 'VENDA', '1');