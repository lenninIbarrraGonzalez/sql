Mostrar los servicios activos de cada cliente con la fecha de activación

SELECT c.nombre, c.apellido, s.nombre_servicio, cs.fecha_activacion
FROM Clientes_Servicios cs
JOIN Clientes c ON cs.cliente_id = c.cliente_id
JOIN Servicios s ON cs.servicio_id = s.servicio_id
ORDER BY c.cliente_id, cs.fecha_activacion;

Clientes que usan más de 2 servicios

SELECT c.cliente_id, c.nombre, c.apellido, COUNT(cs.servicio_id) AS total_servicios
FROM Clientes c
JOIN Clientes_Servicios cs ON c.cliente_id = cs.cliente_id
GROUP BY c.cliente_id
HAVING total_servicios > 2;

Servicios más populares (ordenados por cantidad de clientes)
SELECT s.nombre_servicio, COUNT(cs.cliente_id) AS total_clientes
FROM Servicios s
JOIN Clientes_Servicios cs ON s.servicio_id = cs.servicio_id
GROUP BY s.servicio_id
ORDER BY total_clientes DESC;

Servicios activados este año (2025)
SELECT c.nombre, c.apellido, s.nombre_servicio, cs.fecha_activacion
FROM Clientes_Servicios cs
JOIN Clientes c ON cs.cliente_id = c.cliente_id
JOIN Servicios s ON cs.servicio_id = s.servicio_id
WHERE YEAR(cs.fecha_activacion) = 2025;

Número de servicios activos por mes en 2024
SELECT 
    MONTH(fecha_activacion) AS mes,
    COUNT(*) AS total_servicios_activados
FROM Clientes_Servicios
WHERE YEAR(fecha_activacion) = 2024
GROUP BY mes
ORDER BY mes;