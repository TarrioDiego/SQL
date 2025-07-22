CREATE DATABASE PlataformaCursos;

USE PlataformaCursos;

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    tipo VARCHAR(20), -- alumno o profesor
);

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES usuarios(id_usuario)
);

CREATE TABLE clases (
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT,
    fecha DATE,
    tema TEXT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


CREATE TABLE inscripciones (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE evaluaciones (
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    id_clase INT,
    id_usuario INT,
    nota DECIMAL(3,1),
    FOREIGN KEY (id_clase) REFERENCES clases(id_clase),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
