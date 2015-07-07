
import java.sql.Time;
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
@ManagedBean(name="apt4")
@SessionScoped
public class AppointmentController {
    private AppointmentStep3 appointment3=new AppointmentStep3();

    public AppointmentStep3 getAppointment3() {
        return appointment3;
    }

    public void setAppointment3(AppointmentStep3 appointment3) {
        this.appointment3 = appointment3;
    }
    
    public String success(){
        return "submit";
    }
}
