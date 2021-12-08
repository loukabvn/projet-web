package Controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Parser.ParserAttribute;

import java.util.*;

public class PanelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Controller
	public PanelController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("\nNew HTTP request recieved");
		
		System.out.print("\ntarget: ");
		System.out.println(request.getRequestURI());
		System.out.println(request.getQueryString());
		
		ParserAttribute parser = new ParserAttribute(request.getQueryString());
		Enumeration<String> attributes = parser.getAttributesNames();
        while(attributes.hasMoreElements())
        {
            String attName = attributes.nextElement();
            System.out.print(attName+": ");
            System.out.println(parser.getAttribute(attName));          
        }
        
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/controlPanel/maintainer/maintainerPanel.jsp");
		if (requestDispatcher != null) {
			requestDispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
