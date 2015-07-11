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
public class AlertEmail {

    public void sendAlertMailsForPatients(String fromEmail, String userName, String password, String toEmail, String message, String subject){
        
        try {
            Properties prop=System.getProperties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.port", "465");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            prop.put("mail.smtp.socketFactory.port", "465");
            prop.put("mail.smtp.socketFactory.fallback", "false");
        
            Session mailSession=Session.getDefaultInstance(prop, null);
            mailSession.setDebug(true);
        
            Message mailMessage=new MimeMessage(mailSession);
            mailMessage.setFrom(new InternetAddress(fromEmail));
            mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mailMessage.setContent(message,"text/html");
            mailMessage.setSubject(subject);
            
            Transport transport=mailSession.getTransport("smtp");
            transport.connect("smtp.gmail.com",userName,password);
            transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
        } catch (Exception e) {
        }
    }
}
