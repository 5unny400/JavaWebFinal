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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession s = request.getSession();
		int u = 0;

		if (request.getParameter("userPasswd") != null && !(request.getParameter("userPasswd").toString().trim()
				.equals((request.getParameter("userPasswd2")).toString().trim()))) { // 密码不同！
			out.print(400);
			System.out.print("提交的密码不一致！");
		} else {

			s.setAttribute("Name", request.getParameter("Name"));
			s.setAttribute("userName", request.getParameter("userName"));
			s.setAttribute("phone", request.getParameter("phone"));
			s.setAttribute("workPlace", request.getParameter("workPlace"));
			s.setAttribute("email", request.getParameter("email"));
			s.setAttribute("userPasswd", request.getParameter("userPasswd"));
			s.setAttribute("userPasswd2", request.getParameter("userPasswd2"));
			s.setAttribute("userType", request.getParameter("userType"));

			String sql = "";
			ResultSet rs = null;

			Connection conn = GetConnection.getConnection();

			String userName = request.getParameter("userName");
			sql = "select name from tb_user where userName=?";
			System.out.println(userName);
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, userName);
				rs = GetConnection.query(ps);
				if (!rs.next()) { // 没找到重名！

					if ( request.getParameter("userType") != null) { // 写入数据库，注册成功！
						sql = "insert into tb_user(name,userPhone,workPlace,userEmail,userName,passwd,userType) values(?,?,?,?,?,?,?)";
						PreparedStatement pre = conn.prepareStatement(sql);
						pre.setString(1, request.getParameter("Name"));
						pre.setString(2, request.getParameter("phone"));
						pre.setString(3, request.getParameter("workPlace"));
						pre.setString(4, request.getParameter("email"));
						pre.setString(5, request.getParameter("userName"));
						pre.setString(6, request.getParameter("userPasswd"));
						if(request.getParameter("userType").toString().trim().equals("学生")) {
							pre.setString(7,"1" );
						}else if(request.getParameter("userType").toString().trim().equals("教师")) {
							pre.setString(7,"2" );
						}else if(request.getParameter("userType").toString().trim().equals("管理员")) {
							pre.setString(7,"3" );
						}else {
							pre.setString(7,"-1" );
						}
						
						pre.executeUpdate();

						pre.close();
						ps.close();
						rs.close();
						u = 200;
						out.print(u);
						
					} else if (s.getAttribute("Name") == null) { // 该用户名可用！
						u = 201;
						out.print(u);
						System.out.print(u);
					}

				} else {// 注册失败，存在同名！
					u = 401;
					out.print(u);
					System.out.print(u);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*
		if (u==200) {
			request.getRequestDispatcher("RegistSuccess.jsp").forward(request, response);
		}
		*/
		// doGet(request, response);
	}
}
