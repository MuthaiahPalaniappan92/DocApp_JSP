/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CrickerCorridor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author c0652674
 */
public class DB {
        String url="jdbc:as400:174.79.32.158";
    String userName="IBM66";
    String password="IBM66";
    
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
    
    public void createUser(String user, String pass){
        try {
            Connection con=getConnection();
            String query="INSERT INTO users(username,password) VALUES(?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, user);
            stmt.setString(2, pass);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public boolean userNameCheck(String user){
        int rowCount=0;
        try {
            Connection con=getConnection();
            String query="SELECT COUNT(*) count FROM users WHERE username=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, user);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                rowCount=rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if(rowCount==0){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean doLogin(String userName,String password){
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
        if(rowCount==1){
            return true;
        }else{
            return false;
        }
    }
    
    public String getLoginUserName(String userName,String password){
           String loginUserName=null;     
        try {
            Connection con=getConnection();
            String query="SELECT username FROM users WHERE username=? AND password=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){                
                loginUserName=rs.getString("username");                
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return loginUserName;
    }
    
    public boolean duplicateForumNameCheck(String forumname){
        int rowCount=0;
        try {
            Connection con=getConnection();
            String query="SELECT COUNT(*) count FROM forum WHERE forumname=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, forumname);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                rowCount=rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if(rowCount==0){
            return true;
        }else{
            return false;
        }
    }
    
    public void createNewForum(String forumName, String description){
        try {
            Connection con=getConnection();
            String query="INSERT INTO forum(forumname,description) VALUES(?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, forumName);
            stmt.setString(2, description);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void insertChatInForum(String forumName, String chat,String mes){
        try {
            Connection con=getConnection();
            String query="INSERT INTO forum_chat(forumname,sender,message) VALUES(?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, forumName);
            stmt.setString(2, chat);
            stmt.setString(3, mes);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public Map<String,String> listOfFoum(){
        Map<String,String> listOfFoum=new HashMap<String,String>();
        try {
            Connection con=getConnection();
            String query="SELECT forumname,description FROM forum";
            PreparedStatement stmt=con.prepareStatement(query);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                listOfFoum.put(rs.getString("forumname"), rs.getString("forumname"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listOfFoum;
    }
    
    public ResultSet getWholeChatFromAForum(String forumname){
        ResultSet rs=null;
        try {
            Connection con=getConnection();
            String query="SELECT sender,message FROM forum_chat WHERE forumname=? ORDER BY dateupdated";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, forumname);
            rs=stmt.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rs;
    }
}
