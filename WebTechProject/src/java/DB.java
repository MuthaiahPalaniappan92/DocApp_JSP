
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author c0652674
 */
public class DB {
    String url="jdbc:as400:174.79.32.158";
    String userName="IBM82";
    String password="IBM82";
    boolean isSignedUp=false;
    boolean isLoggedIn=false;
    
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
    
    public void insertCandidate(Candidate c){
        try {
            Connection con=getConnection();
            String query="INSERT INTO i_users (emailid, username, passwords) VALUES(?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, c.getEmailid());
            stmt.setString(2, c.getUsername());
            stmt.setString(3, c.getPassword());
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public int checkingDuplicateUserName(String userName){
        int rowCount=0;
        try {
            Connection con=getConnection();
            String query="SELECT COUNT(*) count FROM i_users WHERE username=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, userName);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                rowCount=rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rowCount;
    }
    
    public int checkingDuplicateEmailId(String emailId){
        int rowCount=0;
        try {
            Connection con=getConnection();
            String query="SELECT COUNT(*) count FROM i_users WHERE emailid=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, emailId);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                rowCount=rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rowCount;
    }
    
    
}
