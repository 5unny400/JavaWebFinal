package servletDemo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GetConnection.GetConnection;
import exercise.Person;



/**
 * Servlet implementation class FindServlet
 */
@WebServlet("/FindServlet")
public class FindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); 

		response.setCharacterEncoding("utf-8");
		
		String sql = "";
		ResultSet rs = null;
		GetConnection getConnection = new GetConnection();
		Connection conn = getConnection.getConnect();
		
		sql = "select *  from tb_useraccount ";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				
				rs = getConnection.query(ps);
				
				List<Person> listAll = new ArrayList<Person>();
				while(rs.next()) {
					Person person = new Person();
					person.setEmail(rs.getString("userEmail"));
					person.setName(rs.getString("name"));
					person.setPasswd(rs.getString("passwd"));
					person.setPhone(rs.getString("userPhone"));
					person.setUserName(rs.getString("userName"));
					person.setWorkPlace(rs.getString("workPlace"));
					person.setUserType(rs.getString("userType"));
					
					listAll.add(person);
				}
				request.setAttribute("listAll", listAll);
				rs.close();
				ps.close();
				conn.close();
				request.getRequestDispatcher("Manage.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//out.print("“Ï≥£4£°");
				e.printStackTrace();
			}
		
		
		response.getWriter().append("Served at findServlet: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		doGet(request, response);
	}

}
