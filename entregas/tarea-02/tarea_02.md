# Tarea 2. Refinamiento del modelo entidad-relación de OmniBank

## Clientes
- cliente_id **(PK, UUID)**
- nombre_completo
- correo_electronico **(UNIQUE)**
- telefono
- fecha_nacimiento
- tax_id **(UNIQUE)**
- is_active **(borrado lógico)**

## Cuentas
- cuenta_id **(PK, UUID)**
- cliente_id **(FK, UUID → Clientes.cliente_id)**
- numero_cuenta **(UNIQUE)**
- moneda
- tipo_cuenta
- saldo_actual **(no negativo)**
- limite_credito
- updated_at **(fecha y hora de última actualización)**

## Transacciones
- transaccion_id **(PK, UUID)**
- cuenta_origen_id **(FK, UUID → Cuentas.cuenta_id)**
- cuenta_destino_id **(FK, UUID → Cuentas.cuenta_id)**
- monto
- tipo_transaccion
- fecha_transaccion

## Cardinalidades
- Clientes **1:N** Cuentas.
- Cuentas **1:N** Transacciones por cuenta de origen.
- Cuentas **1:N** Transacciones por cuenta de destino.

Las llaves primarias utilizan UUID, no identificadores secuenciales. Los clientes se conservan mediante el indicador is_active y las cuentas registran su última modificación con updated_at.
