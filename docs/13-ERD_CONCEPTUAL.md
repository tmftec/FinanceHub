# ERD CONCEITUAL

## ERD Conceitual do FinanceHub

**Documento:** 13-ERD_CONCEPTUAL.md

**Versão:** 1.0

**Status:** Em elaboração

**Objetivo**

Definir a representação estrutural conceitual do domínio do FinanceHub, derivando sua estrutura diretamente dos conceitos e relacionamentos estabelecidos no Domain Model.

O ERD Conceitual estabelece como os conceitos do domínio se organizam e se relacionam, preparando a transição para o modelo físico e para a implementação da plataforma.

Este documento não define tabelas, campos, tipos de dados, chaves técnicas, índices, tecnologias de banco de dados ou qualquer outra decisão específica de implementação.

---

# 1. Objetivo

O ERD Conceitual representa a estrutura do domínio do FinanceHub a partir dos conceitos e relacionamentos definidos no Domain Model.

Seu objetivo é transformar a compreensão conceitual do domínio em uma representação estrutural que permita identificar:

- quais conceitos possuem representação estrutural própria;
- como essas representações se relacionam;
- quais relações são obrigatórias ou opcionais;
- quais conceitos dependem de outros;
- quais estruturas são necessárias para preservar a realidade representada pelo domínio.

O ERD Conceitual constitui a ponte entre o **Domain Model** e o **ERD Físico**.

Ele deve permitir que pessoas e Inteligências Artificiais compreendam a estrutura necessária para materializar o domínio sem introduzir prematuramente decisões técnicas.

---

## 1.1 — Derivação a partir do Domain Model

O ERD Conceitual deverá ser derivado exclusivamente dos conceitos, relacionamentos, natureza e limites estabelecidos no Domain Model.

O Domain Model responde:

> **O que existe no domínio e como esses conceitos se relacionam?**

O ERD Conceitual responde:

> **Como esses conceitos precisam ser estruturados para representar essas relações?**

Nenhuma estrutura deverá ser criada no ERD Conceitual apenas por conveniência de implementação.

Quando uma necessidade estrutural não puder ser justificada pelo domínio, ela deverá ser considerada uma decisão técnica e permanecer fora deste documento.

---

## 1.2 — O ERD Conceitual não redefine o domínio

O ERD Conceitual não possui autoridade para alterar o significado dos conceitos definidos no Domain Model.

Caso a construção do modelo revele que:

- um conceito está incompleto;
- uma relação é inconsistente;
- uma cardinalidade não pode ser determinada;
- ou uma estrutura necessária não possui fundamento no domínio;

a questão deverá retornar ao Domain Model para análise antes de ser incorporada ao ERD.

Dessa forma, o modelo estrutural permanece consequência da compreensão do domínio, e não sua fonte de definição.

---

## 1.3 — Conceito de domínio não implica entidade estrutural

A existência de um conceito no Domain Model não determina automaticamente que ele deverá possuir uma representação estrutural independente no ERD.

Cada conceito deverá ser analisado de acordo com seu papel no domínio e com a necessidade de representar suas relações de forma estrutural.

Um conceito poderá:

- possuir representação estrutural própria;
- ser representado por meio de outro conceito;
- atuar como informação derivada;
- ou não exigir representação estrutural independente.

Essa decisão deverá ser tomada no contexto do ERD Conceitual, sem antecipar decisões pertencentes ao modelo físico.

---

## 1.4 — Independência tecnológica

O ERD Conceitual deverá permanecer independente de:

- banco de dados;
- tabelas físicas;
- tipos de dados;
- chaves técnicas;
- índices;
- APIs;
- frameworks;
- mecanismos de armazenamento;
- tecnologias de Inteligência Artificial.

Essas decisões pertencem às etapas posteriores de modelagem e implementação.

---

## 1.5 — Preservação da linguagem canônica

Os nomes utilizados no ERD Conceitual deverão respeitar a linguagem canônica estabelecida pelo Domain Model.

Um conceito não deverá receber um novo nome apenas para facilitar sua representação estrutural.

Quando houver necessidade de utilizar uma terminologia técnica para representar uma estrutura, essa terminologia não deverá substituir o conceito de domínio.

---

## 1.6 — Estrutura deve preservar a realidade

O ERD Conceitual deverá priorizar a fidelidade à realidade representada pelo FinanceHub.

Uma estrutura aparentemente mais simples não deverá ser adotada quando provocar:

- perda de informação relevante;
- distorção de relacionamentos;
- fragmentação artificial de acontecimentos;
- obrigatoriedade inexistente no domínio;
- ou dependência estrutural que não exista na realidade.

O objetivo não é produzir o menor modelo possível.

O objetivo é produzir **o modelo estrutural mais simples capaz de representar corretamente o domínio**.

---

## 1.7 — Princípio fundamental

O ERD Conceitual deverá obedecer à seguinte cadeia:

```text
REALIDADE FINANCEIRA
        ↓
DOMAIN MODEL
        ↓
ERD CONCEITUAL
        ↓
ERD FÍSICO
        ↓
IMPLEMENTAÇÃO


```
# 2. Critérios de Representação Conceitual

A representação estrutural dos conceitos do Domain Model deverá ser determinada a partir de critérios conceituais, e não pela simples transformação de cada conceito em uma entidade.

O objetivo é identificar quais conceitos necessitam de uma representação estrutural própria para que o domínio seja preservado adequadamente.

A classificação de um conceito deverá considerar seu significado, suas relações, sua independência e sua necessidade de representação ao longo do tempo.

---

## 2.1 — Identidade conceitual

Um conceito deverá ser considerado candidato a uma representação estrutural própria quando possuir identidade conceitual reconhecível dentro do domínio.

A identidade deverá representar algo que possa ser distinguido de outros elementos do mesmo tipo sem depender exclusivamente de suas características momentâneas.

A existência de identidade conceitual, isoladamente, não determina que o conceito deverá se tornar uma entidade estrutural.

---

## 2.2 — Existência conceitual própria

Deverá ser avaliado se o conceito possui significado próprio dentro do domínio ou se existe exclusivamente como parte de outro conceito.

Conceitos que possuem significado próprio tendem a exigir maior independência estrutural.

Conceitos cuja existência depende integralmente de outro conceito poderão ser representados como parte desse conceito, quando isso preservar adequadamente o domínio.

---

## 2.3 — Relações próprias

Um conceito deverá ser analisado quanto à existência de relações próprias com outros conceitos.

Quando um conceito participa de múltiplos relacionamentos que precisam ser compreendidos ou preservados independentemente, isso constitui evidência a favor de uma representação estrutural própria.

