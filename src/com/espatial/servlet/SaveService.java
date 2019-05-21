package com.espatial.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.espatial.model.Service;

/**
 * Servlet implementation class SaveService
 */
@WebServlet("/SaveService")
public class SaveService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveService() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer action = Integer.parseInt(request.getParameter("action"));
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		switch (action) {
		case Service.INSERT:
			if (checkService(id)) {
				request.setAttribute("messageError", "This ID already exists. Please choose another one.");
			} else {
				includeService(id, title, text);
				request.setAttribute("message", "Service included Successfully");
			}
			break;

		case Service.UPDATE:
			updateService(id, title, text);
			request.setAttribute("message", "Service updated Successfully");
			break;
			
		case Service.DELETE:
			deleteService(id);
			request.setAttribute("message", "Service deleted Successfully");
			break;
			
		default:
			request.setAttribute("messageError", "An Error occured while attenpting to save the Service. Please try again.");
			break;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/servicesJSP/index.jsp");
		dispatcher.forward(request, response );
		
	}
	
	private Statement getConnection() {
	  try {
	    Class.forName("com.mysql.jdbc.Driver");  
	    String url="jdbc:mysql://localhost:3306/espatial?useSSL=false";
	    Connection connection = DriverManager.getConnection(url, "admin", "admin");  
	    return connection.createStatement();
	  }
	  catch(Exception e)
	  {
	    System.out.println("Could not connect");
	    return null;
	  }		
	}
	
	private boolean checkService(String id) {
		try {
			String strQuery = "select * from services where id = '" + id + "'";
			ResultSet rs = getConnection().executeQuery(strQuery);
			return rs.next();			
		} catch (Exception e) {
			return false;
		}
	}

	private void includeService(String id, String title, String text) {
		try {
			String strQuery = "insert into services values ('" + id + "', '" + title + "', '" + text + "')";
			Statement st = getConnection();
			st.executeUpdate(strQuery);
			st.getConnection().commit();
			st.close();
		} catch (Exception e) {
		}
	}

	private void updateService(String id, String title, String text) {
		try {
			String strQuery = "update services set title = '" + title + "', text = '" + text + "' where id = '" + id + "'";
			Statement st = getConnection();
			st.executeUpdate(strQuery);
			st.getConnection().commit();
			st.close();
			} catch (Exception e) {
		}
	}
	
	private void deleteService(String id) {
		try {
			String strQuery = "delete from services where id = '" + id + "'";
			Statement st = getConnection();
			st.executeUpdate(strQuery);
			st.getConnection().commit();
			st.close();
			} catch (Exception e) {
		}
	}	
}
