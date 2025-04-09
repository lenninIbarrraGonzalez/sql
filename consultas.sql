Seleccionar todos los clientes
SELECT * FROM Clientes;

Ver nombres y correos electrónicos de clientes
SELECT nombre, correo_electronico FROM Clientes;

Mostrar cuentas con saldo mayor a $1,000,000
SELECT * FROM Cuentas
WHERE saldo > 1000000;


Tipos de transacciones realizadas
SELECT DISTINCT tipo_transaccion
FROM Transacciones;

Listar préstamos con plazo igual o mayor a 48 meses
SELECT * FROM Prestamos
WHERE plazo_meses >= 48;

Obtener clientes ordenados por fecha de nacimiento (más jóvenes al final)
SELECT nombre, apellido, fecha_nacimiento
FROM Clientes
ORDER BY fecha_nacimiento ASC;


1. JOIN entre Clientes y Cuentas
SELECT c.nombre, c.apellido, cu.numero_cuenta, cu.saldo
FROM Clientes c
JOIN Cuentas cu ON c.cliente_id = cu.cliente_id;

-- ¿Qué hace esta consulta?
-- Une la tabla Clientes con la tabla Cuentas usando el campo cliente_id. Devuelve el nombre y apellido del cliente junto con su número de cuenta y el saldo.
-- ✅ Útil para ver qué cuentas tiene cada cliente.

2. JOIN entre Prestamos y Pagos
SELECT p.prestamo_id, p.monto, pg.monto_pagado, pg.fecha_pago
FROM Prestamos p
JOIN Pagos pg ON p.prestamo_id = pg.prestamo_id;
-- ¿Qué hace esta consulta?
-- Une la tabla Prestamos con la tabla Pagos, mostrando el monto total del préstamo junto con los pagos realizados.
-- ✅ Útil para llevar control de cuánto se ha pagado por cada préstamo.

 3. JOIN entre Clientes y Clientes_Servicios
 SELECT c.nombre, c.apellido, cs.servicio_id, cs.fecha_activacion
FROM Clientes c
JOIN Clientes_Servicios cs ON c.cliente_id = cs.cliente_id;
-- ¿Qué hace esta consulta?
-- Relaciona los clientes con los servicios que tienen activos, incluyendo la fecha en que se activó cada uno.
-- ✅ Útil para saber qué servicios tiene cada cliente.


SELECT COUNT(*) AS total_clientes_bogota
FROM Clientes
WHERE direccion LIKE '%Bogotá%';


Ver nombre del cliente y número de su cuenta
SELECT c.nombre, c.apellido, cu.numero_cuenta
FROM Clientes c
JOIN Cuentas cu ON c.cliente_id = cu.cliente_id;

Listar clientes con su tipo de tarjeta
SELECT c.nombre, c.apellido, t.tipo_tarjeta
FROM Clientes c
JOIN Tarjetas t ON c.cliente_id = t.cliente_id;

Obtener nombre del cliente y los montos de sus préstamos
SELECT c.nombre, c.apellido, t.tipo_tarjeta
FROM Clientes c
JOIN Tarjetas t ON c.cliente_id = t.cliente_id;

Clientes con cuentas tipo "Ahorros"
SELECT c.nombre, c.apellido, cu.tipo_cuenta
FROM Clientes c
JOIN Cuentas cu ON c.cliente_id = cu.cliente_id
WHERE cu.tipo_cuenta = 'Ahorros';

Clientes con tarjetas de tipo "Crédito" emitidas después de 2026
SELECT c.nombre, c.apellido, t.numero_tarjeta, t.fecha_expiracion
FROM Clientes c
JOIN Tarjetas t ON c.cliente_id = t.cliente_id
WHERE t.tipo_tarjeta = 'Crédito' AND t.fecha_expiracion > '2026-12-31';

Clientes que han activado el servicio con ID 1 (Banca Móvil)
SELECT c.nombre, c.apellido, cs.servicio_id, cs.fecha_activacion
FROM Clientes c
JOIN Clientes_Servicios cs ON c.cliente_id = cs.cliente_id
WHERE cs.servicio_id = 1;

SELECT 
    c.nombre, 
    c.apellido, 
    s.nombre_servicio, 
    cs.fecha_activacion
FROM Clientes c
JOIN Clientes_Servicios cs ON c.cliente_id = cs.cliente_id
JOIN Servicios s ON cs.servicio_id = s.servicio_id
WHERE cs.servicio_id = 1;