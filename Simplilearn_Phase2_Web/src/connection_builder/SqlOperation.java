package connection_builder;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SqlOperation {
	
	Connection con;
	Statement stmt;
	ResultSet rs;
	int log=0;
	
	public int insertData(String qry) {
		
		con=DBConnection.createConnection();
		try {
			stmt=con.createStatement();
			
			log=stmt.executeUpdate(qry);
			if(log==0) {
				System.out.println("Query inserted" +qry);
				}
			else {
				System.out.println("Query not inserted" +qry);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
			if(con!=null) {con.close();}
			if(stmt!=null) {stmt.close();}
			if(rs!=null) {rs=null;}
			log=0;
			}
			catch(Exception e){ e.printStackTrace();}
		}
		return log; 
	}
	
	
public int updateData(String qry) {
		
		con=DBConnection.createConnection();
		try {
			stmt=con.createStatement();
			
			log=stmt.executeUpdate(qry);
			if(log==0) {
				System.out.println("Query inserted" +qry);
				}
			else {
				System.out.println("Query not inserted" +qry);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
			if(con!=null) {con.close();}
			if(stmt!=null) {stmt.close();}
			if(rs!=null) {rs=null;}
			log=0;
			}
			catch(Exception e){ e.printStackTrace();}
		}
		return log; 
	}
	
	public ResultSet Searchdata(String qry) {
		con= DBConnection.createConnection();
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(qry);
		}
		catch(SQLException se){se.printStackTrace();}
		finally {
			try {
				//if(con!=null) {con.close();}
				//if(stmt!=null) {stmt.close();}
				//if(rs!=null) {rs=null;}
				log=0;
				}
				catch(Exception e){ e.printStackTrace();}
		}
		return rs;
	}
	
	public String[] check_login(String qry) {
		con= DBConnection.createConnection();
		String data[]= new String[2];
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(qry);
			//select * from user_reg where name='' and password='';
			
			if(rs!=null) {
				while(rs.next()) {
					data[0]=rs.getString("id");
					data[1]=rs.getString("type");
					
					
				}
			return data;
			}
			else {
				
				return data;
			}
		}
		catch(SQLException se) {}
		finally {
			try {
				if(con!=null) {con.close();}
				if(stmt!=null) {stmt.close();}
				if(rs!=null) {rs=null;}
				
				}
				catch(Exception e){ e.printStackTrace();}
		}
		
		return data;
		
	}
	

}
