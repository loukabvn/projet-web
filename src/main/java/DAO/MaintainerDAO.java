package DAO;

import java.util.List;

import model.Maintainer;

public class MaintainerDAO {

	public static Maintainer get(String email)  {
		return new Maintainer(null, null, null);
	}
	
	public static List<Integer> getList(int AdminId) {
		return null;
	}

	public static int insert(Maintainer maintainer) {
		return 0;
	}
	
	public static int update(Maintainer maintainer) {
		return 0;
	}
	
	public static int delete(Maintainer maintainer) {
		return 0;
	}
}
