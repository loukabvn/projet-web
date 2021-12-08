package DAO;

import java.sql.SQLException;
import java.util.regex.Pattern;
import java.sql.ResultSet;
import java.util.List;

import DBUtils.Database;

import model.Admin;

public class AdminDAO {
	
	private static final String EMAIL_REGEX =
			"^[a-zA-Z0-9_+&*-]+(?:\\."+
            "[a-zA-Z0-9_+&*-]+)*@" +
            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
            "A-Z]{2,7}$";
	
	private static final String TABLE_NAME		= "Admin";
	
	private static final String ID_FIELD 		= "id";
	private static final String USERNAME_FIELD	= "username";
	private static final String EMAIL_FIELD 	= "email";
	private static final String PASSWORD_FIELD	= "password";
	
	public static Admin get(String email) {
		checkEmail(email);
		String query = "SELECT * FROM " + TABLE_NAME
				+ " WHERE " + EMAIL_FIELD + " = " + email;
		
		Admin admin = null;
		List<Integer> l;
		try {
			
			ResultSet res = Database.execQuery(query);
			res.next();
			
			admin = new Admin(res.getString(USERNAME_FIELD),
					res.getString(EMAIL_FIELD), res.getString(PASSWORD_FIELD));
			
			admin.setID(res.getInt(ID_FIELD));
			
			l = MaintainerDAO.getList(admin.getID());
			if (l == null) {
				admin = null;
			} else {
				admin.setMaintainersList(l);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			admin = null;
		}
		return admin;
	}

	public static void insert(Admin admin) {
		if (admin == null) {
			throw new AssertionError("Invalid parameters");
		}
		String check = "SELECT * FROM " + TABLE_NAME
				+ " WHERE " + EMAIL_FIELD + " = " + admin.getEmail();
		
		String query = "INSERT INTO " + TABLE_NAME + "("
				+ USERNAME_FIELD + "," + EMAIL_FIELD + "," + PASSWORD_FIELD
				+ ") VALUES(" + admin.getUsername() + ","
				+ admin.getEmail() + "," + admin.getPassword() + ");";
		try {
			
			ResultSet res = Database.execQuery(check);
			if (res.next()) {
				throw new AssertionError("This email is already in the database");
			}
			
			Database.execUpdate(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void update(Admin admin) {
		if (admin == null) {
			throw new AssertionError("Invalid parameters");
		}
		
		String query = "UPDATE " + TABLE_NAME
				+ " SET " + USERNAME_FIELD + " = " + admin.getUsername() + ","
				+ EMAIL_FIELD + " = " + admin.getEmail() + ","
				+ PASSWORD_FIELD + " = " + admin.getPassword() + " "
				+ "WHERE " + ID_FIELD + " = "+ admin.getID() + ";";
		try {
			Database.execUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void delete(Admin admin) {
		if (admin == null) {
			throw new AssertionError("Invalid parameters");
		}
		String query = "DELETE FROM " + TABLE_NAME
				+ " WHERE " + ID_FIELD + " = " + admin.getID() + ";";
		
		try {
			Database.execUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Private methods
	
	private static void checkEmail(String email) {
		Pattern pat = Pattern.compile(EMAIL_REGEX);
		if (email == null || !pat.matcher(email).matches()) {
			throw new AssertionError("Invalid email !");
		}
	}
}
