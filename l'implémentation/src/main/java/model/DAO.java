package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class DAO {

	private Connection connection = null;
	private static final String URL = "jdbc:mysql://localhost:3306/atelier";
	private static final String USER = "root";
	private static final String PASSWORD = "ntic";
	
	public Connection connectDB() throws InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("Connection avec succes a la base de donnees !");
		} catch (ClassNotFoundException cnf) {
			System.out.println("Driver not charged...");
		} catch (SQLException sqlex) {
			System.out.println("can not connectt to database...");
		}
		return connection;
	}
	
	public User checkLogin(String email, String password)
			throws InstantiationException, IllegalAccessException {
		
		String requete;
		PreparedStatement statement;
		
		User user = null;

		try {
			
			connectDB();
			
			requete = "SELECT * FROM locataire WHERE email = ? and mot_pass = ?";
			statement = connection.prepareStatement(requete);
			statement.setString(1, email);
			statement.setString(2, password);
			
			ResultSet result = statement.executeQuery();			
			
	        if (result.next()) {
	            user = new User();
	            
	            user.setNom(result.getString("nom"));
	            user.setPrenom(result.getString("prenom"));
	            user.setNum_carte(result.getDouble("num_carte"));
	            user.setEmail(result.getString("email"));
	            user.setTelephone(result.getInt("telephone"));
	            user.setDate_naissance(result.getString("date_naissance"));
	            user.setSexe(result.getString("sexe"));
	            user.setEtat(result.getString("etat"));
	            user.setAlert(result.getInt("alert"));
	            //user.setImage();
	            user.setType(result.getString("type"));

	        }
	        
			statement.close();

			System.out.println("Success !");
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return user;
	}
}
