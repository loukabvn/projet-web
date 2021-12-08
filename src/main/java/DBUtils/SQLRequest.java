package DBUtils;

public class SQLRequest {
	
	public static final String SELECT	= "SELECT ";
	public static final String FROM		= " FROM ";
	public static final String INSERT 	= "INSERT INTO ";
	public static final String UPDATE 	= "UPDATE ";
	public static final String ALL 		= "*";
	public static final String WHERE 	= " WHERE ";
	
	public static String selectAllFrom(String table) {
		return SELECT + ALL + FROM + table;
	}
	
	public static String selectFrom(String table, String... args) {
		if (args.length == 0) {
			throw new AssertionError("Invalid arguments !");
		}
		StringBuffer query = new StringBuffer(SELECT);
		for (int i = 0; i < args.length; i++) {
			query.append(args[i]);
			if (i < args.length - 1) {
				query.append(',');
			}
		}
		query.append(FROM + table);
		return query.toString();
	}
	
	public static String where(String condition) {
		return WHERE + condition;
	}
}
