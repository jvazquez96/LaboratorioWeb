-- Si no tienen la base de datos creada corran descomenten las siguientes lineas.
DROP DATABASE Proyecto;
CREATE DATABASE Proyecto;
USE Proyecto;
CREATE TABLE Horario (
	Frequencia VARCHAR(100) NOT NULL,
	PRIMARY KEY (Frequencia)
);

CREATE TABLE Materia (
	Clave VARCHAR(100) NOT NULL,
	Nombre VARCHAR(100),
	HorasLaboratorio INT,
	PRIMARY KEY (Clave)
);

CREATE TABLE Salon (
	Numero VARCHAR(100) NOT NULL,
	Capacidad INT NOT NULL,
	Administrador VARCHAR(100) NOT NULL,
	PRIMARY KEY (Numero)
);

CREATE TABLE Maestro (
	Nomina VARCHAR(100) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	Telefono VARCHAR(100),
	CorreoElectronico VARCHAR(100),
	CursosProgramados INT NOT NULL,
	PRIMARY KEY (Nomina)
);

CREATE TABLE Curso (
	Clave VARCHAR(100) NOT NULL,
	NumeroDeGrupo INT NOT NULL,
	Horario VARCHAR(100) NOT NULL,
	HorarioLaboratorio VARCHAR(100),
	Salon VARCHAR(100) NOT NULL,
	Ingles INT NOT NULL,
	Honors INT NOT NULL,
	PRIMARY KEY (Clave, NumeroDeGrupo),
	FOREIGN KEY (Clave) REFERENCES Materia (Clave) ON DELETE CASCADE,
	FOREIGN KEY (Horario) REFERENCES Horario(Frequencia) ON DELETE CASCADE,
	FOREIGN KEY (HorarioLaboratorio) REFERENCES Horario(Frequencia) ON DELETE CASCADE,
	FOREIGN KEY (Salon) REFERENCES Salon(Numero) ON DELETE CASCADE
);

CREATE TABLE Ensena (
	Nomina VARCHAR(100) NOT NULL,
	Clave VARCHAR(100) NOT NULL,
	NumeroDeGrupo INT NOT NULL,
	Responsabilidad INT NOT NULL,
	PRIMARY KEY (Nomina, Clave, NumeroDeGrupo),
	FOREIGN KEY (Nomina) REFERENCES Maestro(Nomina) ON DELETE CASCADE,
	FOREIGN KEY (Clave, NumeroDeGrupo) REFERENCES Curso(Clave, NumeroDeGrupo) ON DELETE CASCADE
);

CREATE TABLE Administradores (
	Usuario VARCHAR(100) NOT NULL,
	Password VARCHAR(100) NOT NULL,
	PRIMARY KEY (Usuario)
);

CREATE TRIGGER ActualizaNumeroDeCursos AFTER INSERT ON Ensena
FOR EACH ROW
	UPDATE Maestro
	Set CursosProgramados = CursosProgramados + 1
	WHERE Nomina = NEW.Nomina;


