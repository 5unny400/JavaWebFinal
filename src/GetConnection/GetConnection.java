package GetConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GetConnection {
	 // ����һ�����ݿ�����
    Connection connection = null;
    // ��������������
    Statement stat =null;
    // ����Ԥ����������
    PreparedStatement pstat = null;
    // �������������
    ResultSet rs1 = null;
    int rs2 ;
  //��������
    private static final String driverName="com.mysql.cj.jdbc.Driver";
    //���ݿ�ĵ�ַ(ͨ���˿ں�SID�ҵ���Ӧ�����ݿ�)
    private static final String URL="jdbc:mysql://localhost:3306/user_info?characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true";
    //���ݿ��¼�û���
    private static final String userName="root"; 
    //���ݿ��¼����
    private static final String pwd="root";
    
    
    public Connection getConnect(){
        try {
            //����oracle����
            Class.forName(driverName);
            //ͨ��������ȡ���ݿ������
            connection = DriverManager.getConnection(URL,userName,pwd);
            System.out.println("���ӳɹ�");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    
    public ResultSet query(PreparedStatement ps){
        try {
        	
            /*//ͨ���ղŵ�getConnection�������һ�����ӵĶ���
            connection = getConnect();
            //�����ݿ��з������sql���
            stat = connection.createStatement();*/
            //�������ѯ�Ľ�������ص���Resultset����
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
