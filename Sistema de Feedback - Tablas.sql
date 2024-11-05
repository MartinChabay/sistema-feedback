create database feedback;
use feedback;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

CREATE TABLE feedbacks (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    atencion_cliente INT CHECK (atencion_cliente BETWEEN 1 AND 5),
    calidad_materiales INT CHECK (calidad_materiales BETWEEN 1 AND 5),
    funcionamiento INT CHECK (funcionamiento BETWEEN 1 AND 5),
    promedio FLOAT,
    comentario VARCHAR(500),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE respuestas (
    id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
    id_feedback INT,
    id_empleado INT,
    contenido TEXT NOT NULL,
    fecha_respuesta DATETIME NOT NULL,
    FOREIGN KEY (id_feedback) REFERENCES feedbacks(id_feedback),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM feedbacks;
SELECT * FROM respuestas;
SELECT * FROM empleados; 