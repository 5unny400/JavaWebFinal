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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); // 1

		response.setCharacterEncoding("utf-8"); // 3

		HttpSession s = request.getSession();
		s.setMaxInactiveInterval(600);
		s.setAttribute("userName", request.getParameter("userName"));
		s.setAttribute("passwd", request.getParameter("passwd"));
		
		String chkd[] = request.getParameterValues("remember"); // 记住用户名复选框状态
		if (chkd != null && chkd[0].equals("true")) {
			s.setAttribute("labelj", "true");
		} else {
			s.setAttribute("labelj", "false");
		}

		// 先连接数据库
		String sql = "";
		ResultSet rs = null;
		GetConnection getConnection = new GetConnection();
		Connection conn = getConnection.getConnect();

		String userName = request.getParameter("userName");
		String userPasswd = request.getParameter("passwd");
		sql = "select name from tb_useraccount where userName =? and passwd = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, userPasswd);
			rs = getConnection.query(ps);

			if (!rs.next()) { // 登录失败！

				request.getRequestDispatcher("SignErr.jsp").forward(request, response);
			} else { // 登陆成功！

				request.getRequestDispatcher("SignInSuccess.jsp").forward(request, response);
			}
			ps.close();
			conn.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}

		doGet(request, response);
	}

}
