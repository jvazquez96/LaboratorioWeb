CREATE DATABASE Proyecto;
USE Proyecto;
CREATE TABLE Horario (
	Frequencia VARCHAR(100) NOT NULL,
	PRIMARY KEY (Frequencia)
);

CREATE TABLE Materia (
	Clave VARCHAR(100) NOT NULL,
	Nombre VARCHAR(100),
	HoraLaboratorio VARCHAR(100) NOT NULL,
	PRIMARY KEY (Clave),
	FOREIGN KEY (HoraLaboratorio) REFERENCES Horario(Frequencia)
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
	Telefono INT NOT NULL,
	CorreoElectronico VARCHAR(100),
	CursosProgramados INT NOT NULL,
	PRIMARY KEY (Nomina)
);

CREATE TABLE Curso (
	Clave VARCHAR(100) NOT NULL,
	NumeroDeGrupo INT NOT NULL,
	Horario VARCHAR(100) NOT NULL,
	HorarioLaboratorio VARCHAR(100) NOT NULL,
	Salon VARCHAR(100) NOT NULL,
	Ingles INT NOT NULL,
	Honors INT NOT NULL,
	PRIMARY KEY (Clave),
	FOREIGN KEY (Horario) REFERENCES Horario(Frequencia),
	FOREIGN KEY (HorarioLaboratorio) REFERENCES Horario(Frequencia),
	FOREIGN KEY (Salon) REFERENCES Salon(Numero)
);

CREATE TABLE Ensena (
	Nomina VARCHAR(100) NOT NULL,
	Clave VARCHAR(100) NOT NULL,
	Responsabilidad INT NOT NULL,
	PRIMARY KEY (Nomina, Clave),
	FOREIGN KEY (Nomina) REFERENCES Maestro(Nomina),
	FOREIGN KEY (Clave) REFERENCES Curso(Clave)
);

