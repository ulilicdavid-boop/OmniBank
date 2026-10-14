INSERT INTO core.customers(first_name,last_name,email,phone_number,tax_id,date_of_birth)
VALUES('John','Doe','john.doe@email.com','555-0199','TAX-100','1985-04-12')
ON CONFLICT(email) DO UPDATE SET
 first_name=EXCLUDED.first_name,
 last_name=EXCLUDED.last_name,
 phone_number=EXCLUDED.phone_number
RETURNING customer_id,email;
