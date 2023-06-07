CREATE SCHEMA Barradeventos;
USE Barradeventos;

-- Se crea la tabla "Provincias"
CREATE TABLE Provincias (
ID_Provincia int NOT NULL auto_increment PRIMARY KEY,
Provincia varchar(20) NOT NULL
);

-- Se crea la tabla "Localidades"
CREATE TABLE Localidades (
ID_Localidad int NOT NULL auto_increment PRIMARY KEY,
Localidad varchar(50) NOT NULL,
ID_Provincia int NOT NULL,
CONSTRAINT FK_ID_Provincia_Localidades FOREIGN KEY (ID_Provincia)
REFERENCES Provincias(ID_Provincia)
);

-- Se crea la tabla "Tipo_Documento"
CREATE TABLE Tipos_Documentos (
ID_Documento int NOT NULL auto_increment PRIMARY KEY,
Tipo_Documento varchar(20) NOT NULL
);

-- Se crea la tabla "Generos"
CREATE TABLE Generos (
ID_Genero int NOT NULL auto_increment PRIMARY KEY,
Genero varchar(10) NOT NULL
);

-- Se crea la tabla "Puestos"
CREATE TABLE Puestos (
ID_Puesto int NOT NULL auto_increment PRIMARY KEY,
Puesto varchar(50) NOT NULL
);

-- Se crea la tabla "Empleados"
CREATE TABLE Empleados (
ID_Empleado int NOT NULL auto_increment PRIMARY KEY,
Nombre_Empleado varchar(50) NOT NULL,
ID_Documento int NOT NULL,
CONSTRAINT FK_ID_Documento_Empleados FOREIGN KEY (ID_Documento)
REFERENCES Tipos_Documentos (ID_Documento),
Nro_Documento bigint NOT NULL,
Direccion varchar(50) NOT NULL,
ID_Genero int NOT NULL,
CONSTRAINT FK_ID_Genero_Empleados FOREIGN KEY (ID_Genero)
REFERENCES Generos (ID_Genero),
ID_Puesto int NOT NULL,
CONSTRAINT FK_ID_Puesto FOREIGN KEY (ID_Puesto)
REFERENCES Puestos (ID_Puesto),
Sueldo int NOT NULL
);

-- Se crea la tabla "Condicion_IVA"
CREATE TABLE Condicion_IVA (
ID_CondicionIVA int NOT NULL auto_increment PRIMARY KEY,
Condicion_IVA varchar(20) NOT NULL
);

-- Se crea la tabla "Clientes"
CREATE TABLE Clientes (
ID_Cliente int NOT NULL auto_increment PRIMARY KEY,
Nombre_Cliente varchar(50) NOT NULL,
ID_Documento int NOT NULL,
CONSTRAINT FK_ID_Documento_Clientes FOREIGN KEY (ID_Documento)
REFERENCES Tipos_Documentos (ID_Documento),
Nro_Documento bigint NOT NULL,
Direccion varchar(50),
ID_Localidad int NOT NULL,
CONSTRAINT ID_Localidad_Clientes FOREIGN KEY (ID_Localidad)
REFERENCES Localidades (ID_Localidad),
Email varchar(50) NOT NULL,
Telefono int NOT NULL,
ID_Genero int NOT NULL,
CONSTRAINT ID_Genero_Clientes FOREIGN KEY (ID_Genero)
REFERENCES Generos (ID_Genero),
ID_CondicionIVA int NOT NULL,
CONSTRAINT ID_CondicionIVA_Clientes FOREIGN KEY (ID_CondicionIVA)
REFERENCES Condicion_IVA (ID_CondicionIVA)
);

-- Se crea la tabla "Proveeodres"
CREATE TABLE Proveedores (
ID_Proveedor int NOT NULL auto_increment PRIMARY KEY,
Nombre_Proveedor varchar(50) NOT NULL,
ID_Documento int NOT NULL,
CONSTRAINT FK_ID_Documento_Proveedores FOREIGN KEY (ID_Documento)
REFERENCES Tipos_Documentos (ID_Documento),
Nro_Documento bigint NOT NULL,
Direccion varchar(50),
Email varchar(50) NOT NULL,
Telefono int NOT NULL,
ID_CondicionIVA int NOT NULL,
CONSTRAINT ID_CondicionIVA_Proveedores FOREIGN KEY (ID_CondicionIVA)
REFERENCES Condicion_IVA (ID_CondicionIVA),
ID_Localidad int NOT NULL,
CONSTRAINT ID_Localidad_Proveedores FOREIGN KEY (ID_Localidad)
REFERENCES Localidades (ID_Localidad)
);

