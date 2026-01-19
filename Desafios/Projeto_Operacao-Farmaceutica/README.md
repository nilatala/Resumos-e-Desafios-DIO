# RELATÓRIO DE IMPLEMENTAÇÃO DE SERVIÇOS AWS

**Data:** 19/01/2026  
**Empresa:** Abstergo Industries  
**Responsável:** Elizabeth Thomaz  

---

## Introdução

Este relatório apresenta o processo de implementação de ferramentas na empresa Abstergo Industries, realizado por Elizabeth Thomaz. A proposta foi elencar 3 serviços AWS, com a finalidade de realizar diminuição de custos imediatos. 

A empresa, atuando como um **hub farmacêutico de distribuição**, não possuía previamente nenhuma infraestrutura em cloud. O objetivo principal deste projeto é demonstrar como a adoção de **serviços AWS** pode contribuir para a **redução imediata de custos operacionais**, além de melhorar a escalabilidade, a eficiência e o controle financeiro da operação.

---

## Descrição do Projeto

O projeto de implementação de ferramentas foi estruturado em **três etapas**, cada uma focada em um aspecto específico da redução de custos e da otimização da infraestrutura de TI.

---

### Etapa 1: Amazon S3 (Simple Storage Service)

- **Foco da ferramenta:** Armazenamento escalável e de baixo custo.
- **Descrição do caso de uso:**  
  O Amazon S3 foi proposto para armazenar documentos operacionais, relatórios, registros de pedidos, notas fiscais e backups.  
  A utilização de diferentes classes de armazenamento (Standard, Intelligent-Tiering e Glacier) permite reduzir custos, pois os dados são armazenados de acordo com sua frequência de acesso, eliminando a necessidade de servidores físicos locais.

- **Ganho principal:**  
  Redução de custos com infraestrutura física, alta durabilidade dos dados e escalabilidade automática.

---

### Etapa 2: Amazon EC2 com Auto Scaling

- **Foco da ferramenta:** Otimização do uso de recursos computacionais.
- **Descrição do caso de uso:**  
  A aplicação da empresa pode ser executada em instâncias Amazon EC2 configuradas com **Auto Scaling**, permitindo que a quantidade de servidores aumente ou diminua automaticamente conforme a demanda.  
  Dessa forma, a empresa evita o pagamento por servidores ociosos em períodos de baixa utilização, mantendo desempenho adequado apenas quando necessário.

- **Ganho principal:**  
  Pagamento sob demanda, evitando desperdício de recursos e reduzindo custos operacionais.

---

### Etapa 3: AWS Cost Explorer e AWS Budgets

- **Foco da ferramenta:** Monitoramento e controle de custos.
- **Descrição do caso de uso:**  
  O AWS Cost Explorer permite visualizar e analisar os gastos com os serviços AWS, facilitando a identificação de custos elevados.  
  Já o AWS Budgets possibilita a criação de limites de gastos e alertas automáticos, oferecendo maior previsibilidade financeira e evitando surpresas na fatura mensal.

- **Ganho principal:**  
  Maior controle financeiro e apoio direto à tomada de decisão do gestor.

---

## Conclusão

A implementação dos serviços AWS na empresa **Abstergo Industries** tem como principal benefício a **redução de custos operacionais**, aliada a uma infraestrutura escalável, segura e preparada para o crescimento do negócio.  

A adoção de cloud computing permite que a empresa pague apenas pelos recursos utilizados, eliminando gastos com manutenção de infraestrutura física e melhorando a eficiência dos processos internos.  
Recomenda-se a continuidade do uso das ferramentas apresentadas e a avaliação de novas tecnologias que possam trazer ganhos adicionais no futuro.

---

## Anexos

- Documentação oficial dos serviços AWS:
  - Amazon S3: https://docs.aws.amazon.com/s3/
  - Amazon EC2: https://docs.aws.amazon.com/ec2/
  - EC2 Auto Scaling: https://docs.aws.amazon.com/autoscaling/ec2/
  - AWS Cost Explorer: https://docs.aws.amazon.com/cost-management/latest/userguide/cost-explorer.html
  - AWS Budgets: https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html

- Diagrama de arquitetura da solução

        Usuários / Parceiros
                 |
                 v
        --------------------
        |  Aplicação Web   |
        |   (EC2 + ASG)    |
        --------------------
                 |
        --------------------
        |  Amazon S3       |
        |  (Documentos,    |
        |   Relatórios,    |
        |   Backups)       |
        --------------------
                 |
        --------------------
        | AWS Cost Explorer|
        | AWS Budgets      |
        --------------------

---

**Assinatura do Responsável pelo Projeto:**  

Elizabeth Thomaz

---

📎 **Projeto desenvolvido como parte do Bootcamp Santander 2025 - Ciência de Dados com Python [DIO](https://www.dio.me/)**  
👤 Desenvolvido por: *Elizabeth Thomaz*  
📅 Data: Janeiro de 2026