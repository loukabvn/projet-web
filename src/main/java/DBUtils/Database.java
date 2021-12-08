package DBUtils;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;

public class Database {
	
	private static final String URL = "jdbc:mysql://localhost:3306/projet";
	private static final String DEFAULT_USERNAME = "projet";
	private static final String DEFAULT_PASSWORD = "tejorp";
	
	public static Connection getConnection() throws SQLException {
		Connection connection = null;
		connection = DriverManager.getConnection(URL, DEFAULT_USERNAME,
					DEFAULT_PASSWORD);
		return connection;
	}
	
	public static Connection getConnection(String username, String password)
			throws SQLException {
		Connection connection = null;
		connection = DriverManager.getConnection(URL, username, password);
		return connection;
	}
	
	public static ResultSet execQuery(String query) throws SQLException {
		ResultSet res = null;
		Connection db = Database.getConnection();
		PreparedStatement stmt = db.prepareStatement(query);
		res = stmt.executeQuery(query);
		return res;
	}
	
	public static void execUpdate(String query) throws SQLException {
		Connection db = Database.getConnection();
		PreparedStatement stmt = db.prepareStatement(query);
		stmt.executeUpdate(query);
	}
}