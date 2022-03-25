package model;

import java.sql.CallableStatement;
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
		
		String query;
		PreparedStatement statement;
		
		User user = null;

		try {
			
			connectDB();
			
			query = "SELECT * FROM locataire WHERE email = ? and mot_pass = ?";
			statement = connection.prepareStatement(query);
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
	            user.setImage(result.getString("image"));
	            user.setType(result.getString("type"));
	            user.setUser_name(result.getString("user_name"));
	        }
	        
			statement.close();

			System.out.println("Success !");
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return user;
	}

	public CreditCards getDefaultCard(String user_email) throws InstantiationException, IllegalAccessException {
		
		String query;
		PreparedStatement statement;
		CreditCards card = new CreditCards();	
		String email = user_email ;
		
		try {	
			connectDB();
			
			query = "SELECT defaultPaymentMethod FROM locataire WHERE email = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet result = statement.executeQuery();
			
			
			if (result.next()) {
				card.setCardNumber(result.getString("defaultPaymentMethod"));
			}
			
			
			System.out.println(card.getCardNumber());
			if (card.getCardNumber()==null) {
				return null;
			}else {
				
				query = "SELECT CardNumber , exp FROM creditcards WHERE CardNumber = ?";
				statement = connection.prepareStatement(query);
				statement.setString(1, card.getCardNumber());
				
				
				ResultSet result2 = statement.executeQuery();
				if (result2.next()) {
					card.setExp(result2.getString("exp"));
				}
			}
			statement.close();
			
			System.out.println("Success !");
	}catch (SQLException e) {
		System.out.println("Failure on getting default payment card because :" + e);
	}
		return card;
	}
	
	public ArrayList<Vehicule> carSearch(CarFilter filter) throws InstantiationException, IllegalAccessException {
		
		String query;
		CallableStatement statement;
		
		ArrayList<Vehicule> vehicules = new ArrayList<Vehicule>();
		Vehicule vehicule;

		try {
			
			connectDB();
			
			query = "call car_search(?, ?);";
			statement = connection.prepareCall(query);
			statement.setString(1, filter.getPickUp_date());
			statement.setString(2, filter.getReturn_date());
			
			ResultSet result = statement.executeQuery();			
			
	        while (result.next()) {
	        	vehicule = new Vehicule();
	            
	        	vehicule.setMatricule(result.getString("matricule"));
	        	vehicule.setMarque(result.getString("marque"));
	        	vehicule.setModele(result.getString("modele"));
	        	vehicule.setPLJ(result.getDouble("PLJ"));
	        	vehicule.setPLH(result.getDouble("PLH"));
	        	vehicule.setType(result.getString("type"));
	        	vehicule.setEtat(result.getString("etat"));
	        	vehicule.setImage(result.getString("image"));
	        	vehicule.setDepot_code(result.getString("depot_code"));
	        	
	        	vehicules.add(vehicule);
	        }
	        
			statement.close();

			System.out.println("Success !");
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return vehicules;
	}
}
