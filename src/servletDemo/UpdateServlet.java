package servletDemo;

import java.io.IOException;
import java.io.PrintWriter;
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
		response.setContentType("text/html;charset=utf-8"); // 2
		response.setCharacterEncoding("utf-8"); // 3

		GetConnection getConnection = new GetConnection();
		Connection conn = getConnection.getConnect();

		PrintWriter out = response.getWriter();

		String userName = request.getParameter("userName");
		String changedName = request.getParameter("changedName");

		/*
		 * String name = request.getParameter("name"); String userPhone =
		 * request.getParameter("phone"); String workPlace =
		 * request.getParameter("workPlace"); String userEmail =
		 * request.getParameter("email");
		 * 
		 * String passwd = request.getParameter("passwd"); String userType =
		 * request.getParameter("userType");
		 */
		String sql = "update tb_useraccount set userName=? where userName=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, changedName);
			ps.setString(2, userName);

			int rs = ps.executeUpdate();
			if (rs == 0) {
				out.print("<script language='javascript'>alert('修改失败！');</script>");
			} else {
				out.print("<script language='javascript'>alert('修改成功！');</script>");
			}

			ps.close();
			conn.close();

			response.sendRedirect("FindServlet");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// out.print("异常4！");
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
