package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class DAO {

	private Connection connection = null;
	private static final String URL = "jdbc:mysql://localhost:3306/atelier";
	private static final String USER = "root";
	private static final String PASSWORD = "ntic";
	
	public Connection connectDB() throws InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
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
			
			query = "SELECT * FROM users WHERE email = ? and mot_pass = ?";
			statement = connection.prepareStatement(query);
			statement.setString (1, email);
			statement.setString(2, password);
			
			ResultSet result = statement.executeQuery();			
			
	        if (result.next()) {
	            user = new User();
	            if (result.getString("type").equals("client")) {
	            	user.setPassword(password);
	            	user = getClientInfo(result.getString("email"));
	            }
	            else if (result.getString("type").equals("directeur")) {
	            	user = getAgencyDirecteurInfo(result.getString("email"));
	            }
	        }
	        statement.close();
	        System.out.println("Success !");
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return user;
	}
	
	private User getAgencyDirecteurInfo(String email) throws SQLException {
		User user = null ;
		String query = "SELECT * FROM agence WHERE email_compte = ?";
    	PreparedStatement statement = connection.prepareStatement(query);
    	statement.setString(1, email);
    	ResultSet result = statement.executeQuery();
    	 if (result.next()) {
     		 user = new User();
    		 user.setNom(result.getString("nom"));
    		 user.setImage(result.getString("photo"));
    		 user.setType("directeur");
    	 }
    	statement.close();
		return user;
	}
	
	private User getClientInfo(String email) throws SQLException {
		User user = null ;
		String query = "SELECT * FROM client WHERE email = ?";
    	PreparedStatement statement = connection.prepareStatement(query);
    	statement.setString(1, email);
    	ResultSet result = statement.executeQuery();
    	if(result.next()) {
    		user = new User();
    		user.setNom(result.getString("nom"));
            user.setPrenom(result.getString("prenom"));
            user.setNum_carte(result.getString("num_carte"));
            user.setEmail(result.getString("email"));
            user.setTelephone(result.getString("telephone"));
            user.setDate_naissance(result.getString("date_naissance"));
            user.setSexe(result.getString("sexe"));
            user.setEtat(result.getString("etat"));
            user.setAlert(result.getInt("alert"));
            user.setImage(result.getString("image"));
            user.setType("client");
            user.setUser_name(result.getString("user_name"));
    	}
    	statement.close();
		return user;
	}
	
	public CreditCards getDefaultCard(String user_email) throws InstantiationException, IllegalAccessException {
		
		String query;
		PreparedStatement statement;
		CreditCards card = new CreditCards();	
		String email = user_email ;
		
		try {	
			connectDB();
			
			query = "SELECT defaultPaymentMethod FROM client WHERE email = ?";
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
			
			String typeFilter = filter.getTypeFilter();
			if(typeFilter != null) {
				if(typeFilter.isEmpty()) {
					typeFilter = null;
				}
			}
			
			query = "call car_search(?, ?, ?, ?, ?)";
			statement = connection.prepareCall(query);
			statement.setString(1, filter.getPickUp_date());
			statement.setString(2, filter.getReturn_date());
			statement.setString(3, typeFilter);
			statement.setDouble(4, filter.getPrice());
			statement.setInt(5, filter.getCarRate());
			
			ResultSet result = statement.executeQuery();			
			
	        while (result.next()) {
	        	vehicule = new Vehicule();
	            
	        	vehicule.setMatricule(result.getString("matricule"));
	        	vehicule.setMarque(result.getString("marque"));
	        	vehicule.setModele(result.getString("modele"));
	        	vehicule.setPLJ(result.getDouble("PLJ"));
	        	vehicule.setPLH(result.getDouble("PLH"));
	        	vehicule.setType(result.getString("type"));
	        	vehicule.setImage(result.getString("image"));
	        	vehicule.setDepot_code(result.getString("depot_code"));
	        	vehicule.setAgence(result.getString("agence_nom"));
	        	vehicule.setAverageRating(result.getDouble("rating"));
	        	
	        	vehicules.add(vehicule);
	        }
	        
			statement.close();

			System.out.println("Success !");
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return vehicules;
	}
	public ArrayList<Vehicule> getAgencyCars(String depotCode){
		String Query ; 
		PreparedStatement statement; 
		ResultSet result ; 
		ArrayList<Vehicule> cars = new ArrayList<>();
		Vehicule vehicule = null ;
		try {
			connectDB();
			Query = "Select * from vehicule where depot_code= ?";
			statement = connection.prepareStatement(Query);
			statement.setString(1, depotCode);
			result = statement.executeQuery();
			while(result.next()) {
				vehicule = new Vehicule();
				vehicule.setMatricule(result.getString("matricule"));
	        	vehicule.setMarque(result.getString("marque"));
	        	vehicule.setModele(result.getString("modele"));
	        	vehicule.setPLJ(result.getDouble("PLJ"));
	        	vehicule.setPLH(result.getDouble("PLH"));
	        	vehicule.setType(result.getString("type"));
	        	vehicule.setYear(result.getInt("year"));
	        	vehicule.setImage(result.getString("image"));
	        	vehicule.setDepot_code(result.getString("depot_code"));
	        	vehicule.setColor(result.getString("color"));
	        	vehicule.setNumberSeats(result.getInt("seats"));
	        	vehicule.setNumberDoors(result.getInt("doors"));
	        	vehicule.setNumberSuitCase(result.getInt("suit_case"));
	        	vehicule.setMileage(result.getString("mileage"));
	        	vehicule.setAverageRating(result.getDouble("rating"));
	        	vehicule.setComfortRating(result.getDouble("comfort_rating"));
	        	vehicule.setCleanlinessRating(result.getDouble("cleanliness_rating"));
	        	vehicule.setPickReturnRating(result.getDouble("PickReturn_rating"));
	        	vehicule.setValueMoneyRating(result.getDouble("ValueMoney_rating"));
	        	cars.add(vehicule);
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		return cars;
	}
	public ArrayList<Reservation> getReservation(String email) throws InstantiationException, IllegalAccessException{
		String Query;
		ArrayList<Reservation> reservationList = new ArrayList<Reservation>();
		PreparedStatement statement;
		Reservation reservation = null;
		ResultSet result;
		try {
			connectDB();
			Query = "SELECT * from reservation where locataire_email = ?";
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result =statement.executeQuery();
			
			while(result.next()) {
				reservation = new Reservation();
				
				reservation.setId(result.getInt("id"));
				reservation.setPick_up_date(result.getString("date_1"));
				reservation.setReturn_date(result.getString("date_2"));
				reservation.setReservation_date(result.getString("date_reservation"));
				reservation.setStatus(result.getString("reservation.etat"));
				reservation.setPick_up_hour(result.getString("hour_1"));
				reservation.setReturn_hour(result.getString("hour_2"));
				reservation.setLocation(result.getString("location"));
				reservation.setVehicule(result.getString("vehicule_matricule"));
				reservation.setContrat(result.getString("contrat"));
				System.out.println(reservation.getVehicule());
				Query = "SELECT * from vehicule where matricule = ?";
				PreparedStatement statement2 = connection.prepareStatement(Query);
				statement2.setString(1, reservation.getVehicule());
				ResultSet result2 =statement2.executeQuery();
				while(result2.next()) {
					reservation.setVehicule(result2.getString("modele"));
					System.out.println(reservation.getVehicule());
					reservation.setPLH(result2.getInt("PLH"));
					reservation.setPLJ(result2.getInt("PLJ"));
					reservation.setCarImage(result2.getString("image"));
				}
				
				Query = "SELECT * from transactionhistory where reservationID = "+reservation.getId() ;
				PreparedStatement statement3 = connection.prepareStatement(Query);
				ResultSet result3 = statement3.executeQuery();
				while(result3.next()) {
					reservation.setPaymentId(result3.getInt("payment_id"));
					reservation.setTotalAmount(result3.getInt("montant"));
					reservation.setAgence(result3.getString("agence_name"));
				}	
				reservationList.add(reservation);
			}
			statement.close();
		}catch (SQLException e) {
			System.out.println(e);
			
		}
		return reservationList;
	}
	
	public Reservation getReservation(int id) throws InstantiationException, IllegalAccessException{
		String Query;
		PreparedStatement statement;
		Reservation reservation = new Reservation();;
		ResultSet result;
		try {
			connectDB();
			Query = "SELECT * from reservation as r join vehicule as v on r.vehicule_matricule = v.matricule where id = ?";
			statement = connection.prepareStatement(Query);
			statement.setInt(1, id);
			result = statement.executeQuery();
			
			if(result.next()) {
				
				reservation.setId(result.getInt("id"));
				reservation.setPick_up_date(result.getString("date_1"));
				reservation.setReturn_date(result.getString("date_2"));
				reservation.setReservation_date(result.getString("date_reservation"));
				reservation.setStatus(result.getString("etat"));
				reservation.setPick_up_hour(result.getString("hour_1"));
				reservation.setReturn_hour(result.getString("hour_2"));
				reservation.setLocation(result.getString("location"));
				reservation.setVehicule(result.getString("vehicule_matricule"));
				reservation.setContrat(result.getString("contrat"));
				reservation.setCarName(result.getString("marque") + " " + result.getString("modele"));
				reservation.setPLH(result.getInt("PLH"));
				reservation.setPLJ(result.getInt("PLJ"));
				reservation.setCarImage(result.getString("image"));
				
			}
			statement.close();
		}catch (SQLException e) {
			System.out.println(e);
			
		}
		return reservation;
	}
	
	public ArrayList<Payment> getPayments(String email) throws InstantiationException, IllegalAccessException{
		String Query;
		PreparedStatement statement;
		
		ArrayList<Payment> payments = new ArrayList<Payment>();
		Payment payment;
		
		ResultSet result;
		try {
			connectDB();
			Query = "select * \r\n"
					+ "from transactionhistory as t join reservation as r on t.reservationID = r.id join vehicule as v on r.vehicule_matricule = v.matricule\r\n"
					+ "where locataire_email = ?";
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result = statement.executeQuery();
			
			while(result.next()) {
				payment = new Payment();
				
				payment.setPayment_id(result.getInt("payment_id"));
				payment.setReservationID(result.getInt("reservationID"));
				payment.setMontant(result.getInt("montant"));
				payment.setAgence(result.getString("agence_name"));
				payment.setMethod(result.getString("Method"));
				payment.setDate(result.getString("date"));
				payment.setCar_name(result.getString("marque") + " " + result.getString("modele"));
				payment.setReservation_date(result.getString("date_reservation"));
				
				payments.add(payment);
			}
			statement.close();
		}catch (SQLException e) {
			System.out.println(e);
			
		}
		return payments;
	}

	public int SetTempReservation(Reservation data) {
		String query ; 
		PreparedStatement statement ;
		ResultSet result ;
		try {
			connectDB();
			query = "Insert into reservation(locataire_email , vehicule_matricule,date_1,date_2,etat,hour_1,hour_2,date_reservation,location)"
					+ " values(?,?,?,?,?,?,?,?,?);";
			statement = connection.prepareStatement(query);
			statement.setString(1, data.getEmail());
			statement.setString(2, data.getVehicule());
			statement.setString(3, data.getPick_up_date());
			statement.setString(4, data.getReturn_date());
			statement.setString(5, "en cours");
			statement.setString(6, data.getPick_up_hour());
			statement.setString(7, data.getReturn_hour());
			statement.setString(8, data.getReservation_date());
			statement.setString(9, data.getLocation());
			statement.executeUpdate();
			
			query = "SELECT LAST_INSERT_ID()";
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();
			
			if(result.next()) {
				return result.getInt("LAST_INSERT_ID()");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0; 
	}
	
	public Agence getAgence(String Name) {
		String query ; 
		PreparedStatement statement ;
		ResultSet result ;
		Agence agence = new Agence();
		try {
			connectDB();
			query = "Select * from agence where nom = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, Name);
			result = statement.executeQuery();
			if(result.next()) {
				agence.setName(result.getString("nom"));
				agence.setAddress(result.getString("address"));
				agence.setPhone(result.getString("phone"));
			}
			statement.close();
			
			return agence;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public Vehicule getVehicule(String matricule) {
		String query ; 
		PreparedStatement statement ;
		ResultSet result ;
		Vehicule vehicule = new Vehicule();
		try {
			connectDB();
			query = "Select * from vehicule where matricule="+matricule;
			statement = connection.prepareStatement(query);
			result = statement.executeQuery();
			
			if(result.next()) {
				vehicule.setMarque(result.getString("marque"));
				vehicule.setModele(result.getString("modele"));
				vehicule.setMatricule(result.getString("matricule"));
				vehicule.setColor(result.getString("color"));
				vehicule.setYear(result.getInt("year"));
			}
			statement.close();
			
			return vehicule;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<Depot> getAgencyDepots(String AgencyName) {
		String Query;
		PreparedStatement statement;
		
		ArrayList<Depot> depots = new ArrayList<Depot>();
		Depot depot;
		
		ResultSet result;
		try {
			connectDB();
			Query = "select * \r\n"
					+ "from depot \r\n"
					+ "where agence_nom  = ?";
			statement = connection.prepareStatement(Query);
			statement.setString(1, AgencyName);
			result = statement.executeQuery();
			
			while(result.next()) {
				depot = new Depot();
				depot.setCode(result.getString("code"));
				depot.setAdress(result.getString("adress"));
				depot.setCapacite(result.getInt("capacite"));
				depot.setCapacite_libre(result.getInt("capacite_libre"));
				depot.setAgence_nom(result.getString("agence_nom"));
				depot.setGaragiste_email(result.getString("garagiste_email"));
				depot.setLat(result.getString("lat"));
				depot.setLon(result.getString("lon"));
				depot.setBookings(result.getInt("Bookings"));
				Query = "Select * from garagiste where email = ?";
				statement = connection.prepareStatement(Query);
				statement.setString(1, depot.getGaragiste_email());
				User garagiste = new User();
				ResultSet result1 = statement.executeQuery();
				if(result1.next()) {
					garagiste.setNom(result1.getString("nom"));
					garagiste.setPrenom(result1.getString("prenom"));
					garagiste.setImage(result1.getString("photo"));
					garagiste.setEmail(depot.getGaragiste_email());
				}
				depot.setGaragiste(garagiste);
				depot.setCapacityPercentile((depot.getCapacite_libre()*100)/depot.getCapacite());
				depots.add(depot);
			}
			statement.close();
		}catch (Exception e) {
			System.out.println(e);
			
		}
		return depots;
	}
	public ArrayList<Depot> getDepots(String location) {
		String Query;
		PreparedStatement statement;
		
		ArrayList<Depot> depots = new ArrayList<Depot>();
		Depot depot;
		
		ResultSet result;
		try {
			connectDB();
			Query = "select * \r\n"
					+ "from depot \r\n"
					+ "where adress = ?";
			statement = connection.prepareStatement(Query);
			statement.setString(1, location);
			result = statement.executeQuery();
			
			while(result.next()) {
				depot = new Depot();
				
				
				depot.setCode(result.getString("code"));
				depot.setAdress(result.getString("adress"));
				depot.setCapacite(result.getInt("capacite"));
				depot.setCapacite_libre(result.getInt("capacite_libre"));
				depot.setAgence_nom(result.getString("agence_nom"));
				depot.setGaragiste_email(result.getString("garagiste_email"));
				depot.setLat(result.getString("lat"));
				depot.setLon(result.getString("lon"));
				
				depots.add(depot);
			}
			statement.close();
		}catch (Exception e) {
			System.out.println(e);
			
		}
		return depots;
	}

	public void ModifyUser(User user) {
		String query ; 
		PreparedStatement statement ;
		try {
			connectDB();
			query = "update client set nom= ? , prenom=? , num_carte=?,telephone=? , date_naissance=?,sexe=? where email=?";
			statement = connection.prepareStatement(query);
			statement.setString(1, user.getNom());
			statement.setString(2, user.getPrenom());
			statement.setString(3, user.getNum_carte());
			statement.setString(4, user.getTelephone());
			statement.setString(5, user.getDate_naissance());
			statement.setString(6, user.getSexe());
			statement.setString(7, user.getEmail());
			statement.executeUpdate();
			statement.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void ReadMessage(int messageId) throws InstantiationException, IllegalAccessException, SQLException {
		connectDB();
		String Query = "update messages set status='read' where id="+messageId;
		PreparedStatement statement = connection.prepareStatement(Query);
		statement.executeUpdate();
		statement.close();
	}
	public InboxReturn getMessages(String email){
		String Query;
		PreparedStatement statement;
		InboxReturn inboxreturn = new InboxReturn();
		Message message;
		ResultSet result;
		try {
			connectDB();
			Query = "select * from messages where source=? or destination=? Order by creationTime DESC";
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			statement.setString(2, email);
			result = statement.executeQuery();
			while(result.next()) {
				message = new Message();
				
				message.setId(result.getInt("id"));
				message.setSource(result.getString("source"));
				message.setDestination(result.getString("destination"));
				message.setTitle(result.getString("title"));
				message.setContent(result.getString("content"));
				message.setStatus(result.getString("status"));
				if(message.getStatus().equals("not read") && !message.getSource().equals(email)) {
					inboxreturn.NotReadMessages++;
				}
				message.setTime(result.getString("creationTime"));
				message.setTags(result.getString("tags"));
				Query = "select type from users where email=? limit 1";
				statement = connection.prepareStatement(Query);
				statement.setString(1, message.getSource());
				ResultSet result1 = statement.executeQuery();
				if(result1.next()) {
					if(result1.getString("type").equals("client")) {
						Query = "select user_name , image from client where email=? limit 1";
						statement = connection.prepareStatement(Query);
						
						statement.setString(1, message.getSource());
						ResultSet result2 = statement.executeQuery();
						if(result2.next()) {
							message.setSourceName(result2.getString("user_name"));
							
							message.setSourceImage(result2.getString("image"));
						}
						//TODO other user types
					}
					
				}
				inboxreturn.Messages.add(message);
			}
			statement.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return inboxreturn;
	}
	
	public void addDepot(Depot depot) {
		String Query;
		PreparedStatement statement;
		
		try {
			connectDB();
			Query = "INSERT INTO `atelier`.`depot` (`adress`, `capacite`, `capacite_libre`, `agence_nom`, `garagiste_email`, `lat`, `lon`) \r\n" 
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			statement = connection.prepareStatement(Query);
			
			statement.setString(1, depot.getAdress());
			statement.setInt(2, depot.getCapacite());
			statement.setInt(3, depot.getCapacite_libre());
			statement.setString(4, depot.getAgence_nom());
			statement.setString(5, depot.getGaragiste_email());
			statement.setString(6, depot.getLat());
			statement.setString(7, depot.getLon());
			
			statement.executeUpdate();
			
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
			
		}
	}

	public void SendMessage(Message message) throws SQLException {
		String query ; 
		PreparedStatement statement = null ;
		try {
			connectDB();
			query = "Insert into messages(source , destination , title , content ,tags)"
					+ " values(?,?,?,?,?);";
			statement = connection.prepareStatement(query);
			statement.setString(1, message.getSource());
			statement.setString(2, message.getDestination());
			statement.setString(3, message.getTitle());
			statement.setString(4, message.getContent());
			statement.setString(5, message.getTags());
			statement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		statement.close();
	}

	public void addVehicule(Vehicule vehicule) {
		String Query;
		PreparedStatement statement;
		
		try {
			connectDB();
			Query = "INSERT INTO `atelier`.`vehicule` (`matricule`, `marque`, `modele`, `PLJ`, `PLH`, `type`, `depot_code`, `year`, `color`) \r\n"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			statement = connection.prepareStatement(Query);
			
			statement.setString(1, vehicule.getMatricule());
			statement.setString(2, vehicule.getMarque());
			statement.setString(3, vehicule.getModele());
			statement.setDouble(4, vehicule.getPLJ());
			statement.setDouble(5, vehicule.getPLH());
			statement.setString(6, vehicule.getType());
			//statement.setString(7, vehicule.getImage()); TODO later
			statement.setString(7, vehicule.getDepot_code());
			statement.setInt(8, vehicule.getYear());
			statement.setString(9, vehicule.getColor());
			
			statement.executeUpdate();
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();	
		}
	}

	public void deleteVehicule(String matricule) {
		String Query;
		PreparedStatement statement;
		
		try {
			connectDB();
			Query = "DELETE FROM `atelier`.`vehicule` WHERE (`matricule` = ?)";
			statement = connection.prepareStatement(Query);
			
			statement.setString(1, matricule);
			
			statement.executeUpdate();
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();	
		}
	}
}