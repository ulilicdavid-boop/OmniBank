# Actividad 3. Normalización del prototipo de OmniBank

## Primera forma normal (1NF)
Separé los campos compuestos en atributos individuales:
- cliente_nombre_y_contacto → cliente_nombre, cliente_correo, cliente_telefono.
- moneda_y_tipo → moneda, tipo_cuenta.

Cada columna conserva un solo dato y cada fila puede identificarse mediante su llave.

## Segunda y tercera forma normal (2NF y 3NF)
Los datos de clientes y sucursales no dependen directamente de transaccion_id. El nombre, Tax ID y contacto corresponden al cliente; la dirección corresponde a la sucursal. Mantener esos datos repetidos en transacciones genera redundancia y anomalías de actualización.

Con una llave primaria simple como transaccion_id, el problema principal no es una dependencia parcial de 2NF, sino dependencias transitivas incompatibles con 3NF.

## Tablas resultantes

**Clientes**
- cliente_id **(PK)**
- cliente_nombre
- cliente_correo
- cliente_telefono
- cliente_tax_id

**Sucursales**
- sucursal_id **(PK)**
- sucursal_nombre
- sucursal_direccion

**Cuentas**
- cuenta_id **(PK)**
- cliente_id **(FK → Clientes.cliente_id)**
- sucursal_id **(FK → Sucursales.sucursal_id)**
- numero_cuenta
- moneda
- tipo_cuenta
- saldo_actual
- limite_credito

**Transacciones**
- transaccion_id **(PK)**
- cuenta_origen_id **(FK → Cuentas.cuenta_id)**
- cuenta_destino_id **(FK → Cuentas.cuenta_id)**
- monto
- tipo_transaccion
- fecha_transaccion

Así, los datos de contacto se mantienen en Clientes y los de ubicación en Sucursales, sin repetirlos en cada transacción.
