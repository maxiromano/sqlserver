--TRABAJO PRÁCTICO Nº 2
--MAXIMILIANO ROMANO - FRANCO BRATTOLI
--COMISION 1 - BASE DE DATOS SPEEDY GONZALEZ



create database SpeedyGonzalez;
use SpeedyGonzalez;

CREATE TABLE Ciudad (
IDCiudad INT PRIMARY KEY IDENTITY,
Nombre VARCHAR(50)
);

CREATE TABLE Provincia (
    IDProvincia INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50) UNIQUE
);

CREATE TABLE TipoRemolque (
    IDTipoRemolque INT IDENTITY,
    Nombre VARCHAR(50) UNIQUE,
	PRIMARY KEY (IDTipoRemolque)
);

INSERT INTO Provincia (Nombre)
VALUES
    ('Buenos Aires'),
    ('Córdoba'),
    ('Santa Fe'),
    ('Mendoza'),
    ('Tucumán'),
    ('Salta'),
    ('Entre Ríos'),
    ('Jujuy');

-- Insertar datos de ciudades
INSERT INTO Ciudad (Nombre)
VALUES
    ('Ciudad de Buenos Aires'),
    ('Córdoba'),
    ('Rosario'),
    ('Mendoza'),
    ('Santa Fe'),
    ('Salta'),
    ('Paraná'),
    ('San Salvador de Jujuy');

INSERT INTO TipoRemolque (Nombre)
VALUES
    ('Remolque Tipo A'),
    ('Remolque Tipo B'),
    ('Remolque Tipo C'),
    ('Remolque Tipo D');

-----------------------------------CAMIONES----------------------------------------------------------
---------------------------------------------------------------------------------------------------


--CREAMOS NUEVA ENTIDAD PARA REPRESENTAR MARCA DE CAMIONES Y EVITAR REPETICION DE DATOS
CREATE TABLE marcaCamiones (
idMarca int identity,
nombreMarca varchar (50),
PRIMARY KEY (idMarca)
)

insert into marcaCamiones
values
('Volvo'),
('Mercedes'),
('Scania'),
('MAN'),
('Kenworth'),
('Freightliner'),
('Iveco'),
('Renault');


---------------------------------------------------------

--CREAMOS NUEVA ENTIDAD PARA REPRESENTAR MODELOS DE CAMIONES Y EVITAR REPETICION DE DATOS

CREATE TABLE modeloCamiones (
idModelo int identity,
nombreModelo varchar (50),
PRIMARY KEY (idModelo)
)




insert into modeloCamiones
values
('VNL'),
('Actros'),
('R500'),
('TGX'),
('W900'),
('Cascadia'),
('Stralis'),
('T');





create table camiones 
(id_camion int IDENTITY, 
patente varchar(20) UNIQUE, 
marca int, 
modelo int,
anio int,  
IDTipoRemolque INT,
PRIMARY KEY (id_camion),
FOREIGN KEY (IDTipoRemolque) REFERENCES TipoRemolque(IDTipoRemolque),
FOREIGN KEY (marca) REFERENCES marcaCamiones(idMarca),
FOREIGN KEY (modelo) REFERENCES modeloCamiones(idModelo)
);

INSERT INTO camiones (patente, marca, modelo, anio, IDTipoRemolque) 
VALUES
    ('AB123CD', 1, 1, 2020, 1),
    ('XY567Z', 2, 2, 2019, 3),
    ('GH890IJ', 3, 3, 2018, 4),
    ('KL432MN', 4, 4, 2021, 2),
    ('OP654QR', 5, 5, 2017, 1),
    ('ST789UV', 6, 6, 2020, 4),
	('PL888KJ', 7, 7, 2022, 1),
    ('MN333AB', 8, 8, 2018, 3)

	select * from camiones
	
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-----------------------------------CHOFERES---------------------------------------------------------
create table choferes 
(id_chofer int IDENTITY, 
dni varchar(20) unique, 
nombre varchar(20), 
apellido varchar(20), 
direccion varchar(50),
telefono_fijo varchar(40), 
telefono_celular varchar(40), 
edad int, 
email varchar(30), 
codigo_registro varchar(50) unique,
PRIMARY KEY (id_chofer));

