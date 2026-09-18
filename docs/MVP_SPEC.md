# MVP SPEC

## Especificação do MVP do FinanceHub

**Documento:** MVP_SPEC.md

**Versão:** 1.0

**Status:** Em consolidação

**Objetivo**

Definir o contrato de execução do primeiro MVP real do FinanceHub.

Este documento traduz o domínio já definido em um escopo mínimo implementável, preservando a arquitetura necessária para a evolução futura sem tentar implementar, no MVP, toda a visão de longo prazo da plataforma.

O MVP não é um protótipo descartável. É a primeira implementação real do FinanceHub, com escopo deliberadamente reduzido e estrutura preparada para evolução.

---

# 1. Princípios do MVP

O MVP deverá respeitar os princípios já estabelecidos no Domain Model e no ERD Conceitual.

### MVP-001 — Domínio antes da implementação

A implementação deverá ser consequência do Domain Model e do ERD Conceitual. O MVP não deverá criar conceitos estruturais que não tenham fundamento nesses documentos.

### MVP-002 — Evento Financeiro como unidade central

O MVP deverá utilizar Evento Financeiro como a principal abstração para representar acontecimentos financeiros.

### MVP-003 — Registro sem dependência obrigatória de Conta Financeira

Um Evento Financeiro poderá ser registrado mesmo quando nenhuma Conta Financeira tiver sido identificada.

Quando conhecida ou aplicável, a Conta Financeira poderá contextualizar o evento.

### MVP-004 — Histórico preservado

O MVP não deverá apagar acontecimentos financeiros para corrigir seu estado. Alterações deverão preservar a identidade e o histórico do acontecimento.

### MVP-005 — Saldo como estado derivado

Saldo não será fonte primária de verdade. Os saldos deverão ser calculados a partir dos Eventos Financeiros considerados efetivados, utilizando mecanismos derivados ou snapshots somente como otimização futura.

### MVP-006 — Complexidade progressiva

O MVP deverá permitir registrar a realidade financeira com o menor esforço possível. Informações adicionais deverão ser opcionais quando não forem necessárias para representar o evento.

### MVP-007 — Preparação para evolução

Estruturas do MVP não deverão bloquear recursos futuros como recorrências, parcelamentos, planejamento, inteligência, integrações e importações.

Isso não significa implementar esses recursos no MVP.

---

# 2. Objetivo funcional do MVP

O MVP deverá permitir que uma Pessoa:

1. seja representada no FinanceHub;
2. cadastre ou tenha representadas suas Contas Financeiras conhecidas;
3. associe Contas Financeiras a Instituições Financeiras quando essa informação estiver disponível;
4. registre Eventos Financeiros reais ou conhecidos como futuros;
5. acompanhe os Eventos Financeiros em histórico;
6. confirme Eventos Financeiros futuros quando eles se tornarem efetivos;
7. visualize o Saldo Atual;
8. visualize o Saldo Previsto para o final do mês;
9. acompanhe como os eventos futuros conhecidos alteram a projeção;
10. consulte uma visão inicial consolidada da própria realidade financeira.

O objetivo do MVP é validar o núcleo do ciclo:

```text
REGISTRAR
   ↓
OBSERVAR
   ↓
CONFIRMAR
   ↓
RECALCULAR
   ↓
COMPREENDER
```

---

# 3. Escopo do MVP

## 3.1 — Pessoa

A Pessoa constitui o contexto principal da experiência.

O MVP deverá permitir representar uma Pessoa sem exigir que uma Conta Financeira ou Evento Financeiro já tenha sido identificado.

Não faz parte do MVP implementar estruturas avançadas de compartilhamento entre múltiplas Pessoas.

---

## 3.2 — Conta Financeira

O MVP deverá permitir representar Contas Financeiras conhecidas.

Uma Pessoa poderá estar associada a zero, uma ou múltiplas Contas Financeiras.

Uma Conta Financeira poderá estar associada a no máximo uma Instituição Financeira.

A associação com Instituição Financeira será opcional.

O MVP não deverá exigir que todas as informações possíveis de uma Conta Financeira sejam conhecidas para que ela possa ser representada.

---

## 3.3 — Instituição Financeira

O MVP deverá permitir contextualizar uma Conta Financeira com uma Instituição Financeira quando essa informação estiver disponível.

Uma Instituição Financeira poderá estar associada a múltiplas Contas Financeiras.

Não será criada relação estrutural direta entre Instituição Financeira e Evento Financeiro.

