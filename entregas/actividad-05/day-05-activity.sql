CREATE SCHEMA IF NOT EXISTS core;
CREATE TABLE core.customers (
 customer_id UUID DEFAULT gen_random_uuid(), first_name core.texto_obligatorio NOT NULL,
 last_name core.texto_obligatorio NOT NULL, email VARCHAR(150) NOT NULL,
 phone_number VARCHAR(30), tax_id core.texto_obligatorio NOT NULL,
 date_of_birth DATE, created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
 is_active BOOLEAN NOT NULL DEFAULT TRUE,
 CONSTRAINT pk_customers_customer_id PRIMARY KEY(customer_id),
 CONSTRAINT uq_customers_email UNIQUE(email), CONSTRAINT uq_customers_tax_id UNIQUE(tax_id)
);
CREATE TABLE core.accounts (
 account_id UUID DEFAULT gen_random_uuid(), customer_id UUID NOT NULL,
 account_number VARCHAR(30) NOT NULL, currency core.tipo_moneda NOT NULL DEFAULT 'USD',
 account_type core.tipo_cuenta NOT NULL, balance core.monto_financiero NOT NULL DEFAULT 0,
 credit_limit core.monto_financiero NOT NULL DEFAULT 0,
 is_active BOOLEAN NOT NULL DEFAULT TRUE, updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT pk_accounts_account_id PRIMARY KEY(account_id),
 CONSTRAINT uq_accounts_account_number UNIQUE(account_number),
 CONSTRAINT fk_accounts_customer_id FOREIGN KEY(customer_id) REFERENCES core.customers(customer_id) ON DELETE RESTRICT
);
CREATE TABLE core.loans (
 loan_id UUID DEFAULT gen_random_uuid(), customer_id UUID NOT NULL,
 amount NUMERIC(15,2) NOT NULL, interest_rate NUMERIC(5,4) NOT NULL,
 status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
 CONSTRAINT pk_loans_loan_id PRIMARY KEY(loan_id),
 CONSTRAINT chk_loans_amount_positive CHECK(amount > 0),
 CONSTRAINT chk_loans_interest_nonnegative CHECK(interest_rate >= 0),
 CONSTRAINT fk_loans_customer_id FOREIGN KEY(customer_id) REFERENCES core.customers(customer_id) ON DELETE RESTRICT
);
CREATE TABLE core.transactions (
 transaction_id UUID DEFAULT gen_random_uuid(), account_id UUID NOT NULL,
 amount core.monto_financiero NOT NULL, tx_type core.tipo_transaccion NOT NULL,
 description TEXT, tx_timestamp TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT pk_transactions_transaction_id PRIMARY KEY(transaction_id),
 CONSTRAINT fk_transactions_account_id FOREIGN KEY(account_id) REFERENCES core.accounts(account_id) ON DELETE RESTRICT
);
