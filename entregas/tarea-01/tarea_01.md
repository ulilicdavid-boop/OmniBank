# Tarea 1. Requerimientos no funcionales de OmniBank

1. **Consistencia del saldo:** la base de datos debe impedir que el saldo de una cuenta sea negativo.
2. **Auditoría y baja lógica:** la base de datos no debe permitir eliminar físicamente los registros de clientes; cuando dejen de estar activos, debe conservarlos y marcarlos como inactivos.
3. **Rastreo temporal:** cada cuenta debe registrar la fecha y hora de su última modificación.
