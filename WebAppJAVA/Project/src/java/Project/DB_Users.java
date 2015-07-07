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
            String query="INSERT INTO users(username,firstname,lastname,emailid,gender,address,city,password) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(2, users.getFirstName());
            stmt.setString(3, users.getLastName());
            stmt.setString(1, users.getUserName());
            stmt.setString(4, users.getEmailId());
            
            stmt.setString(5, users.getGender());
            stmt.setString(6, users.getAddress());
            stmt.setString(7, users.getCity());
            stmt.setString(8, users.getPassword());
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
    
    public JSONArray getAllUserName(String sessionUser){
        JSONArray users=new JSONArray();
        try {
            Connection con=getConnection();
            String query="SELECT username FROM users WHERE username!=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, sessionUser);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                users.add(rs.getString("username"));
            }
        } catch (SQLException e) {
        }
        return users;
    }
    
    public Users getUser(String userName){
        Users u=new Users();
        try {
            Connection con=getConnection();
            String query="SELECT address,city,password FROM users WHERE username=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, userName);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                String address=rs.getString("address");
                String city=rs.getString("city");
                String oldpassword=rs.getString("password");
                u.setCity(city);
                u.setPassword(oldpassword);
                u.setAddress(address);
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return u;
    }
    
    public void updateUserDetails(String userName,String userPassword,String address,String city){
        try {
            Connection con=getConnection();
            String query="UPDATE users SET (address,city,password)=(?,?,?) WHERE username=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, address);
            stmt.setString(2, city);
            stmt.setString(3, userPassword);
            stmt.setString(4, userName);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error");
        }
    }
    
    
}
