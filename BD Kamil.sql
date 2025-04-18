CREATE DATABASE Kamil
go

use Kamil
go

-- Tabla Centro de Trabajo
CREATE TABLE Centro_Trabajo (
    ID_Centro INT PRIMARY KEY,
    Nombre_Centro VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL
);

-- Tabla Puesto
CREATE TABLE Puesto (
    ID_Puesto VARCHAR(50) PRIMARY KEY,
    Nombre_Puesto VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(150) NOT NULL
);


-- Tabla Empleado
CREATE TABLE Empleado (
    ID_Empleado INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido_Paterno VARCHAR(50) NOT NULL,
    Apellido_Materno VARCHAR(50) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    RFC AS (UPPER(SUBSTRING(Nombre,1,2) + 
                 SUBSTRING(Apellido_Paterno,1,2) + 
                 SUBSTRING(Apellido_Materno,1,1) + 
                 FORMAT(Fecha_Nacimiento, 'yyMMdd'))),
    ID_Centro INT NOT NULL,
    ID_Puesto VARCHAR(50) NOT NULL,
    Descripcion_Puesto VARCHAR(100) NOT NULL,
    Directivo BIT NOT NULL,
    FOREIGN KEY (ID_Centro) REFERENCES Centro_Trabajo(ID_Centro),
    FOREIGN KEY (ID_Puesto) REFERENCES Puesto(ID_Puesto)
);


-- Tabla Directivo
CREATE TABLE Directivo (
    ID_Directivo INT PRIMARY KEY,
    Centro_Supervisado INT NOT NULL,
    Prestacion_Combustible BIT NOT NULL,
    FOREIGN KEY (ID_Directivo) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (Centro_Supervisado) REFERENCES Centro_Trabajo(ID_Centro)
);





INSERT INTO Centro_Trabajo (ID_Centro, Nombre_Centro, Ciudad) VALUES
(000201, 'Tiendas Angel Flores Ropa', 'Culiacan'),
(000202, 'Tiendas Angel Flores Muebles', 'Culiacan'),
(000203, 'Tiendas Angel Flores Cajas', 'Culiacan'),
(049001, 'La Primavera Ropa', 'Culiacan'),
(049002, 'La Primavera Muebles', 'Culiacan'),
(049003, 'La Primavera Cajas', 'Culiacan');


-- Inserción de datos en Puesto
INSERT INTO Puesto(ID_Puesto, Nombre_Puesto, Descripcion) values

(1,'Jefe de Almacen', 'Gestiona inventarios y operaciones logisticas'),
(2,'Analista Contable','Revisa y analiza estados financieros'),
(3,'Gerente de Sucursal','Supervisa las operaciones de la sucursal'),
(4,'Ejecutiva de Ventas','Responsable de atender clientes clave'),
(5,'Supervisor de Operaciones','Coordina equipos operativos y tareas diarias'),
(6,'Coordinadora de Proyectos','Planifica y supervisa proyectos internos'),
(7,'Especialista en Logística', 'Optimiza procesos de entrega y distribucion'),
(8,'Diseñadora Grafica', 'Crea materiales visuales para campañas publicitarias'),
(9, 'Consultor de Negocios', 'Asesora sobre estrategias empresariales'),
(10, 'Supervisora de Ventas', 'Controla el desempeño del equipo de ventas');




-- Inserción de datos en Empleado
INSERT INTO Empleado(Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento, ID_Centro, ID_Puesto, Descripcion_Puesto, Directivo) VALUES
('Luis', 'Castillo', 'Ramirez', '1987-03-12', 000201, 1, 'Gestiona inventarios y operaciones logisticas', 1),
('Andrea', 'Gonzalez', 'Hernandez', '1992-09-25', 000202, 2, 'Revisa y analiza estados financieros', 0),
('Carlos', 'Santos', 'Lopez', '1980-11-07', 000203, 3, 'Supervisa las operaciones de la sucursal', 1),
('Sofia', 'Morales', 'Diaz', '1995-05-14', 049001, 4, 'Responsable de atender clientes clave', 0),
('Miguel', 'Torres', 'Jimenez', '1983-01-18', 049002, 5, 'Coordina equipos operativos y tareas diarias', 1),
('Elena', 'Garcia', 'Ortiz', '1991-07-03', 049003, 6, 'Planifica y supervisa proyectos internos', 1),
('Ricardo', 'Fernandez', 'Martinez', '1989-02-27', 000201, 7, 'Optimiza procesos de entrega y distribucion', 0),
('Lucia', 'Serrano', 'Castro', '1993-10-15', 049002, 8, 'Crea materiales visuales para campañas publicitarias', 0),
('Roberto', 'Alvarez', 'Velazquez', '1977-04-20', 049001, 9, 'Asesora sobre estrategias empresariales', 1),
('Isabel', 'Lopez', 'Gutierrez', '1985-08-09', 000203, 10, 'Controla el desempeño del equipo de ventas', 1);



-- Inserción de datos en Directivo
INSERT INTO Directivo (ID_Directivo, Centro_Supervisado, Prestacion_Combustible) VALUES
(1, 000201, 1),
(3, 000203, 1),
(5, 049002, 1),
(6, 049003, 1),
(10, 000203, 1);

