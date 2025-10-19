-- Criando o banco de dados

create database oficina_mecanica;
use oficina_mecanica;

-- Criando tabela Cliente

create table client (
	idClient int auto_increment,
    Pname varchar(15) not null,
    Minit char(3),
    Lname varchar(20) not null,
    cel_phone char(11) not null,
    address varchar(255) not null,
    constraint pk_idClient primary key (idClient)    
);

desc client;

-- Criando tabela Veículo

create table vehicle (
	idVehicle int auto_increment,
    idClient int,
    model varchar(45) not null,
    license_plate char(7) not null,
    constraint pk_vehicle primary key (idVehicle),
    constraint fk_vehicle_client foreign key (idClient) references client(idClient)
);

-- Criando tabela Equipe

create table team (
	idTeam int auto_increment,
    teamName varchar(45) not null unique,
    constraint pk_team primary key (idTeam)
);

-- Criando tabela Mecânico

create table mechanic (
	idMechanic int auto_increment,
    name varchar(100) not null,
    address varchar(255),
    specialty varchar(45) not null,
    idTeam int not null,
    constraint pk_mechanic primary key (idMechanic),
    constraint fk_mechanic_team foreign key (idTeam)references team(idTeam)
);

-- Criando tabela Ordem de Serviço

create table workOrder (
	idWorkOrder int auto_increment,
    issueDate datetime not null,
    status enum('Aberta','Em progresso','Finalizada','Cancelada') default 'Aberta',
    completionDate datetime,
    totalAmount decimal(10,2) default 0,
    license_plate char(7) not null,
    idVehicle int not null,
    idTeam int not null,
    constraint pk_work_order primary key (idWorkOrder),
    constraint fk_work_order_vehicle foreign key (idVehicle) references vehicle(idVehicle),
    constraint fk_work_order_team foreign key (idTeam) references team(idTeam),
    constraint ck_work_order_total check (totalAmount >= 0)
);

-- Criando tabela Peças de Reposição

create table replacementPart (
	idPart int auto_increment,
    partName varchar(45) not null,
    unitPrice decimal(10,2) not null,
    constraint pk_part primary key (idPart),
    constraint un_part_name unique (partName),
    constraint ck_part_price check (unitPrice > 0)
);

-- Criando tabela Serviço Executado

create table executedService (
	idService int auto_increment,
    serviceDescription varchar(255) not null,
    laborCost decimal(10,2) not null, 
    idWorkOrder int not null,
    constraint pk_service primary key (idService),
    constraint fk_service_work_order foreign key (idWorkOrder) references workOrder(idWorkOrder),
    constraint ck_labor_cost check (laborCost >= 0)
);

-- Criando tabela de relação entre Peças e Ordem de Serviçoptimize

create table workOrderPart ( 
	idWorkOrder int not null,
    idPart int not null,
    quantity int not null,
    unitPrice decimal(10,2) not null,
    constraint pk_work_order_part primary key (idWorkOrder, idPart),
    constraint fk_work_order_part_order foreign key (idWorkOrder) references workOrder(idWorkOrder),
    constraint fk_work_order_part_part foreign key (idPart) references replacementPart(idPart),
    constraint ck_part_quantity check (quantity > 0),
    constraint ck_part_unit_price check (unitPrice > 0)
);


-- Inserindo dados de exemplo

insert into client (Pname, Minit, Lname, cel_phone, address) values
	('Lucas', 'D', 'Silva', '11999998888', 'Rua das Flores, 100'),
	('Ana', 'M', 'Costa', '11988887777', 'Av. Brasil, 200'),
	('Carlos', 'G', 'Souza', '11977776666', 'Rua Verde, 300');
    
insert into vehicle (idClient, model, license_plate) values
	('2', 'Civic - Honda', 'ABC1234'),
    ('3', 'Corolla - Toyota', 'XYZ5678'),
    ('1', 'Gol - Volkswagem', 'DEF4321');
    
insert into team (teamName) values
	('Equipe Alpha'),
    ('Equipe Beta');
    
insert into mechanic (name, address, specialty, idTeam) values
	('João Mendes', 'Rua A, 10', 'Motor', 1),
	('Mariana Lima', 'Rua B, 20', 'Suspensão', 1),
	('Pedro Rocha', 'Rua C, 30', 'Freios', 2);
    
insert into workOrder (issueDate, status, completionDate, totalAmount, license_plate, idVehicle, idTeam) VALUES
	('2025-10-01', 'Finalizada', '2025-10-05', 850.00, 'ABC1234', 1, 1),
	('2025-10-03', 'Em progresso', NULL, 0.00, 'XYZ5678', 2, 2),
	('2025-10-05', 'Aberta', NULL, 0.00, 'DEF4321', 3, 1);

insert into replacementPart (partName, unitPrice) values
	('Pastilha de Freio', 120.00),
    ('Filtro de Óleo', 45.00),
    ('Vela de Ignição', 30.00);
    
insert into executedService (serviceDescription, laborCost, idWorkOrder) values
	('Substituição do freio', 200.00, 1),
    ('Troca de óleo', 100.00, 1);
    
insert into workOrderPart (idWorkOrder, idPart, quantity, unitPrice) values
	(1, 1, 2, 120.00), -- 2 pastilhas de freio
    (1, 2, 1, 45.00); -- 1 filtro de óleo
    


-- Realizando consultas

-- Listar os clientes que moram em endereços com "Rua"

select Pname, Minit, Lname, cel_phone, address 
from client 
where address like '%Rua%';

-- Quantas ordens de serviço cada cliente possui?

select concat(c.Pname, ' ', c.Minit, ' ', c.Lname) as fullName, 
	count(w.idWorkOrder) as totalOrders
from client c
join vehicle v on c.idClient = v.idClient
join workOrder w on v.idVehicle = w.idVehicle
group by fullName;

-- Listar ordens com o valor total e ordená-las do maior para o menor valor

select idWorkOrder, totalAmount
from workOrder
order by totalAmount desc;

-- Quais equipes executaram mais de uma ordem de serviço?

select t.teamName, count(w.idWorkOrder) as totalOrders
from team t
join workOrder w on t.idTeam = w.idTeam
group by t.teamName
having count(w.idWorkOrder) > 1;

-- Mostrar quais peças foram usadas em cada ordem, com quantidade e preço

select w.idWorkOrder, p.partName, wp.quantity, wp.unitPrice
from workOrder w 
join workOrderPart wp on w.idWorkOrder = wp.idWorkOrder
join replacementPart p on wp.idPart = p.idPart;

-- Mostrar os serviços realizados por cada equipe

select t.teamName, es.serviceDescription, es.laborCost
from executedService es
join workOrder w on es.idWorkOrder = w.idWorkOrder
join team t on w.idTeam = t.idTeam;

-- Calcular o custo total das peças em cada ordem de serviço 

select w.idWorkOrder, sum(wp.quantity * wp.unitPrice) as totalPartsCost
from workOrder w 
join workOrderPart wp on w.idWorkOrder = wp.idWorkOrder
group by w.idWorkOrder;