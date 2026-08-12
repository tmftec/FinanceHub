# 11. User Journey

# 1. Objetivo

O User Journey descreve a evolução da relação entre o usuário e sua vida financeira ao longo da utilização do FinanceHub.

Seu propósito é representar como a plataforma acompanha o usuário desde os primeiros contatos até um estágio de maturidade financeira, entregando informações, funcionalidades e inteligência de forma progressiva.

Este documento não descreve telas, fluxos de navegação ou detalhes de interface.

Ele representa a experiência funcional da plataforma sob a perspectiva do usuário e constitui a ponte entre o Product Requirements Document (PRD) e o Domain Model.

Toda decisão de modelagem, experiência do usuário e implementação deverá respeitar os princípios aqui definidos.


O FinanceHub acompanha o usuário em toda sua jornada financeira utilizando Inteligência Financeira desde o primeiro contato com a plataforma.

O que evolui ao longo da jornada não é a existência da inteligência, mas a profundidade do conhecimento apresentado, respeitando o contexto, a maturidade financeira e as necessidades de cada usuário.

---

# 2. Princípios da Jornada

## JOUR-001 — A jornada acompanha o usuário

O FinanceHub adapta a experiência ao momento financeiro do usuário.

A plataforma não pressupõe conhecimento técnico nem exige uma configuração completa antes de entregar valor.

---

## JOUR-002 — A informação evolui em profundidade

Toda informação deverá estar disponível inicialmente em seu nível mais simples de compreensão.

Sempre que necessário, o usuário poderá expandir progressivamente o nível de detalhamento até análises completas.

A complexidade deverá existir na profundidade da informação, nunca na experiência de utilização.

---

## JOUR-003 — O contexto vem antes da análise

Antes de apresentar indicadores, tendências ou recomendações, o FinanceHub deverá garantir que o usuário compreenda seu contexto financeiro atual.

---

## JOUR-004 — Cada interação deve gerar valor

Toda ação realizada pelo usuário deverá produzir algum benefício imediato, reduzindo esforço futuro ou aumentando a compreensão da sua realidade financeira.

---

## JOUR-005 — O sistema reduz trabalho repetitivo

Sempre que possível, o FinanceHub deverá aprender com as preferências e comportamentos do usuário para reduzir configurações repetitivas e simplificar operações recorrentes.

---

## JOUR-006 — A inteligência é progressiva

A plataforma deverá evoluir naturalmente de registros financeiros para análises, depois para planejamento e finalmente para inteligência financeira.

O usuário nunca deverá ser exposto a funcionalidades avançadas antes que elas façam sentido para sua jornada.

---

## JOUR-007 — A Inteligência Financeira acompanha toda a jornada

A Inteligência Financeira constitui uma característica permanente do FinanceHub.

Desde o primeiro acesso, a plataforma deverá oferecer conhecimento contextualizado capaz de apoiar pequenas decisões e incentivar a evolução financeira do usuário.

À medida que a maturidade financeira aumenta, a profundidade das análises, recomendações e oportunidades também evolui.

A inteligência nunca deverá depender exclusivamente de Inteligência Artificial externa.

Ela deverá ser construída prioritariamente a partir das informações existentes na própria plataforma, utilizando regras de negócio, correlações, indicadores, tendências e contexto financeiro.

---

## JOUR-008 — O usuário mantém o controle

O FinanceHub deverá apoiar decisões.

Nunca substituir o usuário.

Toda recomendação deverá ser explicável e baseada em informações existentes na plataforma.


# 3. Perfis de Evolução do Usuário

O FinanceHub não classifica seus usuários por idade, renda, profissão ou conhecimento técnico.

A plataforma reconhece que um mesmo usuário poderá evoluir ao longo do tempo, assumindo diferentes perfis conforme amadurece sua relação com a própria vida financeira.

Os perfis descritos nesta seção representam momentos da jornada financeira e não características pessoais permanentes.

Eles orientam a forma como a plataforma apresenta informações, funcionalidades e inteligência ao longo da experiência.

---

## PERF-001 — Iniciante

### Objetivo

Começar a organizar sua vida financeira.

### Necessidade Principal

Obter rapidamente uma visão clara da sua situação financeira.

### Características

- busca simplicidade;
- possui poucos registros financeiros;
- ainda não possui histórico suficiente para análises avançadas;
- necessita de orientação.

### Nível de Informação

Predominantemente simples.

A plataforma deverá apresentar apenas as informações essenciais, reduzindo a carga cognitiva.

### Nível de Inteligência

Orientação.

O FinanceHub deverá apresentar recomendações simples e contextualizadas, ajudando o usuário a compreender sua situação financeira atual e a executar pequenas ações que produzam melhorias imediatas.

---

## PERF-002 — Organizador

### Objetivo

Consolidar todas as informações financeiras em um único ambiente.

### Necessidade Principal

Centralizar patrimônio, contas e movimentações.

### Características

- utiliza o FinanceHub regularmente;
- mantém informações atualizadas;
- começa a construir histórico financeiro.

### Nível de Informação

Simples com possibilidade de expansão para análises detalhadas.

### Nível de Inteligência

Sugestões.

A plataforma deverá identificar oportunidades de organização, automatização e consolidação das informações financeiras, reduzindo atividades repetitivas.

---

## PERF-003 — Controlador

### Objetivo

Compreender o comportamento financeiro.

### Necessidade Principal

Acompanhar receitas, despesas, categorias e evolução patrimonial.

### Características

- acompanha indicadores;
- deseja identificar padrões;
- busca reduzir desperdícios.

### Nível de Informação

Detalhado.

A plataforma deverá permitir análises por períodos, categorias e patrimônio.

### Nível de Inteligência

Análises.

O FinanceHub deverá identificar padrões, comportamentos recorrentes, tendências e possíveis desvios, auxiliando o usuário na compreensão da própria vida financeira.

---

## PERF-004 — Planejador

### Objetivo

Transformar objetivos em planejamento financeiro.

### Necessidade Principal

Projetar o futuro financeiro.

### Características

- utiliza metas;
- acompanha orçamento;
- trabalha com projeções;
- revisa planejamento periodicamente.

### Nível de Informação

Analítico.

O FinanceHub deverá apresentar comparações, projeções e acompanhamento de metas.

### Nível de Inteligência

Planejamento.

A plataforma deverá utilizar o histórico financeiro e os objetivos definidos pelo usuário para apoiar projeções, simulações, planejamento e acompanhamento da evolução patrimonial.
---


---

## Considerações

Os perfis representam momentos da maturidade financeira do usuário e não níveis de conhecimento técnico.

Um mesmo usuário poderá evoluir, retroceder ou apresentar características de diferentes perfis simultaneamente.

O FinanceHub deverá adaptar continuamente a experiência, apresentando a informação e a Inteligência Financeira no nível adequado para cada contexto.

O objetivo da plataforma é apoiar a evolução financeira do usuário por meio de conhecimento contextualizado, preservando sempre uma experiência simples, intuitiva e progressiva.

