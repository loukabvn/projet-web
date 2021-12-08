package model;

import java.util.List;

/*
 * Classe des responsables de maintenance
 */
public class Maintainer extends User {
	
	private List<Integer> ressourceList;
	
	public Maintainer(String username, String email, String password) {
		super(username, email, password);
		ressourceList = null;
	}
	
	public List<Integer> getRessourceList() {
		return ressourceList;
	}
	
	public void setRessourcesList(List<Integer> ressources) {
		if (ressources == null) {
			throw new AssertionError("Invalid arguments !");
		}
		this.ressourceList = ressources;
	}
}
