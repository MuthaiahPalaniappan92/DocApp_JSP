/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author c0652674
 */
@WebServlet(urlPatterns = {"/candidate_details"})
public class candidate_details extends HttpServlet {

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
            out.println("<title>Servlet candidate_details</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet candidate_details at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String user=request.getParameter("username");
        int jobid=Integer.parseInt(request.getParameter("jobid"));
        String languagePref=request.getParameter("language");
        String gender=request.getParameter("gender");
        String doa=request.getParameter("doa");
        String position=request.getParameter("position");
        String[] interest=request.getParameterValues("interest");
        String[] skills=request.getParameterValues("skills");
        String additionalSkills=request.getParameter("additionalSkills");
        DB d=new DB();
        d.insertCandidateDetails(doa, user, doa, languagePref, position, gender);
        for(int i=0;i<skills.length;i++){
            d.insertcandidateSkills(user, skills[i], request.getParameter("jobid"));
        }
        for(int i=0;i<interest.length;i++){
            d.insertcandidateInterest(user, interest[i], request.getParameter("jobid"));
        }
        HttpSession session=request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("jobid", jobid);
        request.getRequestDispatcher("resumeUpload.jsp").forward(request, response);
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
