/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author c0652674
 */
public class mainservlet extends HttpServlet {
    DB d=new DB();
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
            out.println("<title>Servlet mainservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mainservlet at " + request.getContextPath() + "</h1>");
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
        if(request.getParameter("sEmailId")!=null && request.getParameter("sPassword")!=null && request.getParameter("cPassword")!=null && request.getParameter("username")!=null){
            HttpSession session=request.getSession();
            if(request.getParameter("sPassword").equals(request.getParameter("cPassword"))){
                if(d.checkingDuplicateEmailId(request.getParameter("sEmailId"))==0){
                    if(d.checkingDuplicateUserName(request.getParameter("username"))==0){
                        Candidate c=new Candidate(request.getParameter("sEmailId"),request.getParameter("sPassword"),request.getParameter("username"));
                        d.insertCandidate(c);
                        request.getRequestDispatcher("security.jsp").forward(request, response);
                    }else{
                        session.setAttribute("failureMessage", "Duplicate UserName");
                    }
                }else{
                    session.setAttribute("failureMessage", "Duplicate EmailId");
                }
                request.getRequestDispatcher("careers.jsp").forward(request, response);
            }else{
                session.setAttribute("failureMessage", "Password and Confirm password should match");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
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