INSERT INTO choferes (dni, nombre, apellido, direccion, telefono_fijo, telefono_celular, edad, email, codigo_registro)
VALUES
	('32445262', 'Manuel', 'Saavedra', 'Felipe Moré 1109', '4484422', '3416221221', 36, 'manusaavedra@gmail.com', 'REG302'),
    ('24756718', 'Juan', 'Gonzalez', 'Saavedra 2765', '4456472', '3412474652', 44, 'jgonzales12@gmail.com', 'REG123'),
    ('19827774', 'María', 'López', 'Monte Flores 5645', '4362471', '3415746428', 53, 'mlopez51@gmail.com', 'REG456'),
    ('33001923', 'Carlos', 'Martinez', 'Rondeau 1814', '4125647', '3412182662', 34, 'cmartinez28@hotmail.com', 'REG789'),
    ('19829871', 'Laura', 'Rodríguez', 'Nuestra Sra. del Rosario 3055', '4564726', '3416758221', 51, 'lrodrigez20@hotmail.com', 'REG101'),
    ('15817268', 'Roberto', 'Gómez', 'Venezuela 6435', '4276278', '3414625161', 62, 'rgomez23@gmail.com', 'REG112'),
    ('40391827', 'Ana', 'Pérez', 'Colombres 920', '4276271', '3412736227', 27, 'aperez65@gmail.com', 'REG131'),
    ('24281761', 'Diego', 'Hernández', 'Pellegrini 6045', '4256472', '3415744462', 43, 'dhernandez30@gmail.com', 'REG415'),
    ('18727165', 'Sofía', 'Díaz', 'Godoy Cruz 2453', '4564726', '3415755742',51 , 'sdiaz27@gmail.com', 'REG516'),
    ('39482719', 'Pedro', 'Ramírez', 'Vera Mujica 3543', '4445261', '3414472622', 27, 'pramirez19@gmail.com', 'REG617'),
    ('37073249', 'Franco', 'Brattoli', 'Santa Fe 3163', '4241138', '3416493925', 30, 'fbratt29@hotmail.com', 'AOZ718');

select * from choferes
	
----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------


-----------------------------------CAMIONES CHOFERES--------------------------------------------------
create table camiones_choferes
(id_chofer_camion int IDENTITY,
id_chofer int,
id_camion int,
PRIMARY KEY (id_chofer_camion),
FOREIGN KEY (id_chofer) references choferes(id_chofer),
FOREIGN KEY (id_camion) references camiones(id_camion));

insert into camiones_choferes (id_camion,id_chofer)
values 
(2,4),
(3,5);



select * from camiones_choferes;
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------------
--------------------------------------CLIENTES---------------------------------------------------------
create table cliente 
(id_cliente int IDENTITY, 
cod_cliente varchar(20) unique, 
nombre varchar(50), 
apellido varchar(50), 
razon_social varchar(20) null, 
dni int, 
cuit varchar(15) null, 
direccion varchar(50), 
telefono varchar(50), 
email varchar(50)
PRIMARY KEY(id_cliente));


--EJERCICIO 2. MODIFICAMOS TABLA PARA AGREGAR RESTRICCIONES VIA CHECK CONSTRAINT
alter table cliente 
add CONSTRAINT CHK_EsPersonaFisica CHECK (
        (nombre IS NOT NULL AND apellido IS NOT NULL AND dni IS NOT NULL AND razon_social IS NULL AND cuit IS NULL) OR
        (nombre IS NULL AND apellido IS NULL AND dni IS NULL AND razon_social IS NOT NULL AND cuit IS NOT NULL))

select * from cliente



-- Insertar clientes personas físicas
INSERT INTO cliente (cod_cliente, nombre, apellido, dni, direccion, telefono, email)
VALUES
    ('P001', 'Eduardo', 'Sacheri', 23492818, 'Talcahuano 114', '011548451', 'eduardos21@email.com'),
    ('P002', 'Mariela', 'Tonso', 22381779, 'Charcas 4548', '011484574', 'mtonso12@email.com'),
	('P003', 'Carla', 'Conde', 30928882, 'Cordoba 3342', '3415445010', 'carlaco93@email.com'),
	('P004', 'Susana', 'Gimenez', 9887827, 'Segurola 876', '011411274', 'sg212@email.com'),
	('P005', 'Gabriela', 'Sabbatini', 19282227, 'Avenida del Huerto 1112', '011451221', 'gsabbatini10@email.com'),
	('P006', 'Oscar', 'Romero', 38292228, 'Centeno 2271', '3415544174', 'oscaromero00@email.com'),
	('P007', 'Juan Pablo', 'Martinez', 31222827, 'Avenida Lugones 3143', '011554214', 'jpmarti_00@email.com'),
	('P008', 'Victor Hugo', 'Morales', 10922282, 'Jose C. Paz 2561', '3414421474', 'vhmoraleja@email.com'),
	('P009', 'Sandra', 'Ferreira', 26226271, 'Liniers 1021', '3412272800', 'sferreira4@email.com'),
	('P010', 'Maximiliano', 'Romano', 42228664, 'Marruecos 4991', '3428277281', 'romanomaxi121@email.com')
    

