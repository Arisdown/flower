package com.flower.utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	// 创建DataSource用来连接数据
	public static ComboPooledDataSource db = new ComboPooledDataSource();
	public static Connection connection;
	public static PreparedStatement pstmt;
	public static ResultSet rs = null;
	private static ThreadLocal<Connection> tl=new ThreadLocal<>();
	// 获取连接对象
	public static Connection getConnection() throws SQLException {
		Connection conn = tl.get();
		if(conn==null){
			conn=db.getConnection();;
			//和当前线程绑�?
			tl.set(conn);
		}
		return conn;
	}

	// 关闭连接
	public static void close(Connection conn, PreparedStatement pstmt,
	                        ResultSet rs) {
		if(rs!=null){
			try{
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

	}
//	public  static List<Product> queryAll() throws Exception{
//		List<Product> list=new ArrayList<Product>();
//		connection=getConnection();
//		pstmt=connection.prepareStatement("select * from product");
//		rs=pstmt.executeQuery();
//		while(rs.next()){
//			Product product=new Product(rs.getInt("id"), rs.getString("name"),rs.getDouble("price"),rs.getString("img"), rs.getString("type"), rs.getString("introduce"));
//			list.add(product);
//		}
//		return list;
//	}
//	public static void insertPro(Product product) throws Exception{
//		String sql="insert product(id,name,price,img,type,introduce) value(?,?,?,?,?,?)";
//		connection=getConnection();
//		pstmt=connection.prepareStatement(sql);
//		pstmt.setInt(1, product.getId());
//		pstmt.setString(2, product.getNameString());
//		pstmt.setDouble(3, product.getPrice());
//		pstmt.setString(4, product.getImg());
//		pstmt.setString(5, product.getType());
//		pstmt.setString(6, product.getIntroduce());
//		pstmt.executeUpdate();
//	}
	//�?启事�?
		public static void startTransaction() throws SQLException{
			getConnection().setAutoCommit(false);
		}
		
		/**
		 * 事务提交且释放连�?
		 */
		public static void commitAndClose(){
			Connection conn = null;
			try {
				conn=getConnection();
				//事务提交
				conn.commit();
				//关闭资源
				conn.close();
				//解除版定
				tl.remove();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		/**
		 * 事务回滚且释放资�?
		 */
		public static void rollbackAndClose(){
			Connection conn = null;
			try {
				conn=getConnection();
				//事务回滚
				conn.rollback();
				//关闭资源
				conn.close();
				//解除版定
				tl.remove();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
