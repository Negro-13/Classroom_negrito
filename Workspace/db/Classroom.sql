CREATE DATABASE IF NOT EXISTS Classroom;

USE DATABASE Classroom;

#Tablas
CREATE TABLE Alumnos(
    DNI INT(8) PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Curso VARCHAR(5),
    Mail VARCHAR(20),
    Telefono INT(15)
);

CREATE TABLE Profesores (
    DNI INT(8) PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Legajo VARCHAR(20),
    Mail VARCHAR(20),
    Telefono INT(15)
);

CREATE TABLE Usuarios (
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Mail VARCHAR(20) PRIMARY KEY,
    Telefono INT(15),
    Contraseña VARCHAR(50),
);

CREATE TABLE Materias_alumno(
    FOREIGN KEY Cod_materia REFERENCES Clases
    FOREIGN KEY docente_acargo REFERENCES Profesores(DNI)
);

CREATE TABLE Clases(
    Cod_materia VARCHAR(25) PRIMARY KEY,
    Nombre_materia VARCHAR(50),
    FOREIGN KEY docente_acargo REFERENCES Profesores(DNI)
);
