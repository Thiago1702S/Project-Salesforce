# Hackathon Salesforce

## Projeto: SkyLog Logistics

**Duração:** 20 a 30 horas\
**Nível:** Desenvolvedor Salesforce (Júnior → Pleno)

## Objetivo

Você foi contratado pela empresa **SkyLog Logistics**, uma empresa
nacional de logística que realiza entregas B2B e B2C.

Atualmente eles trabalham com planilhas, e-mails e WhatsApp.

Seu papel é desenvolver o primeiro CRM da empresa utilizando Salesforce.

## Cenário

A SkyLog possui:

-   250 funcionários
-   8 centros de distribuição
-   mais de 4.000 clientes ativos
-   cerca de 15.000 entregas por mês

Hoje existem diversos problemas:

-   pedidos perdidos
-   entregas atrasadas
-   clientes sem retorno
-   dificuldade para acompanhar motoristas
-   ausência de indicadores

O CEO decidiu centralizar toda operação no Salesforce.

## O que será desenvolvido

Você será responsável por desenvolver o MVP.

Não existe nenhuma configuração pronta.

# Módulo 1 --- Cadastro de Clientes

## Requisitos

Criar cadastro de clientes utilizando Account + Contact.

Informações obrigatórias:

-   Empresa
-   CNPJ
-   Segmento
-   Telefone
-   Email
-   Cidade
-   Estado
-   Status
-   Data de cadastro
-   Classificação (A, B ou C)

### Regras

-   CNPJ não pode duplicar.
-   Status:
    -   Ativo
    -   Inativo
    -   Bloqueado
-   Se um cliente ficar Bloqueado, nenhum pedido poderá ser criado.

# Módulo 2 --- Pedidos

Criar objeto custom **Delivery Order**.

Campos:

-   Número
-   Cliente
-   Origem
-   Destino
-   Valor
-   Peso
-   Data prevista
-   Status
-   Motorista
-   Prioridade
-   Observações

Status:

-   Criado
-   Em preparação
-   Em rota
-   Entregue
-   Cancelado

### Regras

-   Número automático.
-   Peso não pode ser negativo.
-   Valor maior que zero.
-   Ao mudar para **Entregue**:
    -   Gravar Data de Entrega.
    -   Enviar e-mail ao cliente.

# Módulo 3 --- Motoristas

Objeto **Driver**.

Campos:

-   Nome
-   CPF
-   CNH
-   Categoria
-   Telefone
-   Status
-   Centro de Distribuição

Status:

-   Disponível
-   Em rota
-   Férias
-   Inativo

### Regras

-   CPF único.
-   Não permitir exclusão.

# Módulo 4 --- Veículos

Objeto **Vehicle**.

Campos:

-   Placa
-   Modelo
-   Tipo
-   Capacidade
-   Ano
-   Status
-   Motorista Atual

### Regras

-   Placa única.
-   Capacidade positiva.

Status:

-   Disponível
-   Em manutenção
-   Em rota

# Módulo 5 --- Atribuição de Motorista

-   Apenas motoristas disponíveis podem ser atribuídos.
-   Ao iniciar rota:
    -   Motorista → Em rota
    -   Veículo → Em rota
-   Ao finalizar:
    -   Motorista → Disponível
    -   Veículo → Disponível

# Módulo 6 --- SLA

Prioridades:

-   Normal: 5 dias
-   Urgente: 2 dias
-   Expressa: 24 horas

Criar:

-   Fórmula Dias Restantes
-   Semáforo:
    -   Verde
    -   Amarelo
    -   Vermelho

# Módulo 7 --- Dashboard

Criar dashboards contendo:

-   Pedidos por Status
-   Pedidos por Cidade
-   Pedidos por Motorista
-   Entregas no Prazo
-   Entregas Atrasadas
-   Receita Mensal
-   Top 10 Clientes

# Módulo 8 --- Segurança

Perfis:

-   Operador
-   Supervisor
-   Gerente

Permissões:

-   Operador: cria pedidos, não exclui.
-   Supervisor: edita e aprova cancelamentos.
-   Gerente: acesso total.

# Módulo 9 --- Automações

Flows:

1.  Novo Cliente → Enviar e-mail de boas-vindas.
2.  Pedido atrasado → Criar Task para supervisor.
3.  Pedido entregue → Atualizar indicadores e enviar e-mail.

# Módulo 10 --- Apex

Implementar:

-   Trigger Framework
-   Handler
-   Service
-   Selector
-   Domain
-   Factory
-   Classe utilitária
-   Bulkification
-   Cobertura mínima de 85%

# Módulo 11 --- Lightning

Criar:

-   Lightning Record Pages
-   Dynamic Forms
-   Highlights Panel
-   Related Lists
-   Quick Actions

# Módulo 12 --- LWC

Criar um painel operacional mostrando:

-   Entregas em rota
-   Motoristas disponíveis
-   Pedidos atrasados
-   Indicadores por cores

# Módulo 13 --- Integração

REST API:

``` http
POST /delivery
```

Recebe:

-   Cliente
-   Origem
-   Destino
-   Peso
-   Valor

Retorna:

-   Número do Pedido
-   Status

``` http
GET /delivery/{id}
```

# Módulo 14 --- Testes

Entregar:

-   Testes Apex
-   Testes de Flow
-   Plano de testes
-   Casos de teste
-   Massa de dados

# Bônus

-   Integração com CEP
-   Google Maps
-   PDF de comprovante
-   Batch Apex
-   Scheduled Apex
-   Platform Events
-   Change Data Capture

# Critérios de Avaliação

  Critério               Peso
  -------------------- ------
  Modelagem de Dados      15%
  Automações              15%
  Apex                    25%
  LWC                     15%
  Segurança               10%
  Integração              10%
  Boas práticas           10%

# Entregáveis

-   Diagrama de objetos
-   Documento de requisitos
-   Solução arquitetural
-   Aplicação configurada
-   Código Apex com testes
-   LWC funcional
-   Flows implementados
-   APIs documentadas
-   Dashboard executivo
-   Apresentação final de 15--20 minutos
