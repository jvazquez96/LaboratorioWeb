/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Data.Curso;
import Data.Ensena;
import Data.Horario;
import Data.Maestro;
import Data.Materia;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Map;
import java.util.HashMap;

/**
 *
 * @author jorgevazquez
 */
public class DatabaseConnection {

    private static String password = "";
    private static String port = ":3306";

    public static Connection setupDBConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost" + port + "/Proyecto";
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(url, "root", password);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }

   public static boolean isUserAuthorized(User user) throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
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

   public static boolean isTeacherAdded(Maestro maestro) throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
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


   public static ArrayList<Maestro> getAllTeachers() throws SQLException, ClassNotFoundException{
       Connection connection = setupDBConnection();
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

   public static boolean isClassroomAdded(Salon salon) throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
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

   public static ArrayList<Salon> getAllClassrooms() throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
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


   public static boolean isCourseAdded(Curso curso, ArrayList<Maestro> maestros, ArrayList<Responsabilidad> responsabilidades) throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Curso");
       ArrayList<Maestro> maestrosV = getAllTeachersFromCourse(curso.getClave(), curso.getNumeroDeGrupo());
       ArrayList<Curso> cursos = getAllCourses();
       for (Curso cursitos: cursos) {
            if (cursitos.getSalon().equals(curso.getSalon()) && cursitos.getHorario().equals(curso.getHorario())) {
                System.out.println("Horario:" + curso.getHorario());
                System.out.println("Mismo salon y mismo horario");
                return false;
            }
            if (cursitos.getClave().equals(curso.getClave()) && curso.getNumeroDeGrupo() == cursitos.getNumeroDeGrupo()) {
                System.out.println("Misma clave y mismo numero de grupo");
                return false;
            }
            if (cursitos.getHorario().equals(curso.getHorario())) {
                for(Maestro maestrosActuales: maestrosV) {
                    for (Maestro nuevosMaestros: maestros) {
                        if (maestrosActuales == nuevosMaestros) {
                            System.out.println("Mismo numero horario y mismos maestros");
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
                   System.out.println("Horario: " + curso.getHorario());
                   System.out.println("Horario2: " + horario);
                   System.out.println("Misma clave, diferente numero de grupo, mismo horario");
                   return false;
               }
               if (curso.getSalon().equals(salon) && curso.getHorario() == horario) {
                   System.out.println("Horario del curso: " + curso.getHorario());
                   System.out.println("Horario: " + horario);
                   System.out.println("Misma clave, diferente numero de grupo, mismo salon");
                   return false;
               }
           } else if (curso.getClave().equals(clave) && curso.getNumeroDeGrupo() == numeroDeGrupo) {
               System.out.println("Misma clave y mismo numero de grupo");
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


   private static ArrayList<Curso> getAllCourses() throws SQLException, ClassNotFoundException{
       Connection connection = setupDBConnection();
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Curso");
       ArrayList<Curso> cursos = new ArrayList<Curso>();
       while(myResult.next()) {
           String clave = myResult.getString("Clave");
           int numeroDeGrupo = (Integer) myResult.getObject("NumeroDeGrupo");
           String horario = myResult.getString("Horario");
           String horarioLaboratorio = myResult.getString("HorarioLaboratorio");
           String salon = myResult.getString("Salon");
           Boolean ingles = (Integer) myResult.getObject("Ingles") == 1;
           Boolean honors = (Integer) myResult.getObject("Honors") == 1;
           Curso curso = new Curso(clave, horario, horarioLaboratorio, salon, numeroDeGrupo, ingles, honors);
           cursos.add(curso);
       }
       return cursos;
   }

   private static ArrayList<Maestro> getAllTeachersFromCourse(String clave, int numeroDeGrupo) throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
       ArrayList<Maestro> maestros = new ArrayList<>();
       String query = "SELECT * FROM Ensena WHERE Clave = ? AND NumerodeGrupo = ?";
       PreparedStatement preparedStatement = connection.prepareStatement(query);
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

   public static ArrayList<Ensena> getAllCoursesAndTeachers() throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
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

   public static void updateTeachers(String id, String column, String value) throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
       String query = "UPDATE Maestro SET "
               + column
               + " = ? WHERE Nomina = ?";
       PreparedStatement preparedStatement = connection.prepareStatement(query);
       preparedStatement.setString(1, value);
       preparedStatement.setString(2, id);
       preparedStatement.executeUpdate();
   }

   public static void updateClassroom(String id, String column, String value) throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
       String query = "UPDATE Salon SET "
               + column
               + " = ? WHERE Numero = ?";
       PreparedStatement preparedStatement = connection.prepareStatement(query);
       preparedStatement.setString(1, value);
       preparedStatement.setString(2, id);
       preparedStatement.executeUpdate();
   }

   public static ArrayList<Materia> getAllSubjects() throws ClassNotFoundException, SQLException {
       Connection connection = setupDBConnection();
        String query = "SELECT * FROM Materia";
        Statement myStmt = connection.createStatement();
        ResultSet resultSet = myStmt.executeQuery(query);
        ArrayList<Materia> materias = new ArrayList<>();
        while (resultSet.next()) {
            String clave = resultSet.getString("Clave");
            String nombre = resultSet.getString("Nombre");
            int horasLaboratorio = (Integer) resultSet.getObject("HorasLaboratorio");
            Materia materia = new Materia(clave, nombre, horasLaboratorio);
            materias.add(materia);
        }
       return materias;
   }

   public static ArrayList<Horario> getAllSchedules() throws SQLException, ClassNotFoundException {
       Connection connection = setupDBConnection();
        String query = "SELECT * FROM Horario";
        Statement myStmt = connection.createStatement();
        ResultSet resultSet = myStmt.executeQuery(query);
        ArrayList<Horario> horarios = new ArrayList<>();
        while (resultSet.next()) {
            String frequencia = resultSet.getString("Frequencia");
            Horario horario = new Horario(frequencia);
            horarios.add(horario);
        }
        return horarios;
   }


    public static void deleteRow(String tableName, HashMap<String, String> primaryKeys)
            throws SQLException, ClassNotFoundException {
        String keyCondition = "";
        for (Map.Entry<String, String> entry : primaryKeys.entrySet()) {
            System.out.println(entry);
            try {
                if (keyCondition == "") {
                    keyCondition += entry.getKey() + "=" + Integer.parseInt(entry.getValue());
                } else {
                    keyCondition += " and " + entry.getKey() + "=" + Integer.parseInt(entry.getValue());
                }
            } catch (Exception e) {
                if (keyCondition == "") {
                    keyCondition += entry.getKey() + "='" + entry.getValue() + "'";
                } else {
                    keyCondition += " and " + entry.getKey() + "='" + entry.getValue() + "'";
                }
            }
        }
        Connection connection = setupDBConnection();
        String query = "DELETE FROM " + tableName + " WHERE " + keyCondition;
        System.out.println(query);
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.executeUpdate();
    }

}