-- Insertar clientes empresas
INSERT INTO cliente (cod_cliente, razon_social, CUIT, direccion, telefono, email)
VALUES
    ('E001', 'El Palacio', '20335541214', 'Rio Negro 5050', '3416445471', 'transporte@gdlogistica.com'),
	('E002', 'Anacleta Bebes', '24127885311', 'Italia 418', '3414241138', 'anacletabebes@hotmail.com'),
	('E003', 'Estudios America', '20175422140', 'España 131', '0114512450', 'logisticaestudio@america.com'),
	('E004', 'Centolla SRL', '20124555470', 'Tierra del Fuego 29', '053554685', 'envioscentolla@hotmail.com'),
	('E005', 'Vip Mastress', '24181124251', 'La Plata 1109', '3345644521', 'envio_colchones@hotmail.com'),
	('E006', 'El Boulevard', '24405569951', 'Chajari 334', '3345446200', 'enviospanificados@elboulevard.com'),
	('E007', 'Maderas Amiano', '20191120010', 'San Juan 2601', '3415221210', 'trasnporte@amiano.com'),
	('E008', 'AFIP Aduana','2012412450', 'Tucuman 1807', '3415452135', 'seamro@afip.com.ar'),
	('E009', 'Sidersa', '2012445121', 'Tucuman 330', '3314542112', 'envios@sidersa.com.ar');


select * from cliente

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------
----------------------------------------VIAJES/ENVIOS-------------------------------------------------
create table viajes 
(id_viaje int IDENTITY, 
codigo_viaje varchar(20) unique, 
direccion_origen varchar(50), 
IDProvinciaDestino INT, 
IDCiudadDestino INT,
direccion_destino varchar(50), 
IDProvinciaOrigen INT, 
IDCiudadOrigen INT,
km_recorridos int, 
id_cliente int, 
id_camion_asignado int, 
id_chofer_asignado int,
fecha_salida_estimada date, fecha_llegada_estimada date, 
fecha_salida_real date, fecha_llegada_real date,
FOREIGN KEY (id_cliente) references cliente(id_cliente),
FOREIGN KEY (id_camion_asignado) references camiones(id_camion),
FOREIGN KEY (id_chofer_asignado) references choferes(id_chofer),
FOREIGN KEY (IDProvinciaDestino) REFERENCES Provincia(IDProvincia),
FOREIGN KEY (IDCiudadDestino) REFERENCES Ciudad(IDCiudad),
FOREIGN KEY (IDProvinciaOrigen) REFERENCES Provincia(IDProvincia),
FOREIGN KEY (IDCiudadOrigen) REFERENCES Ciudad(IDCiudad),
UNIQUE (id_cliente, id_camion_asignado, id_chofer_asignado, fecha_salida_estimada));

