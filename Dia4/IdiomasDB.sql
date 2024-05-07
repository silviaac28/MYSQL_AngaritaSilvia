-- CREAR BASE DE DATOS 
CREATE database paises;

-- SELECCIONAR BASE DE DATOS 
USE paises;

-- CREAR TABLA IDIOMA
create table idioma(
id_idioma int not null,
primary key(id_idioma),
idioma varchar(50)
)

-- CREAR TABLA PAIS
create table pais(
id_pais int not null,
primary key(id_pais),
nombre varchar(20),
continente varchar(50),
poblacion int
)

-- CREAR TABLA CIUDAD
create table ciudad(
id_ciudad int not null,
primary key(id_ciudad),
nombre varchar(50),
id_pais int,
foreign key(id_pais) references pais(id_pais)
)

-- CREAR TABLA IDIOMA-PAIS
create table idioma_pais(
id_idioma int,
foreign key(id_idioma) references idioma(id_idioma),
id_pais int,
foreign key(id_pais) references pais(id_pais),
es_oficial tinyint(1)
)

-- INSERTAMOS 10 DATOS PARA CADA TABLA

insert  into idioma(id_idioma, idioma) 
values (1, "ingles"), (2, "español"), (3, "frances"), (4, "italiano"), (5, "coreano"), (6, "mandarin"), (7, "japones"), (8, "portugues"),  (9, "ruso"), (10, "aleman");

insert  into pais(id_pais, nombre, continente, poblacion) 
values (1, "España", "Europa", 5000000), (2, "Colombia", "America", 5000000), (3, "China", "Asia", 1400000000), (4, "Alemania", "Europa", 600000000), (5, "Japon", "Asia", 30000000 ), (6, "Corea", "Asia", 45000000), (7, "Brasil", "America", 120000000), (8, "Mexico", "America", 200000000),  (9, "Italia", "Europa", 60000000), (10, "Francia", "Europa", 36000000);

insert  into ciudad(id_ciudad, nombre, id_pais) 
values (1, "Barcelona", 1), (2, "Bucaramanga", 2), (3, "Pekin", 3), (4, "Berlin", 4), (5, "Tokyo", 5), (6, "Seul", 6), (7, "Brasilia", 7), (8, "Ciudad de Mexico", 8), (9, "Milan", 9), (10, "Paris", 10);

insert  into idioma_pais(id_idioma, id_pais, es_oficial) 
values (1, 1, 0), (2, 10, 0), (3, 2, 0), (4, 3, 0), (5, 6, 1), (6, 4, 0), (7, 5, 1), (8, 7, 1), (9, 8, 0), (10, 9, 0);

-- consulta tipo inner join para obtener las ciudades que estàn asignadas a un paìs

select pais.nombre as nombrePais, ciudad.nombre as nombreCiudad
from pais inner join ciudad 
on pais.id_pais = ciudad.id_pais;

-- consulta tipo left join para obtener 
select pais.nombre as nombrePais, ciudad.nombre as nombreCiudad
from pais left join ciudad 
on pais.id_pais = ciudad.id_pais;

insert  into pais(id_pais, nombre, continente, poblacion) 
values (11, "India", "Asia", 500000000);

select pais.nombre as nombrePais, ciudad.nombre as nombreCiudad
from pais cross join ciudad 





