# 🚚 SkyLog Logistics

## Projeto Salesforce — Sistema de Gestão Logística

O **SkyLog Logistics** é um projeto desenvolvido em Salesforce para simular a implementação de um sistema de gestão logística, centralizando informações de clientes, pedidos, motoristas e veículos em uma única plataforma.

O projeto foi desenvolvido com foco em **modelagem de dados, automação de processos, regras de negócio, indicadores e desenvolvimento Apex**.

---

## 🎯 Objetivo

Criar um MVP para uma empresa de logística que anteriormente dependia de planilhas, e-mails e outros processos manuais.

A solução busca centralizar a operação e facilitar o acompanhamento de pedidos, entregas e indicadores.

---

## 🏗️ Principais recursos

### 👥 Gestão de clientes

* Cadastro de empresas utilizando `Account`
* Cadastro de contatos utilizando `Contact`
* Organização das informações dos clientes
* Relacionamento entre clientes e pedidos

### 📦 Gestão de pedidos

Foi criado o objeto customizado `Delivery_Order__c` para representar as entregas.

O processo contempla:

* Número do pedido
* Cliente
* Status
* Prioridade
* Motorista
* Veículo
* Origem
* Destino
* Data prevista de entrega
* Data de entrega
* Valor
* Peso
* Observações

### 🚛 Motoristas e veículos

O sistema possui estruturas específicas para gerenciamento de:

* Motoristas
* Veículos
* Disponibilidade
* Atribuição de recursos às entregas

### ⚙️ Regras de negócio

Foram implementadas regras para controlar o processo de entrega, incluindo:

* Validação de peso e valor
* Controle da evolução dos status
* Regras para início de rota
* Associação de motorista e veículo
* Preenchimento automático da data de entrega

### 🔄 Automação com Flow

Flows foram utilizados para automatizar processos da operação.

Um dos principais fluxos controla o início da rota e a atualização das informações relacionadas à entrega.

### 📊 Relatórios e Dashboard

Foram criados relatórios e indicadores para acompanhamento da operação, incluindo informações relacionadas a:

* Status dos pedidos
* Entregas
* Clientes
* Valores
* Desempenho operacional

---

## 💻 Desenvolvimento Apex

O projeto também utiliza Apex para implementar uma estrutura de código organizada para processamento das entregas.

A arquitetura utiliza separação de responsabilidades entre:

```text
Trigger
   ↓
Handler
   ↓
Service
```

Essa estrutura facilita a manutenção e permite evoluir as regras de negócio sem concentrar toda a lógica dentro do Trigger.

Também foram considerados conceitos como:

* Bulkification
* Governor Limits
* SOQL
* Collections
* Separação de responsabilidades

---

## 🛠️ Tecnologias e recursos

* Salesforce
* Apex
* SOQL
* Flow
* Lightning Experience
* Reports
* Dashboards
* Custom Objects
* Validation Rules
* Git / GitHub

---

## 📈 Evolução do projeto

O projeto está sendo desenvolvido de forma incremental, começando pela configuração da estrutura de dados e regras fundamentais e evoluindo para automações, indicadores e desenvolvimento Apex.

Novos recursos podem ser adicionados conforme a evolução do projeto.

---

## 📚 Objetivo de aprendizado

Este projeto foi desenvolvido como prática para consolidar conhecimentos em **Salesforce Development e Administration**, aplicando conceitos de:

* Modelagem de dados
* Automação de processos
* Regras de negócio
* Desenvolvimento Apex
* SOQL
* Relatórios e indicadores
* Arquitetura de código
* Boas práticas de desenvolvimento

---

## 👨‍💻 Autor

**Thiago Sobral Teodoro**

Estudante de Ciência da Computação

[LinkedIn](https://www.linkedin.com/in/thiago-sobral-teodoro-35323026b/)
