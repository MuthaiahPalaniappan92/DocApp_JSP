/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.json.simple.JSONArray;


/**
 *
 * @author c0652674
 */
public class DB_Users {
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
    
    public void insertUsers(Users users){
        try {
            Connection con=getConnection();
            String query="INSERT INTO users(username,firstname,lastname,emailid,mobilenumber,gender,address,city,password) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(2, users.getFirstName());
            stmt.setString(3, users.getLastName());
            stmt.setString(1, users.getUserName());
            stmt.setString(4, users.getEmailId());
            stmt.setInt(5, users.getMobileNumber());
            stmt.setString(6, users.getGender());
            stmt.setString(7, users.getAddress());
            stmt.setString(8, users.getCity());
            stmt.setString(9, users.getPassword());
            stmt.executeUpdate();
            this.isSignedUp=true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public int checkingDuplicateUserName(String userName){
        int rowCount=0;
        try {
            Connection con=getConnection();
            String query="SELECT COUNT(*) count FROM users WHERE username=?";
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
            String query="SELECT COUNT(*) count FROM users WHERE emailid=?";
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
    
    public int checkingDuplicateMobileNumber(int mobileNumber){
        int rowCount=0;
        try {
            Connection con=getConnection();
            String query="SELECT COUNT(*) count FROM users WHERE mobilenumber=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setInt(1, mobileNumber);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                rowCount=rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rowCount;
    }
    
    public String updateLoginUserDetails(String userName,String password){
           String loginUserName=null;     
        try {
            Connection con=getConnection();
            String query="SELECT username FROM users WHERE username=? AND password=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            ResultSet rs=stmt.executeQuery();
            Users u=new Users();
            while(rs.next()){                
                loginUserName=rs.getString("username");                
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return loginUserName;
    }
    
    public int doLogin(String userName,String password){
        int rowCount=0;
        try {
            Connection con=getConnection();
            String query="SELECT COUNT(*) count FROM users WHERE username=? AND password=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                rowCount=rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rowCount;
    }
    
    public JSONArray getAllUserName(){
        JSONArray users=new JSONArray();
        try {
            Connection con=getConnection();
            String query="SELECT username FROM users";
            PreparedStatement stmt=con.prepareStatement(query);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                users.add(rs.getString("username"));
            }
        } catch (SQLException e) {
        }
        return users;
    }
}
