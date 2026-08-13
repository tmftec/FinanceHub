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

---

# 4. Jornadas de Evolução

As Jornadas de Evolução representam os diferentes momentos da relação entre o usuário e sua vida financeira.

Elas não correspondem a funcionalidades específicas nem a fluxos de navegação.

Representam transformações progressivas na forma como o usuário compreende, organiza, controla e evolui sua realidade financeira.

O FinanceHub acompanha essa evolução oferecendo informações, funcionalidades e Inteligência Financeira adequadas ao contexto e à maturidade de cada usuário.

A evolução da jornada não depende do tempo de utilização da plataforma.

Ela depende da evolução da maturidade financeira do usuário e da compreensão que o FinanceHub possui sobre seu contexto financeiro.


## MJ-001 — Consciência

### Objetivo da Jornada

Permitir que o usuário compreenda sua realidade financeira atual de forma simples, clara e objetiva.

---

### Como o usuário normalmente chega aqui?

- Está iniciando sua organização financeira;
- Possui informações espalhadas;
- Não conhece exatamente seu patrimônio;
- Não consegue explicar sua situação financeira atual.

---

### O que ele normalmente sente?

- Insegurança;
- Falta de controle;
- Confusão;
- Sensação de que o dinheiro "desaparece".

---

### Como o FinanceHub ajuda?

A plataforma consolida informações financeiras, organiza o patrimônio, apresenta uma visão clara da situação atual e elimina a necessidade de múltiplos controles paralelos.

---

### Como a Inteligência Financeira atua?

Desde o primeiro contato, o FinanceHub identifica informações relevantes e apresenta orientações simples e contextualizadas.

Exemplos:

- "Suas despesas superaram suas receitas neste mês."
- "Grande parte dos seus gastos está concentrada em alimentação."
- "Você possui contas sem movimentação há mais de seis meses."

O objetivo não é julgar.

É gerar consciência.

---

### Capacidades envolvidas

- Gestão Patrimonial;
- Gestão de Eventos Financeiros;
- Administração.

---

### Transformação Esperada

O usuário deixa de trabalhar com percepções e passa a compreender sua realidade financeira.

---

## MJ-002 — Organização

### Objetivo da Jornada

Transformar informações financeiras dispersas em uma estrutura organizada, consistente e confiável.

---

### Como o usuário normalmente chega aqui?

Após compreender sua situação financeira inicial, o usuário percebe a necessidade de concentrar suas informações em um único ambiente.

Ele passa a organizar contas, patrimônio, categorias e demais elementos que representam sua realidade financeira.

---

### O que ele normalmente sente?

- Desejo de simplificar o controle financeiro;
- Cansaço por utilizar múltiplas planilhas ou aplicativos;
- Necessidade de centralizar informações;
- Busca por maior confiança nos próprios dados.

---

### Como o FinanceHub ajuda?

O FinanceHub organiza naturalmente as informações financeiras, reduzindo redundâncias e estruturando o patrimônio de forma consistente.

A plataforma elimina controles paralelos e cria uma única fonte confiável para toda a vida financeira do usuário.

---

### Como a Inteligência Financeira atua?

A Inteligência Financeira identifica oportunidades de organização, sugere simplificações e reduz atividades repetitivas.

Exemplos:

- sugerir categorias mais adequadas;
- identificar cadastros duplicados;
- recomendar consolidação de contas semelhantes;
- identificar informações importantes ainda não cadastradas.

O objetivo é reduzir esforço operacional e aumentar a qualidade das informações disponíveis.

---

### Capacidades envolvidas

- Gestão Patrimonial;
- Gestão de Eventos Financeiros;
- Administração.

---

### Próximo Estado da Jornada

O usuário passa a confiar nas informações registradas e estabelece uma base sólida para compreender seu comportamento financeiro.

---

## MJ-003 — Controle

### Objetivo da Jornada

Transformar informações organizadas em hábitos consistentes de acompanhamento financeiro, permitindo que o usuário mantenha controle contínuo sobre sua realidade.

---

### Como o usuário normalmente chega aqui?

Após organizar suas informações financeiras, o usuário passa a confiar na plataforma como fonte principal da sua vida financeira.

Nesse momento, surge a necessidade de acompanhar a evolução das movimentações, verificar resultados e identificar rapidamente mudanças relevantes.

---

### O que ele normalmente sente?

- Maior segurança sobre seus dados;
- Desejo de acompanhar sua evolução;
- Necessidade de identificar rapidamente problemas;
- Interesse em compreender como pequenas decisões impactam sua vida financeira.

---

### Como o FinanceHub ajuda?

O FinanceHub transforma registros financeiros em uma visão contínua da situação do usuário.

O FinanceHub reduz a necessidade de o usuário procurar informações.

