# Actividad 2. Modelo entidad-relación base de OmniBank

## Clientes
- cliente_id **(PK)**
- nombre_completo
- correo_electronico
- telefono
- fecha_nacimiento
- tax_id

## Cuentas
- cuenta_id **(PK)**
- cliente_id **(FK → Clientes.cliente_id)**
- numero_cuenta
- moneda
- tipo_cuenta
- saldo_actual
- limite_credito

## Transacciones
- transaccion_id **(PK)**
- cuenta_origen_id **(FK → Cuentas.cuenta_id)**
- cuenta_destino_id **(FK → Cuentas.cuenta_id)**
- monto
- tipo_transaccion
- fecha_transaccion

## Relaciones y cardinalidades
- **Clientes 1:N Cuentas:** un cliente puede tener varias cuentas; cada cuenta pertenece a un cliente.
- **Cuentas 1:N Transacciones como origen:** una cuenta puede originar múltiples transacciones; cada transacción identifica una cuenta de origen.
- **Cuentas 1:N Transacciones como destino:** una cuenta puede recibir múltiples transacciones; cada transacción identifica una cuenta de destino cuando corresponde.

Las dos llaves foráneas de Transacciones se relacionan por separado con Cuentas.
