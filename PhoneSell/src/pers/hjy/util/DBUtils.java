package pers.hjy.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Administrator 数据库访问工具
 */
public class DBUtils {
	
	private static String url ;
	private static String user ;
	private static String pwd ;
	private static String driver;
	public static void init(String url1 , String username,String password,String drivers){
		url = url1;
		user = username;
		pwd = password;
		driver = drivers;
		System.out.println("开始配置数据库：\nurl:"+url+"\nuser:"+user+"\npwd:"+pwd+"\ndriver"+driver);
		//初始化
		try {
			Class.forName(driver);
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
		System.out.println(new Date()+"执行增删改："+sql);
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
		System.out.println(new Date()+"查询："+sql);
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
		List<Map<String,Object>> list = DBUtils.execQuery("select * from student");
		System.out.println(list.toString().replaceAll("\\},\\s\\{", "},\r\n{"));
		int rs = DBUtils.execUpdate("insert into student (name,age,sex,tid) values('小李',20,'m',13)" );
		System.out.println(rs);
	}
	

}
