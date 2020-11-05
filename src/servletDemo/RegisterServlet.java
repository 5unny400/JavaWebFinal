package servletDemo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GetConnection.GetConnection;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
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
		request.setCharacterEncoding("utf-8"); //1
		//response.setContentType("text/html;charset=utf-8");  //2
		response.setCharacterEncoding("utf-8");  //3 
		
		HttpSession s = request.getSession();
		s.setAttribute("name", request.getParameter("name"));
		s.setAttribute("userName", request.getParameter("userName"));
		s.setAttribute("phone", request.getParameter("phone"));
		s.setAttribute("workPlace", request.getParameter("workPlace"));
		s.setAttribute("email", request.getParameter("email"));
		s.setAttribute("passwd", request.getParameter("passwd"));
		s.setAttribute("userType", request.getParameter("userType"));
		
		String sql = "";
		ResultSet rs = null;
		GetConnection getConnection = new GetConnection();
		Connection conn = getConnection.getConnect();

		String userName =  request.getParameter("userName");
		sql = "select name from tb_useraccount where userName=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			rs = getConnection.query(ps);
			if (!rs.next()) { // ×¢²á³É¹¦£¡
				sql = "insert into tb_useraccount(name,userPhone,workPlace,userEmail,userName,passwd,userType) values(?,?,?,?,?,?,?)";
				PreparedStatement pre = conn.prepareStatement(sql);
				pre.setString(1, request.getParameter("name"));
				pre.setString(2, request.getParameter("phone"));
				pre.setString(3, request.getParameter("workPlace"));
				pre.setString(4, request.getParameter("email"));
				pre.setString(5, request.getParameter("userName"));
				pre.setString(6, request.getParameter("passwd"));
				pre.setString(7, request.getParameter("userType"));
				pre.executeUpdate();
				pre.close();
				ps.close();
				rs.close();
				request.getRequestDispatcher("RegistSuccess.jsp").forward(request, response);
			} else { // ×¢²áÊ§°Ü£¡
				request.getRequestDispatcher("RegistErr.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// out.print("Òì³££¡£¡");
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
