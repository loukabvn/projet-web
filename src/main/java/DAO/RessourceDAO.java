package DAO;

import model.Ressource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBUtils.Database;

public class RessourceDAO {

	private static final String TABLE_NAME = "Ressource";

	private static final String ID_FIELD = "ResId";
	private static final String DESCRIPTION_FIELD = "ResDesc";
	private static final String LOCATION_FIELD = "ResLocation";
	private static final String MAINTAINER_ID_FIELD = "ResMaintainer";

	public static Ressource get(int ressourceId) {
		String query = "SELECT * FROM " + TABLE_NAME + " WHERE " + ID_FIELD + " = " + ressourceId;

		Ressource ressource = null;

		try {

			ResultSet res = Database.execQuery(query);
			if (res.next()) {
				ressource = new Ressource(res.getString(LOCATION_FIELD), res.getString(DESCRIPTION_FIELD),
						res.getInt(MAINTAINER_ID_FIELD));
			}

		} catch (SQLException e) {
			e.printStackTrace();
			ressource = null;
		}
		return ressource;
	}

	public static List<Integer> getList(int MaintainerId) {
		String query = "SELECT * FROM " + TABLE_NAME + " WHERE " + MAINTAINER_ID_FIELD + " = " + MaintainerId;

		List<Integer> l = new ArrayList<Integer>();
		try {
			ResultSet res = Database.execQuery(query);
			while (res.next()) {
				l.add(res.getInt(ID_FIELD));
			}

		} catch (SQLException e) {
			e.printStackTrace();
			l = null;
		}
		return l;
	}

	public static void insert(Ressource ressource) {
		if (ressource == null) {
			throw new AssertionError("Invalid parameters");
		}

		String query = "INSERT INTO " + TABLE_NAME + "(" + DESCRIPTION_FIELD + "," + LOCATION_FIELD + ","
				+ MAINTAINER_ID_FIELD + ") VALUES(" + ressource.getDescription() + "," + ressource.getLocation() + ","
				+ ressource.getMaintainer() + ");";
		try {

			Database.execUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void update(Ressource ressource) {
		if (ressource == null) {
			throw new AssertionError("Invalid parameters");
		}

		String query = "UPDATE " + TABLE_NAME + " SET " + DESCRIPTION_FIELD + " = " + ressource.getDescription() + ","
				+ LOCATION_FIELD + " = " + ressource.getLocation() + "," + MAINTAINER_ID_FIELD + " = "
				+ ressource.getMaintainer() + " " + "WHERE " + ID_FIELD + " = " + ressource.getID() + ";";
		try {
			Database.execUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void delete(Ressource ressource) {
		if (ressource == null) {
			throw new AssertionError("Invalid parameters");
		}

		String query = "DELETE FROM " + TABLE_NAME + " WHERE " + ID_FIELD + " = " + ressource.getID() + ";";

		try {
			Database.execUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
