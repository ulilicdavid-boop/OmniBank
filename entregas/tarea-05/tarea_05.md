# Tarea 5. Dictamen sobre integridad referencial en OmniBank

Se rechaza sustituir ON DELETE RESTRICT por ON DELETE CASCADE en las relaciones principales del núcleo bancario. Si se eliminara accidentalmente un cliente, CASCADE podría propagar el borrado a cuentas y otros registros relacionados, con pérdida de información necesaria para la operación y la revisión posterior. La comodidad para limpiar datos de pruebas no justifica ese riesgo en producción.

Los registros de transacciones y préstamos deben conservarse conforme a las obligaciones de conservación, auditoría y trazabilidad aplicables. El historial permite reconstruir operaciones y atender revisiones contables y regulatorias. La política de retención concreta depende de la jurisdicción, pero el diseño del sistema debe impedir que una baja de cliente destruya automáticamente el historial financiero.

Cuando un cliente termina su relación con el banco, se utiliza una baja lógica: el registro permanece y su indicador is_active pasa a false. Las cuentas se marcan como inactivas o cerradas según su estado operativo, sin borrar las transacciones asociadas. Se mantiene ON DELETE RESTRICT para proteger la integridad referencial.
