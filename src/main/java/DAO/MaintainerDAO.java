package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import DBUtils.Database;
import model.Maintainer;

public class MaintainerDAO {
	
	private static final String EMAIL_REGEX =
			"^[a-zA-Z0-9_+&*-]+(?:\\."+
            "[a-zA-Z0-9_+&*-]+)*@" +
            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
            "A-Z]{2,7}$";
	
	private static final String TABLE_NAME		= "Maintainer";
	
	private static final String ID_FIELD 		= "MainId";
	private static final String USERNAME_FIELD	= "MainName";
	private static final String EMAIL_FIELD 	= "MainMail";
	private static final String PASSWORD_FIELD	= "MainPassword";

	public static Maintainer get(String email) {
		checkEmail(email);
		String query = "SELECT * FROM " + TABLE_NAME
				+ " WHERE " + EMAIL_FIELD + " = " + email;
		Maintainer maintainer = null;
		try {
			ResultSet res = Database.execQuery(query);
			if (res.next()) {
				maintainer = new Maintainer(res.getString(USERNAME_FIELD),
						res.getString(EMAIL_FIELD), res.getString(PASSWORD_FIELD));
				maintainer.setID(res.getInt(ID_FIELD));
				List<Integer> list = RessourceDAO.getList(maintainer.getID());
				if (list == null) {
					maintainer = null;
				} else {
					maintainer.setRessourcesList(list);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			maintainer = null;
		}
		return maintainer;
	}
	
	public static List<Integer> getList(int adminID) {
		String query = "SELECT " + ID_FIELD + " FROM " + TABLE_NAME;
		List<Integer> list = new ArrayList<Integer>();
		try {
			ResultSet res = Database.execQuery(query);
			while (res.next()) {
				list.add(res.getInt(ID_FIELD));
			}
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	public static void insert(Maintainer maintainer) {
		if (maintainer == null) {
			throw new AssertionError("Invalid parameters");
		}
		String check = "SELECT * FROM " + TABLE_NAME
				+ " WHERE " + EMAIL_FIELD + " = " + maintainer.getEmail();
		String query = "INSERT INTO " + TABLE_NAME + "("
				+ USERNAME_FIELD + "," + EMAIL_FIELD + "," + PASSWORD_FIELD
				+ ") VALUES(" + maintainer.getUsername() + ","
				+ maintainer.getEmail() + "," + maintainer.getPassword() + ");";
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
	
	public static void update(Maintainer maintainer) {
		if (maintainer == null) {
			throw new AssertionError("Invalid parameters");
		}
		String query = "UPDATE " + TABLE_NAME
				+ " SET " + USERNAME_FIELD + " = " + maintainer.getUsername() + ","
				+ EMAIL_FIELD + " = " + maintainer.getEmail() + ","
				+ PASSWORD_FIELD + " = " + maintainer.getPassword() + " "
				+ "WHERE " + ID_FIELD + " = "+ maintainer.getID() + ";";
		try {
			Database.execUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void delete(Maintainer maintainer) {
		if (maintainer == null) {
			throw new AssertionError("Invalid parameters");
		}
		String query = "DELETE FROM " + TABLE_NAME
				+ " WHERE " + ID_FIELD + " = " + maintainer.getID() + ";";
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
