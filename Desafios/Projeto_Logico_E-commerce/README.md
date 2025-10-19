# Projeto Lógico de Banco de Dados: E-commerce

Este projeto consiste na modelagem e implementação de um banco de dados relacional para um cenário de e-commerce, com base em um modelo EER refinado. O objetivo é representar de forma precisa as entidades envolvidas no processo de compra e venda online, incluindo clientes (PF e PJ), produtos, fornecedores, vendedores, pedidos, entregas, pagamentos e estoques.

O projeto foi desenvolvido como parte de um desafio prático para consolidar conhecimentos em modelagem conceitual, lógica e física, além de aplicar comandos SQL para criação de esquemas, inserção de dados e consultas analíticas.

---

## Estrutura do Banco de Dados

### Entidades Principais

- **Client**: Clientes com especialização em Pessoa Física (`clientPF`) e Pessoa Jurídica (`clientPJ`)
- **Product**: Produtos com classificação, categoria, avaliação e tamanho
- **Orders**: Pedidos realizados por clientes
- **Payments**: Formas de pagamento associadas aos clientes
- **Delivery**: Informações de entrega com status e código de rastreio
- **ProductStorage**: Estoques físicos com localização e quantidade
- **Supplier**: Fornecedores de produtos
- **Seller**: Vendedores que comercializam os produtos

### Relacionamentos

- Um cliente pode ser PF ou PJ, mas não ambos
- Um cliente pode ter várias formas de pagamento
- Um pedido pode conter vários produtos
- Um produto pode ser fornecido por vários fornecedores e vendido por vários vendedores
- Um pedido possui uma entrega associada
- Produtos estão vinculados a estoques físicos por localizações

---

## 📊 Modelo Conceitual
![Modelo Conceitual](https://github.com/nilatala/Resumos-e-Desafios-DIO/blob/main/Desafios/Projeto_Logico_E-commerce/e-commerce_EER.png)
Arquivo original em [modelo-conceitual.mwb](https://github.com/nilatala/Resumos-e-Desafios-DIO/blob/main/Desafios/Projeto_Logico_E-commerce/modelo_e-commerce.mwb).

---

## 🛠️ Tecnologias Utilizadas

- **MySQL**: Sistema Gerenciador de Banco de Dados
- **Workbench**: Ferramentas de modelagem
- **SQL**: Linguagem para definição e manipulação dos dados
- **GitHub**: Repositório

---

## 📂 Scripts

- `create_schema.sql`: Criação das tabelas, chaves primárias, estrangeiras e constraints
- `insert_data.sql`: Inserção de dados de exemplo para testes
- `queries.sql`: Consultas SQL com diferentes níveis de complexidade

---

## 🔍 Exemplos de Consultas SQL

### 🔹 Recuperação simples com `WHERE`
```sql
select Fname, Lname, Address 
from client 
where Address like '%Centro%';
```

### 🔹 Atributo derivado (quantidade de pedidos por cliente)
````sql
select c.idClient, c.Fname, c.Lname, count(o.idOrder) as totalPedidos from client c
left join orders o on c.idClient = o.idOrderClient group by c.idClient;
````

### 🔹 ORDER BY + expressão derivada:
````sql
select p.Pname, ps.prodQuantity * 100 as estoqueEstimado from product p
join productSeller ps on p.idProduct = ps.idPproduct order by estoqueEstimado desc;
````

### 🔹 HAVING com agrupamento:
````sql
select idOrderClient, count(*) as totalPedidos from orders
group by idOrderClient having totalPedidos = 1;
````

### 🔹 Junção entre múltiplas tabelas (produtos, fornecedores e estoques):
````sql
select s.SocialName as Fornecedor, p.Pname as Produto, ps.quantity as Quantidade, st.storageLocation from supplier s
join productSupplier ps on s.idSupplier = ps.idPsSupplier
join product p on p.idProduct = ps.idPsProduct
join storageLocation sl on sl.idLproduct = p.idProduct
join productStorage st on st.idProdStorage = sl.idLstorage;
````

### 🔹 Verificando se algum vendedor também é fornecedor:
````sql
select s.SocialName from seller s
join supplier f on s.CNPJ = f.CNPJ;
````

---

## 📊 Modelo Lógico
![Script do Modelo Lógico](https://github.com/nilatala/Resumos-e-Desafios-DIO/blob/main/Desafios/Projeto_Logico_E-commerce/ecommerce_script2.sql)

---

📎 **Projeto desenvolvido como parte do Bootcamp em Análise de Dados com a Randstad da [DIO](https://www.dio.me/)**  
👤 Desenvolvido por: *Elizabeth Thomaz*  
📅 Data: Outubro de 2025  
