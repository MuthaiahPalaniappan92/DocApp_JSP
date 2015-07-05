
import java.sql.Time;
import java.util.Date;
import javax.faces.bean.ManagedBean;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author c0652674
 */
@ManagedBean(name="apt3")
public class AppointmentStep3 {
    private AppointmentStep2 appointment2=new AppointmentStep2();
    
    private Time time;
    
    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }
        
    public AppointmentStep2 getAppointment2() {
        return appointment2;
    }

    public void setAppointment2(AppointmentStep2 appointment2) {
        this.appointment2 = appointment2;
    }
    
    public String success(){
        return "success";
    }
}
