use master 
go

if exists(select * from sysdatabases where name = 'ComidasDB')
begin
	drop database ComidasDB
end
go

create database ComidasDB
on(
name = ComidasDB,
filename = 'C:\Paginas web\Casas de comidas\Base de datos\ComidasDB.mdf'
)
go

use ComidasDB
go
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------Creacion de tablas------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Casas
(
	RUT bigint not null primary key,--es long en c#
	Nomb_Casa Varchar(50) not null,
	Especializacion Varchar(50) not null
)
go

create table Platos
(
	IDplato int not null,
	Nomb_Plato Varchar(50) not null,
	Precio float not null,-- es double en c#
	Imagen Varchar(50) not null,
	_RUT bigint not null foreign key references Casas(RUT)	
	primary key(IDplato,_RUT)
)
go

create table Usuarios
(
	NombreUsuario varchar(50) not null unique,
	NombreCompleto varchar(50) not null,
	Contraseña varchar(50) not null,
	Documento Bigint not null primary key-- es long en c#
)
go

create table Clientes
(
	Tarjeta bigint not null,
	Direccion varchar(50) not null,
	Documento bigint not null foreign key references Usuarios(Documento)
)
go

create table Administradores
(
	cargo varchar(50) not null,
	Documento bigint not null foreign key references Usuarios(Documento)
)
go

create table Pedidos
(
	Numero int not null primary key identity,
	Fecha datetime not null,
	Cantidad int not null,
	Entregado bit not null,
	_IDplato int not null,
	RUT_Casa bigint not null,
	foreign key (_IDplato,RUT_Casa) references Platos(IDplato,_RUT),
	Documento bigint not null foreign key references Usuarios(Documento)
)
go
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------Procedimientos Almacenados--------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------


create proc BuscarRut
@Rut bigint
as
begin
	select * from Casas  
	where RUT = @Rut
end
go
----------------------------------------------------------------------------------------------------------------------------
create proc ModificarCasa
@Rut bigint,
@Nombre varchar(50),
@Esp varchar(50)
as
begin
	if not exists (select * from Casas where RUT=@Rut)
	return -1
	update Casas	set Nomb_Casa = @nombre, especializacion = @esp 
	where RUT = @Rut
	if @@error <>0
	return -2
end
go

--exec ModificarCasa  179828837700,'Los Pinos','Pizzeria'
--select * from casas
----------------------------------------------------------------------------------------------------------------------------
create proc AgregarCasa
@Rut bigint,
@Nombre varchar(50),
@Esp varchar(50)
as
begin
	if exists (select * from Casas where RUT=@Rut)
	return -1-- ya existe una casa con ese rut
	if exists (select * from Casas where Nomb_Casa=@Nombre)
	return -2--existe una casa con ese nombre
	insert into Casas(RUT,Nomb_Casa,Especializacion) values(@Rut,@Nombre,@Esp)
	if @@ERROR<>0
	return -3
end
go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
create proc EliminarCasa
@rut bigint
as
begin
	if not exists (select * from Casas where RUT=@rut)
	return -1
	begin tran
	delete from Pedidos where Rut_Casa=@rut
	if @@ERROR <>0
	begin
	rollback transaction
	return -2
	end
	delete from Platos where _RUT = @rut
	if @@ERROR <> 0
	begin
	rollback tran 
	return -2
	end
	delete from Casas where RUT= @rut
	if @@ERROR <>0
	begin
	rollback tran
	return -2 
	end
	commit tran
	return 1
end
go

----------------------------------------------------------------------------------------------------------------------------
create proc Buscarplato
@idplato int,
@rut bigint
--@nombcasa varchar(50)
as
begin
	--declaro variable que sea el rut de la casa
	--declare @rut bigint
	--execute BuscarIDCasa @nombcasa, @rut output--se puede cambiar a algo  mas facil si hay problemas
	select * from Platos inner join Casas
	on @rut= RUT and @rut = _RUT
	where IDplato = @idplato and _RUT = @rut
end
go

--exec Buscarplato 1,'los pinos'
--select * from Platos,Casas


-------------------------------------------------------------------------------------------------------------------------------

create proc BuscarCasas--aca voy a buscar todos los datos de las casas y los voy a agregar en una lista de casas
as
begin
	select * from Casas
end
go
-------------------------------------------------------------------------------------------------------------------------------------
create proc BuscarIDCasa
@nombcasa varchar(50),
@rut bigint output
as
begin
	select @rut = Casas.RUT 
	from Casas
    where Nomb_Casa = @nombcasa
