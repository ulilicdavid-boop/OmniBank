# Tarea 3. Justificación de arquitectura de datos

El saldo actual de una cuenta es un dato derivado de sus movimientos y, si se almacena junto con el historial, representa una redundancia controlada. Sin embargo, no toda redundancia implica automáticamente una dependencia transitiva que viole 3NF: el análisis depende de las claves y dependencias funcionales del modelo. El saldo almacenado debe coincidir con los movimientos que lo respaldan.

Calcular el saldo desde cero mediante SUM sobre 250,000 transacciones cada vez que un cliente consulte su cuenta incrementaría el trabajo de lectura, el uso de CPU y la latencia del sistema. Por eso se conserva saldo_actual en Cuentas y se actualiza junto con las transacciones dentro de operaciones atómicas. El control de concurrencia, los bloqueos transaccionales y las reglas del motor permiten mantener la consistencia; los triggers pueden emplearse cuando forman parte del diseño.
