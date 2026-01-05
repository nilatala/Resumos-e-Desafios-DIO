# 🚀 Projeto ETL com Fake API e Google Gemini

## 📌 Sobre o Desafio

Este projeto foi desenvolvido como parte do **desafio prático da DIO – Santander Dev Week**, cujo objetivo é a construção de um **portfólio em Ciência de Dados**, explorando os conceitos de **Python** e o fluxo **ETL (Extração, Transformação e Carregamento)**.

O foco principal do desafio **não está na ferramenta utilizada**, mas sim em compreender como os dados fluem entre as etapas de extração, transformação e carregamento — cenário comum no dia a dia de profissionais da área de dados.

---

## 🚨 Indisponibilidade da API Original

A API pública utilizada no projeto original do desafio encontra-se **fora do ar**, pois foi desenvolvida em 2023 e hospedada em um serviço com custos de manutenção.

O próprio desafio orienta que, em casos como esse, o estudante **busque soluções alternativas**, refletindo situações reais enfrentadas por Cientistas e Analistas de Dados.

---

## 🛠️ Solução Adotada

Para manter a experiência de consumo de dados via API, foi utilizado o repositório:

🔗 **Fake-API-Santander-Dio**  
Autor: **Paulo H. Leme**  
https://github.com/PauloHLeme/Fake-API-Santander-Dio

Esse repositório simula uma **API local** com dados fictícios de clientes bancários, reproduzindo o comportamento da API apresentada nos vídeos do desafio.

A partir dessa base, foram realizadas **adaptações e extensões**, descritas a seguir.

---

## 🔄 Fluxo ETL Implementado

### 🔹 Extração
- Consumo de dados da **Fake API**, incluindo:
  - Usuários
  - Contas bancárias
  - Cartões de crédito
- A API local foi exposta para o Google Colab utilizando **ngrok**.

### 🔹 Transformação
- Geração de mensagens personalizadas de marketing utilizando a **API do Google Gemini**.
- A OpenAI, utilizada no projeto original, foi substituída por estar atualmente paga.
- As mensagens consideram o perfil do cliente (saldo e limite), **sem expor valores diretamente**.

### 🔹 Carregamento
- Salvamento das mensagens geradas em um novo arquivo (**CSV ou JSON**), consolidando os dados transformados.

---

## ⚙️ Tecnologias Utilizadas

- **Python 3.12**
- **FastAPI** – simulação da API local
- **Uvicorn** – servidor da API
- **Ngrok** – exposição da API local para o Google Colab
- **Google Gemini API** (`google-genai`)
- **Google Colab** – ambiente de execução
- **python-dotenv** – gerenciamento seguro da API Key

---

## 🔑 Configuração da API Key (Google Gemini)

1. Gerar a chave no **Google AI Studio**.
2. Criar um arquivo `.env` com o conteúdo:

''''
env
GOOGLE_API_KEY=SUA_CHAVE_AQUI
''''