A existência de um relacionamento, entretanto, não implica automaticamente a criação de uma entidade.

---

## 2.4 — Continuidade ao longo do tempo

Deverá ser considerado se a representação conceitual precisa permanecer identificável ao longo do tempo para preservar a realidade do domínio.

Conceitos cuja existência ou significado precisam ser acompanhados durante diferentes acontecimentos poderão exigir representação estrutural própria.

Essa análise representa uma necessidade conceitual de continuidade e não constitui uma decisão sobre mecanismos técnicos de persistência.

---

## 2.5 — Evolução e alteração de contexto

Deverá ser avaliado se o conceito pode adquirir novas informações, relações ou estados ao longo de sua existência sem deixar de representar o mesmo elemento conceitual.

Quando essa evolução fizer parte da natureza do conceito, uma representação estrutural própria poderá ser necessária para preservar sua trajetória.

---

## 2.6 — Composição e dependência

Quando um conceito representar uma parte identificável de outro conceito, deverá ser analisado se sua existência depende estruturalmente do conceito principal.

Um conceito composto poderá possuir representação própria quando:

- sua individualidade for relevante para o domínio;
- sua composição precisar ser preservada;
- suas características forem relevantes para a compreensão do conceito principal;
- ou sua participação puder ocorrer de forma múltipla dentro do conceito principal.

A representação própria de um componente não significa que ele possua independência em relação ao conceito do qual faz parte.

---

## 2.7 — Conceitos derivados

Conceitos que representam conhecimento, interpretação, resultado ou capacidade derivada de outros conceitos deverão ser analisados de forma diferente dos conceitos que representam elementos diretamente observáveis da realidade.

A existência de um conceito derivado no Domain Model não implica automaticamente uma representação estrutural independente.

Quando seu valor puder ser obtido a partir de outros conceitos e não houver necessidade conceitual de preservar uma identidade própria, ele poderá permanecer como resultado ou interpretação derivada.

---

## 2.8 — Informação versus conceito estrutural

Uma informação pertencente a um conceito não deverá ser transformada em um conceito estrutural independente apenas porque pode possuir valor analítico.

O ERD Conceitual deverá distinguir entre:

- elementos que possuem existência conceitual própria;
- informações que caracterizam outro conceito;
- relações entre conceitos;
- conhecimentos derivados da interpretação do domínio.

Essa distinção evita a fragmentação desnecessária do modelo.

---

## 2.9 — Independência não significa obrigatoriedade

Um conceito poderá possuir representação estrutural própria e, ainda assim, ser opcional para a Pessoa.

A necessidade de representação estrutural deverá ser determinada pela natureza do conceito, e não pela obrigatoriedade de sua existência em todas as situações.

O fato de um conceito ser opcional não constitui argumento suficiente para eliminá-lo do modelo estrutural.

---

## 2.10 — Simplicidade sem perda de significado

Entre duas estruturas capazes de representar o domínio corretamente, deverá ser preferida aquela que apresentar menor complexidade conceitual sem perda de significado, relações ou capacidade de evolução.

A simplificação não deverá:

- eliminar conceitos relevantes;
- criar dependências inexistentes;
- transformar relações em informações inadequadas;
- fragmentar acontecimentos;
- ou impor obrigações inexistentes no domínio.

O objetivo é alcançar a estrutura conceitual mais simples que preserve integralmente o significado do domínio.

---

## 2.11 — Regra de decisão

A decisão sobre a representação estrutural de um conceito deverá considerar o conjunto dos critérios deste capítulo.

Nenhum critério isolado deverá determinar automaticamente a criação ou eliminação de uma representação estrutural.

A classificação deverá considerar, em conjunto:

1. identidade conceitual;
2. existência conceitual própria;
3. relações próprias;
4. continuidade ao longo do tempo;
5. evolução e alteração de contexto;
6. composição e dependência;
7. natureza derivada ou não derivada;
8. distinção entre informação e conceito;
9. opcionalidade;
10. simplicidade sem perda de significado.

Quando houver dúvida sobre a necessidade de uma representação estrutural, a decisão deverá ser fundamentada na preservação do domínio e na necessidade real de representar suas relações.

---

## 2.12 — Retorno ao Domain Model

Se a aplicação destes critérios revelar que um conceito não possui definição suficiente para determinar sua representação estrutural, o ERD Conceitual não deverá criar uma solução por conveniência.

A questão deverá retornar ao Domain Model para análise e decisão.

Da mesma forma, se uma estrutura necessária para representar corretamente o domínio não puder ser justificada pelos conceitos e relacionamentos existentes, sua inclusão deverá ser precedida de revisão do Domain Model.

O ERD Conceitual permanece, portanto, uma consequência do domínio e não uma fonte silenciosa de novos conceitos.

----------

# 3. Classificação dos Conceitos

Os conceitos definidos no Domain Model deverão ser analisados segundo os critérios estabelecidos no Capítulo 2 antes de receberem uma representação estrutural no ERD Conceitual.

A classificação não determina a implementação física.

Seu objetivo é identificar a natureza estrutural de cada conceito dentro do modelo conceitual e estabelecer quais conceitos precisam possuir representação própria para preservar o domínio.

---

## 3.1 — Pessoa

### Classificação

**Representação estrutural própria.**

### Fundamentação

Pessoa possui identidade conceitual própria e constitui o principal sujeito da realidade financeira representada pelo FinanceHub.

Sua existência não depende de outros conceitos do domínio.

Pessoa estabelece múltiplas relações com outros conceitos, incluindo Contas Financeiras, Eventos Financeiros e Objetivos Financeiros.

Sua representação precisa permanecer identificável ao longo do tempo para que a plataforma possa contextualizar a evolução da realidade financeira do mesmo sujeito.

### Conclusão

Pessoa deverá possuir representação estrutural própria no ERD Conceitual.

---

## 3.2 — Conta Financeira

### Classificação

**Representação estrutural própria.**

### Fundamentação

Conta Financeira representa uma relação financeira identificável e possui significado próprio dentro da realidade financeira.

Ela estabelece relações com Pessoa, Instituição Financeira e Eventos Financeiros.

Sua identidade precisa permanecer reconhecível ao longo do tempo para que os acontecimentos financeiros possam ser contextualizados dentro da relação financeira correspondente.

### Conclusão

Conta Financeira deverá possuir representação estrutural própria no ERD Conceitual.

---

## 3.3 — Evento Financeiro

### Classificação

**Representação estrutural própria.**

### Fundamentação

Evento Financeiro representa um acontecimento da realidade financeira e constitui uma das principais unidades de observação do domínio.

