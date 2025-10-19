# Projeto de Banco de Dados: Oficina Mecânica

Este projeto tem como objetivo modelar e implementar um banco de dados relacional para um sistema de gerenciamento de ordens de serviço em uma oficina mecânica. Ele foi desenvolvido em duas etapas:

1. **Modelagem Conceitual**: Identificação das entidades, atributos e relacionamentos com base em uma narrativa descritiva.
2. **Modelagem Lógica e Implementação**: Conversão do modelo conceitual para o modelo relacional, criação do esquema SQL, inserção de dados e desenvolvimento de consultas analíticas.

---

## 🧠 Modelo Conceitual

### 📝 Resumo da Narrativa

- Clientes levam veículos à oficina para manutenção ou reparos.
- Cada veículo é atribuído a uma equipe de mecânicos.
- A equipe identifica os serviços necessários e preenche uma ordem de serviço (OS).
- A OS inclui valores de mão de obra e peças utilizadas.
- O cliente autoriza a execução dos serviços.
- A mesma equipe realiza os serviços.
- Mecânicos possuem código, nome, endereço e especialidade.
- Cada OS possui número, data de emissão, valor total, status e data de conclusão.

### 📌 Entidades e Relacionamentos

| Entidade              | Atributos / Relacionamentos principais                                  |
|-----------------------|-------------------------------------------------------------------------|
| `client`            | `idClient`, `Pname`, `Minit`, `Lname`, `cel_phone`, `address`            |
| `vehicle`             | `idVehicle`, `model`, `license_plate`, pertence a um cliente        |
| `team`                | `idTeam`, `teamName`                                                  |
| `mechanic`            | `idMechanic`, `name`, `address`, `specialty`, pertence a uma equipe    |
| `workOrder`          | `idWorkOrder`, `issueDate`, `status`, `completionDate`, `totalAmount`, `license_plate`, vinculado a veículo e equipe |
| `replacementPart`    | `idPart`, `partName`, `unitPrice`                                    |
| `executedService`    | `idService`, `serviceDescription`, `laborCost`, vinculado à OS               |
| `workOrderPart`     | Tabela associativa entre OS e peças, com quantidade e preço unitário    |

---

## 🧱 Modelo Lógico e Implementação SQL

O banco foi implementado em MySQL. Todas as tabelas possuem chaves primárias, estrangeiras e constraints nomeadas para garantir integridade e clareza.

### 📂 Arquivos

- ![Modelo Conceitual](https://github.com/nilatala/Resumos-e-Desafios-DIO/blob/main/Desafios/Projeto_Logico_OS/Projeto_Ordem_de_Servico.png)
- Arquivo original em [modelo-conceitual.mwb](https://github.com/nilatala/Resumos-e-Desafios-DIO/blob/main/Desafios/Projeto_Logico_OS/modelo_OS.mwb).
- ![Script do Modelo Lógico](https://github.com/nilatala/Resumos-e-Desafios-DIO/blob/main/Desafios/Projeto_Logico_OS/OS_script.sql)

---

## 🔍 Exemplos de Consultas Analíticas

### 1. Clientes que moram em endereços com "Rua"
```sql
SELECT Pname, Minit, Lname, phone, address
FROM customer
WHERE address LIKE '%Rua%';