INSERT INTO viajes (codigo_viaje, direccion_origen, IDCiudadOrigen, IDProvinciaOrigen, direccion_destino,
IDCiudadDestino, IDProvinciaDestino, km_recorridos, id_cliente, id_camion_asignado, id_chofer_asignado,
fecha_salida_estimada, fecha_llegada_estimada, fecha_salida_real, fecha_llegada_real)
VALUES
    ('VIA001', 'Calle Destino 1', 1, 1, 'Calle Origen 1', 1, 2, 150.5, 1, 1, 1, '2023-02-10', '2023-02-11', '2023-02-10', '2023-02-12'),
    ('VIA002', 'Calle Destino 2', 1, 2, 'Calle Origen 2', 1, 3, 200.7, 2, 2, 2, '2023-05-12', '2023-05-13' ,'2023-05-10', '2023-05-11'),
    ('VIA003', 'Calle Destino 3', 2, 3, 'Calle Origen 3', 2, 4, 180.0, 3, 3, 3, '2023-04-14', '2023-04-15','2023-04-10', '2023-04-11'),
    ('VIA004', 'Calle Destino 4', 3, 4, 'Calle Origen 4', 3, 5, 250.3, 4, 4, 4, '2023-06-16', '2023-06-17','2023-06-16', '2023-06-17'),
    ('VIA005', 'Calle Destino 5', 4, 5, 'Calle Origen 5', 4, 2, 300.2, 5, 5, 5, '2023-07-18', '2023-07-19','2023-07-19', '2023-07-20'),
    ('VIA006', 'Calle Destino 6', 5, 1, 'Calle Origen 6', 5, 1, 210.4, 6, 6, 6, '2022-11-20', '2022-11-21','2022-11-10', '2022-11-11'),
    ('VIA007', 'Calle Destino 7', 3, 2, 'Calle Origen 7', 2, 3, 270.1, 7, 7, 7, '2022-11-22', '2022-11-23','2022-11-10', '2022-11-11'),
    ('VIA008', 'Calle Destino 8', 2, 4, 'Calle Origen 8', 1, 2, 180.9, 8, 8, 8, '2022-11-24', '2022-11-25','2022-11-10', '2022-11-11'),
    ('VIA009', 'Calle Destino 9', 4, 5, 'Calle Origen 9', 5, 1, 220.7, 4, 3, 2, '2023-11-26', '2023-11-27','2023-11-10', '2023-11-11'),
    ('VIA010', 'Calle Destino 10', 2, 2, 'Calle Origen 10', 3, 2, 260.3, 1, 1, 1, '2023-11-28', '2023-11-29','2023-11-10', '2023-11-11'),
    ('VIA011', 'Calle Destino 11', 1, 1, 'Calle Origen 11', 1, 2, 330.5, 1, 1, 3, '2023-11-30', '2023-12-01','2023-11-10', '2023-11-11'),
    ('VIA012', 'Calle Destino 12', 1, 3, 'Calle Origen 12', 4, 4, 190.8, 2, 2, 1, '2023-12-02', '2023-12-03','2023-11-10', '2023-11-11'),
    ('VIA013', 'Calle Destino 13', 2, 1, 'Calle Origen 13', 2, 1, 280.6, 3, 3, 1, '2023-12-04', '2023-12-05','2023-11-10', '2023-11-11'),
    ('VIA014', 'Calle Destino 14', 3, 4, 'Calle Origen 14', 3, 5, 240.1, 3, 4, 4, '2023-12-06', '2023-12-07','2023-11-10', '2023-11-11'),
    ('VIA015', 'Calle Destino 15', 4, 2, 'Calle Origen 15', 4, 3, 290.0, 1, 5, 4, '2023-12-08', '2023-12-09','2023-11-10', '2023-11-11');



select * from viajes


------------------------------------------------------------------------

---4) 
---A)   CUÁNTOS VIAJES SE REALIZARON HACIA LA PROVINCIA DE SANTA FE?
SELECT COUNT(*) AS ViajesHaciaSantaFe
FROM viajes
WHERE EXISTS (SELECT dbo.Provincia.IDProvincia from dbo.provincia where dbo.provincia.IDProvincia=dbo.viajes.IDProvinciaDestino and dbo.Provincia.Nombre='Santa FE');
---COMPLETO Y FUNCIONANDO 


-- INDICE Nº 1)
create index idxnombre_provincia on provincia(Nombre)
------------------------------------------------------------------------


---TP 1 - B)   MOSTRAR LOS DATOS QUE CONSIDERE RELEVANTE SOBRE LOS VIAJES REALIZADOS DESDE LA PVCIA DE CORDOBA DURANTE EL 1ER SEMESTRE DEL 2023
SELECT codigo_viaje, km_recorridos, id_cliente, id_camion_asignado, id_chofer_asignado
FROM viajes
WHERE EXISTS (SELECT dbo.Provincia.IDProvincia from dbo.provincia where dbo.provincia.IDProvincia=dbo.viajes.IDProvinciaOrigen and dbo.Provincia.Nombre='Córdoba')
AND fecha_llegada_real >= '2023-01-01' AND fecha_llegada_real < '2023-07-01';
---COMPLETO Y FUNCIONANDO

-- INDICE Nº 2)
create index idxfecha_llegada_real on viajes (fecha_llegada_real)

--------------------------------------------------------------------------


