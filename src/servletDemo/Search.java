package servletDemo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GetConnection.GetConnection;
import exercise.Person;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		GetConnection getConnection = new GetConnection();
		Connection conn = getConnection.getConnect();
		
		String userName = (String)request.getParameter("UserName");
		
		String sql = "select *  from tb_useraccount where userName = ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ResultSet rs = getConnection.query(ps);
			
			List<Person> listPerson = new ArrayList<Person>();
			while(rs.next()) {
				Person person = new Person();
				person.setEmail(rs.getString("userEmail"));
				person.setName(rs.getString("name"));
				person.setPasswd(rs.getString("passwd"));
				person.setPhone(rs.getString("userPhone"));
				person.setUserName(rs.getString("userName"));
				person.setUserType(rs.getString("userType"));
				person.setWorkPlace(rs.getString("workPlace"));
				listPerson.add(person);
			}
			request.setAttribute("listPerson", listPerson);
			request.setAttribute("userName", userName);
			rs.close();
			conn.close();
			
			request.getRequestDispatcher("ShowSearch.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//out.print("“Ï≥£4£°");
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
