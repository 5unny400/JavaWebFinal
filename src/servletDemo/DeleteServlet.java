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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
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
		response.setCharacterEncoding("utf-8"); 
		String id = (String)request.getParameter("id");
		
		Connection conn = GetConnection.getConnection();
		PrintWriter out=response.getWriter();
		int rows = 0;

		String sql = "delete from tb_user where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rows = ps.executeUpdate();
			System.out.println(rows);
			out.print(rows);
			/*
			if(rs <= 0) {
				out.print("É¾³ýÊ§°Ü£¡");
			}else {
				out.print("<script language='javascript'>alert('É¾³ý³É¹¦£¡');</script>");
			}*/
			conn.close();
			ps.close();
			GetConnection.close();
			//response.sendRedirect("FindServlet");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//out.print("Òì³£4£¡");
			e.printStackTrace();
		}
		//doGet(request, response);
	}

}
