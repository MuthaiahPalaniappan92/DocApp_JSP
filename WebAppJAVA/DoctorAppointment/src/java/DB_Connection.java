
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author c0652674
 */
@ManagedBean(name="selectBoxes")
@SessionScoped
public class DB_Connection {
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
    
    public List<String> getSpeciality(){
        ArrayList<String> speciality=new ArrayList<String>();
        try {
            Connection con=getConnection();
            String query="SELECT DISTINCT dept_name FROM doc_department";
            PreparedStatement stmt=con.prepareStatement(query);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                speciality.add(rs.getString("dept_name"));
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return speciality;
    }
    
    public List<String> getDoctor(String speciality){
        ArrayList<String> doctors=new ArrayList<String>();
        try {
            Connection con=getConnection();
            String query="SELECT doc_name FROM doc_department WHERE dept_name=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, speciality);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                doctors.add(rs.getString("doc_name"));
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return doctors;
    }
    
    public List<String> getTime(String date,String doctor){
        LinkedList<String> timing=new LinkedList<String>();
        try {
            Connection con=getConnection();
            String query="select available_timing from timing where available_timing NOT IN (SELECT available_timing FROM timing t RIGHT OUTER JOIN pt_appt_details p ON t.available_timing=p.apttime WHERE p.apt_date=? AND p.doc_name=?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,date);
            stmt.setString(2, doctor);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                timing.add(rs.getString("available_timing"));
            }
        } catch (SQLException e) {
        }        
        return timing;
    }
}