-- Se crea la tabla "Depositos"
CREATE TABLE Depositos (
ID_Deposito int NOT NULL auto_increment PRIMARY KEY,
Deposito varchar(50) NOT NULL,
Direccion varchar(50) NOT NULL,
ID_Localidad int NOT NULL,
CONSTRAINT FK_ID_Localidad_Depositos FOREIGN KEY (ID_Localidad)
REFERENCES Localidades (ID_Localidad)
);

-- Se crea la tabla "Productos"
CREATE TABLE Productos (
ID_Producto int NOT NULL auto_increment PRIMARY KEY,
Nombre_Producto varchar(50) NOT NULL,
ID_Proveedor int NOT NULL,
CONSTRAINT FK_ID_Proveedor_Productos FOREIGN KEY (ID_Proveedor)
REFERENCES Proveedores(ID_Proveedor),
Precio_Unitario numeric(10,2) NOT NULL,
Precio_Venta numeric(10,2) NOT NULL,
Stock numeric(10,0),
ID_Deposito int NOT NULL,
CONSTRAINT FK_Deposito_Productos FOREIGN KEY (ID_Deposito)
REFERENCES Depositos (ID_Deposito)
);

-- Se crea la tabla "Tipos de Evento"
CREATE TABLE Tipos_Evento (
ID_TipoEvento int NOT NULL auto_increment PRIMARY KEY,
Tipo_Evento varchar(50) NOT NULL
);

-- Se crea la tabla "Presupuestos"
CREATE TABLE Presupuestos (
Nro_Presupuesto int NOT NULL auto_increment PRIMARY KEY,
Fecha_Presupuesto date NOT NULL,
ID_Cliente int NOT NULL,
CONSTRAINT FK_ID_Cliente FOREIGN KEY (ID_Cliente)
REFERENCES Clientes (ID_Cliente),
ID_Empleado int NOT NULL,
CONSTRAINT FK_ID_Empleado FOREIGN KEY (ID_Empleado)
REFERENCES Empleados (ID_Empleado),
ID_TipoEvento int NOT NULL,
CONSTRAINT FK_ID_TipoEvento_Presupuestos FOREIGN KEY (ID_TipoEvento)
REFERENCES Tipos_Evento (ID_TipoEvento),
Fecha_Evento date NOT NULL,
Lugar_Evento varchar(50) NOT NULL
);

-- Se crea la tabla "Detalle_Presupuestos"
CREATE TABLE Detalle_Presupuestos (
Nro_Presupuesto int NOT NULL,
CONSTRAINT FK_Nro_Presupuesto FOREIGN KEY (Nro_Presupuesto)
REFERENCES Presupuestos (Nro_Presupuesto),
ID_Producto int NOT NULL,
CONSTRAINT FK_ID_Producto FOREIGN KEY (ID_Producto)
REFERENCES Productos (ID_Producto),
Cantidad int NOT NULL,
Precio numeric(10,2) NOT NULL
);

------------------------------------------------ VISTAS ------------------------------------------------

-- Se crea una vista que identifica en que lugares se realizaron los eventos corporativos
CREATE VIEW Eventos_Corporativos AS
	(SELECT Lugar_Evento
    FROM Presupuestos
    WHERE ID_TipoEvento = 1);
    
-- Se crea una vista para ver el detalle de productos disponibles en stock

CREATE VIEW ProductosDisponibles AS
	(SELECT Nombre_Producto
    FROM Productos
    WHERE Stock > 0);
    
-- Se crea una vista del nombre de los empleados sin ningun otro dato sensible

CREATE VIEW NombresEmpleados AS
	SELECT Nombre_Empleado
    FROM Empleados;
    
    
 -- Se crea una vista con el TOP10 de los productos mas caros

CREATE VIEW TOP10ProductosCaros AS
	SELECT Nombre_Producto, Precio_Unitario
    FROM Productos
    ORDER BY Precio_Unitario DESC
    LIMIT 10;
 
 -- Se crea una vista para saber cuáles de los clientes son mujeres
 
 CREATE VIEW ClientesMujeres AS
	(SELECT DISTINCT Nombre_Cliente
    FROM Clientes c 
    JOIN Generos g ON (c.ID_Genero = g.ID_Genero)
    WHERE g.Genero = "Femenino");
    
-- Se crea una vista con el TOP10 de los productos más vendidos

CREATE OR REPLACE VIEW TOP10_Productos AS
	(SELECT p.Nombre_Producto, d.Cantidad
    FROM Detalle_Presupuestos d 
    JOIN Productos p ON (d.ID_Producto = p.ID_Producto)
    ORDER BY Cantidad DESC
    LIMIT 10);
    
