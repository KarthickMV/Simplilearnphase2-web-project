package com.operation.forms;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import connection_builder.SqlOperation;

/**
 * Servlet implementation class Login_Check
 */
@WebServlet("/Login_Check")
public class Login_Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw;
	String qry;
	SqlOperation so;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_Check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub+
		
		
		
		  String username; String password;
		  String data[] = new String[2];
		  username=request.getParameter("username"); password=
		  request.getParameter("password"); pw= response.getWriter();
		  //pw.write(username+"username and password"+password);
		  qry="Select id,type from user_reg where Username='"+username+"'and Password='"
		  +password+"'"; 
		  System.out.println("Query for login is:" + qry); so= new
		  SqlOperation(); 
		  int id=0;String type=null;
		  data=so.check_login(qry);
		  id=Integer.parseInt(data[0]);
		  type=data[1];
		  if(id==0) {
		  response.sendRedirect("index.jsp?success=1"); }else { createSession(id,
		  request, response); response.sendRedirect("Flight_Booking.jsp?auth="+type); }
		 
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void createSession(int id, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			HttpSession session= request.getSession();
			session.setAttribute("user_id", id);
			System.out.println("Session Created :" + session.toString());
			
		} catch(Exception e){e.printStackTrace();}
				
	}


}
