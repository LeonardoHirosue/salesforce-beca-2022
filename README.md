# Empresa XPTO

### **Sumário**
1. [Requisitos de Negócio](#requisitos-de-negócio)
2. [Usuários](#👤-users)
3. [Requisitos de Administrador](#requisitos-de-administrador)
4. [Schema Builder](#💾-schema-builder)
5. [Requisitos de Desenvolvimento](#requisitos-de-desenvolvimento)
6. [Melhorias](#📈-melhorias)
7. [Próximos Passos](#🎯-próximos-passos)
8. [Fluxo de Apresentação (Anexo)](#⏭-fluxo-de-apresentação)

<br>

---
<br>


### **Requisitos de Negócio**

- [x] O sistema deverá permitir o cadastro de clientes apenas dos seguintes países: Brasil, Canadá, EUA, México, Argentina, Uruguai, Espanha, Portugal, Itália, França, Alemanha, Japão, Coréia do Sul, Austrália, Nova Zelândia.
- [x] O caso deve ser registrado pelo Atendente.
- [x] O sistema deverá permitir que o gestor(_"Contract Manager"_), do atendente confirme a solicitação e altere o seu "Tipo" para **Instalação**  ou **Suporte**.
- [x] A alteração e acompanhamento dos chamados deve ser feito pelo agente de suporte responsável pelo atendimento e por seu gestor.
- [x] O sistema deverá apresentar apenas as informações relevantes para cada tipo de registro (Instalação de uma nova máquina e Prestação de suporte á uma máquina com defeito).
- [x] Importante que todos os chamados possam ser agrupados para visualização dos operadores, para no caso de o cliente ligar para saber posicionamento.
- [x] As informações dos chamados abertos deverão estar *visíveis* para todos os operadores do sistema
- [x] todas as classes Apex criadas para o processo deverão ter cobertura de teste de, no mínimo 75%, abrangendo os diferentes cenários.
    - [x] CalculateCsatController → 100%
    - [ ] <s>UpdateOwnerCaseTrigger → 0%</s>

<br>

---
<br>

## 👤 **Users**
User                        | Profile           | Permission Sets
----------------------------|:-----------------:|:-----------------:|
josh.smith@sample.com       |Attendant User     |-                  |
emily.carter@sample.com     |Contract Manager   |-                  |
All users                   |-                  |View Open Cases    |
<br>

---
<br>

## 🧩 App: Service
<br>

### **Requisitos de Administrador**

- [x] Criação de Campos (picklist, fórmula, data, customizados).
- [x] Record Types.
- [x] Page Layout.
- [x] Regras de Validação. (Endereço da Conta não pode estar vazia, Países por Picklist)
- [ ] Dashboard

<br>

Objects              | Custom Fields | Record Types       | Support Process    | Page Layout        | Light Web Component | Validation Rules   |
---------------------|:-------------:|:------------------:|:------------------:|:------------------:|:-------------------:|:------------------:|
Account<br><br><br>  | -             | -                  |-                   | Account Layout <br><br><br>| -           | Billing Address fields is required <br>Shipping Address fields is required <br>Limitation on country registration (Picklist). |
Product              | -             | -                  | -                   | Product Layout    | -                   | -                  |
Entitlement<br><br>  | -             | -                  | -                   | Entitlement Layout <br><br>| -       | Phone Service; <br>On Site Service. |
Assets               | -             | -                  | -                   | Assets Layout     | -                   |-                   | 
Contact              | -             | -                  | -                   | Contact Layout    | -                   |-                   |
Case<br><br><br><br><br><br><br><br> |Deadline__c <br> CSAT__c <br> Installation_Subject__c <br> Installation_Type__c <br> Installation_Description__c <br> Support_Subject__c <br> Support_Type__c <br> Support_Description__c |General <br>Support <br>Installation <br><br><br><br><br><br>|General <br>Support <br>Installation <br><br><br><br><br><br>| Case (General) Layout <br>Case (Support) Layout; <br>Case (Intallation) Layout <br> Case Layout <br><br><br><br><br>| CSAT  Avarage <br><br><br><br><br><br><br><br> | Field required by Page Layout <br><br><br><br><br><br><br><br> | 
<br>

---
<br>

## 💾 Schema Builder

![XPTO-DER](./DER%20-%20XPTO.png)

---
<br>

## 🔧 APEX
<br>

### **Requisitos de Desenvolvimento**

- [x] Apex Trigger(ChangeCaseOwner) e/ou Flow (Notificação e ChangeOwner).
- [x] Apex Class. (CalculateCSAT)
- [x] Apex Test Class. (Controller do component)
- [x] SOQL.
- [x] DML.
- [x] Light Web Component (LWC) – Criação. *(CSAT)*
- [x] Light Web Component (LWC) – Apex Controller.

<br>

Name                        | Flow          | Apex Class         | Apex Trigger        | Apex Test Class    | SOQL | DML | LWC | Apex Controller (LWC)|
----------------------------|:-------------:|:------------------:|:-------------------:|:------------------:|:----:|:---:|:---:|:--------------------:|
Update Case Owner           | ✔             |                    |                     |                    |      |     |     |                      |
Notificaty New Case To Manager     | ✔             |                    |                     |                    |      |     |     |                      |
[UpdateOwnerCaseTrigger](./force-app/main/default/triggers/UpdateOwnerCaseTrigger.trigger) | | |✔ |         |✔    |✔    |     |                      |
CSAT Avarage                |               |                    |                     |                    |      |     | ✔   |                      |
[CalculateCsatController](./force-app/main/default/classes/CalculateCsatController.cls)| | ✔ | |            |✔    |     |      | ✔                   |
[TestCalculateCsatController](./force-app/main/default/classes/TestCalculateCsatController.cls)| | | | ✔    |      |     |     |                      |
[TestDataFactory](./force-app/main/default/classes/TestDataFactory.cls)| | |           | ✔                  |      |✔    |     |                      |
<br>

---
<br>

## 📈 Melhorias
<br>

- [ ] Otimização do processo de Entitlements/Deadline utilizando Milestones;
- [ ] Facilitar visualização de Entitlements na página do Conta;
- [ ] Facilitar visualização de Cases na página da Conta;

<br>

---
<br>

## 🎯 Próximos passos
<br>

- [ ] Dashboard

<br>

---
<br>

## ⏭ Fluxo de Apresentação

![Fluxo de Apresentação - Beca 2022](./Fluxo%20de%20Apresenta%C3%A7%C3%A3o%20(Beca%202022).png)

---
<!-- ## Acessos

https://xpto-beta-2022-dev-ed.lightning.force.com
username: leonardo@developer.sandbox

username: emily.carter@sample.com
password: beca2022

username: josh.smith@sample.com
password: beca2022 -->