Um evento pode possuir relações com Pessoa, Conta Financeira, Organização, Instituição Financeira, Componentes Financeiros e outros elementos contextuais.

O evento precisa permanecer identificável para que seu contexto, composição e histórico possam ser compreendidos.

### Conclusão

Evento Financeiro deverá possuir representação estrutural própria no ERD Conceitual.

---

## 3.4 — Componente Financeiro

### Classificação

**Representação estrutural própria, dependente de Evento Financeiro.**

### Fundamentação

Componente Financeiro representa uma parte identificável de um Evento Financeiro complexo.

Embora possua identidade conceitual própria dentro da composição do evento, sua existência depende do Evento Financeiro ao qual pertence.

Sua representação independente é necessária quando múltiplos componentes precisam ser preservados e analisados individualmente sem transformar cada componente em um novo Evento Financeiro.

### Conclusão

Componente Financeiro deverá possuir representação estrutural própria no ERD Conceitual, mantendo dependência conceitual de Evento Financeiro.

---

## 3.5 — Organização

### Classificação

**Representação estrutural própria.**

### Fundamentação

Organização representa um agente externo com o qual a Pessoa estabelece relações econômicas.

Sua existência é independente da Pessoa e dos acontecimentos financeiros específicos.

Uma mesma Organização pode participar de múltiplos Eventos Financeiros ao longo do tempo, tornando necessária a preservação de sua identidade para contextualizar essas relações.

### Conclusão

Organização deverá possuir representação estrutural própria no ERD Conceitual.

---

## 3.6 — Instituição Financeira

### Classificação

**Representação estrutural própria.**

### Fundamentação

Instituição Financeira representa uma organização que mantém ou disponibiliza relações e serviços financeiros utilizados pela Pessoa.

Possui existência independente de uma Conta Financeira específica e pode estar relacionada a múltiplas Contas Financeiras.

Sua identidade deve permanecer reconhecível para preservar o contexto institucional das relações financeiras.

### Conclusão

Instituição Financeira deverá possuir representação estrutural própria no ERD Conceitual.

---

## 3.7 — Objetivo Financeiro

### Classificação

**Representação estrutural própria e opcional.**

### Fundamentação

Objetivo Financeiro representa uma intenção declarada pela Pessoa em relação a um estado financeiro desejado.

Possui significado próprio, depende conceitualmente da Pessoa que o estabelece e pode evoluir ao longo do tempo.

Sua representação precisa ser preservada independentemente dos Eventos Financeiros que posteriormente possam ser relacionados ao objetivo.

A opcionalidade do conceito não elimina a necessidade de representação própria quando um objetivo existir.

### Conclusão

Objetivo Financeiro deverá possuir representação estrutural própria no ERD Conceitual, sendo sua existência opcional para a Pessoa.

---

## 3.8 — Memória Financeira

### Classificação

**Conceito derivado; representação estrutural a determinar.**

### Fundamentação

Memória Financeira representa conhecimento acumulado pelo FinanceHub a partir da observação da realidade financeira da Pessoa.

Embora seja um conceito fundamental do domínio, sua natureza é derivada dos acontecimentos e demais informações observadas.

Sua representação estrutural não deverá ser determinada apenas pela existência do conceito.

Será necessário avaliar, nas etapas seguintes, se a preservação de sua identidade, evolução e relações exige uma representação própria ou se sua natureza poderá ser estruturalmente representada por meio de outros conceitos.

### Conclusão

Memória Financeira permanece reconhecida no domínio, mas sua representação estrutural própria **não será definida neste momento**.

---

## 3.9 — Inteligência Financeira

### Classificação

**Capacidade derivada; sem representação estrutural própria definida neste momento.**

### Fundamentação

Inteligência Financeira representa a capacidade do FinanceHub de interpretar o conhecimento disponível sobre a realidade financeira da Pessoa.

Ela não representa diretamente um elemento independente da realidade financeira nem constitui, por si só, uma entidade estrutural obrigatória.

Sua atuação depende do conhecimento produzido a partir de outros conceitos do domínio.

### Conclusão

Inteligência Financeira não será convertida automaticamente em uma representação estrutural própria no ERD Conceitual.

Sua participação estrutural será considerada apenas quando uma necessidade concreta de representação for identificada.

---

## 3.10 — Descoberta Contextual

### Classificação

**Conhecimento derivado; representação estrutural a determinar.**

### Fundamentação

Descoberta Contextual representa uma compreensão relevante produzida pela Inteligência Financeira a partir do conhecimento disponível.

Ela não constitui um acontecimento financeiro da realidade original, mas um resultado da interpretação realizada pela plataforma.

Sua natureza pode exigir preservação própria quando a descoberta precisar ser acompanhada, relacionada, confirmada ou aprofundada ao longo do tempo.

Entretanto, essa necessidade ainda deverá ser demonstrada pela estrutura conceitual antes que uma representação própria seja estabelecida.

### Conclusão

Descoberta Contextual permanece reconhecida no domínio, mas sua representação estrutural própria **não será definida neste momento**.

---

## 3.11 — Evolução Financeira

### Classificação

**Conceito derivado e longitudinal; representação estrutural a determinar.**

### Fundamentação

Evolução Financeira representa a transformação da relação da Pessoa com sua realidade financeira ao longo do tempo.

Ela não corresponde a um acontecimento isolado, mas à interpretação de mudanças acumuladas.

Sua natureza longitudinal pode exigir preservação de conhecimento sobre diferentes momentos da trajetória financeira.

Entretanto, não deverá ser transformada automaticamente em uma entidade estrutural apenas por possuir existência conceitual.

Sua necessidade de representação própria deverá ser determinada pela estrutura necessária para preservar a trajetória e as relações relevantes do domínio.

### Conclusão

Evolução Financeira permanece reconhecida no domínio, mas sua representação estrutural própria **não será definida neste momento**.

---

# 3.12 — Classificação consolidada

A classificação inicial dos conceitos é:

| Conceito | Classificação estrutural |
|---|---|
| Pessoa | Representação própria |
| Conta Financeira | Representação própria |
| Evento Financeiro | Representação própria |
| Componente Financeiro | Representação própria dependente |
| Organização | Representação própria |
| Instituição Financeira | Representação própria |
| Objetivo Financeiro | Representação própria opcional |
| Memória Financeira | Derivado — representação a determinar |
| Inteligência Financeira | Capacidade derivada |
| Descoberta Contextual | Derivado — representação a determinar |
| Evolução Financeira | Derivado longitudinal — representação a determinar |

Esta classificação constitui uma primeira decisão estrutural do ERD Conceitual e deverá ser validada pelos relacionamentos e pelas cardinalidades antes de ser considerada definitiva.

