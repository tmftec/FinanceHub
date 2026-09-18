# ERD FÍSICO

## Modelo físico do FinanceHub

**Documento:** 21-ERD_FISICO.md

**Versão:** 1.0

**Status:** Em elaboração

**Objetivo**

Definir a estrutura física do núcleo financeiro do FinanceHub, traduzindo o ERD Conceitual e as decisões de domínio já consolidadas em entidades, atributos, relacionamentos e restrições implementáveis.

Este documento é orientado ao MVP, preservando extensibilidade para evolução posterior sem antecipar estruturas de V2 que não são necessárias.

---

# 1. Princípios

1. Evento Financeiro é a principal unidade de registro de acontecimentos financeiros.
2. Saldos são derivados dos Eventos Financeiros e não são armazenados como fonte primária de verdade.
3. Componentes possuem valores positivos; a natureza do impacto é determinada pelo tipo do Evento.
4. Histórico efetivado não é apagado como mecanismo normal de correção.
5. Associações opcionais não devem ser transformadas em obrigatoriedades artificiais.
6. Entidades cadastrais utilizadas no histórico são desativadas em vez de excluídas.
7. Recorrências são modelos que geram Eventos independentes.
8. O modelo físico não deve introduzir entidades ou campos de V2 no MVP sem necessidade.

---

# 2. Entidades

## 2.1 — pessoas

```
pessoas
- id UUID PK
- nome TEXT NOT NULL
- ativo BOOLEAN NOT NULL DEFAULT TRUE
- created_at TIMESTAMPTZ NOT NULL
- updated_at TIMESTAMPTZ NOT NULL
```

Regras:
- Nome é livre.
- Não há CPF, e-mail, telefone ou outros dados pessoais no MVP.
- Pessoa sem vínculos utilizados pode ser excluída.
- Pessoa utilizada por Conta, Evento ou Recorrência não pode ser excluída fisicamente; deve ser desativada.
- Pessoa desativada permanece consultável e pode ser reativada.

## 2.2 — instituicoes_financeiras

```
instituicoes_financeiras
- id UUID PK
- nome TEXT NOT NULL
- ativo BOOLEAN NOT NULL DEFAULT TRUE
- created_at TIMESTAMPTZ NOT NULL
- updated_at TIMESTAMPTZ NOT NULL
```

Regras:
- Não existe pré-cadastro obrigatório.
- Nome é único sem diferenciação entre maiúsculas e minúsculas.
- Instituição utilizada não pode ser excluída; deve ser desativada.
- Instituição sem uso pode ser excluída.
- Pode ser reativada.
- Não há código bancário ou outros identificadores no MVP.

## 2.3 — contas_financeiras

```
contas_financeiras
- id UUID PK
- nome TEXT NOT NULL
- tipo TEXT NOT NULL
- instituicao_id UUID NULL FK -> instituicoes_financeiras.id
- ativo BOOLEAN NOT NULL DEFAULT TRUE
- visivel_dashboard BOOLEAN NOT NULL DEFAULT TRUE
- created_at TIMESTAMPTZ NOT NULL
- updated_at TIMESTAMPTZ NOT NULL
```

Tipos controlados:
- CONTA_CORRENTE
- CONTA_POUPANCA
- CONTA_PAGAMENTO
- CARTEIRA
- DINHEIRO
- OUTRO

Regras:
- Conta pode existir sem Pessoa associada.
- Conta pode existir sem Instituição Financeira.
- Uma Conta pode estar associada a no máximo uma Instituição.
- Não possui saldo armazenado.
- Não possui agência ou número de conta no MVP.
- Conta utilizada não pode ser excluída; deve ser desativada.
- Conta sem uso pode ser excluída.
- Conta desativada permanece no histórico e no patrimônio derivado quando possuir posição financeira.
- `visivel_dashboard` é independente de `ativo`.
- Conta ativa e invisível continua participando dos cálculos e do patrimônio; apenas não é exibida nas visões do Dashboard que respeitam essa preferência.

## 2.4 — pessoa_conta_financeira

```
pessoa_conta_financeira
- pessoa_id UUID NOT NULL FK -> pessoas.id
- conta_financeira_id UUID NOT NULL FK -> contas_financeiras.id
- PRIMARY KEY (pessoa_id, conta_financeira_id)
```

