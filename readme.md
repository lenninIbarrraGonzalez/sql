# Proyecto Base de Datos: BancoPopular

Este proyecto consiste en la creación de una base de datos simulada para una entidad financiera ficticia llamada **BancoPopular**. La base de datos está diseñada para contener múltiples entidades relacionadas con la gestión de clientes, productos financieros, servicios y transacciones.

## Estructura de la Base de Datos

La base de datos incluye las siguientes tablas:

1. **Clientes**: Información personal de los clientes del banco.
2. **Cuentas**: Información de las cuentas bancarias asociadas a los clientes.
3. **Préstamos**: Detalles de los préstamos otorgados a los clientes.
4. **Pagos**: Registros de pagos realizados para saldar préstamos.
5. **Tarjetas**: Tarjetas de crédito o débito asociadas a los clientes.
6. **Servicios**: Lista de servicios ofrecidos por el banco.
7. **Clientes_Servicios**: Relación entre los clientes y los servicios que tienen activos.
8. **Transacciones**: Movimientos realizados en las cuentas bancarias.
9. **Sucursales**: Información sobre las sucursales del banco.

## Datos Insertados

- Se han insertado datos para **49 clientes**, incluyendo nombre, documento, dirección, teléfono, correo y fecha de nacimiento.
- A cada cliente se le han asignado:
  - 1 cuenta bancaria (de tipo "Ahorros" o "Corriente")
  - 1 préstamo con detalles de monto, tasa de interés y plazo
  - 1 pago correspondiente al préstamo
  - 1 tarjeta (crédito o débito)
  - 1 a 3 servicios ofrecidos por el banco
  - 1 a 2 transacciones en su cuenta
- Se han agregado nuevas sucursales basadas en las ciudades de los clientes.

## Consultas SQL Ejemplo

- **SELECT con condición** para contar clientes de Bogotá.
- **SELECT DISTINCT** aplicado a ciudades, tipos de cuentas y tipos de transacciones.
- **JOINs simples** para combinar información de clientes con cuentas, préstamos, y transacciones.
- **UNION** para combinar resultados de diferentes tipos de productos financieros.

## Objetivo

Este proyecto está diseñado para ser una base de práctica con fines educativos, permitiendo realizar consultas SQL básicas, intermedias y avanzadas, así como probar integridad referencial, claves foráneas y relaciones entre tablas.

---

**Nota**: Los datos son completamente ficticios y generados con propósitos académicos.

