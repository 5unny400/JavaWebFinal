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
import net.sf.json.JSONArray;



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
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<Person> listAll = new ArrayList<Person>();
		try {
			String searchtext = request.getParameter("search");
			String id = request.getParameter("id");
			String sql = "select * from tb_user";
			if(searchtext!=null&&!searchtext.equals(""))
			{
				sql =sql + " where userName like '%"+searchtext+"%' or name like '%"+searchtext+"%'";
			}
			if(id!=null&&!id.equals(""))
			{
				sql =sql + " where id="+id;
			}
			
			ResultSet rs = GetConnection.query(sql);
			
			while (rs.next()) {
				Person userinfo = new Person();
				
				userinfo.setId(rs.getString("id"));
				userinfo.setUserName(rs.getString("userName"));
				userinfo.setPasswd(rs.getString("passwd"));
				userinfo.setUserType(rs.getString("userType"));
				userinfo.setName(rs.getString("name"));
				userinfo.setEmail(rs.getString("userEmail"));
				userinfo.setWorkPlace(rs.getString("workPlace"));
				userinfo.setPhone(rs.getString("userPhone"));
				listAll.add(userinfo);
			}
			
			//request.setAttribute("list", list);
			rs.close();  
			GetConnection.close();  
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONArray jsonArray = JSONArray.fromObject(listAll);
		System.out.println(jsonArray);
		response.getWriter().print(jsonArray);
		
		//doGet(request, response);
	}

}
