package GetConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class GetConnection {
    // 创建一个数据库连接
    static Connection connection = null;
    // 创建编译语句对象
    static Statement stat =null;
    // 创建预编译语句对象
    static PreparedStatement ps = null;
    // 创建结果集对象
    static ResultSet rs1 = null;
    //更新的行数
    int rows ;
    //驱动名称
    private static final String driverName="com.mysql.cj.jdbc.Driver";
    //数据库的地址(通过端口和SID找到对应的数据库)
    private static final String URL="jdbc:mysql://localhost:3306/user_info?characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true";
    //数据库登录用户名
    private static final String userName="root";
    //数据库登录密码
    private static final String pwd="root";


    public static Connection getConnection() {
        try {
            //加载oracle驱动
            Class.forName(driverName);
            //通过驱动获取数据库的连接
            connection = DriverManager.getConnection(URL, userName, pwd);
            System.out.println("connected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static ResultSet query(PreparedStatement ps2) {
        // TODO Auto-generated method stub
        try {
            rs1 = ps2.executeQuery();
        }catch(SQLException e) {

        }
        return rs1;
    }

    public static ResultSet query(String sql) {
        try {
            //通过刚才的getConnection方法获得一个连接的对象。
            connection = getConnection();
            //向数据库中发送你的sql语句
            stat = connection.createStatement();
            //获得所查询的结果，返回的是Resultset对象
            rs1 = stat.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs1;
    }

    public int update(String sql){
        try {
            connection = getConnection();
            stat = connection.createStatement();
            rows = stat.executeUpdate(sql);
        }
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rows;
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

    public static int delete(PreparedStatement ps2) {
        // TODO Auto-generated method stub
        try {
            return ps2.executeUpdate();
        }catch(SQLException e) {
        }
        return 0;
    }

    public int delete(String sql){
        try {
            connection = getConnection();
            stat = connection.createStatement();
            rows = ps.executeUpdate(sql);
            return rows;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void close(){

        try {
            if(rs1!=null) {
                rs1.close();
            }
            if(stat!=null) {
                stat.close();
            }
            if(ps!=null) {
                ps.close();
            }
            if(connection!=null) {
                connection.close();
            }

        } catch (SQLException e) {
            // TODO: handle exception
        }
    }
}
