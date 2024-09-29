use vinotecas;

CREATE TABLE varietales (
    id_varietal INT PRIMARY KEY AUTO_INCREMENT,
    variedad VARCHAR(10)
);

CREATE TABLE provincia (
    id_prov INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(10)
);

CREATE TABLE bodega (
    id_bodega INT PRIMARY KEY AUTO_INCREMENT,
    id_provincia INT,
    razon_social VARCHAR(20),
    cuit VARCHAR(13),
    direccion VARCHAR(50),
    email VARCHAR(30),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_prov)
);

CREATE TABLE productos (
    id_prod INT PRIMARY KEY AUTO_INCREMENT,
    nombre_prod VARCHAR(30),
    tamaño INT,
    bodega INT,
    variedad INT,
    descripcion VARCHAR(20),
    Px_costo DECIMAL(10,2),
    Px_venta DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (bodega) REFERENCES bodega(id_bodega),
    FOREIGN KEY (variedad) REFERENCES varietales(id_varietal)
);

CREATE TABLE local (
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    id_prod INT,
    ubicacion VARCHAR(20),
    FOREIGN KEY (id_prod) REFERENCES productos(id_prod)
);

CREATE TABLE clientes (
    id_cl INT PRIMARY KEY AUTO_INCREMENT,
    nombre_apellido VARCHAR(40),
    id_local INT,
    tel VARCHAR(15),
    fecha_cumpleaños DATE,
    email VARCHAR(100),
    FOREIGN KEY (id_local) REFERENCES local(id_local)
);
CREATE TABLE VENTAS (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_local INT,
    id_prod INT,
    Px_venta DECIMAL(10,2),
    cantidad INT,
    fecha_venta DATE,
    FOREIGN KEY (id_local) REFERENCES local(id_local),
    FOREIGN KEY (id_prod) REFERENCES productos(id_prod)
);
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    id_local INT,
    puesto VARCHAR(30),
    fecha_contratacion DATE,
    salario DECIMAL(10, 2),
    FOREIGN KEY (id_local) REFERENCES local(id_local)
);



INSERT INTO provincia (nombre) VALUES
('Bs As'),
('Córdoba'),
('Sta Fe'),
('Mendoza'),
('Tucumán'),
('Salta'),
('San Juan'),
('Jujuy'),
('La Pampa'),
('Neuquén');

INSERT INTO bodega (id_provincia, razon_social, cuit, direccion, email) VALUES
(1, 'Bodega Uno', '20-12345678-9', 'Calle Falsa 123', 'bodega1@email.com'),
(2, 'Bodega Dos', '20-23456789-0', 'Avenida Siempreviva 456', 'bodega2@email.com'),
(3, 'Bodega Tres', '20-34567890-1', 'Boulevard de la Vida 789', 'bodega3@email.com'),
(4, 'Bodega Cuatro', '20-45678901-2', 'Pasaje Secreto 101', 'bodega4@email.com'),
(5, 'Bodega Cinco', '20-56789012-3', 'Callejón Misterioso 202', 'bodega5@email.com'),
(6, 'Bodega Seis', '20-67890123-4', 'Plaza Central 303', 'bodega6@email.com'),
(7, 'Bodega Siete', '20-78901234-5', 'Esquina del Sol 404', 'bodega7@email.com'),
(8, 'Bodega Ocho', '20-89012345-6', 'Camino Real 505', 'bodega8@email.com'),
(9, 'Bodega Nueve', '20-90123456-7', 'Ruta del Vino 606', 'bodega9@email.com'),
(10, 'Bodega Diez', '20-01234567-8', 'Sendero de las Viñas 707', 'bodega10@email.com');

INSERT INTO local (ubicacion) VALUES
('Palmares'),
('Aristides'),
('Shopping'),
('Barraca'),
('Stare');

