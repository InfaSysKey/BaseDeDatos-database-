
1.Sacar el nombre de los clientes y el nombre de sus
representantes junto con la ciudad de la oficina a la que
pertenece el representante.

select nombrecliente as Nombre_De_Cliente, nombre as Representante_Ventas, oficinas.ciudad as Ciudad
	from clientes
	inner join empleados on codigoempleadorepventas=codigoempleado
	inner join oficinas on empleados.codigooficina=oficinas.codigooficina
group by nombrecliente;

2.Obtener un listado con el nombre de los empleados
juntos con el nombre de sus jefes.

select normales.nombre as Empleados, jefes.nombre as Jefes
	from empleados normales
	inner join empleados jefes on normales.codigoempleado=jefes.codigojefe;

3.Obtener el nombre de los clientes a los que no se les ha
entregado a tiempo un pedido (FechaEntrega > Fecha
esperada)

select clientes.nombrecliente as Nombre_De_Cliente
	from clientes
	inner join pedidos on clientes.codigocliente=pedidos.codigocliente
	where FechaEntrega>fechaesperada;

4.Sacar un listado de clientes indicando el nombre del
cliente y cuántos pedidos ha realizado.

select nombrecliente as Nombre_De_Cliente, count(codigopedido) as Nº_Pedidos
	from clientes
	inner join pedidos on clientes.codigocliente=pedidos.codigocliente
	group by clientes.codigocliente;

5.Sacar un listado con los nombres de los clientes y el
total pagado por cada uno de ellos.

select nombrecliente as Nombre_De_Cliente, sum(cantidad) as Total
	from clientes
	inner join pagos on clientes.codigocliente=pagos.codigocliente
	group by clientes.codigocliente;

6.Sacar el nombre de los clientes que hayan hecho pedidos
en 2008.

select clientes.nombrecliente as Nombre_De_Cliente from clientes
	inner join pedidos on clientes.codigocliente=pedidos.codigocliente
	where year(fechapedido)="2008";

7.Listar el nombre del cliente y el nombre y apellidos de
sus representantes de aquellos clientes que no hayan
realizado pagos.

select nombrecliente as Nombre_De_Cliente, concat(nombre ,' ',apellido1,' ',apellido2) as Empleados
	from clientes
	inner join empleados on codigoempleado=codigoempleadorepventas
	and codigocliente not in (select codigocliente from pagos)
	group by nombrecliente;

8.Sacar un listado de clientes donde aparezca el nombre
de su comercial y la ciudad donde está su oficina.

select nombrecliente as Nombre_De_Cliente, nombre as Representante_Ventas, oficinas.ciudad as Ciudad
	from clientes
	inner join empleados on codigoempleadorepventas=codigoempleado
	inner join oficinas on empleados.codigooficina=oficinas.codigooficina
	group by nombrecliente;

9.Sacar cuantos empleados tiene cada oficina, mostrando
el nombre de la ciudad donde está la oficina

select count(empleados.codigoempleado) as Nº_Empleados, oficinas.ciudad as Ciudad
	from empleados inner join oficinas on empleados.codigooficina=oficinas.codigooficina
	group by ciudad;

10.Sacar un listado con el nombre de los empleados, y el
nombre de sus respectivos jefes.

select normales.nombre as Empleados, jefes.nombre as Jefes
	from empleados normales
	inner join empleados jefes on normales.codigoempleado=jefes.codigojefe;