Regras:
- Relação física N:N.
- Não representa propriedade jurídica.
- Não possui atributos adicionais no MVP.
- Conta pode existir sem Pessoa associada.

## 2.5 — eventos_financeiros

```
eventos_financeiros
- id UUID PK
- tipo TEXT NOT NULL
- tipo_ajuste TEXT NULL
- status TEXT NOT NULL DEFAULT 'PLANEJADO'
- descricao TEXT NOT NULL
- data_vencimento DATE NULL
- data_efetivacao DATE NULL
- conta_financeira_id UUID NULL FK -> contas_financeiras.id
- recorrencia_id UUID NULL FK -> recorrencias.id
- evento_relacionado_id UUID NULL FK -> eventos_financeiros.id
- forma_pagamento TEXT NULL
- created_at TIMESTAMPTZ NOT NULL
- updated_at TIMESTAMPTZ NOT NULL
```

Tipos controlados:
- RECEITA
- DESPESA
- TRANSFERENCIA
- APLICACAO
- RESGATE
- COMPRA_CARTAO
- PAGAMENTO_FATURA
- ESTORNO
- AJUSTE
- ABERTURA_CONTA

Status controlados:
- PLANEJADO
- AGENDADO
- EFETIVADO

Tipo de ajuste:
- ACRESCIMO
- REDUCAO

Forma de pagamento:
- opcional;
- atributo controlado do Evento, não entidade independente;
- conjunto inicial previsto: PIX, CARTAO_CREDITO, CARTAO_DEBITO, DINHEIRO, BOLETO, DEBITO_AUTOMATICO, TRANSFERENCIA, OUTRO.

Regras:
- Evento pode existir sem Conta.
- Evento pode estar associado a no máximo uma Conta.
- Evento não possui valor próprio; o total é derivado dos Componentes.
- `descricao` é obrigatória.
- `data_efetivacao` é necessária para Evento EFETIVADO.
- `data_vencimento` representa data prevista/de referência; em Eventos gerados por Recorrência identifica a ocorrência.
- `evento_relacionado_id` é opcional e referencia no máximo um outro Evento.
- Instituição Financeira não possui relação estrutural direta com Evento.
- Evento efetivado não é excluído fisicamente no uso normal.
- Eventos planejados/agendados podem ser excluídos conforme regras de recorrência e histórico.
- Alteração de Conta de Evento é permitida como correção; não cria novo Evento.
- Evento sem Conta pode receber Conta posteriormente.
- Evento efetivado sem Conta participa do histórico e de indicadores de receita/despesa aplicáveis, mas não altera saldo de Conta nem patrimônio consolidado baseado em Contas até que seja associado.

### Impactos por tipo

- RECEITA: aumenta o saldo.
- DESPESA: reduz o saldo.
- TRANSFERENCIA: impacto depende da posição do Evento na Conta; transferência interna é representada por dois Eventos independentes.
- APLICACAO: reduz o saldo da Conta de origem.
- RESGATE: aumenta o saldo da Conta de destino.
- PAGAMENTO_FATURA: reduz o saldo.
- ESTORNO: possui impacto oposto ao acontecimento estornado, conforme a natureza do Evento relacionado.
- AJUSTE: aumenta ou reduz conforme `tipo_ajuste`.
- ABERTURA_CONTA: estabelece a posição inicial conhecida da Conta e não é Receita, Despesa ou Ajuste.

## 2.6 — pessoa_evento_financeiro

```
pessoa_evento_financeiro
- pessoa_id UUID NOT NULL FK -> pessoas.id
- evento_financeiro_id UUID NOT NULL FK -> eventos_financeiros.id
- PRIMARY KEY (pessoa_id, evento_financeiro_id)
```

Regras:
- Relação física N:N.
- Pessoa é contexto do Evento, não proprietária nem autora obrigatória.
- Evento pode existir sem Pessoa.

## 2.7 — categorias

```
categorias
- id UUID PK
- nome TEXT NOT NULL
- categoria_pai_id UUID NULL FK -> categorias.id
- ativo BOOLEAN NOT NULL DEFAULT TRUE
- created_at TIMESTAMPTZ NOT NULL
- updated_at TIMESTAMPTZ NOT NULL
```

