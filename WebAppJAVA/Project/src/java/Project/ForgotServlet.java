/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Project;

import EmailSender.MailSender;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author c0652674
 */
public class ForgotServlet extends HttpServlet {
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
            out.println("<title>Servlet ForgotServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotServlet at " + request.getContextPath() + "</h1>");
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
        if(request.getParameter("f_email")!=null && request.getParameter("f_username")!=null){
            String pass=db.userPasswordRetrieval(request.getParameter("f_username"),request.getParameter("f_email"));
            if(pass!=null){
                String toEmail=request.getParameter("f_email");
                String fromEmail="muthaiahpalaniappan92@gmail.com";
                String emailUserName="muthaiahpalaniappan92";
                String emailPassword="Muthaiah92";
                String subject="Forgot Password Request from Best Buyers";
                String message="Hi "+request.getParameter("f_username")+",<br> Your password is <b>"+pass+"</b>";
                mail.sendEmailForRegistration(toEmail, fromEmail, emailUserName, emailPassword, subject, message);  
            }
            HttpSession session=request.getSession();
            session.setAttribute("loginFailedMessage", "Password request sent your email, if your given information is correct");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }        
        if(request.getParameter("f_email")!=null){
            String mail=request.getParameter("f_email");
            String emailId =db.getUserNameByEmailId(mail);
            HttpSession session=request.getSession();
            session.setAttribute("email", emailId);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