---

## 3.4 — Evento Financeiro

Evento Financeiro é o núcleo funcional do MVP.

O MVP deverá permitir registrar acontecimentos financeiros conhecidos pelo usuário, independentemente de terem sido obtidos manualmente ou por outra origem futura.

O MVP deverá contemplar, no mínimo, os seguintes tipos já definidos pelo domínio:

- Receita;
- Despesa;
- Transferência;
- Aplicação;
- Resgate;
- Compra Cartão;
- Pagamento Fatura;
- Estorno;
- Ajuste;
- Abertura de Conta;

A implementação deverá manter o conceito de Evento Financeiro único, evitando criar entidades diferentes para cada tipo de acontecimento quando isso não for necessário ao domínio.

---

## 3.5 — Estado do Evento

O MVP deverá representar a diferença entre eventos futuros conhecidos e eventos efetivados.

Os estados funcionais previstos são:

```text
Planejado
   ↓
Agendado
   ↓
Efetivado
```

A implementação deverá utilizar os estados PLANEJADO, AGENDADO e EFETIVADO, preservando esse comportamento conceitual.

O usuário deverá conseguir confirmar um evento futuro quando ele efetivamente ocorrer.

A confirmação deverá alterar o estado do evento e os cálculos derivados, sem apagar o registro anterior do acontecimento.

---

# 4. Saldo Atual e Saldo Previsto

## 4.1 — Saldo Atual

Saldo Atual representa o resultado financeiro derivado dos Eventos Financeiros considerados efetivados até o momento relevante da consulta.

O saldo não deverá ser mantido pelo usuário como um valor manualmente editável.

---

## 4.2 — Saldo Previsto

Saldo Previsto representa a projeção do saldo considerando os Eventos Financeiros futuros conhecidos para o período analisado.

No MVP, a principal referência será a projeção para o final do mês.

Conceitualmente:

```text
EVENTOS EFETIVADOS
       ↓
SALDO ATUAL

EVENTOS FUTUROS CONHECIDOS
       ↓
PROJEÇÃO
       ↓
SALDO PREVISTO
```

A projeção deverá ser derivada dos eventos e não de um saldo previsto informado manualmente.

---

## 4.3 — Confirmação e recálculo

Quando um Evento Financeiro futuro for confirmado:

1. o evento permanece identificado como o mesmo acontecimento;
2. seu estado é atualizado;
3. ele passa a compor o cálculo do Saldo Atual conforme a regra temporal aplicável;
4. deixa de ser tratado como evento futuro na projeção correspondente;
5. o Saldo Previsto é recalculado considerando os demais eventos futuros conhecidos.

Esse comportamento deverá preservar a continuidade histórica.

---

# 5. Componente Financeiro

O MVP deverá possuir estrutura compatível com Componente Financeiro, pois um Evento Financeiro pode ser composto por múltiplos elementos.

A utilização de componentes poderá ser simples na primeira experiência do usuário.

Todo Evento Financeiro que produza impacto financeiro deverá possuir pelo menos um Componente Financeiro.

Cada Componente Financeiro deverá permanecer conceitualmente dependente de um Evento Financeiro.

O MVP não deverá transformar cada componente em um Evento Financeiro independente.

---

# 6. Histórico Financeiro

O MVP deverá disponibilizar uma visão cronológica dos Eventos Financeiros.

O histórico deverá permitir distinguir, no mínimo:

- eventos efetivados;
- eventos futuros conhecidos;
- eventos confirmados;
- eventos ainda não efetivados.

O histórico deverá preservar a trajetória dos acontecimentos representados.

Não deverá existir exclusão física como mecanismo normal de correção de eventos.

Quando um evento precisar ser corrigido, cancelado, estornado ou ajustado, o comportamento deverá preservar a rastreabilidade do acontecimento conforme as regras de negócio que serão detalhadas posteriormente.

---

# 7. Dashboard inicial

O MVP deverá possuir uma visão inicial simples e objetiva da realidade financeira.

O dashboard deverá apresentar, no mínimo:

- Saldo Atual;
- Saldo Previsto para o final do mês;
- receitas efetivadas do período;
- despesas efetivadas do período;
- eventos futuros conhecidos relevantes;
- evolução da projeção até o final do mês.

O dashboard não deverá tentar implementar toda a camada de Inteligência Financeira prevista para versões futuras.

---

# 8. Registro de Eventos

O registro deverá privilegiar a linguagem natural e a baixa fricção.

