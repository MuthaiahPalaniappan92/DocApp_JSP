/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author c0652674
 */
public class Database {
    String url="jdbc:as400:174.79.32.158";
    String userName="IBM82";
    String password="IBM82";
    
    public Connection getConnection(){
        Connection con=null;
        try {
            Class.forName("com.ibm.as400.access.AS400JDBCDriver");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        
        try {
            con=DriverManager.getConnection(url, userName, password);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return con;
    }   
    
    public ResultSet jobList(){
        ResultSet rs=null;
        try {
            Connection con=getConnection();
            String query="SELECT jobid,title, exp_required, requirements, responsibilities FROM job_post WHERE active='T'";
            PreparedStatement stmt=con.prepareStatement(query);
            rs=stmt.executeQuery();
        } catch (SQLException e) {
        }
        return rs;
    }  
}
