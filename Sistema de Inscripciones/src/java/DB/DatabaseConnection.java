/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Data.Curso;
import Data.Ensena;
import Data.Maestro;
import Data.Responsabilidad;
import Data.Salon;
import Data.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author jorgevazquez
 */
public class DatabaseConnection {
    
   public static boolean isUserAuthorized(User user) throws SQLException, ClassNotFoundException {
       Class.forName("com.mysql.jdbc.Driver");
       String url = "jdbc:mysql://localhost:8889/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "root");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Administradores");
       while (myResult.next()) {
           String usuario = myResult.getString("Usuario");
           String password = myResult.getString("Password");
           if (user.getUsername().equals(usuario) && user.getPassword().equals(password)) {
               return true;
           }
       }
       return false;
   }
   
   public static boolean isTeacherAdded(Maestro maestro) throws SQLException {
       String url = "jdbc:mysql://localhost:8889/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "root");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Maestro");
       while (myResult.next()) {
           String nomina = myResult.getString("Nomina");
           if (maestro.getNomina().equals(nomina)) {
               return false;
           }
       }
       String query = "INSERT INTO Maestro (Nomina, Nombre, Telefono, CorreoElectronico, CursosProgramados)"
               + "VALUES (?, ?, ?, ?, ?)";
       PreparedStatement preparedStatement = connection.prepareStatement(query);
       preparedStatement.setString(1, maestro.getNomina());
       preparedStatement.setString(2, maestro.getNombre());
       preparedStatement.setString(3, maestro.getTelefono());
       preparedStatement.setString(4, maestro.getCorreoElectronico());
       preparedStatement.setString(5, String.valueOf(maestro.getCursosProgramados()));
       preparedStatement.executeUpdate();
       return true;
   }
   
   
   public static ArrayList<Maestro> getAllTeachers() throws SQLException {
       String url = "jdbc:mysql://localhost:8889/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "root");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Maestro");
       ArrayList<Maestro> teachers = new ArrayList<>();
       while(myResult.next()) {
           String nomina = myResult.getString("Nomina");
           String nombre = myResult.getString("Nombre");
           String telefono = myResult.getString("telefono");
           String correo = myResult.getString("CorreoElectronico");
           int cursos = Integer.parseInt(myResult.getString("CursosProgramados"));
           Maestro newTeacher = new Maestro(nomina, nombre, correo, telefono, cursos);;
           teachers.add(newTeacher);
       }
       return teachers;
   }
   
   public static boolean isClassroomAdded(Salon salon) throws SQLException {
       String url = "jdbc:mysql://localhost:8889/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "root");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Salon");
       while (myResult.next()) {
           String numero = myResult.getString("Numero");
           if (salon.getNumero().equals(numero)) {
               return false;
           }
       }
       String query = "INSERT INTO Salon (Numero, Capacidad, Administrador)"
               + "VALUES (?, ?, ?)";
       PreparedStatement preparedStatement = connection.prepareStatement(query);
       preparedStatement.setString(1, salon.getNumero());
       preparedStatement.setInt(2, salon.getCapacidad());
       preparedStatement.setString(3, salon.getAdministrador());
       preparedStatement.executeUpdate();
       return true;
   }
   
   public static ArrayList<Salon> getAllClassrooms() throws SQLException {
       String url = "jdbc:mysql://localhost:8889/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "root");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Salon");
       ArrayList<Salon> salones = new ArrayList<>();
       while (myResult.next()) {
           String numero = myResult.getString("Numero");
           int capacidad = (Integer) myResult.getObject("Capacidad");
           String administrador = myResult.getString("Administrador");
           Salon nuevoSalon = new Salon(numero, administrador, capacidad);
           salones.add(nuevoSalon);
       }
       return salones;
   }
   
   // Se puede tener el mismo numero de clave siempre y diferente numero de grupo cuando
        // Tengan diferente horario Y
        // Tengan diferente salon Y
        // Tengan diferente profesor (es)
   
   // El salon y la hora no puede ser el mismo
   // La clave y el numero de grupo no pueden ser el mismo
   // No pueden tener los mismos maestros en el mismo horario
   
   
   public static boolean isCourseAdded(Curso curso, ArrayList<Maestro> maestros, ArrayList<Responsabilidad> responsabilidades) throws SQLException {
       String url = "jdbc:mysql://localhost:8889/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "root");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Curso");
       ArrayList<Maestro> maestrosV = getAllTeachersFromCourse(curso.getClave(), curso.getNumeroDeGrupo());
       ArrayList<Curso> cursos = getAllCourses();
       for (Curso cursitos: cursos) {
            if (cursitos.getSalon().equals(curso.getSalon()) && cursitos.getHorario().equals(curso.getHorario())) {
                return false;
            }
            if (cursitos.getClave().equals(curso.getClave()) && curso.getNumeroDeGrupo() == cursitos.getNumeroDeGrupo()) {
                return false;
            }
            if (cursitos.getNumeroDeGrupo().equals(curso.getNumeroDeGrupo())) {
                for(Maestro maestrosActuales: maestrosV) {
                    for (Maestro nuevosMaestros: maestros) {
                        if (maestrosActuales == nuevosMaestros) {
                            return false;
                        }
                    }
                }
            }
        } 

        while (myResult.next()) {
           String clave = myResult.getString("Clave");
           int numeroDeGrupo = Integer.valueOf(myResult.getString("NumeroDeGrupo"));
           String horario = myResult.getString("Horario");
           String salon = myResult.getString("Salon");
           int honors = Integer.valueOf(myResult.getString("Honors"));
           int ingles = Integer.valueOf(myResult.getString("Ingles"));
           // Mismo clave de materia y diferente numero de grupo
           if (curso.getClave().equals(clave) && curso.getNumeroDeGrupo() != numeroDeGrupo) {
               if (curso.getHorario().equals(horario)) {
                   return false;
               }
               if (curso.getSalon().equals(salon)) {
                   return false;
               }
           } else if (curso.getClave().equals(clave) && curso.getNumeroDeGrupo() == numeroDeGrupo) {
               return false;
           }
        }
       
              String insertCurso = "INSERT INTO Curso "
               + "(Clave, NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, Honors)"
               + "VALUES (?, ?, ?, ?, ?, ?, ?)";
       PreparedStatement preparedInsertStatementCurso = connection.prepareStatement(insertCurso);
       preparedInsertStatementCurso.setString(1, curso.getClave());
       preparedInsertStatementCurso.setInt(2, curso.getNumeroDeGrupo());
       preparedInsertStatementCurso.setString(3, curso.getHorario());
       preparedInsertStatementCurso.setString(4, curso.getHorarioLaboratorio());
       preparedInsertStatementCurso.setString(5, curso.getSalon());
       preparedInsertStatementCurso.setInt(5, curso.hasIngles() == true? 1 : 0);
       preparedInsertStatementCurso.setInt(6, curso.hasHonors() == true ? 1 : 0);
       
       
       for (Responsabilidad responsabilidad: responsabilidades) {
            String insertResponsabilidad = "INSERT INTO Ensena VALUES(Nomina, Clave, NumeroDeGrupo, Responsabilidad)"
                     + "VALUES (?, ?, ?, ?)";
             PreparedStatement preparedInsertStatementEnsena = connection.prepareStatement(insertResponsabilidad);
             preparedInsertStatementEnsena.setString(1, responsabilidad.getMaestro().getNomina());
             preparedInsertStatementEnsena.setString(2, responsabilidad.getCurso().getClave());
             preparedInsertStatementEnsena.setInt(3, responsabilidad.getCurso().getNumeroDeGrupo());
             preparedInsertStatementEnsena.setInt(4, responsabilidad.getResponsabilidad());
        }
       
       
       return true;
   }
   
   
   private static ArrayList<Curso> getAllCourses() throws SQLException{
       String url = "jdbc:mysql://localhost:8889/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "root");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Curso");
       ArrayList<Curso> cursos = new ArrayList<Curso>();
       while(myResult.next()) {
           String clave = myResult.getString("Clave");
           int numeroDeGrupo = (Integer) myResult.getObject("NumeroDeGrupo");
           String horario = myResult.getString("Horario");
           String horarioLaboratorio = myResult.getString("HorarioLaboratorio");
           String salon = myResult.getString("Salon");
           Boolean ingles = (Boolean) myResult.getObject("Ingles");
           Boolean honors = (Boolean) myResult.getObject("Honors");
           Curso curso = new Curso(clave, horario, horarioLaboratorio, salon, numeroDeGrupo, ingles, honors);
           cursos.add(curso);
       }
       return cursos;
   }
   
   private static ArrayList<Maestro> getAllTeachersFromCourse(String clave, int numeroDeGrupo) throws SQLException {
       ArrayList<Maestro> maestros = new ArrayList<>();
       String url = "jdbc:mysql://localhost:8889/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "root");
       String query = "SELECT * FROM Ensena WHERE Clave = ? AND NumerodeGrupo = ?";
       PreparedStatement preparedStatement = connection.prepareCall(query);
       preparedStatement.setString(1, clave);
       preparedStatement.setInt(2, numeroDeGrupo);
       ResultSet myResult = preparedStatement.executeQuery();
       while(myResult.next()) {
           String nomina = myResult.getString("Nomina");
           String claveTabla = myResult.getString("Clave");
           int numeroDeGrupoTabla = (Integer) myResult.getObject("NumeroDeGrupo");
           if (claveTabla.equals(clave) && numeroDeGrupoTabla == numeroDeGrupo) {
               Maestro maestro = new Maestro();
               maestro.setNomina(nomina);
           }
       }
       return maestros;
   }
   
   public static ArrayList<Ensena> getAllCoursesAndTeachers() throws SQLException {
       String url = "jdbc:mysql://localhost:3306/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "");
       String query = "Select m.Nomina, Nombre, Responsabilidad, e.Clave,"
               + " e.NumeroDeGrupo, Horario, HorarioLaboratorio, Salon, Ingles, "
               + "Honors from Maestro m, Curso c, Ensena e "
               + "WHERE m.nomina = e.nomina AND e.clave = c.clave";
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery(query);
       ArrayList<Ensena> ensenas = new ArrayList<>();
       while(myResult.next()) {
           String nomina = myResult.getString("Nomina");
           String nombre = myResult.getString("Nombre");
           int responsabilidad = (Integer) myResult.getObject("Responsabilidad");
           String clave = myResult.getString("Clave");
           int numeroDeGrupo = (Integer) myResult.getObject("NumeroDeGrupo");
           String horario = myResult.getString("Horario");
           String horarioLaboratorio = myResult.getString("HorarioLaboratorio");
           if (horarioLaboratorio == null) {
               horarioLaboratorio = "";
           } 
           String salon = myResult.getString("Salon");
           Boolean ingles = (Integer) myResult.getObject("Ingles") == 1;
           Boolean honors = (Integer) myResult.getObject("Honors") == 1;
           Ensena ensena = new Ensena(nomina, nombre, clave, horario, horarioLaboratorio, salon, responsabilidad, numeroDeGrupo, ingles, honors);
           ensenas.add(ensena);
       }
       return ensenas;
   }
   
}
