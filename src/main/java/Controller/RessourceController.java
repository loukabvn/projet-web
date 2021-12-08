package Controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Parser.ParserAttribute;

import java.util.*;

public class RessourceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Controller
	public RessourceController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("\nNew HTTP request recieved");

		System.out.print("\ntarget: ");
		System.out.println(request.getRequestURI());
		System.out.println(request.getQueryString());
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/ressource.jsp");
		if (requestDispatcher != null) {
			requestDispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
