/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package EmailSender;

import java.util.Properties;
import javax.ejb.Stateless;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author c0652674
 */
@Stateless
public class MailSender {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    public void sendEmailForRegistration(String toEmail, String fromEmail, String userName, String password,String subject, String messageBody){
        try {
            Properties prop=System.getProperties();
            //since our host is gmail
            prop.put("mail.smtp.host", "smtp.gmail.com");
            //Authentication based on userName and password
            prop.put("mail.smtp.auth", true);
            //port we are going to use since we have to send this email through secure socket layer
            prop.put("mail.smtp.port","465");
            //therefore we are providing properties for its class
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            prop.put("mail.smtp.socketFactory","465");
            prop.put("mail.smtp.socketFactory.fallback", "false");
        
            //info about mail server and authentication, etc...
            Session mailSession=Session.getDefaultInstance(prop, null);
            mailSession.setDebug(true);
        
            //In order to receive and send email, creating JAVA API
            Message mail=new MimeMessage(mailSession);
            mail.setFrom(new InternetAddress(fromEmail));
            mail.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mail.setSubject(subject);
            mail.setContent(messageBody,"text/html");
            
            //It helps to send messages through smtp protocol
            Transport transport=mailSession.getTransport("smtp");
            //It helps us to establish connection to authenticat the fromEmail Username and password
            transport.connect("smtp.gmail.com", userName, password);
            
            transport.sendMessage(mail, mail.getAllRecipients());
        } catch (Exception e) {
        }
    }
}
