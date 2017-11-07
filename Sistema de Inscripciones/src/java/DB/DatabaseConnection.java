/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Data.Maestro;
import Data.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author jorgevazquez
 */
public class DatabaseConnection {
   public static boolean isUserAuthorized(User user) throws SQLException {
       String url = "jdbc:mysql://localhost:3306/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "");
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
       String url = "jdbc:mysql://localhost:3306/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Maestro");
       while (myResult.next()) {
           String nomina = myResult.getString("Nomina");
           if (maestro.getNomina().equals(nomina)) {
               return false;
           }
       }
       Statement insertionStatement = connection.createStatement();
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
}