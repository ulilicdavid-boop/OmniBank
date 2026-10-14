BEGIN;
INSERT INTO core.customers(customer_id,first_name,last_name,email,phone_number,tax_id,date_of_birth)
VALUES
('11111111-1111-1111-1111-111111111111','John','Doe','john.doe@email.com','555-0100','TAX-100','1985-04-12'),
('22222222-2222-2222-2222-222222222222','Jane','Smith','jane.smith@email.com','555-0200','TAX-200','1990-08-25'),
('33333333-3333-3333-3333-333333333333','Alice','Johnson','alice.j@email.com','555-0300','TAX-300','1978-11-05')
ON CONFLICT(email) DO NOTHING;
INSERT INTO core.accounts(account_id,customer_id,account_number,currency,account_type,balance,credit_limit)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','11111111-1111-1111-1111-111111111111','ACCT-1001','USD','CHECKING',5000,0),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','22222222-2222-2222-2222-222222222222','ACCT-2001','USD','SAVINGS',15000,0),
('cccccccc-cccc-cccc-cccc-cccccccccccc','33333333-3333-3333-3333-333333333333','ACCT-3001','USD','CREDIT',0,10000)
ON CONFLICT(account_number) DO NOTHING;
INSERT INTO core.transactions(transaction_id,account_id,to_account_id,amount,tx_type,status,description,tx_timestamp)
VALUES
('10000000-0000-0000-0000-000000000001','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',150,'TRANSFER','COMPLETED','Cena de John', '2026-09-01 12:00+00'),
('10000000-0000-0000-0000-000000000002','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','cccccccc-cccc-cccc-cccc-cccccccccccc',300,'TRANSFER','COMPLETED','Abono de Jane', '2026-09-03 12:00+00'),
('10000000-0000-0000-0000-000000000003','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',NULL,50,'FEE','COMPLETED',NULL, '2026-09-02 12:00+00')
ON CONFLICT(transaction_id) DO NOTHING;
UPDATE core.accounts SET balance=balance-50, updated_at=CURRENT_TIMESTAMP
WHERE account_number='ACCT-1001'
RETURNING account_number,balance;
COMMIT;
