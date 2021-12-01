create database examen_final
go
use examen_final
go
create schema vijap
go
create table vijap.JARDINERIA_GAMAPRODUCTOS(
    gama INT IDENTITY PRIMARY KEY,
    descripcionTexto NVARCHAR(20),
    descripcionHTML NVARCHAR(50),
    imagen NVARCHAR(60)
)
go
create table vijap.JARDINERIA_PRODUCTOS(
    codigoProducto INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(20) NOT NULL,
    gama INT FOREIGN KEY REFERENCES vijap.JARDINERIA_GAMAPRODUCTOS(gama),
    dimensiones NVARCHAR(20),
    proveedor NVARCHAR(20),
    cantidadEnStock INT NOT NULL,
    precioVenta DECIMAL(10,3) NOT NULL,
    precioProveedor DECIMAL(10,3)
)
go
/*ADICIONAL*/
create table vijap.JARDINERIA_OFICINAS(
	codigoOficina INT identity primary key,
	ciudad NVARCHAR(10),
	pais NVARCHAR(10),
	region NVARCHAR(10),
	codigoPostal NVARCHAR(10),
	telefono NVARCHAR(10),
	lineaDireccion1 NVARCHAR(40),
	lineaDireccion2 NVARCHAR(40)
)
go
create table vijap.JARDINERIA_EMPLEADOS(
	codigoEmpleado int identity primary key,
	nombre NVARCHAR(20),
	apellido1 NVARCHAR(30),
	apellido2 NVARCHAR(30),
	extension NVARCHAR(10),
	email NVARCHAR(40),
	codigoOficina INT FOREIGN KEY REFERENCES vijap.JARDINERIA_OFICINAS(codigoOficina),
	codigoJefe INT FOREIGN KEY REFERENCES vijap.JARDINERIA_EMPLEADOS(codigoEmpleado),
	presupuesto INT
)
go
create table vijap.JARDINERIA_CLIENTES(
	codigoCliente int identity primary key,
	nombreCliente NVARCHAR(30),
	nombreContacto NVARCHAR(30),
	apellidoContacto NVARCHAR(30),
	telefono NVARCHAR(10),
	fax NVARCHAR(10),
	lineaDireccion1 NVARCHAR(30),
	lineaDireccion2 NVARCHAR(30),
	ciudad NVARCHAR(20),
	region NVARCHAR(10),
	pais NVARCHAR(20),
	codigoPostal NVARCHAR(10),
	codigoEmpleadorRepventas INT FOREIGN KEY REFERENCES vijap.JARDINERIA_EMPLEADOS(codigoEmpleado),
	limiteCredito INT
)
go
create table vijap.JARDINERIA_PEDIDOS(
	codigoPedido int identity primary key,
	fechaPedido DATETIME DEFAULT GETDATE(),
	fechaEsperada DATETIME,
	fechaEntrega DATETIME,
	estado NVARCHAR(1),
	comentarios NVARCHAR(20),
	codigoCliente INT FOREIGN KEY REFERENCES vijap.JARDINERIA_CLIENTES(codigoCliente)
)
go
create table vijap.JARDINERIA_DETALLEPEDIDOS(
	id int identity primary key,
	codigoPedido INT FOREIGN KEY REFERENCES vijap.JARDINERIA_PEDIDOS(codigoPedido),
	codigoProducto INT FOREIGN KEY REFERENCES vijap.JARDINERIA_PRODUCTOS(codigoProducto),
	cantidad INT,
	precioUnidad DECIMAL(10,3),
	numeroLinea INT
)
go
create table vijap.JARDINERIA_PAGOS(
	idTransaccion INT identity primary key,
	codigoCliente INT FOREIGN KEY REFERENCES vijap.JARDINERIA_CLIENTES(codigoCliente),
	formaPago NVARCHAR(10),
	fechaPago DATETIME,
	cantidad INT
)
go

/*ADICIONAL*/
create procedure vijap.lista_productos
AS
SELECT codigoProducto, nombre,dimensiones FROM vijap.JARDINERIA_PRODUCTOS
go
create procedure vijap.obtener_producto
@codigoProducto INT
AS
SELECT
codigoProducto,
nombre,
dimensiones,
proveedor,
cantidadEnStock,
precioVenta,
precioProveedor
FROM vijap.JARDINERIA_PRODUCTOS
WHERE codigoProducto=@codigoProducto
go
create procedure vijap.crear_producto
@nombre NVARCHAR(20) NOT NULL,
@gama INT ,
@dimensiones NVARCHAR(20),
@proveedor NVARCHAR(20),
@cantidadEnStock INT NOT NULL,
@precioVenta DECIMAL(10,3) NOT NULL,
@precioProveedor DECIMAL(10,3)
AS
INSERT INTO vijap.JARDINERIA_PRODUCTOS
(nombre,gama,dimensiones,proveedor,cantidadEnStock,precioVenta,precioProveedor)
values(@nombre,@gama,@dimensiones,@proveedor,@cantidadEnStock,@precioVenta,@precioProveedor)
go
create procedure lista_gama
AS
SELECT gama,descripcionTexto
FROM vijap.JARDINERIA_GAMAPRODUCTOS
go

vijap.detalleVentas_producto 2
create procedure vijap.detalleVentas_producto 2 
@idProducto int
as
select sum(cantidad*precioUnidad) as acumulado
from vijap.JARDINERIA_DETALLEPEDIDOS
where codigoProducto = @idProducto

go
select * from [vijap].[JARDINERIA_PRODUCTOS]
go
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(2,10,11)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(2,2,110)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(2,1,101)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(2,4,55)


insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(3,10,110)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(3,2,111)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(3,1,120)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(3,4,99)



insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(8,2,14)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(8,2,20)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(8,1,50)
insert into [vijap].[JARDINERIA_DETALLEPEDIDOS]([codigoProducto],[cantidad],[precioUnidad]) values(8,4,28)



