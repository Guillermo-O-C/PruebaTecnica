/*
A.	Escriba la consulta en SQL que devuelva el nombre del proyecto y sus productos correspondientes del proyecto premia cuyo código es 1
*/

SELECT a.Nombre 'Proyecto', STRING_AGG (c.Nombre, ',') 'Productos'
FROM Proyecto a 
inner join Producto_Proyecto b on a.Proyecto = b.Proyecto 
inner join Producto c on b.Producto = c.Producto 
WHERE PROYECTO = 1
GROUP BY a.Nombre;

/*
B.	Escriba una consulta SQL que devuelva los distintos mensajes que hay, indicando a qué proyecto y producto pertenecen.
*/

SELECT d.Nombre 'Formato Mesaje', b.Nombre 'Producto', c.Nombre 'Proyecto'  
FROM Mensaje a 
inner join Producto b on a.Producto = b.Producto 
inner join Proyecto c on a.Proyecto = c.Proyecto
inner join Formato_Mensaje d on a.Cod_Formato = d.Cod_Formato,

/*
C.	Escriba una consulta SQL que devuelva los distintos mensajes que hay, indicando a qué proyecto y producto pertenecen.
Pero si el mensaje está en todos los productos de un proyecto, en lugar de mostrar cada producto, debe mostrar el nombre del proyecto y un solo producto que diga “TODOS”.
*/

SELECT d.Nombre 'Formato Mesaje', c.Nombre 'Proyecto', 
CASE (SELECT COUNT(*) FROM Producto_Proyecto pp left join Mensaje m on pp.Proyecto = m.Proyecto AND pp.Producto = m.Producto WHERE m.Proyecto IS NULL AND m.Producto IS NULL AND m.Proyecto = a.Proyecto) 
WHEN 0 THEN 'TODOS' ELSE STRING_AGG (b.Nombre, ',') END 'Productos'
FROM Mensaje a 
inner join Producto b on a.Producto = b.Producto 
inner join Proyecto c on a.Proyecto = c.Proyecto
inner join Formato_Mensaje d on a.Cod_Formato = d.Cod_Formato
GROUP BY d.Nombre, c.Nombre;