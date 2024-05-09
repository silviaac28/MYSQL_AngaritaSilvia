create database Dia6;
use Dia6;

-- ##############################
-- ###### EJERCICIO DIA 6  ######
-- ##############################

-- TITULO : NORMALIZACIÓN DE BASE DE DATOS
-- ¿Qué es Normalizar?: Reducir las posibles redundancias de datos y
-- con ello mejorar la integridad de los datos.

-- Pasos principales para la normalización
-- Primera Forma Normal (1NF) "Reducir"
-- Segunda Forma Normal (2NF) "Redundancia"
-- Tercera Forma Normal (3NF) "Independencia"

-- ########### Primera Forma Normal (1NF) ###########
-- En la 1NF se busca eliminar las repeticiones de datos y asegurar con ello que cada columna
-- contenga un solo valor atómico ó 'individisibles' (Dato que no se puede dividir, sea por conveniencia o por
-- especificación del lenguaje)

-- Ej: nombreCompleto= PEDRO FELIPE GOMEZ BONILLA --> ¿Es atómico?
-- RTA: No, por que se puede dividir en nombres y apellidos

-- Ej2: nombre=Pedro Felipe,apellido=Gomez Bonilla --> ¿Es atómico?
-- RTA: Depende del diseñador de base de datos, pues es un criterio muy subjetivo

-- EX1: ¿El siguiente query está normalizado de acuerdo al 1NF?

create table Estudiante(
    ID int,
    Nombre varchar(100),
    Telefono varchar(15)
);

-- RTA : No,por que el usuario está ingresando el nombre completo. Aún asi,si el diseñador lo
-- ve pertinente por los requisitos empresariales, lo puede dejar así.

-- ¿Cómo podemos normalizarla, ya habiendo creado la tabla anteriormente?
alter table Estudiante
    add Apellido varchar(100);

-- Prueba de agregación de datos
show tables;
select * from Estudiante;
-- Revisar columnas creadas con su tipología de dato
show columns from Estudiante;

-- Manera #2 de mostrar información de la tabla
describe Estudiante;
insert into Estudiante(ID,Nombre,Apellido,Telefono) values(1,'Pedro','Gomez','3023019865');

-- Alterar la tabla existente
alter table Estudiante add Edad varchar(2) not null;
drop table Estudiante;

-- Ejercicio Clase : Creación de la tabla de curso como se encuentra actualmente
create table curso(
    ID_Curso int,
    Nombre_Curso varchar(50),
    Estudiantes_Inscritos varchar(50)
);
-- Se insertaron los datos de acuerdo a la imagen dada

INSERT INTO curso VALUES
        (101,'Matematicas','Ana, Juan, Maria'),
        (102,'Historia','Pedro, Luis, Ana, Carmen'),
        (103,'Fisica','Juan, Carmen, Beatriz');


select * from curso;
-- Alteración de la tabla en base a la 1NF, donde se cambia la columna "Estudiantes_Inscritos" a
-- "Estudiante", con el fin de aplicar la atomicidad de la columna
drop table curso;
truncate curso;

alter table curso
rename column Estudiantes_Inscritos to Estudiante;
-- De ahí insertar los nuevos datos individuales para llegar a una integridad de los datos
-- insertados.
INSERT INTO curso values
    (101,'Matematicas','Ana'),
    (101,'Matematicas','Juan'),
    (101,'Matematicas','Maria'),
    (102,'Historia','Pedro'),
    (102,'Historia','Luis'),
    (102,'Historia','Ana'),
    (102,'Historia','Carmen'),
    (103,'Fisica','Juan'),
    (103,'Fisica','Carmen'),
    (103,'Fisica','Beatriz');

-- ########### Segunda Forma Normal (2NF) ###########
-- Es cuando una tabla está en la forma 1NF, donde cada atributo que no forma parte de la
-- clave primaria es COMPLETAMENTE DEPENDIENTE de la clave primaria.

-- Dicha 2NF se aplica a las tablas que tienen claves primarias compuestas de dos o más atributos, donde
-- si una tabla está en 1FN y su clave primaria es simple (Tiene un solo atributo), entonces también está en
-- su 2NF.

-- Lo que busca hacer la 2NF es que cada atributo no clave en una tabla deba depender completamente
-- de la clave primaria de esa tabla, mas no ser una parte de ella.

-- Requisito: Estar en la 1NF donde todos los atributos no claves deban depender totalmente de la clave primaria
-- En otras palabras, el nombre del curso es dependiente del id de este mismo, pero están juntan. Dicho esto, debemos
-- buscar una manera de INDEPENDIZAR dichos datos

drop table curso;

create table curso(
    ID_Estudiante varchar(3),
    Nombre_Estudiante varchar(50),
    ID_Curso varchar(4),
    Nombre_Curso varchar(50),
    Nombre_Profesor varchar(50)
);

select * from curso;

INSERT INTO curso values
    ('E01','Ana','C101','Matematicas', 'Sr. Garcia' ),
    ('E02','Juan','C102','Historia', 'Sra. Lopez' ),
    ('E03','Maria','C101','Matematicas', 'Sr. Garcia' ),
    ('E04','Pedro','C103','Fisica', 'Sr. Hernandez' );

-- EJERCICIO CASA: CREAR LA 2NF DE ACUERDO A LAS INDICACIONES DADAS EN CLASE


CREATE table Estudiante(
ID_Estudiante varchar(10),
Nombre_Estudiante varchar(100)
);

CREATE table Curso(
Nombre_Curso varchar(100),
ID_Curso varchar(10),
Nombre_Profesor varchar(100)
);

CREATE table EstudianteCurso(
ID_Estudiante varchar(10),
ID_Curso varchar(10)
);

insert into Estudiante 
values ('E01','Ana'),
 ('E02','Juan'), 
 ('E03','Maria'), 
 ('E04','Pedro');

insert into Curso 
values ('Matematicas','C101', 'Sr. Garcia'),
('Historia', 'C102', 'Sra. Lopez'), 
('Fisica', 'C103','Sr. Hernandez' );

insert into EstudianteCurso
values('E01','C101' ),
    ('E02','C102'),
    ('E03','C101' ),
    ('E04','C103' );
