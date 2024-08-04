CREATE SCHEMA VINOTECAS;

USE VINOTECAS;

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
