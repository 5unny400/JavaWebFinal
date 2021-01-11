package GetConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class GetConnection {
    // ����һ�����ݿ�����
    static Connection connection = null;
    // ��������������
    static Statement stat =null;
    // ����Ԥ����������
    static PreparedStatement ps = null;
    // �������������
    static ResultSet rs1 = null;
    //���µ�����
    int rows ;
    //��������
    private static final String driverName="com.mysql.cj.jdbc.Driver";
    //���ݿ�ĵ�ַ(ͨ���˿ں�SID�ҵ���Ӧ�����ݿ�)
    private static final String URL="jdbc:mysql://localhost:3306/user_info?characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true";
    //���ݿ��¼�û���
    private static final String userName="root";
    //���ݿ��¼����
    private static final String pwd="root";


    public static Connection getConnection() {
        try {
            //����oracle����
            Class.forName(driverName);
            //ͨ��������ȡ���ݿ������
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
            //ͨ���ղŵ�getConnection�������һ�����ӵĶ���
            connection = getConnection();
            //�����ݿ��з������sql���
            stat = connection.createStatement();
            //�������ѯ�Ľ�������ص���Resultset����
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
