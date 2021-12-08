package model;

/*
 * Classe des anomalies
 */
public class Anomaly {

	private int id;
	private int ressourceId;
	private String description; 
	private Status state;
	
	public Anomaly(String description, int ressourceId) {
		if (description == null) {
			throw new AssertionError("Invalid arguments !");
		}
		this.id = -1;
		this.description = description;
		this.state = Status.PENDING;
		this.ressourceId = ressourceId;
	}
	
	// Getters
	
	public int getID() {
		return this.id;
	}
	
	public int getRessource() {
		return this.ressourceId;
	}
	
	public int getStatus() {
		return this.state.getIntegerCode();
	}
	
	public String getDescription() {
		return this.description;
	}
	
	// Setters
	
	public void setRessource(int newRessourceId) {
		this.ressourceId = newRessourceId;
	}
	
	public void setStatus(int integerCode) {
		boolean valid = false;
		for (Status s : Status.values()) {
			if (s.getIntegerCode() == integerCode) {
				this.state = s;
				valid = true;
			}
		}
		if (!valid) {
			throw new AssertionError("Invalid arguments !");
		}
	}
	
	public void setDescription(String newDescription) {
		if (newDescription == null) {
			throw new AssertionError("Invalid arguments !");
		}
		this.description = newDescription;
	}
	
	private enum Status {
		
	    PENDING(0),
	    RESOLVED(1);

	    private final int state; 
	    
	    Status(int state) {
	    	this.state = state;
	    }
	    
	    public int getIntegerCode() {
	    	return this.state;
	    }
	}
}