end
go
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
create proc AgregarPlato
@nomb varchar(50),
@precio float,
@img varchar(50),
--@casa varchar(50),
@rut bigint,
@id int output
as
begin
	--declare @rut bigint
	--declare @id int 
	--select @rut = RUT from Casas where Nomb_Casa = @casa
	select @id = idplato from Platos where _RUT=@rut order by IDplato asc
	set @id = @id+1
    --execute BuscarIDCasa @casa, @rut output
	insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (@id,@nomb,@precio,@img,@rut)
	if @@ERROR<>0
	return -1--hubo error al agregar a la BD
	return 1
end
go

--exec AgregarPlato 'necar',124,'imagen','Los pinos'
--select * from Platos
----------------------------------------------------------------------------------------------------------------------------
create proc ModificarPlato
@nombre varchar(50),
@precio float,
@imagen varchar(50),
@rut bigint,
@id int -- es lo que me ayuda a especificar el plato
as
begin
	--recibe los datos necesarios para modificar el plato
	if not exists (select * from Platos where IDplato = @id and _RUT = @rut)--ta mal, le doy nombre new
	return -1 --no existe el plato
	update Platos set Nomb_Plato = @nombre, Precio = @precio,Imagen = @imagen
	where IDplato = @id and _RUT = @rut
	if @@ERROR <> 0
	return -2
	return 1
end
go

--exec ModificarPlato 'nombreplato',150.20,'imageeen',179828837700,1 
--select * from Platos
----------------------------------------------------------------------------------------------------------------------------
create proc EliminarPlato
@id int,
@rut bigint
as
begin
	--elimina todos los registros de pedido y de la tabla platos
	--controlar que exista? -existe porque ya esta cargado
	if not exists (select * from Platos where IDplato=@id and _RUT=@rut)
	return -1--no existe el plato // no es necesario, pero por las dudas...
	begin tran
	delete from Pedidos where _IDplato = @id and RUT_Casa = @rut
	if @@ERROR <> 0
	begin
	rollback tran
	return -2
	end
	delete from Platos where IDplato = @id and _RUT = @rut
	if @@ERROR<>0
	begin
	rollback tran
	return -2
	end
	commit tran
	return 1
end
go

--exec EliminarPlato 1, 179828837700
--select * from Platos where IDplato=1
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------inserción de datos---------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Casas
insert into Casas (RUT,Nomb_Casa,Especializacion) values (179828837700,'Los Pinos','Pizzeria')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (269858837801,'Pizzapiedra','Pizzeria')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (672527847732,'El Chancho Felí','Parrillada')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (155823984520,'Don Gato','Parrillada')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (355721153899,'Minutas a la minuta','Minutas')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (279412263311,'Hermanos Poncho','Minutas')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (179838836710,'Varela','Internacional')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (267827726600,'Paladar Negro','Internacional')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (228726637740,'Aguanten las vacas loco','Vegetariano')
insert into Casas (RUT,Nomb_Casa,Especializacion) values (379838837730,'Ta dura la verdura','Vegetariano')
go
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Platos

--los pinos	
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Porción pizza con muzzarella',70,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Porción Fainá',50,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Pizzeta con muzarella',150,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Metro pizza con muzzarella',300,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'Metro pizza',250,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'1/2 metro pizza con muzzarella',150,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'1/2 metro pizza',125,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Porción pizza',60,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Porción figazza',100,'Ruta a imagen',179828837700)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Pizzeta con gustos',200,'Ruta a imagen',179828837700)
go

--Pizzapiedra
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Porción pizza con muzzarella',70,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Porción Fainá',50,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Pizzeta con muzarella',150,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Metro pizza con muzzarella',300,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'Metro pizza',250,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'1/2 metro pizza con muzzarella',150,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'1/2 metro pizza',125,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Porción pizza',60,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Porción figazza',100,'Ruta a imagen',269858837801)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Pizzeta con gustos',200,'Ruta a imagen',269858837801)
go

--El Chancho Felí
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Chorizo',50,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Morcilla',50,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Asado de tira',125,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Chinchulin',70,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'CHOTO',1000,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'Vacio',350,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'Pulpón',500,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Arrollado de pollo',300,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Hamburguesa Completa',150,'Ruta a imagen',672527847732)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Pollo a las brazas',250,'Ruta a imagen',672527847732)
go

--Don Macri
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Chorizo',50,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Morcilla',50,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Asado de tira',125,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Chinchulin',70,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'CHOTO',1000,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'Vacio',350,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'Pulpón',500,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Arrollado de pollo',300,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Hamburguesa Completa',150,'Ruta a imagen',155823984520)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Pollo a las brazas',250,'Ruta a imagen',155823984520)
go

