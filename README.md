# marketplace-sql-case

## Português

`marketplace-sql-case` é um repositório focado em **SQL para analytics de marketplace**, organizado como um case técnico compacto e executável.

O repositório cobre um cenário comum em plataformas transacionais com múltiplas verticais de negócio:

- ranking de merchants por volume;
- inclusão de merchants sem pedidos;
- top-N com tratamento de empate;
- leitura de comportamento cross-vertical de clientes;
- cálculo mensal da porcentagem de clientes que compram em mais de uma vertical.

## Estrutura

- [sql/01_schema.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/01_schema.sql)
  - schema das tabelas `delivery_orders` e `business_info`
- [sql/02_seed_data.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/02_seed_data.sql)
  - dados sintéticos de exemplo
- [sql/03_q1a_business_order_counts.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/03_q1a_business_order_counts.sql)
  - contagem de pedidos por negócio em uma vertical específica
- [sql/04_q1b_top3_rx_last_quarter.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/04_q1b_top3_rx_last_quarter.sql)
  - top 3 negócios por pedidos com tratamento de empate
- [sql/05_q2a_query_explanation.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/05_q2a_query_explanation.sql)
  - explicação do objetivo da query intermediária
- [sql/06_q2b_cross_vertical_monthly_pct.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/06_q2b_cross_vertical_monthly_pct.sql)
  - cálculo mensal da porcentagem de clientes `both`

## Conceitos SQL demonstrados

- `LEFT JOIN`
- `COUNT(DISTINCT ...)`
- `CASE WHEN`
- filtros temporais por janela
- agregação por entidade
- `DENSE_RANK()`
- CTEs
- análise cross-vertical
- cohorting mensal com `DATE(..., 'start of month')`

## Estrutura analítica do case

O repositório foi organizado para cobrir dois blocos de problema muito comuns em analytics de marketplace:

### 1. Merchant-side analytics

- volume por merchant
- inclusão de entidades sem pedidos
- ranking com empate

### 2. Customer behavior analytics

- classificação de clientes por vertical
- identificação de clientes `both`
- evolução mensal de adoção cross-vertical

## Modelo de dados

### `delivery_orders`

- `delivery_id`
- `order_place_time`
- `business_line`
- `business_id`
- `dasher_id`
- `customer_id`

### `business_info`

- `business_id`
- `business_name`
- `business_size`
- `phone_number`

## O que este case mostra tecnicamente

### 1. Merchant-level analytics

As queries da primeira parte mostram como:

- contar pedidos por merchant;
- incluir merchants com zero pedidos;
- ordenar por volume;
- e resolver top-N com empate.

### 2. Customer cross-vertical behavior

As queries da segunda parte mostram como:

- resumir o comportamento de compra por cliente;
- distinguir clientes `rx`, `nv` e `both`;
- calcular a porcentagem mensal de clientes multiverticais.

Essa parte é especialmente útil para portfólio porque demonstra análise de comportamento de usuário, não só agregação operacional.

## Como executar

Fluxo sugerido em SQLite:

```bash
sqlite3 marketplace_sql_case.db
.read sql/01_schema.sql
.read sql/02_seed_data.sql
.read sql/03_q1a_business_order_counts.sql
.read sql/04_q1b_top3_rx_last_quarter.sql
.read sql/05_q2a_query_explanation.sql
.read sql/06_q2b_cross_vertical_monthly_pct.sql
```

## Resultados de referência

### Q1A

- `Bob's burgers | 12`
- `Clara's canteen | 10`
- `Danny's deli | 2`
- `Elle's eatery | 0`

### Q1B

- `Bob's burgers | 12`
- `Clara's canteen | 10`
- `Danny's deli | 2`

### Q2B

- `2021-01-01 | 0.05`
- `2021-02-01 | 0.07`

## Como ler este repositório tecnicamente

- `01_schema.sql`
  - define o modelo relacional mínimo
- `02_seed_data.sql`
  - cria um dataset pequeno, mas suficiente para validar os casos
- `03` e `04`
  - cobrem merchant-level analytics
- `05` e `06`
  - cobrem customer-level cross-vertical analytics

## Como defender em entrevista

> Este case mostra que eu sei trabalhar tanto com analytics operacional quanto com comportamento de clientes em múltiplas verticais. Ele cobre joins, distinct counts, ranking com empate e análise cross-vertical mensal, que são padrões muito comuns em SQL de produto e marketplace.

## English

`marketplace-sql-case` is a compact SQL repository focused on **marketplace analytics casework**.

It covers:

- merchant order counts
- inclusion of zero-order merchants
- top-N ranking with tie handling
- customer cross-vertical classification
- monthly percentage of customers ordering from both business lines

The repository is intentionally clean and runnable, making it useful both as a portfolio artifact and as an interview review lab.
