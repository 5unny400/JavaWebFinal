package servletDemo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GetConnection.GetConnection;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int row = 0;
		Connection conn = GetConnection.getConnection();

		String sql = "insert  into tb_user(userName,passwd,userType,name,workPlace,userPhone,userEmail) values(?,?,?,?,?,?,?)";
		if (!(request.getParameter("passwd").toString().trim()).equals(request.getParameter("qpassword").toString().trim())) {
			row = -1;
			response.getWriter().print(row);
		} else {
			try {
				PreparedStatement ps = conn.prepareStatement(sql);

				ps.setString(1, request.getParameter("userName"));
				ps.setString(2, request.getParameter("passwd"));
				ps.setString(3, request.getParameter("userType"));
				ps.setString(4, request.getParameter("name"));
				ps.setString(5, request.getParameter("workPlace"));
				ps.setString(6, request.getParameter("phone"));
				ps.setString(7, request.getParameter("email"));

				row = ps.executeUpdate();
				response.getWriter().print(row);

				conn.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//doGet(request, response);
	}

}