INSERT INTO Maestro (Nomina, Nombre, Telefono, CorreoElectronico, CursosProgramados)
VALUES ("L12345678", "Angela Aranda", 123997472, "angela@hotmail.com", 0);
INSERT INTO Maestro (Nomina, Nombre, Telefono, CorreoElectronico, CursosProgramados)
VALUES ("L98765432", "Julia Limon", 74682972, "julia@hotmail.com", 0);
INSERT INTO Maestro (Nomina, Nombre, Telefono, CorreoElectronico, CursosProgramados)
VALUES ("L57451829", "Juan Herrera", 23457289, "juan@hotmail.com", 0);
INSERT INTO Maestro (Nomina, Nombre, Telefono, CorreoElectronico, CursosProgramados)
VALUES ("L00251587", "Manuel Ortiz", 23457289, "manuel.ortiz@yahoo.com", 0);
INSERT INTO Horario (Frequencia)
VALUES ("7/3 LuJu");
INSERT INTO Horario (Frequencia)
VALUES ("8+/3 MaVi");
INSERT INTO Horario (Frequencia)
VALUES ("10/3 MaVi");
INSERT INTO Horario (Frequencia)
VALUES ("7/3 MaVi");
INSERT INTO Horario (Frequencia)
VALUES ("18/6 Ju");
INSERT INTO Horario (Frequencia)
VALUES ("16/3 LuJu");
INSERT INTO Horario (Frequencia)
VALUES ("14+/3 MaVi");
INSERT INTO Horario (Frequencia)
VALUES ("13/3 MaVi");
INSERT INTO Horario (Frequencia)
VALUES ("10/3 LuJu");
INSERT INTO Horario (Frequencia)
VALUES ("16/3 MaVi");
INSERT INTO Horario (Frequencia)
VALUES ("14/3 LuJu");
INSERT INTO Horario (Frequencia)
VALUES ("13/3 LuJu");
INSERT INTO Horario (Frequencia)
VALUES ("18/6 Lu");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A3-301", 38, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A3-312", 30, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A3-303", 30, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A3-302", 35, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("CEDDIE-S2", 12, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A3-304", 25, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A4-104", 20, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A4-415", 20, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A7-205", 35, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A1-111", 20, "Escolar");
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC3001", "Intro a la programacion", 0);
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC3002", "Seguridad informatica", 1);
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC1021", "Proyecto desarrollo de videojuegos", 1);
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC3045", "Calidad y Pruebas de Software I", 1);
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC3046", "Calidad y Pruebas de Software II", 1);
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC3098", "Proyecto de desarrollo CMMI 5 y PSP 3.0", 1);
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC1020", "Bases de datos", 1);
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC3020", "Evaluacion y Administracion de Proyectos de Software", 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3001", 1, "7/3 LuJu", NULL, "A3-301", 1, 0);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3002", 1, "8+/3 MaVi", "10/3 MaVi", "A3-302", 1, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3002", 2, "16/3 LuJu", "14/3 LuJu", "A3-302", 1, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3002", 3, "10/3 MaVi", "13/3 MaVi", "A1-111", 1, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC1021", 1, "7/3 LuJu", NULL, "A3-301", 1, 0);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC1021", 2, "13/3 MaVi", NULL, "A3-301", 1, 0);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3045", 1, "13/3 LuJu", NULL, "A3-312", 0, 0);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3046", 1, "8+/3 MaVi", NULL, "A3-303", 1, 0);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3098", 1, "14+/3 MaVi", NULL, "A3-303", 0, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3098", 2, "18/6 Lu", NULL, "A3-303", 0, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3098", 3, "18/6 Ju", NULL, "A3-304", 0, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3098", 4, "10/3 LuJu", NULL, "A3-304", 0, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3020", 1, "16/3 LuJu", NULL, "A3-304", 0, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3020", 2, "10/3 MaVi", NULL, "A4-104", 0, 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3020", 3, "13/3 MaVi", NULL, "A7-205", 0, 0);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC1020", 1, "18/6 Lu", NULL, "CEDDIE-S2", 0, 0);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L12345678", "TC3001", 1, 100);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L98765432", "TC3002", 1, 50);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L57451829", "TC3002", 2, 50);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L00251587", "TC3045", 1, 50);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L00251587", "TC3046", 1, 50);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L00251587", "TC3098", 1, 50);
INSERT INTO Administradores (Usuario, Password)
VALUES ("Jorge", "Vazquez");
INSERT INTO Administradores (Usuario, Password)
VALUES ("Miguel", "Banda");

-- Cursos impartidos por un profesor
SELECT Clave, NumeroDeGrupo, Horario, Salon, Ingles, Honors
FROM Ensena NATURAL JOIN Curso
WHERE Nomina = "NOMINA_PROFESOR"; -- NOMINA_PROFESOR viene desde la pagina web

-- Lista de grupos de una materia
SELECT Curso.Clave, NumeroDeGrupo, Horario, Salon, Ingles, Honors
FROM Curso, Materia
Where Curso.Clave = Materia.Clave AND Curso.Clave = "CLAVE_CURSO"; -- CLAVE_CURSO viene desde la pagina web

-- Lista de salones disponibles en un determinado horario oficial.
SELECT DISTINCT Numero, Capacidad, Administrador
FROM Salon LEFT JOIN Curso ON Salon.Numero = Curso.Salon
WHERE Horario IS NULL OR Horario != '7/3 LuJu'; -- HORARIO_BUSCADO es el horario que recibe desde la pagina web

-- Cambiar profesor de un determinado grupo
UPDATE Ensena
SET Nomina = "NOMINA" -- NOMINA del profesor nuevo, viene de la pagina web
WHERE Clave = "CLAVE" -- CLAVE de materia a editar, viene de la pagina web
AND NumeroDeGrupo = 1; -- Numero de grupo lo obtiene de la pagina web

-- Salones de CS disponibles en cierto horario
SELECT *
FROM salon s
WHERE Numero NOT IN( -- Obtiene todos los salones ocupados a cierta hora --
	SELECT Numero
	FROM salon s, curso c
	WHERE s.Numero = c.Salon AND Horario = 'HORARIO'
	) AND Administrador = 'CS'; -- La condición es que no esté ocupado y sea administrado por CS --

-- Cambiar el salon de un curso -- (Para cambiar dos salones ejecutarlo dos veces)
UPDATE curso
SET Salon = 'SALON'
WHERE Clave = 'CLAVE';

-- Maestros que tienen clase en determinado horario --
SELECT *
FROM maestro m, ensena e, curso c
WHERE m.Nomina = e.Nomina AND c.Clave = e.Clave AND Horario = 'HORARIO';

-- Obtiene los cursos que se imparten en determinado día y determinado salón --
SELECT *
FROM curso
WHERE Horario = 'HORARIO' AND Salon = 'SALON';