---

# 3.13 — Regra de não antecipação estrutural

Nenhum conceito classificado como "representação a determinar" deverá ser transformado em entidade estrutural apenas para completar o diagrama.

Sua representação deverá ser estabelecida somente quando os relacionamentos, necessidades de preservação e comportamento do domínio demonstrarem sua necessidade.

Da mesma forma, nenhum conceito classificado como capacidade ou conhecimento derivado deverá ser eliminado do domínio por não possuir representação estrutural própria.

A estrutura do ERD deve representar aquilo que precisa ser estruturalmente preservado, e não reproduzir mecanicamente todos os conceitos do Domain Model.

----

# 4. Estrutura Conceitual do Núcleo

O núcleo estrutural do FinanceHub é formado pelos conceitos que representam diretamente a realidade financeira da Pessoa e as relações necessárias para contextualizar seus acontecimentos.

A estrutura apresentada neste capítulo deriva exclusivamente dos conceitos e relacionamentos estabelecidos no Domain Model e das classificações realizadas nos capítulos anteriores.

Este capítulo não define implementação física nem estabelece decisões técnicas de armazenamento.

---

## 4.1 — Pessoa como referência central

Pessoa constitui o principal elemento de referência do núcleo estrutural.

A realidade financeira representada pelo FinanceHub é contextualizada a partir da Pessoa, que pode estabelecer relações com Contas Financeiras, Eventos Financeiros e Objetivos Financeiros.

Conceitualmente:

    Pessoa
     ├── Conta Financeira
     ├── Evento Financeiro
     └── Objetivo Financeiro

A existência de uma Pessoa não depende da existência de qualquer um desses conceitos relacionados.

---

## 4.2 — Pessoa e Conta Financeira

Uma Conta Financeira representa uma relação financeira associada à Pessoa.

A Pessoa pode possuir múltiplas Contas Financeiras, enquanto uma Conta Financeira está associada ao contexto financeiro de uma Pessoa.

Conceitualmente:

    Pessoa
       │
       └── Contas Financeiras

A existência de uma Conta Financeira não é obrigatória para a existência da Pessoa.

A cardinalidade estrutural definitiva deverá ser formalizada no capítulo específico de cardinalidades, respeitando as regras estabelecidas no Domain Model.

---

## 4.3 — Pessoa e Evento Financeiro

Eventos Financeiros representam acontecimentos da realidade financeira associados à Pessoa.

A associação entre Pessoa e Evento Financeiro fornece o contexto fundamental para interpretar os acontecimentos financeiros representados pelo FinanceHub.

Essa relação não significa que a Pessoa necessariamente tenha criado ou registrado manualmente o evento.

O Evento Financeiro representa um acontecimento da realidade; a plataforma apenas o representa e interpreta.

Conceitualmente:

    Pessoa
       │
       └── Eventos Financeiros

A existência de Eventos Financeiros depende da existência de acontecimentos financeiros que possam ser associados à realidade da Pessoa.

A cardinalidade estrutural deverá ser formalizada posteriormente.

---

## 4.4 — Conta Financeira e Evento Financeiro

A Conta Financeira fornece contexto para Eventos Financeiros associados à relação financeira representada.

Conceitualmente:

    Conta Financeira
            │
            └── Eventos Financeiros

A associação entre Conta Financeira e Evento Financeiro não deverá ser interpretada como uma obrigatoriedade universal.

O Domain Model não estabelece que todo Evento Financeiro precise necessariamente estar associado a uma Conta Financeira identificada.

Quando a relação estiver disponível, ela deverá ser utilizada para contextualizar o acontecimento.

---

## 4.5 — Evento Financeiro e Componente Financeiro

Um Evento Financeiro pode possuir Componentes Financeiros quando o acontecimento for composto por elementos distintos que precisem ser individualmente representados.

Conceitualmente:

    Evento Financeiro
            │
            └── Componentes Financeiros

Componente Financeiro depende conceitualmente do Evento Financeiro ao qual pertence.

Um Componente Financeiro não representa um novo Evento Financeiro independente.

Essa estrutura permite representar acontecimentos compostos sem fragmentar artificialmente a realidade.

Exemplo:

    Evento Financeiro
    Boleto de R$ 2.150
            │
            ├── Aluguel
            ├── Condomínio
            ├── Água
            ├── Energia
            └── Taxa extraordinária

A existência de Componentes Financeiros é opcional, pois nem todo Evento Financeiro precisa possuir composição identificável.

---

## 4.6 — Conta Financeira e Instituição Financeira

Uma Conta Financeira pode estar associada a uma Instituição Financeira quando aplicável.

Conceitualmente:

    Instituição Financeira
            │
            └── Contas Financeiras

A associação não deverá ser tratada como obrigatória em todos os casos, pois o Domain Model estabelece que a identificação da Instituição Financeira pode não estar disponível ou não ser aplicável.

Uma Instituição Financeira pode estar relacionada a múltiplas Contas Financeiras.

A cardinalidade definitiva será estabelecida posteriormente.

---

## 4.7 — Organização e Evento Financeiro

Uma Organização pode originar ou participar de Eventos Financeiros.

Conceitualmente:

    Organização
          │
          └── Eventos Financeiros

A relação permite contextualizar acontecimentos envolvendo empresas, instituições, estabelecimentos, prestadores de serviços e outros agentes econômicos.

Nem todo Evento Financeiro precisa estar associado a uma Organização.

Um Evento Financeiro pode também estar relacionado a uma Organização sem que isso implique que a Organização seja a única origem ou participante do acontecimento.

A cardinalidade e a natureza exata da participação deverão ser formalizadas posteriormente.

---

## 4.8 — Pessoa e Objetivo Financeiro

Uma Pessoa pode estabelecer Objetivos Financeiros.

Conceitualmente:

    Pessoa
       │
       └── Objetivos Financeiros

Objetivo Financeiro é opcional.

A ausência de Objetivos Financeiros não impede a existência ou o funcionamento da realidade financeira representada pelo FinanceHub.

Quando existir, o Objetivo Financeiro deverá possuir representação própria e permanecer associado à Pessoa que o estabeleceu.

A cardinalidade definitiva será formalizada posteriormente.

---

## 4.9 — Relações que não constituem estruturas independentes neste momento

O ERD Conceitual não deverá criar automaticamente relações estruturais independentes entre:

- Pessoa e Organização;
- Pessoa e Instituição Financeira;
- Instituição Financeira e Evento Financeiro.

Essas relações podem ser compreendidas por meio das estruturas já estabelecidas, especialmente através de Contas Financeiras e Eventos Financeiros.

