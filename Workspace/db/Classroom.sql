CREATE DATABASE IF NOT EXISTS Classroom;
USE Classroom;

CREATE TABLE Profesores (
    DNI INT(8) PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Mail VARCHAR(20),
    Telefono INT(15),
    Contraseña VARCHAR(50)
);

CREATE TABLE Clases (
    Cod_materia VARCHAR(25) PRIMARY KEY,
    Nombre_materia VARCHAR(50),
    docente_acargo CHAR(8),
    FOREIGN KEY (docente_acargo) REFERENCES Profesores(DNI)
);

CREATE TABLE Alumnos (
    DNI CHAR(8) PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Curso VARCHAR(5),
    Mail VARCHAR(50),
    Telefono VARCHAR(15),
    Contraseña VARCHAR(50)
);

CREATE TABLE Usuarios (
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Mail VARCHAR(50) PRIMARY KEY,
    Telefono VARCHAR(15),
    Contraseña VARCHAR(50)
);

CREATE TABLE Materias_alumno (
    Cod_materia VARCHAR(25),
    alumno_dni CHAR(8),
    FOREIGN KEY (Cod_materia) REFERENCES Clases(Cod_materia),
    FOREIGN KEY (alumno_dni) REFERENCES Alumnos(DNI),
    PRIMARY KEY (Cod_materia, alumno_dni)
);
