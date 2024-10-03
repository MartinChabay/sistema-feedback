create database feedback;
use feedback;
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL,
    rol ENUM('cliente', 'empleado') NOT NULL
);

CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE Feedback (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    funcionamiento INT NOT NULL CHECK (funcionamiento BETWEEN 1 AND 5),
    calidad_materiales INT NOT NULL CHECK (calidad_materiales BETWEEN 1 AND 5),
    atencion_cliente INT NOT NULL CHECK (atencion_cliente BETWEEN 1 AND 5),
    comentario TEXT NULL,
    fecha_envio DATETIME NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Respuesta (
    id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
    id_feedback INT NOT NULL,
    id_usuario INT NOT NULL,
    contenido TEXT NOT NULL,
    fecha_respuesta DATETIME NOT NULL,
    FOREIGN KEY (id_feedback) REFERENCES Feedback(id_feedback),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

INSERT INTO Usuario (nombre, email, contraseña, rol) VALUES
('Juan Pérez', 'juan.perez@example.com', 'password123', 'cliente'),
('Ana Gómez', 'ana.gomez@example.com', 'password456', 'empleado'),
('Carlos López', 'carlos.lopez@example.com', 'password789', 'cliente'),
('María Fernández', 'maria.fernandez@example.com', 'password101', 'empleado'),
('Luis Martínez', 'luis.martinez@example.com', 'password102', 'cliente');

INSERT INTO Producto (nombre, descripcion, precio, stock) VALUES
('Teclado Mecánico', 'Teclado mecánico con retroiluminación RGB', 59.99, 100),
('Mouse Inalámbrico', 'Mouse inalámbrico ergonómico', 29.99, 150),
('Monitor 4K', 'Monitor 4K de 27 pulgadas', 399.99, 50),
('Auriculares Bluetooth', 'Auriculares Bluetooth con cancelación de ruido', 89.99, 200),
('Silla Gamer', 'Silla ergonómica para gamers', 199.99, 75);

INSERT INTO Feedback (id_usuario, id_producto, funcionamiento, calidad_materiales, atencion_cliente, comentario, fecha_envio) VALUES
(1, 1, 5, 4, 5, 'Excelente teclado, muy cómodo y con buena iluminación.', '2024-09-30 10:00:00'),
(1, 2, 4, 4, 5, 'Buen mouse, aunque podría mejorar la duración de la batería.', '2024-09-30 10:05:00'),
(3, 3, 5, 5, 5, 'Monitor de alta calidad, muy satisfecho con la compra.', '2024-09-30 10:10:00'),
(3, 4, 4, 4, 4, 'Auriculares cómodos, pero la cancelación de ruido podría ser mejor.', '2024-09-30 10:15:00'),
(5, 5, 5, 5, 5, 'Silla gamer muy cómoda y de excelente calidad.', '2024-09-30 10:20:00');

INSERT INTO Respuesta (id_feedback, id_usuario, contenido, fecha_respuesta) VALUES
(1, 2, 'Gracias por tu feedback, nos alegra saber que estás satisfecho con el teclado.', '2024-09-30 11:00:00'),
(2, 2, 'Agradecemos tu comentario, trabajaremos en mejorar la duración de la batería.', '2024-09-30 11:05:00'),
(3, 4, 'Nos alegra saber que estás satisfecho con el monitor. ¡Gracias por tu compra!', '2024-09-30 11:10:00'),
(4, 4, 'Gracias por tu feedback, tomaremos en cuenta tu sugerencia sobre la cancelación de ruido.', '2024-09-30 11:15:00'),
(5, 2, 'Nos alegra saber que estás satisfecho con la silla gamer. ¡Gracias por tu compra!', '2024-09-30 11:20:00');

SELECT * FROM Usuario;

SELECT * FROM Producto;

SELECT * FROM Feedback;

SELECT * FROM Respuesta;

SELECT * FROM Feedback WHERE id_usuario = 1;

SELECT * FROM Feedback WHERE id_producto = 1;

SELECT * FROM Feedback WHERE funcionamiento > 4;

SELECT * FROM Feedback WHERE comentario IS NOT NULL;

SELECT * FROM Respuesta WHERE id_usuario = 2;

SELECT f.id_feedback, f.id_usuario, f.id_producto, f.funcionamiento, f.calidad_materiales, f.atencion_cliente, f.comentario, f.fecha_envio, r.id_respuesta, r.contenido, r.fecha_respuesta
FROM Feedback f
LEFT JOIN Respuesta r ON f.id_feedback = r.id_feedback;


DELETE FROM Producto WHERE id_producto = 1;

DELETE FROM Feedback WHERE id_feedback = 1;

DELETE FROM Respuesta WHERE id_respuesta = 1;

