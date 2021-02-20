package com.operation.forms;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.operation.forms.Flight_Data;



import connection_builder.SqlOperation;

/**
 * Servlet implementation class Flight_List
 */
@WebServlet("/Flight_List")
public class Flight_List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Flight_List() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResultSet rs;
		String source=null;
		String destination =null;
		Date date= null;
		source= request.getParameter("source_city");
		destination= request.getParameter("dest_city");
		try {
			date= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		SqlOperation so= new SqlOperation();
		String qry1= "Select * from flight_details where source_city='"+source+"' and dest_city='"+destination+"'";
		int rowcount=0, col =0;
		rs=so.Searchdata(qry1);
		Flight_Data fd= new Flight_Data();
		try {
			col=rs.getMetaData().getColumnCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
			List<Flight_Data> al=new ArrayList<Flight_Data>();
		try {
			while(rs.next())
				{
				fd.setId(Integer.parseInt(rs.getString("id")));
				fd.setSource_city(rs.getString("source_city"));
				fd.setDest_city(rs.getString("dest_city"));
				fd.setDate(rs.getString("date"));
				fd.setFlight_name("flight_name");
				al.add(fd);
			}
			
			//sample console print test
			
			for(Flight_Data f:al) {
				
				System.out.print(f);
			}
			//sample console print test
			request.setAttribute("data_list", al);
			RequestDispatcher rd= request.getRequestDispatcher("Flight_details.jsp");
			rd.forward(request, response);
		}catch(SQLException se) {se.printStackTrace();}
		request.setAttribute("resultdata", al);
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