-- Vista que muestra los presupuestos que se cotizaron y especifica si hay faltante de algun producto

CREATE VIEW PresupuestosConStock AS
SELECT p.Nro_Presupuesto, p.Fecha_Presupuesto, c.Nombre_Cliente AS Cliente, tp.Tipo_Evento AS Tipo_Evento, p.Fecha_Evento, p.Lugar_Evento, pd.Nombre_Producto AS Producto, dp.Cantidad, dp.Precio,
CASE
	WHEN pd.Stock > 0 THEN "Tiene stock"
	ELSE "No tiene stock"
END AS Estado_stock
FROM Presupuestos p
JOIN Detalle_Presupuestos dp ON p.Nro_Presupuesto = dp.Nro_Presupuesto
JOIN Clientes c ON p.ID_Cliente = c.ID_Cliente
JOIN Tipos_Evento tp ON p.ID_TipoEvento = tp.ID_TipoEvento
JOIN Productos pd ON dp.ID_Producto = pd.ID_Producto;

------------------------------------------------ FUNCTION ------------------------------------------------

-- Funcion que muestra el nombre del Tipo de Evento

-- DROP FUNCTION IF EXISTS Nombre_TipoEvento;
DELIMITER //
CREATE FUNCTION Nombre_TipoEvento (p_ID_TipoEvento INT)
RETURNS VARCHAR(20)
READS SQL DATA

BEGIN
	DECLARE resultado VARCHAR(20);
    SET resultado = (SELECT Tipo_Evento FROM Tipos_Evento WHERE ID_TipoEvento = p_ID_TipoEvento);
    RETURN resultado;
END //
DELIMITER ;

SELECT Nombre_TipoEvento(2);

SELECT Fecha_Presupuesto, Lugar_Evento, Nombre_TipoEvento(ID_TipoEvento)
FROM Presupuestos;

-- Función que determina si el sueldo es alto, medio o bajo

-- DROP FUNCTION IF EXISTS Valor_sueldo;
DELIMITER //
CREATE FUNCTION Valor_sueldo (p_valor_sueldo INT)
		RETURNS VARCHAR (20)
        READS SQL DATA

BEGIN
	CASE
		WHEN p_valor_sueldo BETWEEN 0 AND 499999 THEN
			RETURN "sueldo bajo";
		WHEN p_valor_sueldo BETWEEN 500000 AND 799999 THEN
			RETURN "sueldo medio";
		ELSE
			RETURN "sueldo alto";
END CASE;
END //
DELIMITER ;

------------------------------------------------ STORED PROCEDURE ------------------------------------------------

-- SP que cargar un nuevo Puesto en la tabla “Puestos"

DROP PROCEDURE IF EXISTS sp_AddPuesto
DELIMITER //
CREATE PROCEDURE sp_AddPuesto (IN p_Puesto VARCHAR(50))
BEGIN
	SET @idMax = (SELECT MAX(ID_Puesto) FROM Puestos) +1;
	INSERT INTO Puestos VALUES (@idMax, p_Puesto);
END //
DELIMITER ;

CALL sp_AddPuesto('Encargado de barra');

SELECT * FROM Puestos;

-- SP que devuelven los productos más caros despues de introducida la variable a analizar

DROP PROCEDURE IF EXISTS sp_ProductosCaros

DELIMITER //
CREATE PROCEDURE sp_ProductosCaros (IN p_precio DECIMAL (10,2))

BEGIN
	SELECT Nombre_Producto, Precio_Unitario
    FROM Productos
    WHERE Precio_Unitario > p_precio;
END //
DELIMITER ;

------------------------------------------------ TIGGERS ------------------------------------------------

-- Se crea un Tiggers que descuenta el stock de los productos que se cargan, actualizan o eliminan en un presupuesto

DELIMITER //
CREATE TRIGGER Descuento_Stock_Insert
AFTER INSERT ON Detalle_presupuestos
FOR EACH ROW
BEGIN
UPDATE Productos SET Stock = Stock - NEW.Cantidad
WHERE ID_Producto = NEW.ID_Producto;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Descuento_Stock_Update
AFTER UPDATE ON Detalle_presupuestos
FOR EACH ROW
BEGIN
UPDATE Productos SET Stock = Stock + (OLD.Cantidad - NEW.Cantidad)
WHERE ID_Producto = OLD.ID_Producto;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Descuento_Stock_Delete
AFTER DELETE ON Detalle_presupuestos
FOR EACH ROW
BEGIN
	UPDATE Productos SET Stock = Stock + OLD.Cantidad
	WHERE ID_Producto = OLD.ID_Producto;
END //
DELIMITER ;

