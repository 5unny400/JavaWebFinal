package servletDemo;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateServlet() {
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

		int rows = 0;
		Connection conn = GetConnection.getConnection();
		PrintWriter out = response.getWriter();

		String sql = "update tb_user set userName=? ,name = ?,userPhone = ?,workPlace=?,userEmail=?,passwd=?,userType=? where id=?";
		if (!(request.getParameter("passwd").toString().trim()).equals(request.getParameter("qpassword").toString().trim())) {
			rows = -1;
			response.getWriter().print(rows);
		} else {
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, request.getParameter("userName"));
				ps.setString(2, request.getParameter("name"));
				ps.setString(3, request.getParameter("phone"));
				ps.setString(4, request.getParameter("workPlace"));
				ps.setString(5, request.getParameter("email"));
				ps.setString(6, request.getParameter("passwd"));
				ps.setString(7, request.getParameter("userType"));
				ps.setString(8, request.getParameter("id"));

				rows = ps.executeUpdate();
				System.out.println(rows);
				out.print(rows);

				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				// out.print("“Ï≥£4£°");
				e.printStackTrace();
			}
		}
		//doGet(request, response);
	}

}
