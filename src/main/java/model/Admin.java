package model;

import java.util.List;

/*
 * Classe des administrateurs
 */
public class Admin extends User {
	
	private List<Integer> maintainersList;
	
	public Admin(String username, String email, String password) {
		super(username, email, password);
		maintainersList = null;
	}
	
	public List<Integer> getMaintainersList() {
		return maintainersList;
	}
	
	public void setMaintainersList(List<Integer> maintainers) {
		if (maintainers == null) {
			throw new AssertionError("Invalid arguments !");
		}
		this.maintainersList = maintainers;
	}
}