Os acontecimentos realmente relevantes são apresentados de forma contextualizada, permitindo que a atenção seja direcionada ao que exige ação ou acompanhamento.

O usuário passa a acompanhar sua vida financeira de forma contínua, desenvolvendo o hábito de compreender sua evolução antes que problemas aconteçam.

---

### Como a Inteligência Financeira atua?

A Inteligência Financeira passa a identificar padrões de comportamento e mudanças relevantes, chamando a atenção apenas para aquilo que realmente merece análise.

Exemplos:

- identificar aumentos recorrentes em determinadas categorias;
- perceber alterações incomuns no comportamento financeiro;
- destacar mudanças significativas em relação aos períodos anteriores;
- chamar a atenção para eventos que merecem acompanhamento.

O objetivo é direcionar a atenção do usuário para aquilo que realmente mudou em sua realidade financeira.

O objetivo não é gerar mais notificações.

É direcionar a atenção do usuário para o que realmente importa.

---

### Capacidades envolvidas

- Gestão de Eventos Financeiros;
- Planejamento Financeiro;
- Dashboards e Indicadores;
- Inteligência Financeira.

---

### Próximo Estado da Jornada

O usuário deixa de apenas acompanhar números e passa a compreender o comportamento da própria vida financeira.

---

## MJ-004 — Compreensão

### Objetivo da Jornada

Ampliar a compreensão do usuário sobre sua própria vida financeira, revelando padrões, relações e oportunidades que normalmente passariam despercebidos.

---

Após estabelecer o hábito de acompanhar sua vida financeira, o usuário começa a compreender melhor sua realidade.

Nesse momento, o FinanceHub passa a revelar relações, padrões e comportamentos que normalmente permaneceriam invisíveis.

O usuário passa a descobrir aspectos da própria vida financeira que dificilmente perceberia sozinho.

---

### O que ele normalmente sente?

- Curiosidade;
- Interesse em melhorar;
- Desejo de aprender;
- Necessidade de compreender os impactos dos próprios hábitos financeiros.

---

### Como o FinanceHub ajuda?

O FinanceHub conecta informações que normalmente seriam analisadas de forma isolada, revelando relações entre eventos, categorias, períodos e comportamentos.

A plataforma transforma registros financeiros em conhecimento compreensível, permitindo que o usuário enxergue padrões antes invisíveis.

---

### Como a Inteligência Financeira atua?

A Inteligência Financeira interpreta o contexto financeiro do usuário para explicar comportamentos recorrentes, identificar relações entre acontecimentos e transformar dados em compreensão.

Exemplos:

- explicar que o aumento da conta de gás ocorre historicamente durante o inverno;
- relacionar o crescimento do consumo de energia ao uso mais intenso de ar-condicionado no verão;
- identificar que despesas escolares e tributos concentram-se no início de cada ano;
- demonstrar que determinados gastos aumentam sempre próximos a datas específicas;
- mostrar como pequenas mudanças de comportamento produziram impactos positivos ao longo do tempo.

O objetivo não é apenas explicar acontecimentos financeiros.

É revelar relações, padrões e oportunidades que normalmente permaneceriam ocultos.

A Inteligência Financeira também estabelece relações entre informações aparentemente independentes, criando novas perspectivas sobre a realidade financeira do usuário.

Essas relações têm como objetivo ampliar a compreensão e estimular reflexões que dificilmente seriam percebidas sem análise contextual.

A Inteligência Financeira também estabelece relações entre acontecimentos financeiros aparentemente independentes, oferecendo novas perspectivas para apoiar a tomada de decisão.

O objetivo não é apenas apresentar dados ou identificar padrões, mas revelar conexões que ampliem a compreensão do usuário sobre sua própria realidade financeira.

---

### Capacidades envolvidas

- Gestão de Eventos Financeiros;
- Dashboards e Indicadores;
- Planejamento Financeiro;
- Inteligência Financeira.

---

### Próximo Estado da Jornada

O usuário passa a compreender as causas do próprio comportamento financeiro e desenvolve confiança para tomar decisões mais conscientes.

---

## MJ-005 — Planejamento

### Objetivo da Jornada

Transformar conhecimento em decisões conscientes, permitindo que o usuário planeje seu futuro financeiro com base em cenários realistas e contextualizados.

---

### Como o usuário normalmente chega aqui?

Após compreender sua realidade financeira e identificar os fatores que influenciam seus resultados, o usuário passa a desejar construir um futuro mais previsível.

Ele deixa de perguntar apenas "o que aconteceu?" e passa a refletir sobre "o que pode acontecer?" e "o que posso fazer para melhorar esse resultado?".

---

### O que ele normalmente sente?

- Segurança para planejar;
- Desejo de alcançar objetivos;
- Interesse em antecipar problemas;
- Necessidade de avaliar alternativas antes de tomar decisões.

