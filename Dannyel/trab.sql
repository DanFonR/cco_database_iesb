CREATE DATABASE IF NOT EXISTS db_ecommerce;

USE db_ecommerce;

CREATE TABLE IF NOT EXISTS tb_clientes (

cpf CHAR(14) NOT NULL,

nom_cliente VARCHAR(100) NOT NULL,

num_telefone INT,

dsc_email VARCHAR(50) NOT NULL,

dsc_endereco VARCHAR(150) NOT NULL,

PRIMARY KEY (cpf)

);

CREATE TABLE IF NOT EXISTS tb_produtos (

id_produto INT NOT NULL AUTO_INCREMENT,

nom_produto VARCHAR(100) NOT NULL,

dsc_produto VARCHAR(500),

vlr_produto NUMERIC(6, 2),

nom_marca VARCHAR(20) NOT NULL,

PRIMARY KEY (id_produto)

);

CREATE TABLE IF NOT EXISTS tb_categorias (

id_categoria INT NOT NULL AUTO_INCREMENT,

nom_categoria VARCHAR(25) NOT NULL,

PRIMARY KEY (id_categoria)

);

CREATE TABLE IF NOT EXISTS tb_pedidos (

id_pedido INT NOT NULL AUTO_INCREMENT,

vlr_total NUMERIC(7, 2) NOT NULL,

dsc_forma_pagamento VARCHAR(7) NOT NULL,

data_entrega DATE NOT NULL,
data_pedido DATE NOT NULL,

cpf CHAR(14) NOT NULL,

PRIMARY KEY (id_pedido),

FOREIGN KEY (cpf) REFERENCES tb_clientes(cpf)

);

CREATE TABLE IF NOT EXISTS tb_fornecedores (

cnpj CHAR(18) NOT NULL,

nom_razao_social VARCHAR(100) NOT NULL,

dsc_email VARCHAR(50) NOT NULL,

PRIMARY KEY (cnpj)

);

/*--- DEFINIÇÃO TABELAS LIGAÇÃO N:N*/

CREATE TABLE IF NOT EXISTS tb_produtos_categorias (

id_prod_cat INT NOT NULL AUTO_INCREMENT,

id_produto INT NOT NULL,

id_categoria INT NOT NULL,

PRIMARY KEY (id_prod_cat),

FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria),

FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)

);

CREATE TABLE IF NOT EXISTS tb_pedidos_produtos (

id_ped_prod INT NOT NULL AUTO_INCREMENT,

id_ped INT NOT NULL,

id_prod INT NOT NULL,

PRIMARY KEY (id_ped_prod),

FOREIGN KEY (id_ped) REFERENCES tb_pedidos(id_pedido),

FOREIGN KEY (id_prod) REFERENCES tb_produtos(id_produto)

);

CREATE TABLE IF NOT EXISTS tb_fornecedores_produtos (
id_forn_prod INT NOT NULL AUTO_INCREMENT,

cnpj CHAR(18) NOT NULL,

id_prod INT NOT NULL,

PRIMARY KEY (id_forn_prod),

FOREIGN KEY (cnpj) REFERENCES tb_fornecedores(cnpj),

FOREIGN KEY (id_prod) REFERENCES tb_produtos(id_produto)

);
