
package Action;


import DBConnection.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/StudentRegistration")
public class StudentRegistration extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement ps = null;
        
        String sname = request.getParameter("sname").trim();
        String pswd = request.getParameter("pswd");
        String smail = request.getParameter("semail");
        String mobile = request.getParameter("mno");
        String course = request.getParameter("course");
        String branch = request.getParameter("branch");
        String htno = request.getParameter("htno");

        InputStream inputStream = null;
        Part filePart = request.getPart("file");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        else{
            response.sendRedirect("StudentRegistration.jsp?msg=faild");
            }

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement("insert into student(htno, sname, email, pswd, mno, branch, course, pic)values(?,?,?,?,?,?,?,?)");
            ps.setString(1, htno);
            ps.setString(2, sname);
            ps.setString(3, smail);
            ps.setString(4, pswd);
            ps.setString(5, mobile);
            ps.setString(6, branch);
            ps.setString(7, course);
            if(inputStream!=null){
            ps.setBlob(8, inputStream);
            }
            int no = ps.executeUpdate();
            if(no>0){
            response.sendRedirect("index.html?msg=success");
            }else{
            response.sendRedirect("StudentRegistration.jsp?msg=faild");
            }

        } catch (Exception e) {
            out.println("Error at "+e.getMessage()+" \n\t\t\t\t\t\t\t\t\tAccount Already exists.");
        }finally{
            try {
                ps.close();
                conn.close();
            } catch (Exception e) {
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
