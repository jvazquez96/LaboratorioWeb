/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Data.User;
import java.sql.Connection;
import java.sql.DriverManager;
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
}