---TP 1 - C)   LISTAR LOS 3 CHOFERES QUE REGISTRARON LA MAYOR CANTIDAD DE KM. RECORRIDOS EN EL 2023,
--- MOSTRANDO SU NOMBRE Y CANTIDAD DE KM. RECORRIDOS EN C/VIAJE
SELECT TOP 3 c.nombre, c.apellido, SUM(ve.km_recorridos) AS KilometrosTotales
FROM Choferes c
JOIN viajes ve ON c.id_chofer = ve.id_chofer_asignado
WHERE YEAR(ve.fecha_salida_real) = 2023
GROUP BY c.nombre, c.apellido
ORDER BY SUM(ve.km_recorridos) DESC;
---COMPLETO Y FUNCIONANDO


-- INDICES Nº 3 y 4)
create index idxChofer_Asignado on viajes (id_chofer_asignado)
create index idxfecha_salida_real on viajes (fecha_salida_real)



---TP1 - D) OBTENER UNA LISTA DE LOS CLIENTES QUE SOLICITARON VIAJES/ENVIOS EN 2023, JUNTO CON LOS NOMBRES DE LOS
---CHOFERES Y LA CANTIDAD DE KM. RECORRIDOS EN C/VIAJE. MOSTRAR LA INFO EN ORDEN DESC DE KM. RECORRIDOS

SELECT c.nombre as NombreCliente, c.apellido as ApellidoCliente, c.razon_social, ch.nombre as NombreChofer, ch.apellido as ApellidoChofer, ve.km_recorridos
FROM cliente c
JOIN viajes ve ON c.id_cliente = ve.id_cliente
JOIN choferes ch ON ve.id_chofer_asignado = ch.id_chofer
WHERE YEAR(ve.fecha_salida_estimada) = 2023
ORDER BY ve.km_recorridos DESC;
---COMPLETO Y FUNCIONANDO


--INDICE Nº 5)
create index ix_fecha_salida_estimada on viajes (fecha_salida_estimada);

go


------------------------------------------------------------------------------------------

--TP 2 . EJERCICIO 4) Diseña  un  Stored  Procedure  llamado  'ActualizarViajeEnvio'  
--que  acepte  parámetros para identificar un viaje/envío a actualizar 
--y el nuevo valor para  la fecha estimada de llegada. 
--Este SP se utilizará para actualizar, de ser necesario, este campo pero solo 
--se debe poder actualizar para viajes que no hayan llegado.

create procedure actualizacionFecha
@viajeParaActualizar int,
@nuevaFechaLlegada date OUTPUT	

as 
update viajes
set fecha_llegada_real = @nuevaFechaLlegada
where id_viaje = @viajeParaActualizar

exec actualizacionFecha 20, '2024-01-01'

go 

-----------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
--TP 2. EJERCICIO 5) 5. Escriba un Stored Procedure llamado 'ObtenerPatenteCamionAsignado’ 
--que acepte como parámetros de entrada el DNI de un chofer y una fecha de consulta 
--y devuelva en dos parámetros independientes:
--a)Un  mensaje  indicando  si  encontró  o  no  al  chofer  y  si  tiene  un  camión asignado en la fecha dada.
--b)La patente del camión asignado al chofer en esa fecha en caso de que se encuentre el mismo.


create procedure ObtenerPatenteCamionAsignado

@dni int,
@fechaConsulta date,
@mensajePositivo varchar (50) output, 
@mensajeNegativo varchar (50) output,
@patente varchar (15) output


as

set @mensajePositivo = 'Chofer y patente encontrados'
set @mensajeNegativo = 'Chofer y patente no encontrados'
set @patente = (select ca.patente from viajes v
join choferes ch on v.id_chofer_asignado = ch.id_chofer
join camiones ca on v.id_camion_asignado = ca.id_camion
where (ch.dni = @dni) and (v.fecha_salida_real = @fechaConsulta ))  

begin 

if exists (select ch.nombre,v.fecha_salida_real,ca.patente from viajes v
join choferes ch on v.id_chofer_asignado = ch.id_chofer
join camiones ca on v.id_camion_asignado = ca.id_camion
where (ch.dni = @dni) and (v.fecha_salida_real = @fechaConsulta )) 
select @mensajePositivo, @patente as patente
else 
select @mensajeNegativo


end

exec ObtenerPatenteCamionAsignado 32445262, '2023-02-10', 'hola', 'hola','hola'

------------------------------------------------------------------------------------------

go




--------------------------------------------------------
--------------------FIN DEL TP--------------------------
--------------------------------------------------------