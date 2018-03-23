
select nombrecliente as Nombre_De_Cliente, nombre as Representante_Ventas, oficinas.ciudad as Ciudad
from clientes
inner join empleados on codigoempleadorepventas=codigoempleado
inner join oficinas on empleados.codigooficina=oficinas.codigooficina
group by nombrecliente;