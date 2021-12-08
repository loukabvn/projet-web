package Parser;

import java.util.*;
import java.util.regex.*;

public class ParserAttribute {

	private Map<String, String> attributes;

	// constructor
	public ParserAttribute(String query) {
		this.attributes = parseQuery(query);
		if (this.attributes == null) {
			throw new RuntimeException("Failed to parse query");
		} 
	}

	// Getters
	public Enumeration<String> getAttributesNames() {
		return Collections.enumeration(new ArrayList<String>(this.attributes.keySet()));
	}

	public String getAttribute(String attrName) {
		return this.attributes.get(attrName);
	}

	// tools

	private Map<String, String> parseQuery(String query) {
		Map<String, String> m = new TreeMap<String, String>();
		if (m != null) {
		    Pattern pat = Pattern.compile("([^&=]+)=([^&]*)");
		    Matcher matcher = pat.matcher(query);
		    while (matcher.find()) {
		        m.put(matcher.group(1), matcher.group(2));
		    }
		}
		return m;
	}

}