INSERT INTO clientes (nombre_apellido, id_local, tel, fecha_cumpleaños, email) VALUES
('Juan Pérez', 1, '123456789', '1990-05-15', 'juan.perez@email.com'),
('María López', 2, '987654321', '1985-11-20', 'maria.lopez@email.com'),
('Carlos Gómez', 3, '456123789', '1992-02-10', 'carlos.gomez@email.com'),
('Ana Martínez', 4, '789456123', '1995-07-25', 'ana.martinez@email.com'),
('José Fernández', 5, '321654987', '1988-12-30', 'jose.fernandez@email.com'),
('Laura Díaz', 1, '654321789', '1993-03-18', 'laura.diaz@email.com'),
('Ricardo Sánchez', 2, '987321654', '1991-09-12', 'ricardo.sanchez@email.com'),
('Sofía Herrera', 3, '123789456', '1994-06-22', 'sofia.herrera@email.com'),
('Luis Castro', 4, '456987123', '1987-04-03', 'luis.castro@email.com'),
('Martín García', 5, '789123654', '1996-08-15', 'martin.garcia@email.com'),
('Gabriela Ruiz', 1, '321987654', '1990-01-29', 'gabriela.ruiz@email.com'),
('Diego Morales', 2, '654789321', '1985-10-05', 'diego.morales@email.com'),
('Verónica Ríos', 3, '987654123', '1992-02-25', 'veronica.rios@email.com'),
('Javier Peña', 4, '123456789', '1994-07-07', 'javier.pena@email.com'),
('Patricia Vega', 5, '456123789', '1988-11-13', 'patricia.vega@email.com'),
('Oscar Medina', 1, '789456123', '1991-09-20', 'oscar.medina@email.com'),
('Valeria Ortiz', 2, '321654987', '1993-03-01', 'valeria.ortiz@email.com'),
('Fernando Castillo', 3, '654321789', '1987-12-18', 'fernando.castillo@email.com'),
('Mónica Flores', 4, '987321654', '1990-05-28', 'monica.flores@email.com'),
('Roberto Paredes', 5, '123789456', '1995-08-22', 'roberto.paredes@email.com'),
('Elena Aguirre', 1, '456987123', '1992-04-10', 'elena.aguirre@email.com'),
('Andrés Silva', 2, '789123654', '1989-10-02', 'andres.silva@email.com'),
('Natalia Soto', 3, '321987654', '1996-06-17', 'natalia.soto@email.com'),
('Jorge Ramos', 4, '654789321', '1985-03-13', 'jorge.ramos@email.com'),
('Paula Méndez', 5, '987654123', '1991-11-30', 'paula.mendez@email.com'),
('Ramiro Núñez', 1, '123456789', '1988-07-15', 'ramiro.nunez@email.com'),
('Lucía Ibáñez', 2, '456123789', '1994-05-19', 'lucia.ibanez@email.com'),
('Emilio Guzmán', 3, '789456123', '1990-09-21', 'emilio.guzman@email.com'),
('Alicia Torres', 4, '321654987', '1993-12-25', 'alicia.torres@email.com'),
('Gustavo Ramírez', 5, '654321789', '1987-01-11', 'gustavo.ramirez@email.com');

INSERT INTO varietales (variedad) VALUES
('Mb'),
('CS'),
('SB'),
('Ch'),
('PG'),
('PN'),
('CF');

