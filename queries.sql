-- Si no tienen la base de datos creada corran descomenten las siguientes lineas.
-- CREATE DATABASE Proyecto;
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
	FOREIGN KEY (Clave) REFERENCES Materia (Clave),
	FOREIGN KEY (Horario) REFERENCES Horario(Frequencia),
	FOREIGN KEY (HorarioLaboratorio) REFERENCES Horario(Frequencia),
	FOREIGN KEY (Salon) REFERENCES Salon(Numero)
);

CREATE TABLE Ensena (
	Nomina VARCHAR(100) NOT NULL,
	Clave VARCHAR(100) NOT NULL,
	NumeroDeGrupo INT NOT NULL,
	Responsabilidad INT NOT NULL,
	PRIMARY KEY (Nomina, Clave, NumeroDeGrupo),
	FOREIGN KEY (Nomina) REFERENCES Maestro(Nomina),
	FOREIGN KEY (Clave, NumeroDeGrupo) REFERENCES Curso(Clave, NumeroDeGrupo)
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
INSERT INTO Horario (Frequencia)
VALUES ("7/3 LuJu");
INSERT INTO Horario (Frequencia)
VALUES ("8+/3 MaVi");
INSERT INTO Horario (Frequencia)
VALUES ("10/3 MaVi");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A3-301", 38, "Escolar");
INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A3-302", 25, "Escolar");
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC3001", "Intro a la programacion", 0);
INSERT INTO Materia (Clave, Nombre, HorasLaboratorio)
VALUES ("TC3002", "Seguridad informatica", 1);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3001", 1, "7/3 LuJu", NULL, "A3-301", 1, 0);
INSERT INTO Curso (Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)
VALUES ("TC3002", 1, "8+/3 MaVi", "10/3 MaVi", "A3-302", 1, 1);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L12345678", "TC3001", 1, 100);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L98765432", "TC3002", 1, 50);
INSERT INTO Ensena (Nomina, Clave, NumeroDeGrupo, Responsabilidad)
VALUES ("L57451829", "TC3002", 1, 50);
INSERT INTO Administradores (Usuario, Password) 
VALUES ("Jorge", "Vazquez");

INSERT INTO Salon (Numero, Capacidad, Administrador)
VALUES ("A3-303", 32, "Escolar");

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

-- 
UPDATE Ensena
SET Nomina = "NOMINA" -- NOMINA del profesor nuevo, viene de la pagina web
WHERE Clave = "CLAVE" -- CLAVE de materia a editar, viene de la pagina web
AND NumeroDeGrupo = 1; -- Numero de grupo lo obtiene de la pagina web