A experiência deverá permitir que a Pessoa informe um acontecimento sem precisar conhecer a estrutura interna do domínio.

Exemplos conceituais:

```text
Recebi meu salário de R$ 5.000 no dia 5.

Tenho uma conta de luz de R$ 280 para pagar dia 20.

Paguei R$ 120 no supermercado hoje.
```

A interface poderá apresentar campos estruturados quando isso reduzir ambiguidade ou facilitar a operação, mas não deverá exigir conhecimento prévio da modelagem interna.

---

# 9. Escopo explicitamente fora do MVP

Os seguintes recursos permanecem fora do escopo inicial, mesmo que façam parte da visão futura do FinanceHub:

- Open Finance;
- OFX;
- OCR;
- NF-e;
- importação automática de PDFs;
- importação automática de CSV;
- Inteligência Financeira avançada;
- Descobertas Contextuais avançadas;
- recomendações avançadas;
- orçamento inteligente;
- cenários e simulações avançadas;
- planejamento financeiro avançado;
- investimentos avançados;
- integrações externas;
- automações financeiras externas;
- estruturas avançadas de compartilhamento entre Pessoas;
- recursos administrativos avançados.

Esses itens não deverão ser removidos do domínio ou da arquitetura futura apenas porque não serão implementados no MVP.

---

# 10. O que o MVP não deve fazer

O MVP não deverá:

- exigir cadastro completo antes de permitir registrar um evento;
- exigir Conta Financeira para todo Evento Financeiro;
- transformar transferência em receita ou despesa;
- tratar saldo manual como fonte primária;
- apagar histórico para representar confirmação ou correção;
- obrigar Objetivo Financeiro para utilização da plataforma;
- criar relação direta entre Evento Financeiro e Instituição Financeira;
- criar conceitos estruturais apenas para atender conveniência da interface;
- implementar inteligência avançada antes de possuir histórico suficiente;
- tentar implementar todo o PRD na primeira versão.

---

# 11. Critérios de aceite do núcleo

O MVP será considerado funcionalmente consistente quando for possível executar, sem quebrar o modelo de domínio, o seguinte cenário:

```text
1. Representar uma Pessoa.

2. Representar uma Conta Financeira conhecida.

3. Associar a Conta a uma Instituição Financeira, quando conhecida.

4. Registrar receitas e despesas já efetivadas.

5. Registrar receitas e despesas futuras conhecidas.

6. Visualizar o Saldo Atual.

7. Visualizar o Saldo Previsto para o final do mês.

8. Confirmar um evento futuro.

9. Recalcular automaticamente o Saldo Atual e o Saldo Previsto.

10. Consultar o histórico dos acontecimentos sem perder sua continuidade.
```

O cenário acima constitui o caminho mínimo de validação do núcleo do FinanceHub.

---

# 12. Preparação para as próximas camadas

A implementação do MVP deverá deixar espaço estrutural para futura evolução do domínio, incluindo:

- recorrências;
- compromissos financeiros;
- parcelamentos;
- planejamento;
- objetivos;
- memória financeira;
- inteligência financeira;
- descobertas contextuais;
- integrações;
- importações;
- análises mais profundas.

Esses recursos não deverão ser antecipadamente implementados apenas para preparar o terreno.

A preparação consiste em não criar uma estrutura que impeça sua implementação futura.

---

# 13. Relação com a documentação oficial

Este documento depende conceitualmente dos seguintes documentos oficiais:

```text
00-VISION.md
01-MANIFESTO.md
10-PRD.md
11-USER_JOURNEY.md
12-DOMAIN_MODEL.md
20-ERD_CONCEPTUAL.md
```

O MVP_SPEC não substitui esses documentos.

Ele funciona como contrato de execução para uma primeira implementação limitada do domínio já definido.

Caso exista conflito entre este documento e uma regra de domínio já congelada, a implementação não deverá resolver o conflito silenciosamente. A inconsistência deverá retornar à documentação de domínio para decisão.

---

# 14. Regra final do MVP

O MVP deverá responder a uma pergunta simples:

> **O FinanceHub consegue representar a realidade financeira conhecida da Pessoa, acompanhar o que já aconteceu, antecipar o que está previsto e recalcular essa realidade conforme os acontecimentos são confirmados?**

Se a resposta for sim, o núcleo essencial do FinanceHub estará validado.

A partir desse núcleo, as demais capacidades poderão evoluir progressivamente sem transformar o MVP em uma versão incompleta da plataforma final.