INSERT INTO productos (nombre_prod, tamaño, bodega, variedad, descripcion, Px_costo, Px_venta, stock) VALUES
('Producto A', 750, 1, 1, 'Descripción A', 1200, 1800, 20),
('Producto B', 500, 2, 2, 'Descripción B', 900, 1350, 100),
('Producto C', 1000, 3, 3, 'Descripción C', 2500, 3750, 15),
('Producto D', 750, 4, 4, 'Descripción D', 1700, 2550, 45),
('Producto E', 500, 5, 5, 'Descripción E', 1100, 1650, 120),
('Producto F', 1000, 6, 4, 'Descripción F', 3000, 4500, 10),
('Producto G', 750, 2, 7, 'Descripción G', 1900, 2850, 55),
('Producto H', 500, 3, 1, 'Descripción H', 850, 1275, 75),
('Producto I', 1000, 4, 2, 'Descripción I', 4500, 6750, 200),
('Producto J', 750, 5, 2, 'Descripción J', 2800, 4200, 130),
('Producto K', 500, 1, 3, 'Descripción K', 1300, 1950, 110),
('Producto L', 1000, 2, 4, 'Descripción L', 2100, 3150, 80),
('Producto M', 750, 3, 5, 'Descripción M', 1600, 2400, 95),
('Producto N', 500, 4, 6, 'Descripción N', 1200, 1800, 75),
('Producto O', 1000, 5, 7, 'Descripción O', 3400, 5100, 20),
('Producto P', 750, 1, 1, 'Descripción P', 2200, 3300, 10),
('Producto Q', 500, 2, 2, 'Descripción Q', 900, 1350, 5),
('Producto R', 1000, 3, 3, 'Descripción R', 2600, 3900, 100),
('Producto S', 750, 4, 4, 'Descripción S', 1400, 2100, 40),
('Producto T', 500, 5, 5, 'Descripción T', 6000, 9000, 200),
('Producto U', 1000, 1, 6, 'Descripción U', 3500, 5250, 170),
('Producto V', 750, 2, 7, 'Descripción V', 2700, 4050, 120),
('Producto W', 500, 3, 3, 'Descripción W', 900, 1350, 10),
('Producto X', 1000, 4, 1, 'Descripción X', 3200, 4800, 35),
('Producto Y', 750, 5, 2, 'Descripción Y', 2100, 3150, 50),
('Producto Z', 500, 1, 3, 'Descripción Z', 800, 1200, 10),
('Producto AA', 1000, 2, 7, 'Descripción AA', 2800, 4200, 10),
('Producto BB', 750, 3, 4, 'Descripción BB', 1500, 2250, 20),
('Producto CC', 500, 4, 5, 'Descripción CC', 2000, 3000, 95),
('Producto DD', 1000, 5, 3, 'Descripción DD', 3800, 5700, 80),
('Producto EE', 750, 1, 6, 'Descripción EE', 1200, 1800, 50),
('Producto FF', 500, 2, 7, 'Descripción FF', 2400, 3600, 30),
('Producto GG', 1000, 3, 3, 'Descripción GG', 2700, 4050, 50),
('Producto HH', 750, 4, 2, 'Descripción HH', 1800, 2700, 25),
('Producto II', 500, 5, 3, 'Descripción II', 1300, 1950, 70),
('Producto JJ', 1000, 1, 6, 'Descripción JJ', 3300, 4950, 60),
('Producto KK', 750, 2, 7, 'Descripción KK', 2200, 3300, 80),
('Producto LL', 500, 3, 1, 'Descripción LL', 3000, 4500, 200),
('Producto MM', 1000, 4, 2, 'Descripción MM', 2500, 3750, 130),
('Producto NN', 750, 5, 3, 'Descripción NN', 1700, 2550, 100),
('Producto OO', 500, 1, 1, 'Descripción OO', 1400, 2100, 40),
('Producto PP', 1000, 2, 2, 'Descripción PP', 2000, 3000, 20),
('Producto QQ', 750, 3, 3, 'Descripción QQ', 2800, 4200, 70),
('Producto RR', 500, 4, 4, 'Descripción RR', 3900, 5850, 200),
('Producto SS', 1000, 5, 5, 'Descripción SS', 3300, 4950, 190),
('Producto TT', 750, 1, 6, 'Descripción TT', 1200, 1800, 80),
('Producto UU', 500, 2, 7, 'Descripción UU', 1700, 2550, 90),
('Producto VV', 1000, 3, 1, 'Descripción VV', 2400, 3600, 20),
('Producto WW', 750, 4, 2, 'Descripción WW', 800, 1200, 40),
('Producto XX', 500, 5, 3, 'Descripción XX', 1500, 2250, 100);