-- Se crea un Tiggers que calcula el precio de venta de cada producto dentro de la tabla producto, cuando el mismo es cargado o actualizado

DELIMITER //
CREATE TRIGGER Calculo_Precio_Venta_Insert
BEFORE INSERT ON Productos
FOR EACH ROW
BEGIN
	SET NEW.Precio_Venta = NEW.Precio_Unitario * 1.1;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Calculo_Precio_Venta_Update
BEFORE UPDATE ON Productos
FOR EACH ROW
BEGIN
	SET NEW.Precio_Venta = NEW.Precio_Unitario * 1.1;
END //
DELIMITER ;

-- ------------------------------------------ USUARIOS ----------------------------------------------

-- Se revisan los empleados cargados en la tabla "Empleados"

SELECT * FROM Empleados;

-- Se revisa las politicas que tiene la base

SHOW VARIABLES LIKE "validate_pasword%";

-- Se crean los 5 usuarios con un pass base
CREATE USER hsimpson@localhost IDENTIFIED BY "1234";
CREATE USER bsimpson@localhost IDENTIFIED BY "1234";
CREATE USER lsimpson@localhost IDENTIFIED BY "1234";
CREATE USER msimpson@localhost IDENTIFIED BY "1234";
CREATE USER masimpson@localhost IDENTIFIED BY "1234";

-- Se verifica la creación de los usuarios creados

SELECT * FROM mysql.user WHERE user LIKE "hsimpson";
SELECT * FROM mysql.user WHERE user LIKE "bsimpson";
SELECT * FROM mysql.user WHERE user LIKE "lsimpson";
SELECT * FROM mysql.user WHERE user LIKE "msimpson";
SELECT * FROM mysql.user WHERE user LIKE "masimpson";

-- Se crea los accesos a cada nuevo usuario

-- Se le da permiso total a dos de los usuarios creados. Ambos pueden eliminar tablas
GRANT ALL ON *.* TO hsimpson@localhost;
GRANT ALL ON *.* TO msimpson@localhost;

-- Se le da permiso de solo lectura a dos de los usuarios creados
GRANT SELECT, INSERT, UPDATE ON *.* TO bsimpson@localhost;
GRANT SELECT, INSERT, UPDATE ON *.* TO lsimpson@localhost;

-- Se le da permiso de Lectura, inserción, modificación y acceso a los stored procedure y funciones a uno de los usuarios creados. Solo se le da permiso a una tabla.
GRANT SELECT, UPDATE, EXECUTE ON *.* TO masimpson@localhost;

-- Se elimina el permiso de eliminar a uno de los usuarios
REVOKE DELETE ON *.* FROM msimpson@localhost;

-- Se revisan los permisos que quedaron para cada usuario

SHOW GRANTS FOR hsimpson@localhost;
SHOW GRANTS FOR bsimpson@localhost;
SHOW GRANTS FOR lsimpson@localhost;
SHOW GRANTS FOR msimpson@localhost;
SHOW GRANTS FOR masimpson@localhost;

-- ------------------------------------------ SENTENCIAS TCL ---------------------------------------------- 

-- Se cambia el estado de la base a no Autocommit
SELECT @@autocommit;
SET AUTOCOMMIT = 0; 

-- Se inicia un ST para agregar un nuevo empleado

START TRANSACTION;
INSERT INTO Empleados VALUES(6, "Nelson Muntz", 3, 20349342341, "Calle 3", 2, 6, 300000);
ROLLBACK;
COMMIT;

-- Se inicia un ST para agregar productos a la tabla "Productos"

START TRANSACTION;
INSERT INTO Productos VALUES(311,"CORONA PORRON",1, 80, 152, 200, 1);
INSERT INTO Productos VALUES(312,"MILLER PORRON ",1, 70, 133, 200, 1);
INSERT INTO Productos VALUES(313,"STELLA ARTOIS PORRON",1, 75, 143, 200, 1);
INSERT INTO Productos VALUES(314,"ANDES PORRON",1, 60, 114, 200, 1);
SAVEPOINT lote_1;
INSERT INTO Productos VALUES(315,"CORONA 710ML",1, 400, 760, 200, 1);
INSERT INTO Productos VALUES(316,"MILLER 1L",1, 300, 570, 200, 1);
INSERT INTO Productos VALUES(317,"STELLA ARTOIS 1L",1, 350, 650, 200, 1);
INSERT INTO Productos VALUES(318,"ANDES 1L",1, 300, 570, 200, 1);
SAVEPOINT lote_2;

-- RELEASE savepoint lote_1;

-- Se realiza un Backup de las siguientes tablas:
-- Clientes
-- Detalle_Presupuestos
-- Empleados
-- Presupuestos
-- Proveedores