Uma relação independente somente deverá ser criada caso sua necessidade seja demonstrada pelo domínio.

---

## 4.10 — Estrutura conceitual consolidada

O núcleo estrutural pode ser representado conceitualmente da seguinte forma:

    Pessoa
      │
      ├── Conta Financeira
      │        │
      │        └── Instituição Financeira
      │
      ├── Evento Financeiro
      │        │
      │        └── Componente Financeiro
      │
      └── Objetivo Financeiro

    Organização
      │
      └── Evento Financeiro

A representação acima demonstra os principais conceitos e suas relações conceituais, sem estabelecer ainda direção, cardinalidade ou decisões de implementação.

---

## 4.11 — Limite da estrutura do núcleo

O núcleo apresentado neste capítulo representa somente os conceitos cuja necessidade de representação estrutural própria já foi suficientemente demonstrada.

Memória Financeira, Descoberta Contextual e Evolução Financeira permanecem reconhecidas no domínio, mas não são incorporadas ao núcleo estrutural neste momento.

Inteligência Financeira permanece como capacidade derivada da plataforma e não constitui uma entidade estrutural própria.

A representação desses conceitos será analisada em capítulo específico, caso os relacionamentos e necessidades de preservação demonstrem sua necessidade.

---

## 4.12 — Regra de preservação do domínio

Nenhuma relação apresentada neste capítulo deverá ser interpretada como mais forte do que a relação definida no Domain Model.

Quando o domínio estabelece uma relação como opcional, o ERD deverá preservar essa opcionalidade.

Quando o domínio não estabelece uma cardinalidade, o ERD deverá manter a decisão em aberto até que ela possa ser fundamentada.

O ERD Conceitual não deverá utilizar convenções estruturais para criar regras que não existam no domínio.


-------

# 5. Relacionamentos Conceituais

Os relacionamentos conceituais representam as associações existentes entre os conceitos estruturais do FinanceHub.

Cada relacionamento deverá preservar o significado estabelecido no Domain Model, sem introduzir novas regras, obrigatoriedades ou cardinalidades que ainda não tenham sido determinadas.

A natureza de cada relacionamento deverá ser compreendida antes da definição de sua cardinalidade.

---

## 5.1 — Pessoa e Conta Financeira

Pessoa e Conta Financeira estabelecem uma relação de associação contextual.

Uma Conta Financeira está associada ao contexto financeiro de uma Pessoa.

A relação não deverá ser interpretada como uma definição de propriedade jurídica da Conta Financeira.

Uma Pessoa pode estar associada a múltiplas Contas Financeiras.

A existência de uma Conta Financeira não é obrigatória para a existência da Pessoa.

A multiplicidade definitiva da relação deverá ser formalizada posteriormente.

---

## 5.2 — Pessoa e Evento Financeiro

Pessoa e Evento Financeiro estabelecem uma relação de contextualização da realidade financeira.

Eventos Financeiros representam acontecimentos da realidade financeira associados à Pessoa.

A relação não significa que a Pessoa tenha necessariamente criado, registrado ou provocado manualmente o Evento Financeiro.

O Evento Financeiro representa um acontecimento da realidade; o FinanceHub representa e interpreta esse acontecimento dentro do contexto financeiro da Pessoa.

A multiplicidade definitiva da relação deverá ser formalizada posteriormente.

---

## 5.3 — Conta Financeira e Evento Financeiro

Conta Financeira e Evento Financeiro estabelecem uma relação de contextualização financeira.

Uma Conta Financeira pode fornecer o contexto financeiro associado a um Evento Financeiro quando essa relação for conhecida ou aplicável.

A associação não deverá ser interpretada como obrigatória para todos os Eventos Financeiros.

O Domain Model não estabelece que todo Evento Financeiro precise estar associado a uma Conta Financeira identificada.

A possibilidade de um Evento Financeiro estar associado a uma ou múltiplas Contas Financeiras ainda não está determinada no domínio e deverá ser analisada antes da definição da cardinalidade.

---

## 5.4 — Evento Financeiro e Componente Financeiro

Evento Financeiro e Componente Financeiro estabelecem uma relação de composição conceitual.

Um Evento Financeiro pode ser composto por múltiplos Componentes Financeiros.

O Componente Financeiro representa uma parte identificável do Evento Financeiro e depende conceitualmente do evento ao qual pertence.

Um Componente Financeiro não representa um novo Evento Financeiro independente.

A composição permite representar acontecimentos complexos sem fragmentar artificialmente a realidade financeira.

A existência de Componentes Financeiros é opcional, pois nem todo Evento Financeiro precisa possuir uma composição identificável.

---

## 5.5 — Pessoa e Objetivo Financeiro

Pessoa e Objetivo Financeiro estabelecem uma relação de intenção.

Uma Pessoa pode estabelecer Objetivos Financeiros relacionados à sua realidade financeira.

Objetivo Financeiro é opcional.

A ausência de Objetivos Financeiros não impede a existência ou o funcionamento da realidade financeira representada pelo FinanceHub.

Quando existir, o Objetivo Financeiro permanece associado à Pessoa que o estabeleceu.

A multiplicidade definitiva da relação deverá ser formalizada posteriormente.

---

## 5.6 — Conta Financeira e Instituição Financeira

Conta Financeira e Instituição Financeira estabelecem uma relação de associação.

Uma Conta Financeira pode estar associada a uma Instituição Financeira quando aplicável.

A ausência dessa associação não invalida a existência da Conta Financeira.

Uma Instituição Financeira pode estar relacionada a múltiplas Contas Financeiras.

A possibilidade de uma Conta Financeira estar associada simultaneamente a múltiplas Instituições Financeiras ainda não está determinada no domínio e deverá ser analisada antes da definição da cardinalidade.

---

## 5.7 — Organização e Evento Financeiro

Organização e Evento Financeiro estabelecem uma relação de participação.

Uma Organização pode originar ou participar de Eventos Financeiros.

A participação de uma Organização permite contextualizar acontecimentos envolvendo empresas, instituições, estabelecimentos, prestadores de serviços e outros agentes econômicos.

Nem todo Evento Financeiro precisa estar associado a uma Organização.

A distinção entre os papéis de origem e participação ainda deverá ser analisada para determinar se representam papéis distintos dentro de uma mesma relação ou se exigem relações estruturais diferentes.

A multiplicidade e os papéis específicos de uma Organização em um Evento Financeiro ainda deverão ser formalizados.

---

## 5.8 — Relações estruturais não estabelecidas

O ERD Conceitual não deverá criar relações estruturais independentes entre conceitos quando essas relações não tiverem sido estabelecidas como necessárias pelo Domain Model.