Regras:
- Estrutura autorreferenciada.
- `categoria_pai_id = NULL` identifica categoria de nível superior.
- Não pode haver auto-referência ou ciclo.
- Não há limite estrutural de profundidade.
- Nome é único dentro do mesmo pai, sem diferenciação entre maiúsculas e minúsculas.
- Mesmo nome pode existir em ramificações diferentes.
- Categoria utilizada não é excluída; é desativada.
- Categoria desativada permanece vinculada ao histórico.
- Categoria desativada não é oferecida para nova classificação.
- Subcategoria não é automaticamente desativada quando o pai é desativado; porém, uma subcategoria com ancestral inativo não pode ser usada em nova classificação.
- Categoria pode ser editada sem criar novo identificador.

## 2.8 — componentes_financeiros

```
componentes_financeiros
- id UUID PK
- evento_financeiro_id UUID NOT NULL FK -> eventos_financeiros.id
- descricao TEXT NULL
- valor NUMERIC(15,2) NOT NULL CHECK (valor > 0)
- categoria_id UUID NULL FK -> categorias.id
- created_at TIMESTAMPTZ NOT NULL
- updated_at TIMESTAMPTZ NOT NULL
```

Regras:
- Todo Componente pertence a um Evento.
- Evento possui de 1 a N Componentes.
- Valor é sempre positivo.
- Categoria é opcional.
- Um Componente pode ter somente uma Categoria.
- Subcategoria é representada por Categoria com `categoria_pai_id`; não existe `subcategoria_id`.
- Total do Evento = soma dos valores de seus Componentes.
- Um Evento pode começar com um Componente e posteriormente ser dividido em múltiplos Componentes.
- Alteração de componentes pode corrigir ou detalhar um Evento sem substituir seu histórico.

## 2.9 — recorrencias

```
recorrencias
- id UUID PK
- descricao TEXT NOT NULL
- periodicidade TEXT NOT NULL
- data_inicio DATE NOT NULL
- ativo BOOLEAN NOT NULL DEFAULT TRUE
- conta_financeira_id UUID NULL FK -> contas_financeiras.id
- data_fim DATE NULL
- created_at TIMESTAMPTZ NOT NULL
- updated_at TIMESTAMPTZ NOT NULL
```

Periodicidade controlada:
- SEMANAL
- QUINZENAL
- MENSAL
- ANUAL

Regras:
- `data_inicio` é a data da primeira ocorrência.
- Recorrência pode existir sem Pessoa.
- Recorrência pode existir sem Conta.
- No máximo uma Conta por Recorrência.
- `ativo` controla a geração de novas ocorrências.
- Pode ser reativada.
- `data_fim` é limite explícito de geração quando informado.
- Quando `data_fim` é NULL, o horizonte padrão de planejamento é o final do ano corrente.
- O horizonte padrão não encerra a Recorrência.
- Atingir `data_fim` interrompe a geração após a data limite, sem excluir a Recorrência.
- Recorrência sem Eventos efetivados pode ser excluída.
- Se existir qualquer Evento gerado já efetivado, a Recorrência não pode ser excluída; deve ser desativada.
- Ao excluir uma Recorrência sem Eventos efetivados, Eventos gerados ainda não efetivados vinculados a ela podem ser excluídos mediante confirmação.
- Ao desativar uma Recorrência, Eventos já gerados permanecem.
- Reativação não recria Eventos existentes nem Eventos que o usuário tenha excluído individualmente.
- Geração ocorre imediatamente na criação, respeitando horizonte e `data_fim`.
- Geração posterior deve ser idempotente.

## 2.10 — pessoa_recorrencia

```
pessoa_recorrencia
- pessoa_id UUID NOT NULL FK -> pessoas.id
- recorrencia_id UUID NOT NULL FK -> recorrencias.id
- PRIMARY KEY (pessoa_id, recorrencia_id)
```

Regras:
- Relação física N:N.
- Não representa propriedade.

## 2.11 — recorrencias_componentes

```
recorrencias_componentes
- id UUID PK
- recorrencia_id UUID NOT NULL FK -> recorrencias.id
- descricao TEXT NULL
- valor NUMERIC(15,2) NOT NULL CHECK (valor > 0)
- categoria_id UUID NULL FK -> categorias.id
- ordem INTEGER NOT NULL
- created_at TIMESTAMPTZ NOT NULL
- updated_at TIMESTAMPTZ NOT NULL
```

