import java.sql.*;
public class demo {
	public static void main(String [] Args) {
		int s1 = 99;
		String s2 = "Admin@000";
				
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/test","root","Rahul@earth5");  
			
			Statement stmt=con.createStatement();  
			ResultSet rs = stmt.executeQuery("select passwor from Admin Where AdminId="+s1);  
			
			
			if (rs.next()) {
				String pass = rs.getString("passwor");
				if(s2.equals(pass)) {
					System.out.println("Login Successfull..");
				}else {
					System.out.println("Login Faild. User Id or Passwrod Mismachted.");
				}
			}else {
				System.out.println("User id Not found.");
			}
				
				
			}catch(Exception e){
				System.out.println(e);
		}
	}
}
