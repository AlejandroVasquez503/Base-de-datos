CREATE DATABASE ControlGastosUniversitarios;
GO

USE ControlGastosUniversitarios;
GO

CREATE TABLE Usuarios (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Carnet VARCHAR(20) NOT NULL UNIQUE,
    Contraseña VARCHAR(50) NOT NULL
);

CREATE TABLE CategoriasGasto (
    IdCategoria INT PRIMARY KEY IDENTITY(1,1),
    NombreCategoria VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE GastosUniversitarios (
    IdGasto INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    IdCategoria INT,
    IdUsuario INT,
    FOREIGN KEY (IdCategoria) REFERENCES CategoriasGasto(IdCategoria),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);

INSERT INTO Usuarios (NombreUsuario, Apellido, Carnet, Contraseña)
VALUES 
('Ale', 'Vasquez', '20230402', 'password123'),
('Rene', 'García', '202304442', 'password456'),
('Angel', 'Martínez', '20230334', 'password789');

INSERT INTO CategoriasGasto (NombreCategoria)
VALUES 
('Matrícula'),
('Materiales'),
('Transporte'),
('Comida');

INSERT INTO GastosUniversitarios (Fecha, Monto, Descripcion, IdCategoria, IdUsuario)
VALUES 
('2024-10-01', 150.00, 'Pago de matrícula', 1, 1),
('2024-10-05', 30.00, 'Compra de libros', 2, 2),
('2024-10-08', 15.00, 'Transporte a la universidad', 3, 1),
('2024-10-10', 50.00, 'Almuerzo en la cafetería', 4, 3);