--Minutas a la minuta
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Milanesa al pan completa',150,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Hamburguesa completa',130,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Empanadas varios gustos',50,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Milanesa en dos panes completa',250,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'Chivito al plato',300,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'Chivito al pan',350,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'Chorizo al pan completo',80,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Milanesa napolitana',300,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Milanesa con fritas',250,'Ruta a imagen',355721153899)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Gramajo',100,'Ruta a imagen',355721153899)
go

--Hermanos Poncho
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Milanesa al pan completa',150,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Hamburguesa completa',130,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Empanadas varios gustos',50,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Milanesa en dos panes completa',250,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'Chivito al plato',300,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'Chivito al pan',350,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'Chorizo al pan completo',80,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Milanesa napolitana',300,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Milanesa con fritas',250,'Ruta a imagen',279412263311)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Gramajo',100,'Ruta a imagen',279412263311)
go

--Varela
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Sushi',450,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Ramen',300,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Cuscús de cordero con higos',580,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Pollo al curry',675,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'Arroz salvaje 3 delicias',300,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'Pasta con brocoli, ajo y anchoas',350,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'kokoda',500,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Musaka',300,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Takoyaki',250,'Ruta a imagen',179838836710)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Sopa de macaco',1000000,'Ruta a imagen',179838836710)
go

--paladar negro
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Sushi',450,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Ramen',300,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Cuscús de cordero con higos',580,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Pollo al curry',675,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'Arroz salvaje 3 delicias',300,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'Pasta con brocoli, ajo y anchoas',350,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'kokoda',500,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Musaka',300,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Takoyaki',250,'Ruta a imagen',267827726600)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Sopa de macaco',1000000,'Ruta a imagen',267827726600)
go  

--aguanten las vacas loco
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Ensalada de espinacas y tofu',450,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Ensalada de peras glaseadas',300,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Hamburguesa de lentejas',580,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Gazpacho',675,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'Ensalada de arroz y guacamole',300,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'Pizza Vegana',350,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'Arroz frito con verduras',500,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Sopa de miso',300,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Berenjenas con salsa de tomate',250,'Ruta a imagen',228726637740)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Humus',100,'Ruta a imagen',228726637740)
go  

--Ta dura la verdura
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (1,'Ensalada de espinacas y tofu',450,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (2,'Ensalada de peras glaseadas',300,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (3,'Hamburguesa de lentejas',580,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (4,'Gazpacho',675,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (5,'Ensalada de arroz y guacamole',300,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (6,'Pizza Vegana',350,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (7,'Arroz frito con verduras',500,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (8,'Sopa de miso',300,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (9,'Berenjenas con salsa de tomate',250,'Ruta a imagen',379838837730)
insert into Platos (IDplato,Nomb_Plato,Precio,Imagen,_RUT) values (10,'Humus',100,'Ruta a imagen',379838837730)
go  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Usuarios

insert into Usuarios (NombreUsuario,NombreCompleto,Contraseña,Documento) values ('Admin1','Mathías Banega','1',52113811)
insert into Usuarios (NombreUsuario,NombreCompleto,Contraseña,Documento) values ('Cliente1','José Perez','1',53845466)
insert into Usuarios (NombreUsuario,NombreCompleto,Contraseña,Documento) values ('Admin2','Diego Martinez','2',12345678)
insert into Usuarios (NombreUsuario,NombreCompleto,Contraseña,Documento) values ('Cliente2','Juan Perez','2',39456123)
go

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Clientes

insert into Clientes(Tarjeta,Direccion,Documento) values (1234567891234567,'Calle 1234',53845466)
insert into Clientes(Tarjeta,Direccion,Documento) values (7456123001471256,'Calle 1234',39456123)
go

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Administradores
insert into Administradores(cargo,Documento)values ('Empleado',52113811)
insert into Administradores(cargo,Documento)values ('Empleado',12345678)
go
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Pedidos

insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',5,1,10,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',2,1,3,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',1,0,1,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',1,1,5,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',2,1,7,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',5,1,9,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',1,1,10,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',2,1,7,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',3,0,10,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',1,0,2,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',5,1,10,179828837700,39456123)
insert into Pedidos(Fecha,Cantidad,Entregado,_IDplato,RUT_Casa,Documento)values('20171001',1,1,1,179828837700,39456123)
go

select * from Pedidos
select * from platos
select * from Clientes
select * from Administradores
select * from Usuarios
select * from Casas