/*-------------SubConsultas-----------*/

/*Muestre los sueldos que están por debajo del sueldo promedio de la tabla
puesto*/

select avg(SueldoBase) as sueldo from puesto;

/*Muestre todos los puestos cuyo sueldo sea menor al sueldo más alto de los
puestos que inician con "Administrador%" */

select *from puesto;
select NombrePuesto, Min(SueldoBase) from puesto
order by NombrePuesto asc;

select Min(SueldoBase)  from puesto 
where concat(NombrePuesto, '')
like 'Administrador%';


/*Muestre nombre y apellido de los empleados que iniciaron labores en el mes de
octubre (sin importar el año).*/;

/*select Nombres, Apellidos, month(2020/10/12) from personal;*/
select p.Nombres, p.Apellidos, a.FechincioLa 
from asigna a   
join  personal p 
on  p.CodPersonal  =  p. Asigna_CodigoAsigna
where month(FechincioLa)='10';
 

/*Consulta  que nos vaya a traer nombres, apellidos, nombre 
del puesto y sueldo de un empleado(usar inner join).*/


select a.nombres, a.apellidos, b.NombrePuesto, b.SueldoBase
from  personal  a
inner join puesto  b on a.Puesto_CodPuesto = b.CodPuesto;
select*from personal;




/*---------------FUNCIONES Y PROCEDIMIENTOS----------------------*/
 /*Crear una función con el nombre "fnbono" que reciba un parámetro y calcule el
10% del valor recibido.*/
 
 DELIMITER $$
create function fnbono( numero double)
RETURNS DOUBLE
BEGIN
 declare porcentaje double ;
 set porcentaje = (numero*10)/100;
 return porcentaje;
 end  $$ 
 DELIMITER ;
 
/*Crear un procedimiento que permita insertar registros en la tabla puestos, para
el campo bono utilice la función "fnbono".
Ejemplo del insert a realizar en el procedimiento
El procedimiento debe realizar un INSERT into tabla
VALUES(varablecodPuesto,...,...,varSueldobase,fnbono(varSueldobase),varBonificación) */;

create procedure fnbono ( IN CodPuesto int,IN NombrePuesto varchar(45),IN Descrip varchar(45), IN SueldoBase varchar(45),IN bono varchar(45), IN Bonificación varchar(45),IN Asigna_CodigoAsigna int  )
begin 
insert into puesto(CodPuesto,NombrePuesto,Descrip ,SueldoBase ,Bono ,Bonificación ,Asigna_CodigoAsigna) values(CodPuesto, NombrePuesto, Descrip  ,fnbono(SueldoBase) ,bono ,Bonificación, Asigna_CodigoAsigna)
end $$
DELIMITER ;

/**--------------------TRIGGERS-----------------*/
/*Crear un trigger que permita llevar una bitácora de quien elimina registros de la tabla
"Personal".
Datos a registrar en la tabla bitacora: CodPersona, fecha/hora de eliminación, usuario que lo elimino.
usuario loggeado SELECT USER()/CURRENT_USER()*/;

  
DELIMITER $$
create trigger savebitacora after update on personal
for each row 
insert into bitacora(codPersona, fecha, usuario) values(CURRENT_USER())
$$
DELIMITER ;
 



