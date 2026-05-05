# marketplace-sql-case

## Português

### Visão geral

`marketplace-sql-case` é um repositório de SQL para analytics de marketplace, organizado como um case técnico compacto e executável.

Ele cobre:

- ranking de merchants por volume;
- inclusão de merchants sem pedidos;
- top-N com tratamento de empate;
- comportamento cross-vertical de clientes;
- porcentagem mensal de clientes que compram em mais de uma vertical.

### Estrutura

- [sql/01_schema.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/01_schema.sql)
- [sql/02_seed_data.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/02_seed_data.sql)
- [sql/03_q1a_business_order_counts.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/03_q1a_business_order_counts.sql)
- [sql/04_q1b_top3_rx_last_quarter.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/04_q1b_top3_rx_last_quarter.sql)
- [sql/05_q2a_query_explanation.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/05_q2a_query_explanation.sql)
- [sql/06_q2b_cross_vertical_monthly_pct.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/06_q2b_cross_vertical_monthly_pct.sql)

### Estrutura analítica do case

#### 1. Merchant-side analytics

- volume por merchant
- inclusão de entidades sem pedidos
- ranking com empate

#### 2. Customer behavior analytics

- classificação de clientes por vertical
- identificação de clientes `both`
- evolução mensal de adoção cross-vertical

### Conceitos SQL demonstrados

- `LEFT JOIN`
- `COUNT(DISTINCT ...)`
- `CASE WHEN`
- filtros temporais
- agregação por entidade
- `DENSE_RANK()`
- CTEs
- análise cross-vertical
- cohorting mensal

### Resultados de referência

#### Q1A

- `Bob's burgers | 12`
- `Clara's canteen | 10`
- `Danny's deli | 2`
- `Elle's eatery | 0`

#### Q1B

- `Bob's burgers | 12`
- `Clara's canteen | 10`
- `Danny's deli | 2`

#### Q2B

- `2021-01-01 | 0.05`
- `2021-02-01 | 0.07`

### Como executar

```bash
sqlite3 marketplace_sql_case.db
.read sql/01_schema.sql
.read sql/02_seed_data.sql
.read sql/03_q1a_business_order_counts.sql
.read sql/04_q1b_top3_rx_last_quarter.sql
.read sql/05_q2a_query_explanation.sql
.read sql/06_q2b_cross_vertical_monthly_pct.sql
```

### Como defender em entrevista

> Este case mostra analytics operacional e comportamental no mesmo repositório: ranking de merchants, inclusão de zero-order merchants, top-N com empate e comportamento cross-vertical mensal de clientes.

## English

### Overview

`marketplace-sql-case` is a SQL repository for marketplace analytics, organized as a compact and runnable technical case.

It covers:

- merchant ranking by order volume
- inclusion of zero-order merchants
- top-N with tie handling
- customer cross-vertical behavior
- monthly share of customers ordering from more than one business line

### Repository structure

- [sql/01_schema.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/01_schema.sql)
- [sql/02_seed_data.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/02_seed_data.sql)
- [sql/03_q1a_business_order_counts.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/03_q1a_business_order_counts.sql)
- [sql/04_q1b_top3_rx_last_quarter.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/04_q1b_top3_rx_last_quarter.sql)
- [sql/05_q2a_query_explanation.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/05_q2a_query_explanation.sql)
- [sql/06_q2b_cross_vertical_monthly_pct.sql](/Users/flaviagaia/Documents/CV_FLAVIA_CODEX/marketplace-sql-case/sql/06_q2b_cross_vertical_monthly_pct.sql)

### Analytical structure

#### 1. Merchant-side analytics

- volume by merchant
- inclusion of zero-order entities
- ranking with tie handling

#### 2. Customer behavior analytics

- classifying customers by business line
- identifying `both` customers
- monthly evolution of cross-vertical adoption

### SQL concepts demonstrated

- `LEFT JOIN`
- `COUNT(DISTINCT ...)`
- `CASE WHEN`
- time-window filtering
- entity-level aggregation
- `DENSE_RANK()`
- CTEs
- cross-vertical analysis
- monthly cohorting

### Reference results

#### Q1A

- `Bob's burgers | 12`
- `Clara's canteen | 10`
- `Danny's deli | 2`
- `Elle's eatery | 0`

#### Q1B

- `Bob's burgers | 12`
- `Clara's canteen | 10`
- `Danny's deli | 2`

#### Q2B

- `2021-01-01 | 0.05`
- `2021-02-01 | 0.07`

### How to run

```bash
sqlite3 marketplace_sql_case.db
.read sql/01_schema.sql
.read sql/02_seed_data.sql
.read sql/03_q1a_business_order_counts.sql
.read sql/04_q1b_top3_rx_last_quarter.sql
.read sql/05_q2a_query_explanation.sql
.read sql/06_q2b_cross_vertical_monthly_pct.sql
```

### Interview framing

> This case shows both operational and behavioral analytics in the same repository: merchant ranking, inclusion of zero-order merchants, top-N with ties, and monthly cross-vertical customer behavior.
