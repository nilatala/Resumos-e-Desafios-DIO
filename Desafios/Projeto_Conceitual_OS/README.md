# Projeto Conceitual de Banco de Dados – Oficina Mecânica

Este projeto foi desenvolvido como parte de um desafio de modelagem de banco de dados.  
O objetivo é construir um **esquema conceitual** para um sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica.

---

## 📖 Narrativa
- Clientes levam veículos à oficina para consertos ou revisões periódicas.  
- Cada veículo é designado a uma equipe de mecânicos, que identifica os serviços necessários e gera uma Ordem de Serviço (OS).  
- Cada OS possui número, data de emissão, data de conclusão, status e valor total.  
- O valor da OS é composto pelos serviços executados (consultados em uma tabela de referência de mão de obra) e pelas peças utilizadas.  
- Mecânicos possuem código, nome, endereço e especialidade.  
- A mesma equipe avalia e executa os serviços.  

---

## 📊 Modelo Conceitual
![Modelo Conceitual](https://github.com/nilatala/Resumos-e-Desafios-DIO/blob/main/Desafios/Projeto_Conceitual_OS/Projeto_OS.png)

Arquivo original em [modelo-conceitual.mwb](https://github.com/nilatala/Resumos-e-Desafios-DIO/blob/main/Desafios/Projeto_Conceitual_OS/modelo_OS.mwb).

---

## 🗂️ Entidades Principais
- **Cliente**: informações de identificação.  
- **Veículo**: associado a um cliente.  
- **Ordem de Serviço (OS)**: documento que reúne serviços e peças.  
- **Equipe**: conjunto de mecânicos responsável pela OS.  
- **Mecânico**: dados pessoais e especialidade.  
- **Serviço Executado**: tabela de referência de mão de obra.  
- **Peças de Reposição**: itens usados para reparo.  

---

## 🛠️ Ferramentas Utilizadas
- MySQL Workbench  
- GitHub  

---

