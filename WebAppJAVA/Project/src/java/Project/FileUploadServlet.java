/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Project;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author c0652674
 */
public class FileUploadServlet extends HttpServlet {

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
            out.println("<title>Servlet FileUploadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FileUploadServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html");
        String path="";
        boolean isMultiPart=ServletFileUpload.isMultipartContent(request);
        if(isMultiPart){
            ServletFileUpload upload=new ServletFileUpload();
            try {
                FileItemIterator itr=upload.getItemIterator(request);
                Map<String,String> map=new HashMap<String,String>();
                while(itr.hasNext()){
                    FileItemStream item=itr.next();
                    if(item.isFormField()){
                        //do variable declaration of the specific field
                        String fieldName=item.getFieldName();
                        InputStream is=item.openStream();
                        byte[] b=new byte[is.available()];
                        is.read(b);
                        String value=new String(b);
                        response.getWriter().println(fieldName+":"+value+"<br/>");
                        map.put(fieldName, value);
                    }else{
                        //do file upload and store the path as variable
                        path=getServletContext().getRealPath("/");
                        //will write a method and we will call here
                        if(processFile(path,item)){
                            response.getWriter().println("File uploaded successfully");
                            response.getWriter().println(path);
                        }else{
                            response.getWriter().println("File uploading failed");
                        }
                    }
                    String category="";
                    String keywords="";
                    String cost="";
                    String imagess="";
                    for(Map.Entry<String,String> entry:map.entrySet()){
                        if(entry.getKey().equals("category")){
                            category=entry.getValue();
                        }else if(entry.getKey().equals("keywords")){
                            keywords=entry.getValue();
                        }else if(entry.getKey().equals("cost")){
                            cost=entry.getValue();
                        }else if(entry.getKey().equals("fileName")){
                            imagess=entry.getValue();
                        }
                    }
                    response.getWriter().println(path+"images\\"+imagess);
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
        }else{
            //do nothing
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
    
    
    public static boolean processFile(String path, FileItemStream item){
        try {
            File f=new File(path+File.separator+"images");
            if(!f.exists()){
                f.mkdir();
            }
            File savedFile=new File(f.getAbsolutePath()+File.separator+item.getName());
            FileOutputStream fos=new FileOutputStream(savedFile);
            InputStream is=item.openStream();
            int x=0;
            byte[] b=new byte[1024];
            while((x=is.read(b))!=-1){
                fos.write(b, 0, x);
            }
            fos.flush();
            fos.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
