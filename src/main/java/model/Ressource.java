package model;

import java.util.List;

/*
 * Classe des ressources
 */
public class Ressource {

	private int id;
	private int maintainerId;
	private String location;
	private String description;
	private List<Anomaly> anomalyList;
	
	public Ressource(String location, String description,
			int maintainerId) {
		if (location == null || description == null) {
			throw new AssertionError("Invalid arguments !");
		}
		this.id = -1;
		this.maintainerId = maintainerId;
		this.location = location;
		this.description = description;
		this.anomalyList = null;
	}
	
	// Getters
	
	public int getID() {
		return id;
	}
	
	public int getMaintainer() {
		return maintainerId;
	}
	
	public String getLocation() {
		return location;
	}
	
	public String getDescription() {
		return description;
	}
	
	public List<Anomaly> getAnomalyList() {
		return anomalyList;
	}
	
	// Setters
	
	public void setMaintainer(int newMaintainerId) {
		this.maintainerId = newMaintainerId;
	}
	
	public void setLocation(String newLocation) {
		if (newLocation == null) {
			throw new AssertionError("A ressource need a valid location !");
		}
		this.location = newLocation;
	}
	
	public void setDescription(String newDescription) {
		if (newDescription == null) {
			throw new AssertionError("A ressource need a valid description !");
		}
		this.description = newDescription;
	}
	
	public void setAnomalyList(List<Anomaly> anomalies) {
		if (anomalies == null) {
			throw new AssertionError("Invalid arguments !");
		}
		this.anomalyList = anomalies;
	}
}