Neste momento, não serão estabelecidas como relações estruturais independentes:

- Pessoa e Organização;
- Pessoa e Instituição Financeira;
- Instituição Financeira e Evento Financeiro.

A existência de relações indiretas entre esses conceitos não constitui, por si só, fundamento para a criação de uma relação estrutural direta.

Uma relação estrutural independente poderá ser introduzida somente quando sua necessidade for demonstrada pelo domínio.

---

## 5.9 — Situações ainda não determinadas

Algumas situações relevantes ainda não possuem definição suficiente no Domain Model para que sejam formalizadas no ERD Conceitual.

Entre elas estão:

### Evento Financeiro envolvendo múltiplas Pessoas

Ainda não está determinado se um mesmo Evento Financeiro pode estar associado estruturalmente a múltiplas Pessoas.

### Evento Financeiro envolvendo múltiplas Contas Financeiras

Ainda não está determinado se um mesmo Evento Financeiro pode estar associado a duas ou mais Contas Financeiras.

### Múltiplos papéis de uma Organização

Ainda não está determinado se uma Organização pode exercer simultaneamente diferentes papéis dentro de um mesmo Evento Financeiro e se esses papéis precisam possuir representação estrutural própria.

Essas situações não deverão ser resolvidas por conveniência do ERD.

Deverão ser analisadas quando houver informação suficiente para fundamentar sua representação.

---

## 5.10 — Relação conceitual não implica cardinalidade

A existência de uma relação conceitual não determina automaticamente sua cardinalidade.

A cardinalidade deverá ser estabelecida somente após a análise conjunta:

- do significado da relação;
- da opcionalidade;
- da multiplicidade possível;
- da dependência conceitual;
- e das regras estabelecidas no Domain Model.

O ERD Conceitual não deverá utilizar cardinalidades presumidas apenas porque uma determinada configuração parece tecnicamente conveniente.

---

## 5.11 — Princípio de preservação dos relacionamentos

Os relacionamentos do ERD Conceitual deverão preservar a linguagem e o significado definidos no Domain Model.

Uma relação não deverá ser fortalecida, enfraquecida, dividida ou combinada sem justificativa conceitual.

Quando o Domain Model não fornecer informação suficiente para determinar uma característica estrutural da relação, essa característica deverá permanecer explicitamente em aberto até que possa ser fundamentada.

O objetivo é garantir que o ERD Conceitual seja uma representação fiel dos relacionamentos do domínio e não uma interpretação técnica antecipada.

---------

# 6. Dependência e Opcionalidade Conceitual

A definição dos relacionamentos do ERD Conceitual deve distinguir claramente três dimensões diferentes:

- existência da relação;
- dependência conceitual;
- opcionalidade.

Essas dimensões deverão ser estabelecidas antes da definição das cardinalidades.

---

## 6.1 — Existência da relação

A existência de uma relação indica que dois conceitos possuem uma associação reconhecida no domínio.

A existência da relação não determina, por si só:

- quantos elementos podem participar;
- se a relação é obrigatória;
- se um conceito depende do outro;
- ou como a relação será implementada.

Essas características deverão ser determinadas separadamente.

---

## 6.2 — Dependência conceitual

Existe dependência conceitual quando a existência ou o significado de um conceito depende da existência de outro conceito.

A dependência deverá ser determinada pelo significado do domínio e não pela forma como os conceitos serão armazenados.

Quando um conceito depende de outro, essa dependência deverá ser preservada no ERD Conceitual.

---

## 6.3 — Composição como forma de dependência

A relação entre Evento Financeiro e Componente Financeiro constitui uma relação de composição.

O Componente Financeiro representa uma parte identificável de um Evento Financeiro e não representa um acontecimento financeiro independente.

Conceitualmente:

    Evento Financeiro
            │
            └── Componente Financeiro

O Componente Financeiro depende conceitualmente do Evento Financeiro ao qual está associado.

A existência dessa dependência não deverá ser confundida com uma simples relação de associação.

---

## 6.4 — Associação não implica dependência

Nem toda relação existente entre dois conceitos estabelece dependência conceitual.

Por exemplo:

    Pessoa
       │
       └── Conta Financeira

A existência de uma Conta Financeira está associada ao contexto financeiro de uma Pessoa, mas a relação não deverá ser interpretada automaticamente como uma dependência conceitual equivalente à existente entre Evento Financeiro e Componente Financeiro.

A natureza da relação deverá determinar se existe dependência.

---

## 6.5 — Opcionalidade

Uma relação é opcional quando um conceito pode existir sem participar dessa relação.

A opcionalidade deverá ser analisada individualmente para cada relação.

A existência de um conceito opcional não significa que ele seja irrelevante para o domínio.

Significa apenas que sua ausência não impede a existência do conceito ao qual ele poderia estar relacionado.

---

## 6.6 — Objetivo Financeiro como relação opcional

Pessoa e Objetivo Financeiro possuem uma relação opcional.

Uma Pessoa pode existir sem possuir Objetivos Financeiros.

Conceitualmente:

    Pessoa
       │
       └── Objetivo Financeiro

A ausência de Objetivo Financeiro não impede a existência ou o funcionamento da realidade financeira representada pelo FinanceHub.

Objetivo Financeiro permanece, portanto, como conceito estrutural próprio e opcional.

---

## 6.7 — Instituição Financeira como associação opcional

A relação entre Conta Financeira e Instituição Financeira é opcional.

Uma Conta Financeira pode estar associada a uma Instituição Financeira quando essa informação estiver disponível ou for aplicável.

A ausência da associação não invalida a existência da Conta Financeira.

Conceitualmente:

    Conta Financeira
            │
            └── Instituição Financeira

A opcionalidade da relação não elimina a necessidade de representar Instituição Financeira como conceito estrutural próprio.

---

## 6.8 — Evento Financeiro e Conta Financeira

A relação entre Evento Financeiro e Conta Financeira também não deverá ser considerada obrigatória em todos os casos.

Um Evento Financeiro pode possuir associação com uma Conta Financeira quando essa relação for conhecida ou aplicável.

A ausência dessa associação não invalida o Evento Financeiro.

O Domain Model ainda não determina se um Evento Financeiro pode estar associado a uma ou múltiplas Contas Financeiras.

Essa questão deverá permanecer em aberto até a definição das cardinalidades.

---

## 6.9 — Evento Financeiro e Organização

A relação entre Evento Financeiro e Organização não deverá ser considerada obrigatória para todos os Eventos Financeiros.

Uma Organização pode originar ou participar de um Evento Financeiro.

Nem todo Evento Financeiro precisa estar associado a uma Organização.

