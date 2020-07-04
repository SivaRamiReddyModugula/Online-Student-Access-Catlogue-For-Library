
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
@WebServlet("/FacultyRegistration")
public class FacultyRegistration extends HttpServlet {

   

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
        String fid = request.getParameter("fid");
        String fname = request.getParameter("fname").trim();
        String pswd = request.getParameter("pswd");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mno");
        String course = request.getParameter("course");
        String dept = request.getParameter("dept");
        

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

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement("insert into faculty(fid,fname, email, pswd, mno, dept, course, pic)values(?,?,?,?,?,?,?,?)");
            ps.setString(1, fid);
            ps.setString(2, fname);
            ps.setString(3, email);
            ps.setString(4, pswd);
            ps.setString(5, mobile);
            ps.setString(6, dept);
            ps.setString(7, course);
            if(inputStream!=null){
            ps.setBlob(8, inputStream);
            }
            int no = ps.executeUpdate();
            if(no>0){
            response.sendRedirect("index.html?msg=success");
            }else{
            response.sendRedirect("FacultyRegistration.jsp?msg=faild");
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
