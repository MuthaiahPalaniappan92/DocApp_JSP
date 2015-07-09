


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@ManagedBean(name="apt2")
@SessionScoped
public class AppointmentStep2 {
    private Appointment appointment=new Appointment();
    private String doctor;           
    private String date;

    public String getDate() {
        return date;
    }

    public void setDate(String date) throws ParseException {
        this.date=date;
    }
    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }
            
    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }
    
    public String success(){
        return "doctor";
    }
    
}
