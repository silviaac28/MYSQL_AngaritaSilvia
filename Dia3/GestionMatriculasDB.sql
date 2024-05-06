create database GestionMatriculasDB;
use GestionMatriculasDB;

create table Departamento(
Id_departamento INT PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL
)

create table Grado(
Id_grado INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL
)

create table Curso_escolar(
Id_curso_escolar INT PRIMARY KEY,
anyo_inicio YEAR NOT null,
anyo_fin YEAR NOT null
)

create table persona(
id INT PRIMARY KEY,
nif VARCHAR(9),
nombre VARCHAR(25) not null,
apellido1 VARCHAR(50) not null,
apellido2 VARCHAR(50),
ciudad VARCHAR(25) not null,
direccion VARCHAR(50) not null,
telefono VARCHAR(9),
fecha_nacimiento DATE not null,
sexo ENUM('H','M') not null,
tipo ENUM('1', '2', '3') not null
)

create table profesor(
Id_profesor INT,
foreign key(Id_profesor) references persona(id), 
Id_departamento INT,
foreign key(Id_departamento) references Departamento(Id_departamento)
)

create table asignatura(
id INT PRIMARY KEY,
nombre VARCHAR(100) not null,
creditos FLOAT not null,
tipo ENUM('1','2', '3') not null,
curso TINYINT not null,
cuatrimestre TINYINT not null,
Id_profesor INT,
foreign key(Id_profesor) references profesor(Id_profesor),
Id_grado INT,
foreign key(Id_grado) references Grado(Id_grado)
)

create table alumno_se_matricula_asignatura(
Id_alumno INT,
foreign key(Id_alumno) references persona(id),
Id_asignatura INT,
foreign key(Id_asignatura) references asignatura(id),
Id_curso_escolar INT,
foreign key(Id_curso_escolar) references Curso_escolar(Id_curso_escolar)
)