---

### Como o FinanceHub ajuda?

O FinanceHub transforma histórico financeiro em cenários futuros.

A plataforma permite visualizar impactos, comparar possibilidades e compreender como pequenas mudanças de comportamento podem influenciar significativamente a evolução financeira.

---

### Como a Inteligência Financeira atua?

A Inteligência Financeira constrói cenários utilizando histórico, sazonalidade, contexto e comportamento financeiro do usuário.

Ela antecipa acontecimentos recorrentes, simula impactos e apresenta recomendações preventivas antes que situações desfavoráveis ocorram.

Exemplos:

- antecipar despesas sazonais como IPVA, IPTU, material escolar e férias;
- prever aumento de consumo durante períodos específicos do ano;
- demonstrar como pequenas mudanças de hábito aceleram objetivos financeiros;
- comparar diferentes cenários antes da tomada de decisão;
- recomendar provisões para reduzir impactos futuros.

O objetivo não é prever o futuro.

É permitir que o usuário tome decisões melhores antes que o futuro aconteça.

---

### Capacidades envolvidas

- Planejamento Financeiro;
- Objetivos Financeiros;
- Inteligência Financeira;
- Dashboards e Indicadores.

---

### Próximo Estado da Jornada

O usuário deixa de reagir aos acontecimentos financeiros e passa a construir conscientemente o futuro que deseja.

---

## MJ-006 — Evolução Contínua

### Objetivo da Jornada

Estabelecer um processo permanente de evolução financeira, no qual o usuário desenvolve melhores hábitos, toma decisões cada vez mais conscientes e utiliza o FinanceHub como um parceiro contínuo na construção da sua vida financeira.

---

### Como o usuário normalmente chega aqui?

Após compreender sua realidade financeira, planejar seus objetivos e experimentar os benefícios das decisões baseadas em contexto, o usuário passa a enxergar sua vida financeira como um processo contínuo de aprendizado e evolução.

Nesse momento, o FinanceHub deixa de ser apenas uma ferramenta de controle e passa a fazer parte da rotina de tomada de decisões.

---

### O que ele normalmente sente?

- Confiança nas próprias decisões;
- Segurança para construir novos objetivos;
- Interesse em evoluir continuamente;
- Curiosidade para descobrir novas oportunidades de melhoria.

---

### Como o FinanceHub ajuda?

O FinanceHub acompanha continuamente a evolução financeira do usuário, adaptando sua experiência, aprofundando as análises e oferecendo novos conhecimentos conforme aumenta a compreensão sobre seu contexto.

A plataforma evolui junto com o usuário, mantendo a experiência simples, relevante e personalizada em todas as fases da jornada.

A cada nova interação, o FinanceHub amplia sua compreensão sobre o contexto financeiro do usuário.

Essa memória contextual permite que a plataforma produza análises cada vez mais relevantes, mantendo a coerência com a realidade financeira construída ao longo do tempo.

---

### Como a Inteligência Financeira atua?

A Inteligência Financeira aprende continuamente com o histórico, os objetivos, os comportamentos e o contexto financeiro do usuário.

Ela identifica novas oportunidades de evolução, revela descobertas cada vez mais sofisticadas e adapta naturalmente o nível das recomendações conforme a maturidade financeira alcançada.

Exemplos:

- identificar novas oportunidades de otimização financeira;
- sugerir estratégias mais eficientes para atingir objetivos futuros;
- adaptar automaticamente o nível de profundidade das análises;
- revelar relações cada vez mais complexas entre diferentes aspectos da vida financeira;
- incentivar melhorias contínuas sem aumentar a complexidade da experiência.

O objetivo não é conduzir o usuário até um ponto final.

É apoiá-lo em uma evolução financeira permanente.

---

### Capacidades envolvidas

- Todas as capacidades do FinanceHub.

A Evolução Contínua representa a integração natural de toda a plataforma.

---

### Próximo Estado da Jornada

A jornada reinicia em um novo nível de maturidade.

Cada evolução permite ao usuário perceber novas oportunidades, compreender aspectos antes invisíveis e construir decisões ainda melhores.

O ciclo de evolução financeira torna-se permanente.

---

# 5. O Ciclo de Evolução Financeira

A Jornada de Evolução do FinanceHub não possui um ponto final.

Cada evolução alcançada amplia a compreensão do usuário sobre sua própria realidade financeira, permitindo novas descobertas, novos objetivos e novas oportunidades de crescimento.

A Inteligência Financeira acompanha continuamente esse processo, adaptando o conhecimento apresentado conforme aumenta o contexto disponível e a maturidade financeira do usuário.

O objetivo do FinanceHub não é concluir uma jornada.

É apoiar uma evolução permanente.

---


