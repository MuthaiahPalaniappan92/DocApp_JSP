/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Project;

import EmailSender.MailSender;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author c0652674
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    @EJB
    private MailSender mail;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        HttpSession session=request.getSession();
        session.removeAttribute("username");
        response.sendRedirect("login.jsp");
        request.setAttribute("loginFailedMessage", "Logged out Successfully");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
            DB_Users db=new DB_Users();
        if(request.getParameter("username")!=null && request.getParameter("password")!=null){
            String userName=request.getParameter("username");
            String password=request.getParameter("password");
            
            int loginCheck=db.doLogin(userName, password); 
            
        if(loginCheck==1){
                    String loginUserName=db.updateLoginUserDetails(userName, password);
                    HttpSession session=request.getSession();
                    session.setAttribute("username", loginUserName);
                    //response.sendRedirect("myprofile.jsp");            
                    request.getRequestDispatcher("myprofile.jsp").forward(request, response);
                    
                }else{
                    String toEmail=db.getEmailIdOfLoginUser(userName);
                    String fromEmail="muthaiahpalaniappan92@gmail.com";
                    String emailUserName="muthaiahpalaniappan92";
                    String emailPassword="Muthaiah92";
                    String subject="Sign In Attempt Blocked";
                    String message="Someone have attempted to login your account with this password ("+password+"). If this was you, then that\'s okay ., else please change your password ";
                    mail.sendEmailForRegistration(toEmail, fromEmail, emailUserName, emailPassword, subject, message);
                    request.setAttribute("loginFailedMessage", "UserName or Password you entered is incorrect");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
        }
            //Update info
        if(request.getParameter("newAddress")!=null && request.getParameter("newPassword")!=null && request.getParameter("loginUser")!=null && request.getParameter("newCity")!=null){
            String newAddress=request.getParameter("newAddress");
            String newPassword=request.getParameter("newPassword");
            String newCity=request.getParameter("newCity");
            String updatableUser=request.getParameter("loginUser");
            db.updateUserDetails(updatableUser, newPassword, newAddress, newCity);
            request.getRequestDispatcher("chatbox.jsp").forward(request, response);
        }
        
        if(request.getParameter("sender")!=null && request.getParameter("receiver")!= null&& request.getParameter("message")!= null){
                String senderVar=request.getParameter("sender");
                String receiverVar=request.getParameter("receiver");
                String messageVar=request.getParameter("message");
                Chat c=new Chat(senderVar,receiverVar,messageVar);                
                db.insertChat(c);
                request.getRequestDispatcher("chatbox.jsp").forward(request, response);
            }else{
                request.setAttribute("emptyReceiverOrMessage", "Receiver or Message should not be empty");
                request.getRequestDispatcher("chatbox.jsp").forward(request, response);
        }
        
       if(request.getParameter("user")!=null && request.getParameter("opponent")!=null){
            db.deleteConversation(request.getParameter("user"), request.getParameter("opponent"));
        }
              
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
     

}
