# Projeto Lógico de Banco de Dados: E-commerce

Este projeto consiste na modelagem e implementação de um banco de dados relacional para um cenário de e-commerce, com base em um modelo EER refinado. O objetivo é representar de forma precisa as entidades envolvidas no processo de compra e venda online, incluindo clientes (PF e PJ), produtos, fornecedores, vendedores, pedidos, entregas, pagamentos e estoques.

O projeto foi desenvolvido como parte de um desafio prático para consolidar conhecimentos em modelagem conceitual, lógica e física, além de aplicar comandos SQL para criação de esquemas, inserção de dados e consultas analíticas.

---

## 🧱 Estrutura do Banco de Dados

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

## 🛠️ Tecnologias Utilizadas

- **MySQL**: Sistema Gerenciador de Banco de Dados
- **Workbench/dbdiagram.io**: Ferramentas de modelagem (opcional)
- **SQL**: Linguagem para definição e manipulação dos dados

---

## 📂 Scripts

- `create_schema.sql`: Criação das tabelas, chaves primárias, estrangeiras e constraints
- `insert_data.sql`: Inserção de dados de exemplo para testes
- `queries.sql`: Consultas SQL com diferentes níveis de complexidade

---

## 🔍 Exemplos de Consultas SQL

### 🔹 Recuperação simples com `WHERE`
```sql
SELECT Fname, Lname, Address 
FROM client 
WHERE Address LIKE '%Centro%';