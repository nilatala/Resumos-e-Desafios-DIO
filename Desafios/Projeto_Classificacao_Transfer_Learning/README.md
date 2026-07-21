# 🚀 Treinamento de Redes Neurais com Transfer Learning

## 📌 Visão Geral

Este projeto foi desenvolvido como parte do desafio **Treinamento de Redes Neurais com Transfer Learning** da **DIO (Digital Innovation One)**.

O objetivo do projeto foi aplicar a técnica de **Transfer Learning** utilizando **Python** no ambiente **Google Colab**, explorando um modelo de Deep Learning previamente treinado para realizar a classificação de imagens entre duas classes: **gatos** e **cachorros**.

Durante o desenvolvimento, foram necessárias adaptações em relação ao projeto apresentado nas aulas. O modelo originalmente utilizado pelo curso, disponibilizado através do **TensorFlow Datasets (cats_vs_dogs)**, apresentou incompatibilidades durante a execução. Como alternativa, foi utilizado um conjunto de **5000 imagens selecionadas do Kaggle Cats and Dogs**, juntamente com o modelo **MobileNetV2**, disponibilizado pelo Keras Applications.

Essa adaptação permitiu manter o objetivo principal do desafio, aplicando os conceitos de Transfer Learning utilizando ferramentas amplamente empregadas em projetos reais de Visão Computacional.

---

## 🎯 Objetivos do Projeto

- Aplicar a técnica de Transfer Learning em um problema de classificação de imagens;
- Utilizar uma rede neural previamente treinada para reduzir tempo de treinamento;
- Compreender o processo de preparação dos dados, treinamento e validação do modelo;
- Documentar o projeto utilizando boas práticas no GitHub.

---

## 📊 Dataset

Foi utilizada uma seleção de **5.000 imagens** do dataset **Cats and Dogs**, disponível no Kaggle, distribuídas entre duas classes:

- Cats
- Dogs

As imagens foram organizadas em conjuntos de:

- Treinamento
- Teste

permitindo avaliar o desempenho do modelo durante o processo de treinamento.

---

## 🧩 Arquitetura Utilizada

O modelo utilizado foi o **MobileNetV2**, disponibilizado através do **Keras Applications**.

A MobileNetV2 é uma arquitetura de Rede Neural Convolucional (CNN) otimizada para tarefas de classificação de imagens, oferecendo excelente desempenho com baixo custo computacional.

Neste projeto foi aplicada a técnica de **Transfer Learning**, utilizando os pesos previamente treinados na base **ImageNet**. Inicialmente, as camadas convolucionais foram congeladas e apenas a camada classificadora adicionada ao modelo foi treinada.

---

## ⚙️ Tecnologias e Bibliotecas

### Ambiente
- Google Colab

### Linguagem
- Python

### Frameworks de Deep Learning
- TensorFlow
- Keras

### Modelo Pré-treinado
- MobileNetV2 (Keras Applications)

### Manipulação e Análise de Dados
- NumPy
- Pandas

### Processamento de Imagens
- OpenCV

### Machine Learning e Avaliação de Modelos
- Scikit-learn
  - Matriz de Confusão
  - Relatório de Classificação
  - Métricas de Avaliação

### Visualização de Dados
- Matplotlib
- Seaborn

### Versionamento
- Git
- GitHub

---

## 🔄 Desenvolvimento

As principais etapas realizadas foram:

1. Importação das bibliotecas necessárias;
2. Organização do dataset em conjuntos de treinamento e teste;
3. Pré-processamento das imagens;
4. Carregamento do modelo MobileNetV2 pré-treinado;
5. Congelamento das camadas convolucionais;
6. Adição da camada classificadora;
7. Treinamento da rede neural;
8. Avaliação do modelo utilizando os dados de teste.

---

## 🚨 Adaptações Realizadas

O projeto original utilizava o dataset **cats_vs_dogs** disponibilizado pelo TensorFlow Datasets.

Durante a implementação foram encontrados problemas relacionados ao carregamento do dataset. Após pesquisar alternativas e consultar a comunidade da DIO, foi adotada uma abordagem utilizando o dataset **Cats and Dogs** do Kaggle em conjunto com o modelo **MobileNetV2** do Keras Applications.

Essa adaptação permitiu manter os objetivos propostos pelo desafio, além de proporcionar uma experiência prática mais próxima de cenários encontrados em projetos reais de Machine Learning.

---

## 📊 Resultados

Após o treinamento, o modelo foi avaliado utilizando métricas de classificação e uma matriz de confusão, permitindo analisar o desempenho da rede neural na distinção entre as classes **gatos** e **cachorros**.

Foram utilizadas ferramentas do **Scikit-learn** para gerar métricas de avaliação, como o relatório de classificação (*Classification Report*) e a matriz de confusão, auxiliando na interpretação dos resultados obtidos.

A utilização do Transfer Learning permitiu aproveitar o conhecimento previamente aprendido pela MobileNetV2 para realizar a classificação entre gatos e cachorros com menor tempo de treinamento e menor necessidade de recursos computacionais.

Além disso, o projeto possibilitou consolidar conhecimentos sobre:

- Deep Learning;
- Redes Neurais Convolucionais (CNN);
- Transfer Learning;
- TensorFlow e Keras;
- Avaliação de modelos de classificação;
- Organização de projetos de Machine Learning.

---

## 📂 Estrutura do Repositório

```text
├── classificacao_transfer_learning.ipynb
├── classificacao_transfer_learning.py
├── requirements.txt
├── README.md
└── images/
    ├── convert.png
    ├── matriz_confusao.png
    ├── test_dog.png
    ├── training_cat.png
    └── training_dog.png
```

---

## 🔑 Arquivos do Repositório

- `transfer-learning.ipynb` → Notebook desenvolvido no Google Colab.
- `transfer-learning.py` → Versão do código em script Python, exportada a partir do notebook.
- `requirements.txt` → Lista das bibliotecas e dependências necessárias para executar o projeto.
- `README.md` → Documentação do projeto.
- `images/` → Capturas de tela do treinamento, resultados e demais imagens utilizadas na documentação.

---

## Referências

- [TensorFlow Documentation](https://www.tensorflow.org/datasets/catalog/cats_vs_dogs?hl=pt)
- [Keras Applications – MobileNetV2](https://keras.io/api/applications/mobilenet/mobilenet_models/#mobilenetv2-function)
- [Kaggle Cats and Dogs Dataset - completo](https://www.microsoft.com/en-us/download/details.aspx?id=54765)
- [Imagens Selecionadas - cat_dog](https://drive.google.com/file/d/10Zc6nKXZQDpWEj6zdyIW7ULCQ8ISd2B0/view)
- [Material do Bootcamp da DIO](https://www.dio.me/)

---

## 🎯 Considerações Finais

Este projeto permitiu aplicar os conceitos de **Transfer Learning** em um problema clássico de classificação de imagens, reforçando conhecimentos em **Deep Learning**, **Visão Computacional** e **TensorFlow/Keras**.

Além dos aspectos técnicos, o projeto evidenciou a importância da adaptação de soluções diante de dificuldades encontradas durante o desenvolvimento, característica comum em projetos reais de Ciência de Dados e Inteligência Artificial.

---

📎 **Projeto desenvolvido como parte da Formação Machine Learning Specialist – [DIO](https://web.dio.me/track/a7a92326-cb82-41e2-a150-0e5ede46a412)**

👤 **Desenvolvido por:** *Elizabeth Thomaz*

📅 **Data:** Julho de 2026