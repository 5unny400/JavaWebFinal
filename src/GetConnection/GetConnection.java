package GetConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GetConnection {
	 // 创建一个数据库连接
    Connection connection = null;
    // 创建编译语句对象
    Statement stat =null;
    // 创建预编译语句对象
    PreparedStatement pstat = null;
    // 创建结果集对象
    ResultSet rs1 = null;
    int rs2 ;
  //驱动名称
    private static final String driverName="com.mysql.cj.jdbc.Driver";
    //数据库的地址(通过端口和SID找到对应的数据库)
    private static final String URL="jdbc:mysql://localhost:3306/user_info?characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true";
    //数据库登录用户名
    private static final String userName="root"; 
    //数据库登录密码
    private static final String pwd="root";
    
    
    public Connection getConnect(){
        try {
            //加载oracle驱动
            Class.forName(driverName);
            //通过驱动获取数据库的连接
            connection = DriverManager.getConnection(URL,userName,pwd);
            System.out.println("连接成功");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    
    public ResultSet query(PreparedStatement ps){
        try {
        	
            /*//通过刚才的getConnection方法获得一个连接的对象。
            connection = getConnect();
            //向数据库中发送你的sql语句
            stat = connection.createStatement();*/
            //获得所查询的结果，返回的是Resultset对象
            rs1 = ps.executeQuery();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs1;
    }
    
    public int update(String sql){
        try {
            connection = getConnect();
            stat = connection.createStatement();
            rs2 = stat.executeUpdate(sql);  
        } 
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs2;
    }
    
    public int update(PreparedStatement ps){
    	int x = 0;
        try {
            x = ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
		return x;
    }
    
    public int delete(PreparedStatement ps){
        try {
            
            rs2 = ps.executeUpdate();
            return rs2;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }
    
    public void close(){

        try {
            if(rs1!=null) {
                rs1.close();
            }
            if(stat!=null) {
                rs1.close();
            }
            if(pstat!=null) {
                rs1.close();
            }
            if(connection!=null) {
                rs1.close();
            }

        } catch (SQLException e) {
            // TODO: handle exception
        }
    }

    
    
}