A natureza dos papéis de origem e participação ainda não está suficientemente determinada para estabelecer se constituem papéis distintos de uma mesma relação ou relações estruturais diferentes.

Essa decisão deverá permanecer em aberto.

---

## 6.10 — Pessoa e Evento Financeiro

A associação entre Pessoa e Evento Financeiro fornece o contexto da realidade financeira representada.

Eventos Financeiros são contextualizados em relação à Pessoa dentro da realidade financeira representada pelo FinanceHub.

A associação não deverá ser interpretada como uma relação de propriedade.

As situações envolvendo um mesmo Evento Financeiro associado a múltiplas Pessoas ainda não estão determinadas no Domain Model.

Essa questão deverá permanecer em aberto até que exista fundamento conceitual suficiente para sua definição.

---

## 6.11 — Pessoa e Conta Financeira

A associação entre Pessoa e Conta Financeira fornece o contexto da relação financeira representada.

Uma Pessoa pode estar associada a múltiplas Contas Financeiras.

A existência de uma Conta Financeira não é obrigatória para a existência da Pessoa.

A natureza dessa associação não deverá ser interpretada como propriedade jurídica da Conta Financeira.

As situações especiais de compartilhamento, múltiplas Pessoas ou alteração de associação ainda não estão determinadas no Domain Model e não deverão ser inferidas pelo ERD.

---

## 6.12 — Dependência, opcionalidade e cardinalidade são dimensões distintas

Dependência, opcionalidade e cardinalidade não deverão ser tratadas como sinônimos.

Uma relação pode ser:

- existente, mas opcional;
- existente e dependente;
- existente sem dependência;
- ou ainda possuir multiplicidade não determinada.

A cardinalidade deverá ser definida somente depois que a natureza da relação, sua dependência e sua opcionalidade tiverem sido estabelecidas.

---

## 6.13 — Regra de não inferência

O ERD Conceitual não deverá criar dependências ou obrigatoriedades apenas porque elas parecem convenientes para a estrutura.

Quando o Domain Model não fornecer informação suficiente para determinar:

- dependência;
- opcionalidade;
- multiplicidade;
- ou papel dentro de uma relação;

a característica deverá permanecer explicitamente em aberto.

A ausência de uma decisão não deverá ser substituída por uma suposição estrutural.

---

## 6.14 — Preparação para cardinalidades

Após a definição de dependência e opcionalidade, as relações poderão ser analisadas quanto à sua multiplicidade.

Somente nessa etapa deverão ser estabelecidas cardinalidades como:

    0..1
    1..1
    0..N
    1..N
    N..N

As cardinalidades deverão representar as regras do domínio e não limitações ou convenções da implementação física.

O Capítulo 7 deverá formalizar essa análise.

-------------

# 7. Cardinalidades Conceituais

A cardinalidade representa a multiplicidade possível de elementos que participam de uma relação conceitual.

Sua definição deverá ser derivada do significado da relação, de sua opcionalidade, de sua dependência e das regras estabelecidas no Domain Model.

A cardinalidade não deverá ser determinada por convenções de implementação ou por escolhas técnicas.

Quando o domínio não fornecer informação suficiente para estabelecer uma cardinalidade, a relação deverá permanecer explicitamente indeterminada até que exista fundamento suficiente para sua definição.

---

## 7.1 — Notação adotada

O ERD Conceitual utilizará a seguinte notação para representar multiplicidade:

- `0..1` — nenhum ou um;
- `1..1` — exatamente um;
- `0..N` — nenhum ou vários;
- `1..N` — um ou vários;

A notação representa multiplicidade conceitual e não constitui definição de implementação física.
? é utilizado neste documento exclusivamente para indicar uma extremidade cuja cardinalidade ainda não foi determinada; não constitui uma notação de cardinalidade.

---

## 7.2 — Pessoa e Conta Financeira

Uma Pessoa pode estar associada a nenhuma, uma ou múltiplas Contas Financeiras.

A existência de Conta Financeira não é obrigatória para a existência da Pessoa.

A multiplicidade conhecida da relação é:

    Pessoa 0..N ─── Conta Financeira ?

O Domain Model não fornece fundamento suficiente, neste estágio, para determinar se uma mesma Conta Financeira pode estar associada a uma ou múltiplas Pessoas.

Essa característica deverá permanecer em aberto até que exista regra de domínio suficiente para sua definição.

---

## 7.3 — Pessoa e Evento Financeiro

Uma Pessoa pode estar associada a nenhum, um ou múltiplos Eventos Financeiros.

A existência de Evento Financeiro não é necessária para a existência da Pessoa.

A multiplicidade conhecida da relação é:

    Pessoa 0..N ─── Evento Financeiro ?

O Domain Model não fornece fundamento suficiente, neste estágio, para determinar se um mesmo Evento Financeiro pode estar associado a uma ou múltiplas Pessoas.

Essa característica deverá permanecer em aberto até que exista regra de domínio suficiente para sua definição.

---

## 7.4 — Conta Financeira e Evento Financeiro

Uma Conta Financeira pode estar associada a nenhum, um ou múltiplos Eventos Financeiros.

A multiplicidade conhecida da relação é:

    Conta Financeira 0..N ─── Evento Financeiro ?

A cardinalidade do lado de Evento Financeiro permanece indeterminada.

O Domain Model estabelece que:

- um Evento Financeiro pode possuir associação com uma Conta Financeira quando essa relação for conhecida ou aplicável;
- nem todo Evento Financeiro precisa possuir uma Conta Financeira identificada;
- uma Conta Financeira pode contextualizar múltiplos Eventos Financeiros.

Entretanto, não está determinado se um mesmo Evento Financeiro pode estar associado a uma única Conta Financeira ou a múltiplas Contas Financeiras.

Essa decisão deverá permanecer em aberto até que exista fundamento conceitual suficiente.

---

## 7.5 — Evento Financeiro e Componente Financeiro

Um Evento Financeiro pode não possuir Componentes Financeiros ou pode possuir múltiplos Componentes Financeiros.

Cada Componente Financeiro depende conceitualmente de um Evento Financeiro.

A relação é representada como:

    Evento Financeiro 0..N ─── Componente Financeiro 1..1

A cardinalidade indica que:

- um Evento Financeiro pode não possuir composição;
- um Evento Financeiro pode possuir um ou vários Componentes Financeiros;
- um Componente Financeiro está associado a exatamente um Evento Financeiro;
- um Componente Financeiro não representa um Evento Financeiro independente.

A relação possui natureza de composição e dependência conceitual.

---

## 7.6 — Pessoa e Objetivo Financeiro

Uma Pessoa pode não possuir Objetivos Financeiros ou pode possuir múltiplos Objetivos Financeiros.

