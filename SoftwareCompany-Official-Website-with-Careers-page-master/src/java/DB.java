
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
    
    public String getAffiliation(String userName){
        String affiliation=null;
        try {
            Connection con=getConnection();
            String query="SELECT affiliation FROM i_users WHERE username=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, userName);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                affiliation=rs.getString("affiliation");
            }
        } catch (SQLException e) {
        }
        return affiliation;
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
    
    public boolean login(String userName, String pass){
        int count=0;
        try {
            Connection con=getConnection();
            String query="SELECT COUNT(*) count FROM i_users WHERE username=? AND passwords=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, userName);
            stmt.setString(2,pass);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                count=rs.getInt("count");
            }
        } catch (Exception e) {
        }
        if(count==0){
            return false;
        }else{
            return true;
        }
    }
    
    public void insertJobPost(String title, int expRequired, String requirements, String responsibilities){
        try {
            Connection con=getConnection();
            String query="INSERT INTO job_post (title, exp_required, requirements, responsibilities) VALUES(?,?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,title);
            stmt.setInt(2,expRequired);
            stmt.setString(3,requirements);
            stmt.setString(4, responsibilities);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void insertCandidateDetails(String jobid,String user,String doa,String lang,String position,String gender){
        try {
            Connection con=getConnection();
            String query="INSERT INTO candidate_details (jobid, user, doa, lang, position, gender) VALUES(?,?,?,?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,jobid);
            stmt.setString(2,user);
            stmt.setString(3,doa);
            stmt.setString(4, lang);
            stmt.setString(5, position);
            stmt.setString(6, gender);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void insertcandidateSkills(String user,String skills,String job_id){
        try {
            Connection con=getConnection();
            String query="INSERT INTO candidate_skills (jobid, user, skills) VALUES(?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,job_id);
            stmt.setString(2,user);
            stmt.setString(3,skills);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void insertcandidateInterest(String user,String interest,String job_id){
        try {
            Connection con=getConnection();
            String query="INSERT INTO candidate_interest (jobid, user, interest) VALUES(?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,job_id);
            stmt.setString(2,user);
            stmt.setString(3,interest);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
     
    
}