Regras:
- Recorrência possui 1..N componentes-modelo.
- Valor positivo.
- Categoria opcional.
- `ordem` define a posição dos componentes na composição da Recorrência.
- Cada ocorrência gera seus próprios Componentes independentes.
- Alterações futuras da Recorrência não alteram automaticamente Eventos já efetivados.

---

# 3. Relacionamentos físicos

| Relação | Cardinalidade |
|---|---|
| Pessoa × Conta | N:N |
| Pessoa × Evento | N:N |
| Pessoa × Recorrência | N:N |
| Conta × Instituição | N:1 do ponto de vista da Conta; Instituição 0..N |
| Conta × Evento | Conta 0..N; Evento 0..1 |
| Recorrência × Conta | Recorrência 0..1; Conta 0..N |
| Recorrência × Evento | Recorrência 0..N; Evento 0..1 |
| Evento × Evento | autorreferência opcional, 0..1 direta por Evento |
| Evento × Componente | Evento 1..N; Componente 1..1 |
| Componente × Categoria | Componente 0..1; Categoria 0..N |
| Recorrência × Componente-modelo | Recorrência 1..N; componente-modelo 1..1 |
| Pessoa × Objetivo | 0..N × 1..1; tabela física de Objetivo pertence ao domínio, mas sua implementação detalhada permanece fora deste fechamento do núcleo físico atual |
| Organização × Evento | 0..N × 0..N; implementação física depende da definição estrutural de Organização e permanece fora deste núcleo MVP |

---

# 4. Regras de Recorrência e Eventos gerados

## 4.1 — Geração

Cada ocorrência gera:
- um Evento Financeiro;
- os Componentes Financeiros correspondentes ao modelo da Recorrência.

O Evento gerado recebe:
- `recorrencia_id`;
- `status = PLANEJADO`;
- `data_vencimento` igual à data da ocorrência.

A geração não significa efetivação.

## 4.2 — Identidade da ocorrência

A ocorrência automática é identificada por:

`recorrencia_id + data_vencimento`

Não deve existir mais de um Evento gerado automaticamente para a mesma Recorrência na mesma data.

Essa regra deve ser protegida por restrição/índice de unicidade no banco.

## 4.3 — Alteração individual

Um Evento já gerado pode ter sua data, valor ou Conta corrigidos individualmente, sem alterar a Recorrência.

Ao alterar a data de uma ocorrência:
- mantém-se o vínculo com a Recorrência;
- verifica-se duplicidade na nova data;
- demais ocorrências não são alteradas.

## 4.4 — Alteração da Recorrência

Alterações da Recorrência não alteram automaticamente Eventos já gerados.

Para alterações propagáveis, o sistema pergunta se o usuário deseja aplicar aos Eventos futuros.

Somente:
- valor dos componentes;
- Conta Financeira

podem ser propagados para Eventos futuros `PLANEJADOS` ou `AGENDADOS`.

Se o valor de um componente for alterado, somente o componente correspondente é alterado nos Eventos futuros.

Eventos `EFETIVADOS` nunca são alterados automaticamente.

## 4.5 — Exclusão de Evento recorrente

Evento `PLANEJADO` ou `AGENDADO` pode ser excluído.

Quando originado de Recorrência, o sistema deve perguntar:
- somente este Evento; ou
- este e os Eventos posteriores.

A exclusão individual não altera a Recorrência e o Evento excluído não deve ser recriado automaticamente.

## 4.6 — Desativação

Desativar Recorrência:
- interrompe novas gerações;
- preserva Eventos já existentes;
- não altera Eventos `PLANEJADOS`, `AGENDADOS` ou `EFETIVADOS`.

## 4.7 — Reativação

Reativar:
- permite novas gerações;
- não recria Eventos já existentes;
- não recria Eventos que tenham sido excluídos individualmente;
- gera somente ocorrências futuras aplicáveis, respeitando periodicidade, `data_fim` e horizonte.

---

# 5. Saldos e Patrimônio

## 5.1 — Saldo Atual

Saldo Atual é derivado exclusivamente dos Eventos `EFETIVADOS` aplicáveis à Conta.

Não existe campo de saldo em `contas_financeiras`.

## 5.2 — Saldo Previsto

Saldo Previsto considera:
- Eventos `EFETIVADOS`;
- impactos de Eventos `PLANEJADOS`;
- impactos de Eventos `AGENDADOS`.

No MVP, a principal projeção é para o final do mês.

## 5.3 — Saldo negativo

