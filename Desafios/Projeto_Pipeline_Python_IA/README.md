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

```env
GOOGLE_API_KEY=SUA_CHAVE_AQUI
```

3. Carregar a variável de ambiente no Colab:

```python
from dotenv import load_dotenv
import os

load_dotenv('/content/drive/MyDrive/chave_api_gemini.env')
api_key = os.getenv("GOOGLE_API_KEY")
```

---

## 📡 Exposição da API com Ngrok

Como o Google Colab não acessa diretamente uma API local, foi utilizado o ngrok para criar um túnel público:

```bash
ngrok http 8000
```

A URL gerada é utilizada no código Python para consumir os dados da API.

---

## 🧩 Função de Geração de Mensagens

```python
def generate_ai_news(user):
  completion = client.models.generate_content(
    model="gemini-2.5-flash",
    config=types.GenerateContentConfig(
        system_instruction="Você é um especialista de marketing que trabalha faz anos para uma agência bancária."
    ),
    contents=f"Crie uma mensagem para {user['name']} sobre a importância dos investimentos. A mensagem deve ser feita levando em consideração o perfil de cliente baseado no seu saldo em conta de {user['account']['balance']} reais e seu limite do cartão de {user['card']['limit']} reais, porém, não fale de forma explícita o valor que o cliente tem ou insinuar que ele tem pouco ou muito dinheiro. A mensagem não deve ter mais de 100 caracteres."
  )
  return completion.text

for user in users:
  user.setdefault("news", [])
  news = generate_ai_news(user)
  print(news)
  user['news'].append({
      "icon": "https://digitalinnovationone.github.io/santander-dev-week-2023-api/icons/credit.svg",
      "description": news
  })

with open("users_with_news.json", "w", encoding="utf-8") as f:
    json.dump(users, f, indent=2, ensure_ascii=False)
  ```

---

## 📊 Resultados

- Mensagens personalizadas foram **geradas com sucesso** para cada cliente utilizando o modelo Gemini.  
- Todas as mensagens foram adicionadas ao campo `news` de cada usuário e **armazenadas em arquivo JSON** (`users_with_news.json`).  
- O fluxo **ETL** foi concluído com as seguintes etapas:
  - **Extração** → dados obtidos via Fake API ou arquivo CSV.  
  - **Transformação** → enriquecimento dos dados com IA generativa, criando mensagens personalizadas.  
  - **Carregamento** → salvamento dos dados finais em arquivo JSON para consulta e análise.


---

## 🎯 Conclusão

- Este projeto demonstra a capacidade de:
   - Adaptar soluções diante da indisponibilidade de fontes de dados.
   - Integrar diferentes ferramentas e serviços.
   - Aplicar o fluxo ETL em um cenário prático de Ciência de Dados com Python.
   - Trabalhar com APIs, IA generativa e ambientes em nuvem.

---

## 🤝 Créditos

A simulação da API local foi baseada no repositório
Fake-API-Santander-Dio, desenvolvido por Paulo H. Leme.

🔗 https://github.com/PauloHLeme/Fake-API-Santander-Dio

---

📎 **Projeto desenvolvido como parte do Bootcamp Santander 2025 - Ciência de Dados com Python [DIO](https://www.dio.me/)**  
👤 Desenvolvido por: *Elizabeth Thomaz*  
📅 Data: Janeiro de 2026  