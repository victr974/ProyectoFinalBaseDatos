/** Realizar por lo menos 5 ejemplo de cada 
una de las sentencias de SQL utilizadas en el 
curso (CRUD)
**/
CREATE DATABASE AdminInventario;
USE AdminInventario;

-- Estructura de tabla para la tabla `categorias`

CREATE TABLE categorias(
codigoCategoria int(11) auto_increment ,
descripcion varchar(50) not null,
primary key(codigoCategoria)
);
 
 -- Volcado de datos para la tabla `categorias`
 INSERT INTO categorias (codigoCategoria, descripcion) VALUES
('1', 'Comida'),
('2', 'Bebidas'), 
('3', 'Bebidas con Alcohol'),
('4', 'Postres'),
('5', 'Ensaladas');

select * from categorias;
delete from categorias where codigoCategoria='5';
update categorias set descripcion='Carnes' where codigoCategoria='4';


 -- Estructura de tabla para la tabla `productos`
 
CREATE TABLE productos(
codigoProducto int(11) not null,
nombre varchar(50) not null, 
precio varchar(50) not null,
unitario int(11) not null,
precioDocena varchar(50) not null,
precioMayor  varchar (50) not null,
existencia int(11) not null,
tipoEmpaque varchar(50) not null,
codigoProducto_categoria int, 
primary key(codigoProducto),
foreign key(codigoProducto_categoria) references categorias (codigoCategoria) on delete cascade);

 -- Volcado de datos para la tabla `productos`
 INSERT INTO productos (codigoProducto,nombre, precio, unitario, precioDocena, precioMayor,existencia, tipoEmpaque,codigoProducto_categoria ) VALUES
('01', 'Café Americano', '35', '3', '420','490', '15', 'empaque primario', '2' ),
('02', 'Chuletas de Cerdo', '50', '60', '600', '650','31','bosa','1'),
('03', 'Vino Tinto México', '89', '32','549','654','19', 'envase','3'),
('04', 'Ensalada de Higo', '89', '45','643','573','53','bolsa', '5'),
('05', 'Pastel de Zanahoria', '89', '54', '325', '454','32','empaque primario', '4');

select * from productos;
delete from productos where codigoProducto='5';
update productos set nombre='Pastel rosa', precio='342',unitario='12',precioDocena='644',precioMayor='786',existencia='110',tipoEmpaque='carton',codigoProducto_categoria='4'
where codigoProducto='3';


-- Estructura de tabla para la tabla `clientes`

CREATE TABLE clientes(
nit int(50) not null auto_increment ,
dpi varchar(50) not null,
nombre  varchar(50) not null,
direccion varchar(50) not null,
telefono int(15) not null,
email  varchar(50) not null,
primary key(nit)
);
 
 -- Volcado de datos para la tabla `clientes`
 
 INSERT INTO clientes (nit ,dpi , nombre,direccion ,telefono ,email ) VALUES
('87343', '3165 00321 15054', 'Juan Perez', 'Rabinal Baja Verapaz','58589432', 'Jperez872@gmail.com' ),
('17343', '3113 00339 13503', 'Pedro Soto', 'Salama Baja Verapaz','24739273', 'pedsoto@gmail.com' ),
('37445', '2465 00356 16873', 'Victor Cortez', 'Rabinal Baja Verapaz','58879318', 'renecorte871@gmail.com' ),
('12741', '6475 00524 28878', 'Edgar Rodriguez', 'Rabinal Baja Verapaz','52276323', 'rodriguez@gmail.com' ),
('42345', '2566 00983 13645', 'Aracely Alavarado', 'Rabinal Baja Verapaz','92198321', 'aralvarado@gmail.com' );

select * from clientes;
delete from clientes where nit='87343';
update clientes set dpi='4255 01814 11442',nombre='Aracely Garcia',direccion='Coban',telefono='32531276',email='araGarcia@gmail.com'
where nit='42345';

-- Estructura de tabla para la tabla `proveedores `
CREATE TABLE proveedores(
codigo int(11) not null auto_increment,
nit int(25) not null,
razonSocial varchar(50) not null,
direccion varchar(45) not null,
telefono int(15) not null,
paginaWeb varchar(150) not null,
email varchar(50) not null,
contatoPrincipal  varchar(50) not null,
codigo_producto int not null, 
primary key(codigo), 
foreign key(codigo_producto ) references productos (codigoProducto) on delete cascade
);
 -- Volcado de datos para la tabla `proveedores`

 INSERT INTO proveedores (codigo , nit, razonSocial, direccion, telefono, paginaWeb, email,contatoPrincipal,codigo_producto) VALUES
('01','092344','Grupo Modesto','Salama B.V','58474723','https://www.GrupoModesto.com','Grupm@gmail.com','Carmen Garcia','1'),
('02','932345','Brothers Lopez','Rabinal B.V','47838732','https://www.BrothersLopez.com','Brothers@gmail.com','Lesly Kastro','2'),
('03','109631','Garcia Armenteros','Salama B.V','38742123','https://www.GarciaArmenteros.com','GarciaArmentero.com','Solis Garcia','3'),
('04','726378','Brothers Gómez','Salama B.V','31435678','https://www.BrothersGomez.com','BrothersGomez@gmail.com','Jhon Gomez','4'),
('05','094346','Asociacion Luna','Rabinal B.V','42129805','www.AsociacionL.com','AsociacionL@gmail.com','Karen Soto','5');   

