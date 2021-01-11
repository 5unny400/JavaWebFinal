package servletDemo;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class SignInServlet
 */
@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignInServlet() {
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
	 * @return
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		String userName = request.getParameter("userName").trim();
		String userPasswd = request.getParameter("userPasswd").trim();

		// 便于管理页面使用用户名信息
		HttpSession s = request.getSession();
		s.setMaxInactiveInterval(600);
		s.setAttribute("userName", userName);
		s.setAttribute("passwd", userPasswd);
		

		String chkd[] = request.getParameterValues("remember"); // 记住用户名复选框状态
		if (chkd != null && chkd[0].equals("true")) {
			s.setAttribute("label", "true");
		} else {
			s.setAttribute("label", "false");
		}

		// 先连接数据库
		String sql = "";
		ResultSet rs = null;

		Connection conn = GetConnection.getConnection();

		sql = "select id from tb_user where userName =? and passwd = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, userPasswd);
			// ps.setString(3, userType);
			rs = GetConnection.query(ps);
			rs.next();
			out.print(rs.getRow());
			System.out.print(rs.getRow());

			out.close();
			ps.close();
			conn.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// doGet(request, response);
	}
}