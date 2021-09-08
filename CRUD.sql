USE ControlPersonal;

INSERT INTO asigna (CodigoAsigna,CodPersona,CodDep ,CodPuesto ,FechaAsigna,FechincioLa) VALUES
('001','1287 88883 0101','0411','001','2020-02-12 11:11:04','2021-02-12 11:18:04'),
('002','2320 55432 0103','0512','002','2020-04-02 21:12:03','2021-02-12 17:01:11'),
('003','2349 31345 0808','0613','003','2020-01-23 20:11:23','2021-02-12 21:19:16'),
('004','3719 42527 1219','0114','004','2020-02-22 17:10:14','2021-02-12 19:18:19'),
('005','1923 23321 1235','5234','005','2020-03-25 02:01:24','2021-02-12 21:14:02');

SELECT *FROM asigna;
delete from asigna where CodigoAsigna='5';
update asigna set CodPersona='7319 24572 2112' where CodigoAsigna='4';

INSERT INTO departamento (CodDepto,NombreDepto,Descripcion,CantEmpleados,Asigna_CodigoAsigna) VALUES
('0411','Logistica','Gestion empresas de logistica','3','001'),
('0512','Compras','Control de calidad','4','002'),
('0613','Produccion','Cortrol de calidad','2','003'),
('0114','Marketing','Esstudio del mercado','3','004'),
('5234','Comercial','Presupuesto de ventas','1','005');

SELECT *FROM departamento;
DELETE FROM departamento WHERE CodDepto='5234';
UPDATE departamento SET Descripcion='Control cajas y atender pagos' WHERE CodDepto='613';

INSERT INTO personal (CodPersonal, Nombres, Apellidos, Correo, FechaNacimiento,Puesto_CodPuesto, Departamento_CodDepto, Asigna_CodigoAsigna) VALUES 
('1','Victor Rene','Cortez Sis','renecortez871@gmail.com','1999-02-04','1223','114','1'),
('2','Sheyli Ely','Tecu Alvarado','sheelyta@gmail.com','2000-08-04','1345','411','2'),
('3','Karen Adrina','Chur Garcia','kachurg@gmail.com','1995-10-01','2221','512','3'),
('4','Karina','Kastro Mejias','kkmejia@gmail.com','1998-12-12','2322','613','4'),
('5','Perla','Garcia','perg@gmail.com','1997-02-01','3122','5234','5');

SELECT *FROM personal;
DELETE FROM personal WHERE CodPersonal='5';
UPDATE personal SET Nombres='Sonia', Apellidos='Cortez',Correo='soniacortez@gmail.com' WHERE CodPersonal='4';

INSERT INTO puesto(CodPuesto,NombrePuesto,Descrip,SueldoBase,Bono,Bonificación,Asigna_CodigoAsigna) VALUES
('2322','Supervisor','Responsable de asesorar','7890','1000','400','1'),
('2221','Admin de redes','Funcion gestionar y cordinador','8000','1100','500','2'),
('3122','Admin de proyectos','Responsable para llevar a cabo el proyecto','7500','900','350','3'),
('1223','Gerente','Funcion oordinacion ','7000','800','300','4'),
('1345','Cajero','Llevar el contro de caja','5000','500','250','5');

SELECT * FROM puesto;
DELETE FROM puesto WHERE CodPuesto = '1345';
UPDATE puesto  SET Descrip='A cargo de direccion o cordinacion' WHERE CodPuesto='1223';