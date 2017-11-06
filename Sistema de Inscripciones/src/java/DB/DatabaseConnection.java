/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Data.Maestro;
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
   public static boolean isUserAuthorized(Maestro maestro) throws SQLException {
       String url = "jdbc:mysql://localhost:3306/Proyecto";
       Connection connection = DriverManager.getConnection(url, "root", "");
       Statement myStmt = connection.createStatement();
       ResultSet myResult = myStmt.executeQuery("SELECT * FROM Maestro");
       while (myResult.next()) {
           String nomina = myResult.getString("Nomina");
           String nombre = myResult.getString("Nombre");
           if (maestro.getNomina().equals(nomina) && maestro.getNombre().equals(nombre)) {
               return true;
           }
       }
       return false;
   }
}
