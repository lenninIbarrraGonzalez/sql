-- Tabla de Clientes
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    documento_identidad VARCHAR(20) UNIQUE,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(100),
    fecha_nacimiento DATE
);

-- Tabla de Cuentas
CREATE TABLE Cuentas (
    cuenta_id INT AUTO_INCREMENT PRIMARY KEY,
    numero_cuenta VARCHAR(20) UNIQUE,
    tipo_cuenta ENUM('Ahorros', 'Corriente'),
    saldo DECIMAL(15,2),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabla de Transacciones
CREATE TABLE Transacciones (
    transaccion_id INT AUTO_INCREMENT PRIMARY KEY,
    cuenta_id INT,
    tipo_transaccion ENUM('Depósito', 'Retiro', 'Transferencia'),
    monto DECIMAL(15,2),
    fecha_transaccion DATETIME,
    FOREIGN KEY (cuenta_id) REFERENCES Cuentas(cuenta_id)
);

-- Tabla de Tarjetas
CREATE TABLE Tarjetas (
    tarjeta_id INT AUTO_INCREMENT PRIMARY KEY,
    numero_tarjeta VARCHAR(16) UNIQUE,
    tipo_tarjeta ENUM('Débito', 'Crédito'),
    fecha_expiracion DATE,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabla de Préstamos
CREATE TABLE Prestamos (
    prestamo_id INT AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(15,2),
    tasa_interes DECIMAL(5,2),
    plazo_meses INT,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabla de Pagos
CREATE TABLE Pagos (
    pago_id INT AUTO_INCREMENT PRIMARY KEY,
    prestamo_id INT,
    monto_pagado DECIMAL(15,2),
    fecha_pago DATE,
    FOREIGN KEY (prestamo_id) REFERENCES Prestamos(prestamo_id)
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    documento_identidad VARCHAR(20) UNIQUE,
    puesto VARCHAR(100),
    sucursal_id INT,
    FOREIGN KEY (sucursal_id) REFERENCES Sucursales(sucursal_id)
);

-- Tabla de Sucursales
CREATE TABLE Sucursales (
    sucursal_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sucursal VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Tabla de Servicios
CREATE TABLE Servicios (
    servicio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100),
    descripcion TEXT
);

-- Tabla de Clientes_Servicios (relación muchos a muchos entre Clientes y Servicios)
CREATE TABLE Clientes_Servicios (
    cliente_id INT,
    servicio_id INT,
    fecha_contratacion DATE,
    PRIMARY KEY (cliente_id, servicio_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (servicio_id) REFERENCES Servicios(servicio_id)
);

1. Tabla Clientes
INSERT INTO Clientes (nombre, apellido, documento_identidad, direccion, telefono, correo_electronico, fecha_nacimiento) VALUES
('Carlos', 'García', 'CC12345678', 'Calle 123 #45-67, Bogotá', '3001234567', 'carlos.garcia@example.com', '1985-05-15'),
('María', 'López', 'CC87654321', 'Carrera 54 #23-45, Medellín', '3107654321', 'maria.lopez@example.com', '1990-08-22'),
('Juan', 'Martínez', 'CC11223344', 'Avenida 68 #34-56, Cali', '3201122334', 'juan.martinez@example.com', '1982-11-30'),
('Ana', 'Rodríguez', 'CC44332211', 'Diagonal 12 #98-76, Barranquilla', '3014433221', 'ana.rodriguez@example.com', '1995-03-10'),
('Luis', 'Fernández', 'CC55667788', 'Transversal 25 #65-43, Cartagena', '3115566778', 'luis.fernandez@example.com', '1988-07-25');

2. Tabla Cuentas
INSERT INTO Cuentas (numero_cuenta, tipo_cuenta, saldo, cliente_id) VALUES
('1002003001', 'Ahorros', 500000.00, 1),
('1002003002', 'Corriente', 1500000.00, 2),
('1002003003', 'Ahorros', 750000.00, 3),
('1002003004', 'Corriente', 200000.00, 4),
('1002003005', 'Ahorros', 1000000.00, 5);

3. Tabla Transacciones
INSERT INTO Transacciones (cuenta_id, tipo_transaccion, monto, fecha_transaccion) VALUES
(1, 'Depósito', 200000.00, '2025-04-01 10:00:00'),
(2, 'Retiro', 50000.00, '2025-04-02 11:30:00'),
(3, 'Transferencia', 150000.00, '2025-04-03 14:45:00'),
(4, 'Depósito', 300000.00, '2025-04-04 09:20:00'),
(5, 'Retiro', 100000.00, '2025-04-05 16:10:00');

4. Tabla Tarjetas
INSERT INTO Tarjetas (numero_tarjeta, tipo_tarjeta, fecha_expiracion, cliente_id) VALUES
('4111111111111111', 'Crédito', '2027-12-31', 1),
('5500000000000004', 'Débito', '2026-11-30', 2),
('340000000000009', 'Crédito', '2028-10-31', 3),
('30000000000004', 'Débito', '2025-09-30', 4),
('6011000000000004', 'Crédito', '2029-08-31', 5);

5. Tabla Prestamos
INSERT INTO Prestamos (monto, tasa_interes, plazo_meses, cliente_id) VALUES
(5000000.00, 12.5, 36, 1),
(10000000.00, 10.0, 60, 2),
(7500000.00, 11.0, 48, 3),
(3000000.00, 13.5, 24, 4),
(15000000.00, 9.5, 72, 5);

6. Tabla Pagos
INSERT INTO Pagos (prestamo_id, monto_pagado, fecha_pago) VALUES
(1, 150000.00, '2025-04-06'),
(2, 200000.00, '2025-04-07'),
(3, 175000.00, '2025-04-08'),
(4, 125000.00, '2025-04-09'),
(5, 250000.00, '2025-04-10');


 Tabla Sucursales
INSERT INTO Sucursales (nombre_sucursal, direccion, telefono) VALUES
('Sucursal Centro', 'Carrera 7 #12-34, Bogotá', '6012345678'),
('Sucursal Norte', 'Calle 100 #15-45, Bogotá', '6018765432'),
('Sucursal Sur', 'Avenida 68 #30-55, Bogotá', '6015678901'),
('Sucursal Medellín', 'Calle 50 #40-20, Medellín', '6041234567'),
('Sucursal Cali', 'Carrera 1 #20-30, Cali', '6029876543');

Tabla Empleados

INSERT INTO Empleados (nombre, apellido, documento_identidad, puesto, sucursal_id) VALUES
('Laura', 'Hernández', 'CC99887766', 'Gerente', 1),
('Pedro', 'Gómez', 'CC88776655', 'Cajero', 2),
('Sofía', 'Díaz', 'CC77665544', 'Asesor', 3),
('Miguel', 'Torres', 'CC66554433', 'Analista', 4),
('Lucía', 'Ramírez', 'CC55443322', 'Supervisor', 5);

 Tabla Servicios
INSERT INTO Servicios (nombre_servicio, descripcion) VALUES
('Banca Móvil', 'Acceso a cuentas bancarias desde dispositivos móviles'),
('Seguro de Vida', 'Cobertura de seguro de vida para clientes'),
('Inversiones', 'Asesoría y gestión de portafolios de inversión'),
('Créditos Hipotecarios', 'Préstamos para adquisición de vivienda'),
('Tarjeta de Crédito Premium', 'Tarjeta de crédito con beneficios exclusivos');


-- Cliente 1 tiene 2 servicios
INSERT INTO Clientes_Servicios (cliente_id, servicio_id, fecha_activacion) VALUES
(1, 1, '2023-03-01'), -- Banca Móvil
(1, 2, '2023-04-15'); -- Seguro de Vida

-- Cliente 2 tiene 1 servicio
INSERT INTO Clientes_Servicios (cliente_id, servicio_id, fecha_activacion) VALUES
(2, 3, '2023-05-20'); -- Inversiones

-- Cliente 3 tiene 3 servicios
INSERT INTO Clientes_Servicios (cliente_id, servicio_id, fecha_activacion) VALUES
(3, 1, '2024-01-10'),
(3, 2, '2024-02-05'),
(3, 4, '2024-03-12');

-- Cliente 4 tiene 1 servicio
INSERT INTO Clientes_Servicios (cliente_id, servicio_id, fecha_activacion) VALUES
(4, 5, '2023-12-01'); -- Tarjeta de Crédito Premium


ALTER TABLE Clientes_Servicios
ADD COLUMN fecha_activacion DATE;


INSERT INTO Clientes (cliente_id, nombre, apellido, documento_identidad, direccion, telefono, correo_electronico, fecha_nacimiento) VALUES
(6, 'Valentina', 'Mejía', 'CC90123456', 'Carrera 7 #12-34, Bogotá', '3004567891', 'valentina.mejia@example.com', '1991-04-11'),
(7, 'Andrés', 'Ruiz', 'CC90123457', 'Calle 45 #67-89, Medellín', '3115678902', 'andres.ruiz@example.com', '1984-09-28'),
(8, 'Juliana', 'Torres', 'CC90123458', 'Avenida 30 #23-56, Cali', '3206789013', 'juliana.torres@example.com', '1993-01-19'),
(9, 'Camilo', 'Sánchez', 'CC90123459', 'Diagonal 56 #78-90, Bucaramanga', '3017890124', 'camilo.sanchez@example.com', '1987-06-03'),
(10, 'Diana', 'Pérez', 'CC90123460', 'Transversal 89 #12-34, Pereira', '3108901235', 'diana.perez@example.com', '1995-10-07'),
(11, 'Felipe', 'Moreno', 'CC90123461', 'Carrera 50 #45-78, Cúcuta', '3029012346', 'felipe.moreno@example.com', '1983-03-14'),
(12, 'Laura', 'Gómez', 'CC90123462', 'Calle 90 #56-78, Ibagué', '3110123457', 'laura.gomez@example.com', '1992-08-25'),
(13, 'Sebastián', 'Vargas', 'CC90123463', 'Avenida 6 #77-66, Santa Marta', '3031234568', 'sebastian.vargas@example.com', '1989-12-05'),
(14, 'Isabella', 'Jiménez', 'CC90123464', 'Carrera 9 #99-10, Manizales', '3042345679', 'isabella.jimenez@example.com', '1996-07-18'),
(15, 'Mateo', 'Castro', 'CC90123465', 'Calle 78 #43-21, Villavicencio', '3053456790', 'mateo.castro@example.com', '1980-02-27'),
(16, 'Sofía', 'Ramírez', 'CC90123466', 'Avenida Las Américas #55-90, Neiva', '3064567891', 'sofia.ramirez@example.com', '1994-06-11'),
(17, 'Tomás', 'Herrera', 'CC90123467', 'Diagonal 23 #34-45, Popayán', '3075678912', 'tomas.herrera@example.com', '1986-11-20'),
(18, 'Luciana', 'Mendoza', 'CC90123468', 'Transversal 12 #11-22, Montería', '3086789123', 'luciana.mendoza@example.com', '1990-05-04'),
(19, 'Samuel', 'Cárdenas', 'CC90123469', 'Calle 34 #56-67, Armenia', '3097891234', 'samuel.cardenas@example.com', '1985-09-13'),
(20, 'Gabriela', 'Salazar', 'CC90123470', 'Carrera 3 #23-45, Sincelejo', '3008912345', 'gabriela.salazar@example.com', '1993-02-21'),
(21, 'Emilio', 'León', 'CC90123471', 'Calle 88 #12-90, Riohacha', '3119023456', 'emilio.leon@example.com', '1982-12-01'),
(22, 'Antonia', 'Acosta', 'CC90123472', 'Avenida 19 #33-44, Leticia', '3020134567', 'antonia.acosta@example.com', '1988-04-30'),
(23, 'Simón', 'Delgado', 'CC90123473', 'Carrera 21 #45-66, Mitú', '3031245678', 'simon.delgado@example.com', '1991-06-12'),
(24, 'Renata', 'Navarro', 'CC90123474', 'Calle 54 #11-20, Inírida', '3042356789', 'renata.navarro@example.com', '1987-01-08'),
(25, 'Martín', 'Reyes', 'CC90123475', 'Diagonal 45 #66-77, Quibdó', '3053467890', 'martin.reyes@example.com', '1984-08-17'),
(26, 'Daniela', 'Cano', 'CC90123476', 'Carrera 60 #78-89, Arauca', '3064578901', 'daniela.cano@example.com', '1992-10-03'),
(27, 'Esteban', 'Ortega', 'CC90123477', 'Calle 100 #11-11, San José del Guaviare', '3075689012', 'esteban.ortega@example.com', '1981-05-22'),
(28, 'Manuela', 'Zapata', 'CC90123478', 'Transversal 13 #55-66, Puerto Carreño', '3086790123', 'manuela.zapata@example.com', '1989-09-01'),
(29, 'Julián', 'Ríos', 'CC90123479', 'Avenida Caracas #90-10, Turbo', '3097801234', 'julian.rios@example.com', '1994-03-09'),
(30, 'Sara', 'Luna', 'CC90123480', 'Carrera 10 #10-20, Maicao', '3108912345', 'sara.luna@example.com', '1986-07-16'),
(31, 'Ángel', 'Peña', 'CC90123481', 'Calle 19 #22-33, Rionegro', '3119023456', 'angel.pena@example.com', '1983-11-27'),
(32, 'Camila', 'Guzmán', 'CC90123482', 'Avenida 6 #44-55, Soacha', '3120134567', 'camila.guzman@example.com', '1990-01-12'),
(33, 'Maximiliano', 'López', 'CC90123483', 'Transversal 70 #77-88, Zipaquirá', '3131245678', 'max.lopez@example.com', '1985-06-25'),
(34, 'Mariana', 'Beltrán', 'CC90123484', 'Carrera 15 #34-56, Facatativá', '3142356789', 'mariana.beltran@example.com', '1993-12-30'),
(35, 'Benjamín', 'Silva', 'CC90123485', 'Calle 40 #23-90, Mosquera', '3153467890', 'benjamin.silva@example.com', '1979-04-06'),
(36, 'Regina', 'Cuéllar', 'CC90123486', 'Avenida 23 #12-34, Cajicá', '3164578901', 'regina.cuellar@example.com', '1987-09-15'),
(37, 'Isaac', 'Mora', 'CC90123487', 'Calle 33 #11-99, Chía', '3175689012', 'isaac.mora@example.com', '1984-12-19'),
(38, 'Alejandra', 'Patiño', 'CC90123488', 'Diagonal 76 #66-44, Madrid', '3186790123', 'alejandra.patino@example.com', '1995-08-08'),
(39, 'Lucas', 'Arias', 'CC90123489', 'Carrera 20 #23-45, Sogamoso', '3197801234', 'lucas.arias@example.com', '1981-03-28'),
(40, 'Emilia', 'Aguilar', 'CC90123490', 'Calle 99 #11-12, Yopal', '3008912345', 'emilia.aguilar@example.com', '1988-11-03'),
(41, 'Thiago', 'García', 'CC90123491', 'Transversal 40 #20-77, Duitama', '3019023456', 'thiago.garcia@example.com', '1991-01-14'),
(42, 'Salomé', 'Rangel', 'CC90123492', 'Carrera 12 #33-44, Puerto Asís', '3020134567', 'salome.rangel@example.com', '1982-06-02'),
(43, 'Facundo', 'Quintero', 'CC90123493', 'Calle 22 #11-90, Tumaco', '3031245678', 'facundo.quintero@example.com', '1990-09-30'),
(44, 'Josefa', 'Molina', 'CC90123494', 'Diagonal 30 #55-66, Fusagasugá', '3042356789', 'josefa.molina@example.com', '1986-03-06'),
(45, 'Benjamina', 'Robledo', 'CC90123495', 'Carrera 44 #22-33, Palmira', '3053467890', 'benjamina.robledo@example.com', '1983-07-23'),
(46, 'Valerio', 'Muñoz', 'CC90123496', 'Calle 60 #77-78, Pitalito', '3064578901', 'valerio.munoz@example.com', '1992-05-18'),
(47, 'Agustina', 'Rueda', 'CC90123497', 'Avenida 100 #12-90, Tuluá', '3075689012', 'agustina.rueda@example.com', '1980-10-20'),
(48, 'Cristóbal', 'Palacios', 'CC90123498', 'Transversal 88 #45-66, Girardot', '3086790123', 'cristobal.palacios@example.com', '1978-02-04'),
(49, 'Florencia', 'Barrios', 'CC90123499', 'Carrera 60 #33-11, Melgar', '3097801234', 'florencia.barrios@example.com', '1996-06-27');

INSERT INTO Cuentas (cliente_id, numero_cuenta, tipo_cuenta, saldo, fecha_apertura) VALUES
(6, '100000006', 'Ahorros', 1530000.50, '2021-02-01'),
(7, '100000007', 'Corriente', 243000.00, '2022-05-15'),
(8, '100000008', 'Ahorros', 986500.75, '2020-09-10'),
(9, '100000009', 'Corriente', 187000.25, '2023-03-20'),
(10, '100000010', 'Ahorros', 4200000.00, '2019-11-03'),
-- (continúa hasta cliente_id 49) ...
(49, '100000049', 'Ahorros', 380000.00, '2021-08-25');


INSERT INTO Cuentas (cliente_id, tipo_cuenta, numero_cuenta, saldo, fecha_apertura) VALUES
(6, 'Ahorros', '10000006', 1500000, '2022-01-10'),
(7, 'Corriente', '10000007', 2450000, '2021-06-15'),
(8, 'Ahorros', '10000008', 800000, '2023-02-20'),
(9, 'Corriente', '10000009', 1320000, '2020-11-05'),
(10, 'Ahorros', '10000010', 540000, '2023-05-30');
(11, 'Ahorros', '10000006', 1500000, '2022-01-10'),
(12, 'Corriente', '10000007', 2450000, '2021-06-15'),
(13, 'Ahorros', '10000008', 800000, '2023-02-20'),
(14, 'Corriente', '10000009', 1320000, '2020-11-05'),
(15, 'Ahorros', '10000010', 540000, '2023-05-30');
(16, 'Ahorros', '10000006', 1500000, '2022-01-10'),
(17, 'Corriente', '10000007', 2450000, '2021-06-15'),
(18, 'Ahorros', '10000008', 800000, '2023-02-20'),
(19, 'Corriente', '10000009', 1320000, '2020-11-05'),
(20, 'Ahorros', '10000010', 540000, '2023-05-30');
(21, 'Ahorros', '10000006', 1500000, '2022-01-10'),
(22, 'Corriente', '10000007', 2450000, '2021-06-15'),
(23, 'Ahorros', '10000008', 800000, '2023-02-20'),
(24, 'Corriente', '10000009', 1320000, '2020-11-05'),
(25, 'Ahorros', '10000010', 540000, '2023-05-30');
(26, 'Ahorros', '10000006', 1500000, '2022-01-10'),
(27, 'Corriente', '10000007', 2450000, '2021-06-15'),
(28, 'Ahorros', '10000008', 800000, '2023-02-20'),
(29, 'Corriente', '10000009', 1320000, '2020-11-05'),
(30, 'Ahorros', '10000010', 540000, '2023-05-30');
(31, 'Ahorros', '10000006', 1500000, '2022-01-10'),
(32, 'Corriente', '10000007', 2450000, '2021-06-15'),
(33, 'Ahorros', '10000008', 800000, '2023-02-20'),
(34, 'Corriente', '10000009', 1320000, '2020-11-05'),
(35, 'Ahorros', '10000010', 540000, '2023-05-30');
(36, 'Ahorros', '10000006', 1500000, '2022-01-10'),
(37, 'Corriente', '10000007', 2450000, '2021-06-15'),
(38, 'Ahorros', '10000008', 800000, '2023-02-20'),
(39, 'Corriente', '10000009', 1320000, '2020-11-05'),
(40, 'Ahorros', '10000010', 540000, '2023-05-30');

INSERT INTO Cuentas (cuenta_id, numero_cuenta, tipo_cuenta, saldo, cliente_id) VALUES
(6, 1002003006, 'Corriente', 1200000.00, 6),
(7, 1002003007, 'Ahorros', 900000.00, 7),
(8, 1002003008, 'Corriente', 250000.00, 8),
(9, 1002003009, 'Ahorros', 1100000.00, 9),
(10, 1002003010, 'Corriente', 700000.00, 10),
(11, 1002003011, 'Ahorros', 950000.00, 11),
(12, 1002003012, 'Corriente', 1300000.00, 12),
(13, 1002003013, 'Ahorros', 1050000.00, 13),
(14, 1002003014, 'Corriente', 300000.00, 14),
(15, 1002003015, 'Ahorros', 880000.00, 15),
(16, 1002003016, 'Corriente', 1400000.00, 16),
(17, 1002003017, 'Ahorros', 920000.00, 17),
(18, 1002003018, 'Corriente', 500000.00, 18),
(19, 1002003019, 'Ahorros', 700000.00, 19),
(20, 1002003020, 'Corriente', 1600000.00, 20),
(21, 1002003021, 'Ahorros', 1150000.00, 21),
(22, 1002003022, 'Corriente', 350000.00, 22),
(23, 1002003023, 'Ahorros', 970000.00, 23),
(24, 1002003024, 'Corriente', 1250000.00, 24),
(25, 1002003025, 'Ahorros', 890000.00, 25),
(26, 1002003026, 'Corriente', 1450000.00, 26),
(27, 1002003027, 'Ahorros', 1020000.00, 27),
(28, 1002003028, 'Corriente', 400000.00, 28),
(29, 1002003029, 'Ahorros', 1080000.00, 29),
(30, 1002003030, 'Corriente', 1350000.00, 30),
(31, 1002003031, 'Ahorros', 940000.00, 31),
(32, 1002003032, 'Corriente', 600000.00, 32),
(33, 1002003033, 'Ahorros', 860000.00, 33),
(34, 1002003034, 'Corriente', 1500000.00, 34),
(35, 1002003035, 'Ahorros', 910000.00, 35),
(36, 1002003036, 'Corriente', 370000.00, 36),
(37, 1002003037, 'Ahorros', 1130000.00, 37),
(38, 1002003038, 'Corriente', 1190000.00, 38),
(39, 1002003039, 'Ahorros', 1070000.00, 39),
(40, 1002003040, 'Corriente', 420000.00, 40),
(41, 1002003041, 'Ahorros', 1000000.00, 41),
(42, 1002003042, 'Corriente', 900000.00, 42),
(43, 1002003043, 'Ahorros', 870000.00, 43),
(44, 1002003044, 'Corriente', 1550000.00, 44),
(45, 1002003045, 'Ahorros', 930000.00, 45),
(46, 1002003046, 'Corriente', 380000.00, 46),
(47, 1002003047, 'Ahorros', 1140000.00, 47),
(48, 1002003048, 'Corriente', 1240000.00, 48),
(49, 1002003049, 'Ahorros', 960000.00, 49);


INSERT INTO Prestamos (prestamo_id, monto, tasa_interes, plazo_meses, cliente_id) VALUES
(6, 3200000.00, 12.00, 36, 6),
(7, 5800000.00, 11.50, 48, 7),
(8, 7200000.00, 10.75, 60, 8),
(9, 4100000.00, 13.00, 36, 9),
(10, 9000000.00, 9.80, 72, 10),
(11, 6000000.00, 10.50, 60, 11),
(12, 7500000.00, 11.00, 48, 12),
(13, 4300000.00, 13.20, 24, 13),
(14, 8500000.00, 10.10, 60, 14),
(15, 3900000.00, 12.75, 36, 15),
(16, 5000000.00, 11.20, 48, 16),
(17, 7000000.00, 10.90, 60, 17),
(18, 6200000.00, 11.50, 36, 18),
(19, 8100000.00, 10.00, 60, 19),
(20, 4700000.00, 12.30, 36, 20),
(21, 6900000.00, 11.00, 48, 21),
(22, 5300000.00, 12.00, 36, 22),
(23, 9100000.00, 9.90, 72, 23),
(24, 3600000.00, 13.40, 24, 24),
(25, 4400000.00, 12.80, 36, 25),
(26, 7900000.00, 10.30, 60, 26),
(27, 5700000.00, 11.60, 48, 27),
(28, 8800000.00, 10.00, 72, 28),
(29, 4200000.00, 13.10, 36, 29),
(30, 7400000.00, 10.20, 60, 30),
(31, 3900000.00, 12.60, 36, 31),
(32, 6100000.00, 11.10, 48, 32),
(33, 8100000.00, 10.80, 60, 33),
(34, 4600000.00, 12.50, 36, 34),
(35, 6800000.00, 11.30, 48, 35),
(36, 5200000.00, 12.10, 36, 36),
(37, 8900000.00, 9.70, 72, 37),
(38, 3700000.00, 13.60, 24, 38),
(39, 4500000.00, 12.90, 36, 39),
(40, 7700000.00, 10.40, 60, 40),
(41, 5600000.00, 11.70, 48, 41),
(42, 8600000.00, 10.10, 72, 42),
(43, 4300000.00, 13.00, 36, 43),
(44, 7300000.00, 10.30, 60, 44),
(45, 4000000.00, 12.70, 36, 45),
(46, 6200000.00, 11.20, 48, 46),
(47, 8200000.00, 10.60, 60, 47),
(48, 4800000.00, 12.40, 36, 48),
(49, 6600000.00, 11.40, 48, 49);


INSERT INTO Pagos (pago_id, prestamo_id, monto_pagado, fecha_pago) VALUES
(6, 6, 250000.00, '2025-04-01'),
(7, 7, 300000.00, '2025-04-01'),
(8, 8, 200000.00, '2025-04-02'),
(9, 9, 280000.00, '2025-04-02'),
(10, 10, 350000.00, '2025-04-03'),
(11, 11, 310000.00, '2025-04-03'),
(12, 12, 400000.00, '2025-04-03'),
(13, 13, 270000.00, '2025-04-04'),
(14, 14, 320000.00, '2025-04-04'),
(15, 15, 260000.00, '2025-04-04'),
(16, 16, 290000.00, '2025-04-05'),
(17, 17, 330000.00, '2025-04-05'),
(18, 18, 310000.00, '2025-04-05'),
(19, 19, 340000.00, '2025-04-06'),
(20, 20, 275000.00, '2025-04-06'),
(21, 21, 315000.00, '2025-04-06'),
(22, 22, 295000.00, '2025-04-07'),
(23, 23, 365000.00, '2025-04-07'),
(24, 24, 240000.00, '2025-04-07'),
(25, 25, 250000.00, '2025-04-08'),
(26, 26, 385000.00, '2025-04-08'),
(27, 27, 305000.00, '2025-04-08'),
(28, 28, 375000.00, '2025-04-09'),
(29, 29, 255000.00, '2025-04-09'),
(30, 30, 345000.00, '2025-04-09'),
(31, 31, 265000.00, '2025-04-10'),
(32, 32, 295000.00, '2025-04-10'),
(33, 33, 360000.00, '2025-04-10'),
(34, 34, 270000.00, '2025-04-11'),
(35, 35, 310000.00, '2025-04-11'),
(36, 36, 290000.00, '2025-04-11'),
(37, 37, 370000.00, '2025-04-12'),
(38, 38, 235000.00, '2025-04-12'),
(39, 39, 260000.00, '2025-04-12'),
(40, 40, 390000.00, '2025-04-13'),
(41, 41, 300000.00, '2025-04-13'),
(42, 42, 355000.00, '2025-04-13'),
(43, 43, 280000.00, '2025-04-14'),
(44, 44, 350000.00, '2025-04-14'),
(45, 45, 250000.00, '2025-04-14'),
(46, 46, 295000.00, '2025-04-15'),
(47, 47, 365000.00, '2025-04-15'),
(48, 48, 275000.00, '2025-04-15'),
(49, 49, 335000.00, '2025-04-16');

INSERT INTO Tarjetas (numero_tarjeta, tipo_tarjeta, fecha_expiracion, cliente_id) VALUES
('4111111111111006', 'Crédito', '2027-01-31', 6),
('5500000000000007', 'Débito', '2026-02-28', 7),
('340000000000008', 'Crédito', '2028-03-31', 8),
('30000000000007', 'Débito', '2025-04-30', 9),
('6011000000000009', 'Crédito', '2029-05-31', 10),
('4111111111111011', 'Débito', '2026-06-30', 11),
('5500000000000012', 'Crédito', '2027-07-31', 12),
('340000000000013', 'Débito', '2028-08-31', 13),
('30000000000014', 'Crédito', '2025-09-30', 14),
('6011000000000015', 'Débito', '2029-10-31', 15),
('4111111111111016', 'Crédito', '2026-11-30', 16),
('5500000000000017', 'Débito', '2027-12-31', 17),
('340000000000018', 'Crédito', '2028-01-31', 18),
('30000000000019', 'Débito', '2025-02-28', 19),
('6011000000000020', 'Crédito', '2029-03-31', 20),
('4111111111111021', 'Débito', '2026-04-30', 21),
('5500000000000022', 'Crédito', '2027-05-31', 22),
('340000000000023', 'Débito', '2028-06-30', 23),
('30000000000024', 'Crédito', '2025-07-31', 24),
('6011000000000025', 'Débito', '2029-08-31', 25),
('4111111111111026', 'Crédito', '2026-09-30', 26),
('5500000000000027', 'Débito', '2027-10-31', 27),
('340000000000028', 'Crédito', '2028-11-30', 28),
('30000000000029', 'Débito', '2025-12-31', 29),
('6011000000000030', 'Crédito', '2029-01-31', 30),
('4111111111111031', 'Débito', '2026-02-28', 31),
('5500000000000032', 'Crédito', '2027-03-31', 32),
('340000000000033', 'Débito', '2028-04-30', 33),
('30000000000034', 'Crédito', '2025-05-31', 34),
('6011000000000035', 'Débito', '2029-06-30', 35),
('4111111111111036', 'Crédito', '2026-07-31', 36),
('5500000000000037', 'Débito', '2027-08-31', 37),
('340000000000038', 'Crédito', '2028-09-30', 38),
('30000000000039', 'Débito', '2025-10-31', 39),
('6011000000000040', 'Crédito', '2029-11-30', 40),
('4111111111111041', 'Débito', '2026-12-31', 41),
('5500000000000042', 'Crédito', '2027-01-31', 42),
('340000000000043', 'Débito', '2028-02-29', 43),
('30000000000044', 'Crédito', '2025-03-31', 44),
('6011000000000045', 'Débito', '2029-04-30', 45),
('4111111111111046', 'Crédito', '2026-05-31', 46),
('5500000000000047', 'Débito', '2027-06-30', 47),
('340000000000048', 'Crédito', '2028-07-31', 48),
('30000000000049', 'Débito', '2025-08-31', 49);


INSERT INTO Clientes_Servicios (cliente_id, servicio_id, fecha_activacion) VALUES
(6, 1, '2023-05-10'),
(6, 3, '2024-06-15'),
(7, 2, '2023-11-01'),
(8, 1, '2024-01-20'),
(8, 4, '2024-02-25'),
(9, 5, '2025-03-14'),
(10, 2, '2023-09-10'),
(10, 3, '2024-10-05'),
(11, 1, '2024-08-08'),
(11, 5, '2025-01-12'),
(12, 3, '2023-06-18'),
(13, 2, '2024-07-22'),
(13, 4, '2024-08-30'),
(14, 1, '2023-04-15'),
(15, 5, '2024-12-01'),
(16, 1, '2024-03-11'),
(16, 3, '2024-07-07'),
(17, 2, '2023-10-22'),
(18, 4, '2025-01-29'),
(19, 1, '2023-08-05'),
(20, 3, '2024-06-14'),
(20, 5, '2025-02-02'),
(21, 2, '2023-09-25'),
(22, 1, '2024-04-19'),
(23, 3, '2024-11-11'),
(23, 4, '2025-01-17'),
(24, 5, '2023-12-12'),
(25, 1, '2024-03-03'),
(25, 2, '2024-05-21'),
(26, 4, '2025-02-18'),
(27, 1, '2023-10-10'),
(28, 2, '2024-06-06'),
(28, 5, '2024-12-30'),
(29, 3, '2023-07-14'),
(30, 1, '2024-01-01'),
(31, 5, '2024-09-09'),
(32, 2, '2024-03-27'),
(32, 4, '2025-03-01'),
(33, 1, '2023-06-30'),
(34, 3, '2024-08-15'),
(35, 5, '2024-11-04'),
(36, 2, '2023-11-23'),
(37, 4, '2024-05-28'),
(38, 1, '2023-10-17'),
(38, 3, '2024-07-01'),
(39, 2, '2024-02-19'),
(40, 5, '2025-01-05'),
(41, 1, '2023-09-03'),
(42, 3, '2024-03-13'),
(43, 4, '2025-02-25'),
(44, 2, '2023-12-20'),
(45, 1, '2024-04-04'),
(45, 5, '2025-03-18'),
(46, 3, '2023-08-08'),
(47, 4, '2024-09-21'),
(48, 2, '2024-06-12'),
(49, 1, '2023-07-07');


