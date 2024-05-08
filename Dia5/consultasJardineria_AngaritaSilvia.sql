use jardineriaDB;

-- 1 Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

SELECT oficina.codigo_oficina, oficina.ciudad
FROM oficina;


-- 2 CONSULTA Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select codigo_oficina, ciudad from oficina;

-- 3 CONSULTA Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select oficina.ciudad, oficina.telefono from oficina
where oficina.pais = 'España';

-- 4 CONSULTA Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

select nombre, apellido1, apellido2, email from empleado
where codigo_jefe = 7;

-- 5 CONSULTA Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select puesto, nombre, apellido1, apellido2, email from empleado
where codigo_empleado = (select codigo_empleado from empleado where codigo_jefe is null);

-- 6 CONSULTA Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

select nombre, apellido1, apellido2, puesto from empleado
where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente where codigo_empleado_rep_ventas is not null);


-- 7 CONSULTA Devuelve un listado con el nombre de los todos los clientes españoles.

select nombre_cliente from cliente
where pais = 'España';

-- 8 CONSULTA Devuelve un listado con los distintos estados por los que puede pasar un pedido

select distinct estado from pedido;


-- CONSULTA  Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- 9 Utilizando la función YEAR de MySQL.

SELECT DISTINCT codigo_cliente
FROM pago
WHERE YEAR(fecha_pago) = 2008;

-- 10 Utilizando la función DATE_FORMAT de MySQL.

SELECT DISTINCT codigo_cliente
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

-- 11 Sin utilizar ninguna de las funciones anteriores.

SELECT DISTINCT p.codigo_cliente
FROM pago p
JOIN cliente c ON p.codigo_cliente = c.codigo_cliente
WHERE p.fecha_pago >= '2008-01-01' AND p.fecha_pago <= '2008-12-31';


-- 12 CONSULTA Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido
where fecha_entrega > fecha_esperada;

-- CONSULTA  Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- 13 Utilizando la función ADDDATE de MySQL.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega <= ADDDATE(fecha_esperada, -2);


-- 14 Utilizando la función DATEDIFF de MySQL.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?



-- 15 CONSULTA  Devuelve un listado de todos los pedidos que fueron en 2009.

select * from pedido where year(fecha_pedido) = 2009;

-- 16 CONSULTA Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.

select * from pedido
where month(fecha_pedido) = 1;

-- 17 CONSULTA Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

select * from pago
where year(fecha_pago) = 2008 and forma_pago = 'Paypal'
order by total desc;

-- 18 CONSULTA  Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

select distinct forma_pago
from pago;

-- 19 CONSULTA  Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

select * from producto
where gama = 'Ornamentales' and cantidad_en_stock > 100
order by precio_venta desc;

-- 20 CONSULTA  Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

select * from cliente
where ciudad = 'Madrid' and codigo_empleado_rep_ventas in (11, 30);


-- PARTEEEEE 2 ************************** ------------------------------------------------------



-- Consultas multitabla (Composición interna) Resuelva todas las consultas mediante INNER JOIN y NATURAL JOIN.

-- 21 Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

select cliente.nombre_cliente  as NombreCliente, empleado.nombre as NombreRepresentante, empleado.apellido1  as Apellido1,empleado.apellido2  as Apellido2
from cliente inner join empleado on cliente.codigo_empleado_rep_ventas  = empleado.codigo_empleado;

-- 22 Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

SELECT cliente.nombre_cliente AS nombrecliente, empleado.nombre AS nombrerepresentante, empleado.apellido1, empleado.apellido2
FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente;


-- 23 Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT cliente.nombre_cliente AS nombrecliente, empleado.nombre AS nombrerepresentante, empleado.apellido1, empleado.apellido2, oficina.ciudad
FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente;


-- 24 Devuelve el nombre de los clientes que  hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT DISTINCT oficina.linea_direccion1, oficina.linea_direccion2
FROM oficina
INNER JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina
INNER JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE cliente.ciudad = 'Fuenlabrada';


-- 25 Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT cliente.nombre_cliente AS nombrecliente, empleado.nombre AS nombrerepresentante, empleado.apellido1, empleado.apellido2, oficina.ciudad
FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;


-- 26 Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

SELECT empleado1.nombre AS nombre_empleado, empleado2.nombre AS nombre_jefe
FROM empleado empleado1
INNER JOIN empleado empleado2 ON empleado1.codigo_jefe = empleado2.codigo_empleado;


-- 27 Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

SELECT empleado1.nombre AS nombre_empleado, empleado2.nombre AS nombre_jefe, empleado3.nombre AS nombre_jefe_jefe
FROM empleado empleado1
INNER JOIN empleado empleado2 ON empleado1.codigo_jefe = empleado2.codigo_empleado
INNER JOIN empleado empleado3 ON empleado2.codigo_jefe = empleado3.codigo_empleado;


-- 28 Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

SELECT cliente.nombre_cliente
FROM cliente
INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE pedido.fecha_entrega > pedido.fecha_esperada;


--  29 Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

SELECT DISTINCT cliente.nombre_cliente, producto.gama
FROM cliente
INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
INNER JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
INNER JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto;





