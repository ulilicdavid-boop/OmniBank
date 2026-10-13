# Actividad 1. Levantamiento de requisitos de OmniBank

## Entidades
- **Clientes:** personas registradas en el banco.
- **Cuentas:** productos bancarios que pertenecen a los clientes.
- **Transacciones:** movimientos de dinero entre cuentas.

## Requerimientos funcionales
1. Registrar de cada cliente nombre completo, correo electrónico, teléfono, fecha de nacimiento y Tax ID.
2. Permitir que un cliente tenga varias cuentas y registrar de cada una número, moneda, tipo, saldo y límite de crédito.
3. Registrar cada transacción con cuenta de origen, cuenta de destino, monto, tipo de operación y fecha exacta de realización.

## Restricciones de unicidad
- El correo electrónico de cada cliente debe ser único.
- El Tax ID de cada cliente no puede repetirse.
