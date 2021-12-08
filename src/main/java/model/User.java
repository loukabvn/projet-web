package model;

import java.util.regex.Pattern;

/*
 * Classe des utilisateurs
 */
public class User {
	
	private static final String EMAIL_REGEX =
			"^[a-zA-Z0-9_+&*-]+(?:\\."+
            "[a-zA-Z0-9_+&*-]+)*@" +
            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
            "A-Z]{2,7}$";
	
	private int id;
	private String username;
	private String email;
	private String password;
	
	public User(String username, String email, String password) {
		checkEmail(email);
		this.id = -1;
		this.username = username;
		this.email = email;
		this.password = password;
	}

	public int getID() {
		return id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setID(int id) {
		this.id = id;
	}
	
	public void setUsername(String newName) {
		this.username = newName;
	}
	
	public void setEmail(String email) {
		checkEmail(email);
		this.email = email;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	// Private methods
	
	private void checkEmail(String email) {
		Pattern pat = Pattern.compile(EMAIL_REGEX);
		if (email == null || !pat.matcher(email).matches()) {
			throw new AssertionError("Invalid email !");
		}
	}
}

