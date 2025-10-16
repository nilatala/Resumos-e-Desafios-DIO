-- Criação de banco de dados para cenário de E-commerce

create database e_commerce;
use e_commerce;

-- criar tabela cliente

create table client(
	idClient int auto_increment primary key,
    Fname varchar(15),
    Mint char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(60),
    constraint unique_cpf_client unique (CPF)
);

-- criar restrição PF/PJ para clientes

create table clientPF(
	idClientPF int primary key,
    RG char(9),
    foreign key (idClientPF) references client(idClient)
);

create table clientPJ (
	idClientPJ int primary key,
    CNPJ char(14),
    SocialName varchar(255),
    foreign key (idClientPJ) references client(idClient)
);

-- criar tabela produto (

create table product(
	idProduct int auto_increment primary key,
    Pname varchar(25) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedo', 'Alimento', 'Móveis', 'Livros') not null,
    avaliação float default 0,
    size varchar(10)
);

-- criar tabela de pagamento

create table payments(
    idPayment int auto_increment,
    idClient int,
    typePayment enum('Boleto', 'Cartão', 'Dois Cartões', 'PIX'),
    limitAvailable float,
    primary key(idPayment),
    constraint fk_payment_client foreign key (idClient) references client(idClient)
);

-- criar tabela pedido

create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em Processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references client(idClient)
);

-- criar tabela de entrega

create table delivery (
	idDelivery int auto_increment primary key,
    idDelOrder int,
    trackingCode varchar(50),
    deliveryStatus enum('Em trânsito','Entregue','Aguardando envio','Cancelado') default 'Aguardando envio',
    foreign key (idDelOrder) references orders(idOrder)
);

-- criar tabela estoque

create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor

create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstractName varchar(255),
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor

create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstractName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- criar relação entre vendedor e produto

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product (idProduct)
);

-- criar relação entre produto e pedido

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder)
);

-- criar relação entre produto e estoque

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- criar relação entre fornecedor e produto

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

-- inserindo informações nas tabelas

insert into client (Fname, Mint, Lname, CPF, Address) values
	('Maria','M','Silva','12345678912','Rua Silva de Prata 29, Carangola - Cidade das Flores'),
    ('Matheus','O','Pimentel','98765432198','Rua Alameda 289, Centro - Cidade das Flores'),
    ('Ricardo','F','Silva','45678912345','Avenida Alameda Vinha 1009, Centro - Cidade das Flores'),
    ('Julia','S','França','78912345678','Rua das Laranjas 851, Centro - Cidade das Flores'),
    ('Roberta','G','Assis','98745632189','Avenida Koller 19, Centro - Cidade das Flores'),
    ('Isabela','M','Cruz','65478912365','Alameda das Flores 28, Centro - Cidade das Flores');
    
insert into product (Pname, classification_kids, category, avaliação, size) values
	('Fone de ouvido',false,'Eletrônico','4',null),
    ('Barbie Elsa',true,'Brinquedo','3',null),
    ('Body Carters',true,'Vestimenta','5',null),
    ('Microfone Vedo - Youtuber',false,'Eletrônico','4',null),
    ('Sofá rereátil',false,'Móveis','3','3x57x80'),
    ('Farinha de arroz',false,'Alimento','2',null),
    ('Fire Stick Amazon',false,'Eletrônico','3',null);
    
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
	(1, default, 'compra via aplicativo', null, 1),
    (2, default, 'compra via aplicativo', 50, 0),
    (3, 'Confirmado', null, null, 1),
    (4, default, 'compra via web site', 150, 0);
    
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
	(1,1,2,default),
    (2,1,1,'Disponível'),
    (3,2,1,'Sem estoque');
    
insert into productStorage (storageLocation, quantity) values
	('Rio de Janeiro',1000),
    ('Rio de Janeiro',500),
    ('São Paulo',10),
    ('São Paulo',100),
    ('São Paulo',10),
    ('Brasília',60);
    
insert into storageLocation (idLproduct, idLstorage, location) values
	(1,2,'RJ'),
    (2,6,'GO');
    
insert into supplier (SocialName, CNPJ, contact) values
	('Almeida e Filhos',123456789123456,'21985474'),
    ('Eletrônicos Silva',854519649143457,'21985484'),
    ('Eletrônicos Valma',934567893934695,'21975474');
    
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
	(1,1,500),
    (1,2,400),
    (2,4,633),
    (3,3,5),
    (2,5,10);
    
insert into seller (SocialName, AbstractName, CNPJ, CPF, location, contact) values
	('Tech Eletrônics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
    ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);
    
insert into productSeller (idPseller, idPproduct, prodQuantity) values
	(1,6,80),
    (2,7,10);
    

-- Analisando as informações

-- Recuperação simples utilizando WHERE:

select Fname, Lname, Address from client where Address like '%Centro%';

-- Atributo derivado (quantidade de pedidos por cliente):

select c.idClient, c.Fname, c.Lname, count(o.idOrder) as totalPedidos from client c
left join orders o on c.idClient = o.idOrderClient group by c.idClient;

-- ORDER BY + expressão derivada:

select p.Pname, ps.prodQuantity * 100 as estoqueEstimado from product p
join productSeller ps on p.idProduct = ps.idPproduct order by estoqueEstimado desc;

-- HAVING com agrupamento:

select idOrderClient, count(*) as totalPedidos from orders
group by idOrderClient having totalPedidos = 1;

-- JOIN complexo (relação de produtos fornecedores e estoques):

select s.SocialName as Fornecedor, p.Pname as Produto, ps.quantity as Quantidade, st.storageLocation from supplier s
join productSupplier ps on s.idSupplier = ps.idPsSupplier
join product p on p.idProduct = ps.idPsProduct
join storageLocation sl on sl.idLproduct = p.idProduct
join productStorage st on st.idProdStorage = sl.idLstorage;

-- Verificando se algum vendedor também é fornecedor:

select s.SocialName from seller s
join supplier f on s.CNPJ = f.CNPJ;