A multiplicidade conhecida da relação é:

    Pessoa 0..N ─── Objetivo Financeiro ?

O Domain Model estabelece que Objetivo Financeiro é opcional e que uma Pessoa pode estabelecer Objetivos Financeiros.

Entretanto, a documentação atualmente disponível para esta etapa não fornece fundamento suficiente para congelar a multiplicidade do lado de Objetivo Financeiro.

Essa característica deverá permanecer em aberto até que a regra canônica correspondente seja formalmente confrontada.

A ausência de Objetivos Financeiros não impede a existência ou o funcionamento da realidade financeira representada pelo FinanceHub.

---

## 7.7 — Conta Financeira e Instituição Financeira

Uma Instituição Financeira pode estar associada a nenhuma, uma ou múltiplas Contas Financeiras.

A multiplicidade conhecida da relação é:

    Instituição Financeira 0..N ─── Conta Financeira ?

A ausência de Instituição Financeira não invalida a existência de uma Conta Financeira.

O Domain Model estabelece a possibilidade de associação entre Conta Financeira e Instituição Financeira, mas não fornece informação suficiente, neste estágio, para determinar se uma mesma Conta Financeira pode estar associada a uma ou múltiplas Instituições Financeiras.

Essa característica deverá permanecer em aberto até que exista fundamento suficiente para sua definição.

---

## 7.8 — Organização e Evento Financeiro

Uma Organização pode estar associada a nenhum, um ou múltiplos Eventos Financeiros.

A multiplicidade conhecida da relação é:

    Organização 0..N ─── Evento Financeiro ?

Uma Organização pode originar ou participar de Eventos Financeiros.

Nem todo Evento Financeiro precisa estar associado a uma Organização.

A cardinalidade do lado de Evento Financeiro permanece indeterminada porque o Domain Model ainda não estabelece:

- se um Evento Financeiro pode envolver múltiplas Organizações;
- se origem e participação representam papéis distintos;
- ou se esses papéis exigem representação estrutural diferente.

Essas decisões deverão ser resolvidas antes que a cardinalidade completa dessa relação seja congelada.

---

## 7.9 — Cardinalidades parcialmente determinadas

Uma cardinalidade parcialmente determinada ocorre quando o domínio fornece fundamento suficiente para estabelecer uma extremidade da multiplicidade, mas não fornece fundamento suficiente para determinar a outra.

Neste estágio, permanecem parcialmente determinadas:

- Pessoa e Conta Financeira;
- Pessoa e Evento Financeiro;
- Conta Financeira e Evento Financeiro;
- Pessoa e Objetivo Financeiro;
- Conta Financeira e Instituição Financeira;
- Organização e Evento Financeiro.

A relação entre Evento Financeiro e Componente Financeiro possui cardinalidade determinada neste estágio.

As relações parcialmente determinadas não deverão receber cardinalidades presumidas apenas para completar o diagrama.

---

## 7.10 — Cardinalidade indeterminada não implica ausência de relação

Quando uma cardinalidade permanece indeterminada, isso não significa que a relação conceitual não exista.

Significa apenas que sua multiplicidade ainda não foi formalmente estabelecida.

Portanto:

    relação existente ≠ cardinalidade determinada

O ERD deverá preservar a existência da relação e registrar explicitamente a característica ainda não determinada.

---

## 7.11 — Cardinalidade e opcionalidade

A cardinalidade incorpora informação de multiplicidade e opcionalidade da relação, mas não substitui a análise conceitual realizada nos capítulos anteriores.

A definição de `0..N`, por exemplo, representa que uma relação pode não ocorrer ou ocorrer múltiplas vezes.

Entretanto, a cardinalidade não deverá ser utilizada para inferir dependência conceitual.

Dependência e cardinalidade permanecem dimensões distintas do modelo.

---

## 7.12 — Cardinalidade e dependência

A relação entre Evento Financeiro e Componente Financeiro demonstra que cardinalidade e dependência devem ser analisadas conjuntamente, mas não são equivalentes.

A relação:

    Evento Financeiro 0..N ─── Componente Financeiro 1..1

indica simultaneamente que:

- um Evento pode não possuir Componentes;
- um Evento pode possuir múltiplos Componentes;
- cada Componente está associado a um Evento;
- o Componente depende conceitualmente desse Evento.

A cardinalidade descreve a multiplicidade.

A dependência descreve a natureza da existência do conceito relacionado.

---

## 7.13 — Regra de não preenchimento

Nenhuma cardinalidade deverá ser preenchida apenas para eliminar uma lacuna visual no ERD.

Quando o Domain Model não fornecer fundamento suficiente para determinar uma das extremidades da relação, essa extremidade deverá permanecer explicitamente indeterminada.

Uma cardinalidade incorreta é mais prejudicial ao modelo do que uma cardinalidade temporariamente não determinada.

---

## 7.14 — Regra de não inferência entre extremidades

A cardinalidade conhecida de uma extremidade de uma relação não deverá ser utilizada, isoladamente, para inferir a cardinalidade da extremidade oposta.

Por exemplo:

    Pessoa 0..N ─── Conta Financeira ?

não permite concluir automaticamente que:

    Conta Financeira 1..1 ─── Pessoa

Da mesma forma:

    Pessoa 0..N ─── Evento Financeiro ?

não permite concluir automaticamente que:

    Evento Financeiro 1..1 ─── Pessoa

A cardinalidade de cada extremidade deverá ser fundamentada individualmente pelas regras do domínio.

---

## 7.15 — Critério para congelamento

Uma cardinalidade somente poderá ser considerada congelada quando:

1. a existência da relação estiver confirmada;
2. sua natureza estiver compreendida;
3. sua opcionalidade estiver determinada;
4. sua multiplicidade estiver fundamentada no domínio;
5. não houver interpretação alternativa relevante ainda não resolvida.

Até que essas condições sejam atendidas, a cardinalidade deverá permanecer em estado de análise.

---

## 7.16 — Estado atual das cardinalidades

O estado atual do modelo é:

    Pessoa 0..N ─── Conta Financeira ?

    Pessoa 0..N ─── Evento Financeiro ?

    Conta Financeira 0..N ─── Evento Financeiro ?

    Evento Financeiro 0..N ─── Componente Financeiro 1..1

    Pessoa 0..N ─── Objetivo Financeiro ?

    Instituição Financeira 0..N ─── Conta Financeira ?

    Organização 0..N ─── Evento Financeiro ?

As relações com cardinalidade ainda indeterminada deverão ser objeto de análise específica antes do congelamento definitivo do ERD Conceitual.

-------------