select * from proveedores;
delete from proveedores where codigo='5';
update proveedores set nit='235212',razonSocial='Grupo Gastronomico S.A', direccion='Salama'  where codigo='3';


-- Estructura de tabla para la tabla ` facturas`
CREATE TABLE facturas(
Nofactura int(15) not null auto_increment,
fecha timestamp not null,
datosCliente varchar(100) not null,
codigoProducto varchar(100) not null,
descripcion varchar(100) not null,
cantidad int(50) not null, 
totalFactura int(50) not null,
codigo_cliente int not null,
primary key(NoFactura),
foreign key(codigo_cliente) references clientes(nit) on delete cascade
);

 -- Volcado de datos para la tabla `facturas`
 INSERT INTO facturas(Nofactura,fecha ,datosCliente ,codigoProducto ,descripcion ,cantidad ,totalFactura, codigo_cliente) VALUES
('04451', '2021-02-10 21:20:32','Juan Perez','01','Café Americano','15','525','87343'),
('02422', '2021-03-28 21:20:32','Pedro Soto','02','Chuletas de Cerdo','12','600','17343'), 
('05243', '2021-02-09 21:20:32','Victor Cortez','03','Vino Tinto México','1','89','37445'),
('04344', '2021-03-19 23:00:31','Edgar Rodriguez','04','Ensalada de Higo','4','356','12741'),
('02345', '2021-02-11 12:20:32','Aracely Alavarado','05','Pastel de Zanahoria','2','178','42345');

select * from facturas;
delete from facturas where Nofactura='5243';
update facturas set fecha='2021-05-15 21:12:10',datosCliente='René Soto',codigoProducto='2' ,descripcion='Soda'
where Nofactura='04344';

-- Estructura de tabla para la tabla `tipoRegistrp`
create table tiporegistro(
id int not null auto_increment,
nombre varchar(25) not null,
primary key(id));

 -- Volcado de datos para la tabla `tipoRegistro`
 insert into tiporegistro(id, nombre) values 
 ('1','venta'),
 ('2','compra'),
 ('3','venta'),
 ('4','venta'),
 ('5','compra');
 
 select * from tiporegistro;
 delete from tiporegistro where id='5';
 update tiporegistro set nombre='compra' where id = '4';
	

-- Estructura de tabla para la tabla `Salidas`
 create table Salidas(
 idSalida int not null auto_increment,
 fecha timestamp not null, 
 cantidadProducto int not null,
 primary key(idSalida));
 
  -- Volcado de datos para la tabla `Salidas`
  insert into Salidas( idSalida, fecha, cantidadProducto) values
  ('1','2021-01-15 02:23:13','45'),
  ('2','2021-02-10 22:20:22','23'),
  ('3','2021-03-09 21:10:32','76'),
  ('4','2021-02-16 11:04:21','35'),
  ('5','2021-04-16 17:02:43','86');
  
  select * from Salidas;
  delete from salidas where idSalida='5';
  update salidas set fecha='2021-05-15 20:12:10', cantidadProducto='78' where idSalida = '4';
  
  -- Estructura de tabla para la tabla `Entradas`
  create table Entradas(
  idEntrada int not null auto_increment,
  fecha timestamp not null,
  codigoProveedor int not null,
  cantidadProducto int not null,
  primary key(idEntrada),
  foreign key(codigoProveedor) references proveedores(codigo) on delete cascade);
  
   -- Volcado de datos para la tabla `Entradas`
   insert into Entradas(idEntrada, fecha, codigoProveedor, cantidadProducto) values
   ('1','2021-05-12 01:28:32','1','32'),
   ('2','2021-04-28 21:08:54','2','43'),
   ('3','2021-01-06 18:02:14','3','53'),
   ('4','2021-02-16 09:21:22','4','25'),
   ('5','2021-03-21 17:22:12','5','45');
   
   select * from entradas;
   delete from entradas where idEntrada='5';
   update entradas set fecha='2021-03-21 20:12:19', codigoProveedor='3', cantidadProducto='54' where idEntrada='3'; 
   
  
-- Estructura de tabla para la tabla `inventario`
CREATE TABLE inventario(
codigoProducto int(10) not null,
typeRegistro int not null,
fecha timestamp not null, 
precio varchar(255) not null,
entradas int not null,
salidas int not null,
foreign key(CodigoProducto)  references productos(codigoProducto) on delete cascade,
foreign key(typeRegistro) references tiporegistro(id) on delete cascade,
foreign key(entradas) references entradas(idEntrada) on delete cascade,
foreign key(salidas) references Salidas(idSalida)on delete cascade
);

 -- Volcado de datos para la tabla `inventario`
 INSERT INTO inventario ( codigoProducto,typeRegistro,fecha ,precio,entradas,salidas) VALUES
('01','1','2021-03-11 11:00:32','574','1','1'),
('02','2','2021-04-18 21:22:42','432','2','2'),
('03','3','2021-02-21 21:09:26','232','3','3'),
('04','4','2021-01-18 21:07:38','654','4','4'),
('05','5','2021-04-21 21:20:12','436','5','5');
 
 select * from inventario;
 delete from inventario where codigoProducto = '4';
 update inventario set typeRegistro='3',fecha='2021-03-12 20:10:11',precio='53',entradas='3',salidas='3' 
 where codigoProducto = '3';
