package connection_builder;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.Properties;


public class DBConnection {	

	private static String driver;
	private static String db_url;
	private static String username;
	private static String password;
	InputStream in;


	public void getDetails() throws IOException {
		Properties prop= new Properties();
		String filename="dbconfig.properties";
		in= getClass().getClassLoader().getResourceAsStream(filename);
		if(in!=null) {
			prop.load(in);
			driver= prop.getProperty("JDBC_DRIVER");
			db_url= prop.getProperty("DB_URL");
			username= prop.getProperty("Username");
			password= prop.getProperty("Password");
			System.out.println(""+driver+db_url+username+password+"creating connection" );

		}else {
			throw new FileNotFoundException("file could be ne found");
			}

	}

	public static Connection createConnection() {
		Connection con = null;
		try {
			//System.out.println(""+driver+db_url+username+password+"creating connection" );

			DBConnection db= new DBConnection();
			db.getDetails();
			System.out.println(""+driver+db_url+username+password+"creating connection" );
			Class.forName(driver);
			con= DriverManager.getConnection(db_url,username,password);
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		}
		return con;
		}
	


}
