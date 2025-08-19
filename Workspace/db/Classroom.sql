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

CREATE TABLE Materias(
    Codigo_materia VARCHAR(25),
    FOREIGN KEY DNI REFERENCES Profesores(DNI)
);