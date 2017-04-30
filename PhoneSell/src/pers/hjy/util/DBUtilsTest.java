package pers.hjy.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Administrator 数据库访问工具
 */
public class DBUtilsTest {
	
	private static String url="jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	private static String user="hjy";
	private static String pwd="hjy123" ;
	private static String driver="oracle.jdbc.driver.OracleDriver";
	static{
		//初始化
		try {
			Class.forName(driver);
			System.out.println("开始尝试连接数据库！");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 执行增删改的sql语句
	 * 
	 * @param sql
	 * @return
	 */
	public static int execUpdate(String sql) {
		Connection conn = null;
		Statement stat = null;
		int rs = 0;
		try {
			conn = DriverManager.getConnection(url, user, pwd);
			stat = conn.createStatement();
			rs = stat.executeUpdate(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//保证两个对象都必须close
			try {
				stat.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	/**
	 * 执行查询的sql语句
	 * 
	 * @param sql
	 * @return
	 */
	public static List<Map<String, Object>> execQuery(String sql) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		System.out.println(url);
		try {
			conn = DriverManager.getConnection(url, user, pwd);
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			//获取元数据
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()) {
				HashMap<String,Object> row = new HashMap<String,Object>();
				for(int i=1; i<=rsmd.getColumnCount(); i++){
					row.put(rsmd.getColumnName(i), rs.getObject(i));
				}
				list.add(row);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//保证三个对象都必须close
			try {
				rs.close();
				stat.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static void main(String[] args) {
		List<Map<String,Object>> list = DBUtilsTest.execQuery("select * from student");
		System.out.println(list.toString().replaceAll("\\},\\s\\{", "},\r\n{"));
		int rs = DBUtilsTest.execUpdate("insert into student (name,age,sex,tid) values('小李',20,'m',13)" );
		System.out.println(rs);
	}
	

}
