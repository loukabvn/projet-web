package DAO;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import DBUtils.Database;

import model.Anomaly;

public class AnomalyDAO {

	private static final String TABLE_NAME = "Anomaly";

	private static final String ID_FIELD = "AnomalyId";
	private static final String DESCRIPTION_FIELD = "AnomalyDesc";
	private static final String STATUS_FIELD = "AnomalyStatus";
	private static final String RESSOURCE_ID_FIELD = "AnomalyRes";

	public static Anomaly get(int AnomalyId) {
		String query = "SELECT * FROM " + TABLE_NAME + " WHERE " + ID_FIELD + " = " + AnomalyId;

		Anomaly anomaly = null;

		try {

			ResultSet res = Database.execQuery(query);
			if (res.next()) {
				anomaly = new Anomaly(res.getString(DESCRIPTION_FIELD), res.getInt(RESSOURCE_ID_FIELD));
			}

		} catch (SQLException e) {
			e.printStackTrace();
			anomaly = null;
		}
		return anomaly;
	}

	public static List<Integer> getList(int RessourceId) {
		String query = "SELECT * FROM " + TABLE_NAME + " WHERE " + RESSOURCE_ID_FIELD + " = " + RessourceId;

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

	public static void insert(Anomaly anomaly) {
		if (anomaly == null) {
			throw new AssertionError("Invalid parameters");
		}

		String query = "INSERT INTO " + TABLE_NAME + "(" + DESCRIPTION_FIELD + "," + STATUS_FIELD + ","
				+ RESSOURCE_ID_FIELD + ") VALUES(" + anomaly.getDescription() + "," + anomaly.getStatus() + ","
				+ anomaly.getRessource() + ");";
		try {

			Database.execUpdate(query);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void update(Anomaly anomaly) {
		if (anomaly == null) {
			throw new AssertionError("Invalid parameters");
		}

		String query = "UPDATE " + TABLE_NAME + " SET " + DESCRIPTION_FIELD + " = " + anomaly.getDescription() + ","
				+ STATUS_FIELD + " = " + anomaly.getStatus() + "," + RESSOURCE_ID_FIELD + " = " + anomaly.getRessource()
				+ " " + "WHERE " + ID_FIELD + " = " + anomaly.getID() + ";";
		try {
			Database.execUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void delete(Anomaly anomaly) {
		if (anomaly == null) {
			throw new AssertionError("Invalid parameters");
		}

		String query = "DELETE FROM " + TABLE_NAME + " WHERE " + ID_FIELD + " = " + anomaly.getID() + ";";

		try {
			Database.execUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
