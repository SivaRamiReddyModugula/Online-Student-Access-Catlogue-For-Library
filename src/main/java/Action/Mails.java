package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import DBConnection.DBConnection;

public class Mails implements Runnable {

	@Override
	public void run() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String Date = sdf.format(cal.getTime());
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps2 = null;
		try {
			ps2 = conn.prepareStatement("select * from issue where status='issued'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet rs2 = null;
		try {
			rs2 = ps2.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while (rs2.next()) {

				String htno = rs2.getString("htno");
				PreparedStatement ps3 = conn.prepareStatement("select * from student where htno='" + htno + "'");
				ResultSet rs3 = ps3.executeQuery();
				if (rs3.next()) {
					String sname = rs3.getString("sname");
					String email = rs3.getString("email");
					String submit = rs2.getString("submit");
					String issue = rs2.getString("issue");
					if (Date.equals(submit)) {

						String bname = rs2.getString("bname");
						String[] mail = new String[] { email };
						String sub = "Library Book Return..";
						String msg = "<head><meta charset=“UTF-8”></head><p><b>Dear " + sname
								+ ",</b> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You need to submit <b>\"<i>"
								+ bname + "</i>\"</b> book. Issued on <b>\"<i>" + issue
								+ "</i>\"</b>. Submit the book Fast with-in time...</p><br><br><h3 align=\"center\">Thank You!! &#x1F60a;</h3>";
						System.out.println("Sending mail to \"" + email + "\". You need to submit \"" + bname
								+ "\". Issued on \"" + issue + "\".");
						new MailUtil().sendMail(mail, mail, sub, msg);
						System.out.println("sent successful");
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
