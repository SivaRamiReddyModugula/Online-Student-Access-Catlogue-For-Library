package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Ramu Maloth
 */
public class DBConnection {
    private static Connection con = null;
    public static Connection getConnection(){
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
            if(con!=null){
            return con;
            }else{
                System.out.println("DB Error ");
                return con;
            }
        } catch (Exception e) {
            System.out.println("DB Connection error "+e.getMessage());
        }
        return con;
    }
}
