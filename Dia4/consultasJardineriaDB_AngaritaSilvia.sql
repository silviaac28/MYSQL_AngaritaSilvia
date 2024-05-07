use jardineriaDB;


-- CONSULTA Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select codigo_oficina, ciudad from oficina;

-- CONSULTA Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select oficina.ciudad, oficina.telefono from oficina
where oficina.pais = 'España';

-- CONSULTA Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

select nombre, apellido1, apellido2, email from empleado
where codigo_jefe = 7;

-- CONSULTA Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select puesto, nombre, apellido1, apellido2, email from empleado
where codigo_empleado = (select codigo_empleado from empleado where codigo_jefe is null);

-- CONSULTA Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

select nombre, apellido1, apellido2, puesto from empleado
where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente where codigo_empleado_rep_ventas is not null);


-- CONSULTA Devuelve un listado con el nombre de los todos los clientes españoles.

select nombre_cliente from cliente
where pais = 'España';

-- CONSULTA Devuelve un listado con los distintos estados por los que puede pasar un pedido

select distinct estado from pedido;


-- CONSULTA  Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- Utilizando la función YEAR de MySQL.
-- Utilizando la función DATE_FORMAT de MySQL.
-- Sin utilizar ninguna de las funciones anteriores.

-- CONSULTA Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido
where fecha_entrega > fecha_esperada;


-- CONSULTA  Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- Utilizando la función ADDDATE de MySQL.
-- Utilizando la función DATEDIFF de MySQL.
-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

-- CONSULTA  Devuelve un listado de todos los pedidos que fueron en 2009.

select * from pedido where year(fecha_pedido) = 2009;

-- CONSULTA Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.

select * from pedido
where month(fecha_pedido) = 1;

-- CONSULTA Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

select * from pago
where year(fecha_pago) = 2008 and forma_pago = 'Paypal'
order by total desc;

-- CONSULTA  Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

select distinct forma_pago
from pago;

-- CONSULTA  Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

select * from producto
where gama = 'Ornamentales' and cantidad_en_stock > 100
order by precio_venta desc;

-- CONSULTA  Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

select * from cliente
where ciudad = 'Madrid' and codigo_empleado_rep_ventas in (11, 30);
