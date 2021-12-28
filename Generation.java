import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Generation {

	// Size of the salt
	private static final int SALT_LENGTH = 32;
	// Regular expression to check the strength of password
	private static final String REGEXP =
			"^(?=.*[A-Z])"		// at least one uppercase
			+ "(?=.*[!@#$&*])"	// at least one special character
			+ "(?=.*[0-9])"		// at least one number
			+ "(?=.*[a-z])"		// at least one lowercase
			+ ".{8,}$";		// at least 8 characters
	
	// Verify the password
	public static boolean verifyPassword(String refPassword, String refSalt,
			String toCheck) {
		String computedPassword = cookPassword(refSalt, toCheck);
		return refPassword.equals(computedPassword);
	}
	
	// Check if password if strong enough.
	public static boolean checkPasswordStrength(String password) {
		Pattern p = Pattern.compile(REGEXP);
		return password != null && p.matcher(password).matches();
	}
	
	public static String cookPassword(String salt, String password) {
		String newPassword = null;
		// check for password strength 
		if (checkPasswordStrength(password)) {
			try {
				// Create an instance of MessageDigest to hash password
				// with SHA-256
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				Encoder encoder = Base64.getUrlEncoder();
				Decoder decoder = Base64.getUrlDecoder();
				// compute hashed password
				md.update(decoder.decode(salt));
				byte[] bytes = md.digest(password.getBytes(StandardCharsets.UTF_8));
				// Encode into string value
				newPassword = encoder.encodeToString(bytes);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		// return hashed password or null if an error occured
		return newPassword;
	}
	
	// Generate salt for storage of user's passwords.
	public static String generateSalt() {
		// Create a SecureRandom object (Java CSPRNG)
		SecureRandom sr = new SecureRandom();
    	byte b[] = new byte[SALT_LENGTH];
    	// Generate next SALT_LENGTH bytes in b
    	sr.nextBytes(b);
    	assert(b.length == SALT_LENGTH);
    	// Encode into string value
    	Encoder encoder = Base64.getUrlEncoder();
    	return encoder.encodeToString(b);
	}
	
	public static void main(String[] args) {
        if (args[0].equals("salt")) {
            System.out.print(generateSalt());
        }
        if (args[0].equals("cook")) {
            String salt = args[1];
            String passwd = args[2];
            System.out.print(cookPassword(salt, passwd));
        }
	}
}
