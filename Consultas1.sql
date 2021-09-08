/**    ---- --- Consultas------------

Despliegue los cinco productos más costosos, en orden descendente, 
del más costoso hasta la menos costoso, la cantidad en existencia 
de cada uno y el tipo de empaque.*/
 select * from productos;
 select p.precio, p.existencia, p.tipoEmpaque  from  productos p
 order by precio desc;


/**Despliegue una lista de cada proveedor, sus productos, las cantidades
 en existencia y los niveles de reabastecimiento asociados; se debe ordenar 
 en forma alfabética por proveedor; dentro de cada categoría de proveedor 
 hay que colocar los productos en orden alfabético.*/
 select * from proveedores;
select * from productos;

 select pr.nit, pr.razonSocial, p.nombre, p.existencia from proveedores pr
 join productos p
 on p.codigoProducto =p.codigoProducto;

select p.nombre, p.existencia, pr.nit from proveedores pr
left join productos p
on p.codigoProducto = p.codigoProducto; 

 
 /**Despliegue una lista de los productos que tengan un nivel bajo de existencia
 y necesitan reabastecerse. La consulta debe proveer información a los proveedores
 para los productos identificados.*/
  select * from productos;
  select * from proveedores;

 select  p.existencia,p.nombre, pr.nit, pr.razonSocial from productos p
 join proveedores pr 
 on p.codigoProducto=p.codigoProducto_categoria
 
 
 
 
 


