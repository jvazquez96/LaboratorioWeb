/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author jorgevazquez
 */
public class SendMail {
    private static String to = "jorgevzqz6@gmail.com";
    private static String from = "examenjsp@gmail.com";
    private static String host = "localhost";
    private static Properties properties = System.getProperties();
    
    
    public static String sendMail() {
        String menssage;
        properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "prueba123456");
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("This is the Subject Line!");
            message.setText("Thisis actual message");
            Transport.send(message);
            menssage = "Sent message sucessfully";
        } catch (MessagingException mex) {
            mex.printStackTrace();
            menssage = "Error: unable to send message";
        }
                
        return menssage;
    }
    
}