Saldo negativo é permitido. Não existe restrição que impeça uma Conta de apresentar saldo negativo.

## 5.4 — Patrimônio consolidado

Patrimônio Atual é derivado da soma das posições financeiras das Contas consideradas no universo patrimonial.

`visivel_dashboard` não exclui Conta do patrimônio.

Transferências internas não alteram o patrimônio consolidado.

Eventos sem Conta não alteram o patrimônio baseado em Contas até que uma Conta seja associada.

## 5.5 — Abertura de Conta

Quando uma Conta já possui uma posição financeira no momento em que o controle começa:
- o sistema pode criar um Evento `ABERTURA_CONTA` `EFETIVADO`;
- o valor positivo do Componente representa a posição inicial conhecida;
- a abertura não é Receita, Despesa ou Ajuste.

Saldo inicial zero não exige Evento de abertura.

O tratamento físico definitivo de saldo inicial negativo permanece em aberto e não deverá ser implementado por exceção improvisada às regras de Componentes positivos.

---

# 6. Transferências

Transferência interna é composta por dois Eventos independentes do tipo `TRANSFERENCIA`:
- um Evento de saída na Conta de origem;
- um Evento de entrada na Conta de destino.

Os Eventos são relacionados por `evento_relacionado_id`.

Cada Evento possui:
- seus próprios Componentes;
- status;
- data;
- Conta.

Uma transferência pode ter os dois Eventos em estados diferentes.

Se a Conta de destino não estiver representada no FinanceHub, somente o Evento da origem é necessário.

Transferência não é Receita nem Despesa e não altera o patrimônio consolidado quando os dois lados estão representados.

---

# 7. Estornos e correções

## 7.1 — Estorno

Estorno é um novo Evento independente.

O Evento original:
- permanece intacto;
- mantém seus Componentes;
- mantém seu histórico.

O Estorno:
- possui seus próprios Componentes;
- possui sua própria data e status;
- pode ter Conta própria;
- referencia o original por `evento_relacionado_id`.

Estornos parciais são permitidos.

## 7.2 — Ajuste

`AJUSTE` é excepcional e serve para diferenças financeiras não explicadas por um Evento identificável.

Requer:
- `tipo_ajuste = ACRESCIMO` ou `REDUCAO`;
- Componentes com valor positivo.

Se a causa for identificada posteriormente, registra-se o Evento correspondente sem apagar a história.

## 7.3 — Edição

Eventos efetivados podem ser editados para correção, complementação ou detalhamento.

Nova ocorrência ou novo fato financeiro deve gerar novo Evento.

A exclusão física de Evento efetivado não é mecanismo normal de correção.

---

# 8. Integridade e ciclo de vida

- FKs devem preservar a integridade referencial.
- Entidades cadastrais utilizadas no histórico devem ser desativadas em vez de excluídas.
- Eventos efetivados permanecem.
- Componentes pertencem a Eventos.
- Componentes de Recorrência pertencem à Recorrência.
- Categorias utilizadas permanecem no histórico.
- Não deve haver valores de saldo armazenados como fonte primária.
- Processos de geração de Recorrência devem ser idempotentes.
- Não deve haver duplicidade de ocorrência automática para a combinação `recorrencia_id + data_vencimento`.

---

# 9. Fora do MVP físico

Não fazem parte deste modelo físico inicial:
- módulo completo de cartão de crédito;
- parcelamentos;
- Favorecidos/Contrapartes;
- Open Finance;
- OFX;
- OCR;
- NF-e;
- importações;
- investimentos avançados;
- reconciliação formal;
- orçamento inteligente;
- Inteligência Financeira avançada;
- estruturas avançadas de compartilhamento;
- recursos administrativos avançados.

Esses recursos podem possuir decisões conceituais futuras, mas não devem ser incorporados ao esquema físico do MVP sem nova consolidação.

---

# 10. Pendências explícitas

As únicas pendências estruturais relevantes deste documento devem ser resolvidas antes da implementação final:

1. representação física definitiva de saldo inicial negativo;
2. definição estrutural futura de Objetivo Financeiro e Organização, caso sejam necessárias ao escopo físico do MVP;
3. fechamento da lista definitiva de valores de `forma_pagamento`, se ela for necessária no MVP.

Até que essas pendências sejam resolvidas, nenhuma implementação deve inventar comportamento alternativo.