INSERT INTO VENTAS (id_local, id_prod, Px_venta, cantidad, fecha_venta)
VALUES
(1, 1, (SELECT Px_costo * 1.50 FROM productos WHERE id_prod = 1), 10, '2024-08-28'),
(2, 3, (SELECT Px_costo * 1.50 FROM productos WHERE id_prod = 3), 5, '2024-08-28'),
(3, 5, (SELECT Px_costo * 1.50 FROM productos WHERE id_prod = 5), 8, '2024-08-28'),
(4, 2, (SELECT Px_costo * 1.50 FROM productos WHERE id_prod = 2), 12, '2024-08-28'),
(5, 4, (SELECT Px_costo * 1.50 FROM productos WHERE id_prod = 4), 15, '2024-08-28');


INSERT INTO empleados (nombre, apellido, id_local, puesto, fecha_contratacion, salario) 
VALUES
('Juan', 'Pérez', 1, 'Gerente', '2021-05-10', 120000.00),
('María', 'Gómez', 1, 'Vendedor', '2022-02-14', 85000.00),
('Carlos', 'López', 1, 'Vendedor', '2020-11-03', 80000.00),
('Ana', 'Martínez', 1, 'Vendedor', '2023-03-12', 87000.00),
('Jorge', 'Rodríguez', 1, 'Gerente', '2019-07-19', 125000.00),
('Lucía', 'Fernández', 1, 'Cajero', '2021-09-25', 78000.00),
('Pablo', 'Sánchez', 1, 'Cajero', '2020-01-30', 77000.00),
('Sofía', 'Romero', 1, 'Vendedor', '2022-06-18', 83000.00),
('Miguel', 'Ramírez', 1, 'Gerente', '2018-12-10', 128000.00),
('Laura', 'Hernández', 1, 'Vendedor', '2023-05-01', 84000.00);


create view proveedores as
select * from bodega;
Select * from proveedores;


create view pedido as
select id_prod, nombre_prod, variedad, stock from productos
where stock < 10;
select * from pedido;


DELIMITER $$
CREATE FUNCTION total_ventas_producto(product_id INT) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;    
    SELECT SUM(cantidad)
    INTO total
    FROM ventas
    WHERE id_prod = product_id;    
    RETURN total;
END$$
SELECT total_ventas_producto(2) AS resultado;


DELIMITER $$

CREATE FUNCTION obtener_provincia_bodega(bodega_id INT) 
RETURNS VARCHAR(50)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE provincia_nombre VARCHAR(50);
    
    SELECT p.nombre 
    INTO provincia_nombre
    FROM bodega b
    JOIN provincia p ON b.id_provincia = p.id_prov
    WHERE b.id_bodega = bodega_id;
    
    RETURN provincia_nombre;
END$$
SELECT obtener_provincia_bodega(5) AS resultado;



DELIMITER $$
CREATE PROCEDURE listar_productos(IN variedad int)
BEGIN
  SELECT *
  FROM productos
  WHERE productos.variedad = variedad;
END
$$
call listar_productos(4);


DELIMITER $$
CREATE PROCEDURE contar_productos(IN variedad int, OUT total INT UNSIGNED)
BEGIN
  SET total = (
    SELECT COUNT(*) 
    FROM productos
    WHERE productos.variedad = variedad);
END
$$
DELIMITER ;
CALL contar_productos('4', @total);
SELECT @total;





CREATE TABLE auditoria_clientes (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_cl INT,
    nombre_apellido_ant VARCHAR(40),
    tel_ant VARCHAR(15),
    fecha_cumpleaños_ant DATE,
    email_ant VARCHAR(100),
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER registrar_cambios_cliente
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_clientes (id_cl, nombre_apellido_ant, tel_ant, fecha_cumpleaños_ant, email_ant)
    VALUES (OLD.id_cl, OLD.nombre_apellido, OLD.tel, OLD.fecha_cumpleaños, OLD.email);
END$$;



DELIMITER $$

CREATE TRIGGER actualizar_cantidad_producto
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    UPDATE productos
    SET tamaño = tamaño - NEW.cantidad
    WHERE id_prod = NEW.id_prod;
END$$

DELIMITER;
