package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

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
			
			query = "SELECT * FROM users WHERE email = ? and mot_pass = ? limit 1";
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
	            else if(result.getString("type").equals("service_client")) {
	            	user = getServiceClient(result.getString("email"));
	            }
	            else if(result.getString("type").equals("depot manager")) {
	            	user = getGaragiste(result.getString("email"));
	            }
	            else if(result.getString("type").equals("secretary")) {
	            	user = getSecretaire(result.getString("email"));
	            }
	            user.setPassword(password);
	        }
	        statement.close();
	        System.out.println("Success !");
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return user;
	}
	public String getUserType(String email) { 
		String userType = null;
		String query = "SELECT type from users where email = ? limit 1";
		PreparedStatement statement ;
		ResultSet result ; 
		try {
			connectDB();
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			result = statement.executeQuery();
			if(result.next()) {
				userType = result.getString("type");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userType;
	}
	public boolean IsNewAccount(User employee) {
		String Query ; 
		PreparedStatement statement ; 
		boolean newAccount = false;
		ResultSet result ; 
		try {
			if(employee.getType().equals("depot manager")){
				Query = "Select nom from garagiste where email = ? limit 1 ";
			}else {
				Query = "Select nom from secretary where email = ? limit 1 ";
			}
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, employee.getEmail());
			result = statement.executeQuery();
			if(result.next()) {
				if(result.getString("nom") == null) {
					newAccount = true;
				}
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return newAccount;
	}
	public int CompleteEmployeeRegistration(Employee employee) {
		String Query = null ;
		PreparedStatement statement; 
		int result = 0;
		try {
			connectDB();
			if (employee.getType().equals("depot manager")) {
				Query = "Update garagiste set nom = ?,prenom=?,photo=?  where email = ?";
			}else {
				Query = "Update secretary set nom =? ,prenom = ? , photo = ? where email = ?";
			}
			statement = connection.prepareStatement(Query);
			statement.setString(1, employee.getNom());
			statement.setString(2, employee.getPrenom());
			statement.setString(3, employee.getImage());
			statement.setString(4, employee.getEmail());
			
			result = statement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public User getAgencyDirecteurInfo(String email) throws SQLException {
		User user = null ;
		String query = "SELECT * FROM agence WHERE email_compte = ?";
    	PreparedStatement statement = connection.prepareStatement(query);
    	statement.setString(1, email);
    	ResultSet result = statement.executeQuery();
    	 if (result.next()) {
     		 user = new User();
     		 user.setEmail(email);
    		 user.setNom(result.getString("nom"));
    		 user.setImage(result.getString("photo"));
    		 user.setType("directeur");
    	 }
    	statement.close();
		return user;
	}
	
	public User getGaragiste(String email) {
		User user = null ;
		Garagiste garagiste = null;
		String Query = "Select * from garagiste where email = ? limit 1";
		PreparedStatement statement;
		ResultSet result ; 
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result = statement.executeQuery();
			if (result.next()) {
				user = new User();
				garagiste = new Garagiste();
				user.setEmail(email);
				user.setType("depot manager");
				user.setNom(result.getString("nom"));
				user.setPrenom(result.getString("prenom"));
				user.setImage(result.getString("photo"));
				garagiste.setAgencyName(result.getString("agency_name"));
				garagiste.setMonthlySession(result.getString("monthly_session"));
				garagiste.setWorkingLocation(result.getString("working_location"));
				user.setEmployement(garagiste);
				Query = "Select mot_pass from users where email = ? limit 1";
				statement = connection.prepareStatement(Query);
				statement.setString(1, user.getEmail());
				result = statement.executeQuery();
				if (result.next()) {
					user.setPassword(result.getString("mot_pass"));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public User getSecretaire(String email) {
		User user = null ;
		Secretaire secretaire = null;
		String Query = "Select * from secretary where email = ? limit 1";
		PreparedStatement statement;
		ResultSet result ;
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result = statement.executeQuery();
			if (result.next()) {
				user = new User();
				secretaire = new Secretaire();
				user.setEmail(email);
				user.setType("secretary");
				user.setNom(result.getString("nom"));
				user.setPrenom(result.getString("prenom"));
				user.setImage(result.getString("photo"));
				secretaire.setWorkingLocation(result.getString("working_location"));
				secretaire.setAgencyName(result.getString("agency_name"));
				user.setEmployement(secretaire);
				Query = "Select mot_pass from users where email = ? limit 1";
				statement = connection.prepareStatement(Query);
				statement.setString(1, user.getEmail());
				result = statement.executeQuery();
				if (result.next()) {
					user.setPassword(result.getString("mot_pass"));
				}
			}
			}catch(Exception e) {
				e.printStackTrace();
		}
		return user;
	}
	private User getServiceClient(String email) throws SQLException {
		User user = null ;
		String query = "SELECT * FROM serviceclient WHERE email = ?";
    	PreparedStatement statement = connection.prepareStatement(query);
    	statement.setString(1, email);
    	ResultSet result = statement.executeQuery();
    	 if (result.next()) {
     		 user = new User();
    		 user.setNom(result.getString("nom"));
    		 user.setPrenom(result.getString("prenom"));
    		 user.setImage(result.getString("image"));
    		 user.setEmail(result.getString("email"));
    		 user.setType("service_client");
    	 }
    	statement.close();
		return user;
	}
	
	public User getClientInfo(String email) throws SQLException, InstantiationException, IllegalAccessException {
		User user = null ;
		String query = "SELECT * FROM client WHERE email = ?";
		connectDB();
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
            user.setAccountCreated(result.getString("Account_created"));
            user.setLat(result.getString("currentlat"));
            user.setLon(result.getString("currentlong"));
            user.setAddress(result.getString("Address"));
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
	
	public ArrayList<Vehicule> getAgencyCars(String depotCode ,String AgencyName){
		String Query ; 
		PreparedStatement statement; 
		ResultSet result ; 
		ArrayList<Vehicule> cars = new ArrayList<Vehicule>();
		Vehicule vehicule = null ;
		try {
			connectDB();
			Query = "Select * from vehicule where depot_code= ? and agence = ?";
			statement = connection.prepareStatement(Query);
			statement.setString(1, depotCode);
			statement.setString(2, AgencyName);
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
	
	public HashMap<Integer,Payment> getPayments(String email) throws InstantiationException, IllegalAccessException, ParseException{
		String Query;
		PreparedStatement statement;
		
		HashMap<Integer,Payment> map = new HashMap<>();
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
				payment.setPick_up_date(result.getString("date_1"));
				payment.setReturn_date(result.getString("date_2"));
				payment.setPLJ(result.getInt("PLJ"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
			    Date firstDate = sdf.parse(payment.getPick_up_date());
			    Date secondDate = sdf.parse(payment.getReturn_date());

			    long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
			    long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
			    payment.setDuration(diff);
				map.put(payment.getPayment_id(), payment);
			}
			statement.close();
		}catch (SQLException e) {
			System.out.println(e);
			
		}
		return map;
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
			query = "Select * from vehicule where matricule = ?";
			statement = connection.prepareStatement(query);
			
			statement.setString(1, matricule);
			
			result = statement.executeQuery();
			
			if(result.next()) {
				vehicule.setMatricule(result.getString("matricule"));
				vehicule.setMarque(result.getString("marque"));
				vehicule.setModele(result.getString("modele"));
				vehicule.setYear(result.getInt("year"));
				vehicule.setColor(result.getString("color"));
				vehicule.setPLJ(result.getDouble("PLJ"));
				vehicule.setPLH(result.getDouble("PLH"));
				vehicule.setNumberSeats(result.getInt("seats"));
				vehicule.setNumberDoors(result.getInt("doors"));
				vehicule.setNumberSuitCase(result.getInt("suit_case"));
				vehicule.setMileage(result.getString("mileage"));
				vehicule.setType(result.getString("type"));
				vehicule.setImage(result.getString("image"));
				vehicule.setComfortRating(result.getInt("comfort_rating"));
				vehicule.setCleanlinessRating(result.getInt("cleanliness_rating"));
				vehicule.setPickReturnRating(result.getInt("pickReturn_rating"));
				vehicule.setValueMoneyRating(result.getInt("ValueMoney_rating"));
			}
			statement.close();
			
			return vehicule;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Building> getAgencyBuildings(String AgencyName) {
		String Query;
		ArrayList<Building> buildings = new ArrayList<Building>();
		
		PreparedStatement statement;
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
				Depot depot = new Depot();
				depot.setCode(result.getString("code"));
				depot.setAdress(result.getString("adress"));
				depot.setCapacite(result.getInt("capacite"));
				depot.setCapacite_libre(result.getInt("capacite_libre"));
				depot.setAgence_nom(result.getString("agence_nom"));
				depot.setEmployee_email(result.getString("garagiste_email"));
				depot.setLat(result.getString("lat"));
				depot.setLon(result.getString("lon"));
				depot.setBookings(result.getInt("Bookings"));
				depot.setEmployee(getBuildingEmployee(depot));
				depot.setCapacityPercentile((depot.getCapacite_libre()*100)/depot.getCapacite());
				
				buildings.add(depot);
			}
			
			Query = "select * \r\n"
					+ "from offices \r\n"
					+ "where agency_name  = ?";
			statement = connection.prepareStatement(Query);
			statement.setString(1, AgencyName);
			result = statement.executeQuery();
			
			while(result.next()) {
				Office office = new Office();
				office.setCode(result.getString("code"));
				office.setAdress(result.getString("address"));
				office.setAgence_nom(result.getString("agency_name"));
				office.setEmployee_email(result.getString("email_secretaire"));
				office.setLat(result.getString("lat"));
				office.setLon(result.getString("lon"));
				office.setBookings(result.getInt("Bookings"));
				office.setEmployee(getBuildingEmployee(office));
				
				buildings.add(office);
			}
			statement.close();
		} catch (SQLException | InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buildings;
	}
	public Office getOfficeInfo(String AgencyName , String code) {
		String Query; 
		Office Office = new Office();
		PreparedStatement statement; 
		ResultSet result; 
		try {
			connectDB();
			Query = "select * from offices where agency_name = ? and code = ? limit 1";
			statement = connection.prepareStatement(Query);
			statement.setString(1, AgencyName);
			statement.setString(2, code);
			result = statement.executeQuery();
			if(result.next()) {
				Office.setCode(result.getString("code"));
				Office.setAdress(result.getString("address"));
				Office.setAgence_nom(result.getString("agency_name"));
				Office.setEmployee_email(result.getString("email_secretaire"));
				Office.setLat(result.getString("lat"));
				Office.setLon(result.getString("lon"));
				Office.setBookings(result.getInt("Bookings"));
				Office.setType("Office");
				Query = "Select * from secretary where email = ? limit 1";
				statement = connection.prepareStatement(Query);
				statement.setString(1, Office.getEmployee_email());
				result = statement.executeQuery();
				if(result.next()) {
					Employee employee = new Employee();
					employee = getBuildingEmployee(Office);
					Office.setEmployee(employee);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return Office ;
	}
	public Depot getDepotInfo(String AgencyName , String depot_code) {
		String Query; 
		Depot depot = new Depot();
		PreparedStatement statement; 
		ResultSet result; 
		try {
			connectDB();
			Query = "select * from depot where agence_nom = ? and code = ? limit 1";
			statement = connection.prepareStatement(Query);
			statement.setString(1, AgencyName);
			statement.setString(2, depot_code);
			result = statement.executeQuery();
			if(result.next()) {
				depot.setCode(result.getString("code"));
				depot.setAdress(result.getString("adress"));
				depot.setCapacite(result.getInt("capacite"));
				depot.setCapacite_libre(result.getInt("capacite_libre"));
				depot.setAgence_nom(result.getString("agence_nom"));
				depot.setEmployee_email(result.getString("garagiste_email"));
				depot.setLat(result.getString("lat"));
				depot.setLon(result.getString("lon"));
				depot.setBookings(result.getInt("Bookings"));
				depot.setType("depot");
				depot.setStoredCars(getAgencyCars(depot_code, AgencyName));
				Query = "Select * from garagiste where email = ? limit 1";
				statement = connection.prepareStatement(Query);
				statement.setString(1, depot.getEmployee_email());
				result = statement.executeQuery();
				if(result.next()) {
					Employee employee = new Employee();
					employee = getBuildingEmployee(depot);
					depot.setEmployee(employee);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return depot ;
	}
	//this method return the building where there is no employee
	public ArrayList<Building> getAvailableAgencyBuildings(String AgencyName,String Type) {
		String Query;
		ArrayList<Building> buildings = new ArrayList<Building>();
		
		PreparedStatement statement = null;
		ResultSet result;
		try {
			if(Type.equals("depot manager")) {
				connectDB();
				Query = "select * \r\n"
						+ "from depot \r\n"
						+ "where agence_nom  = ? and garagiste_email is null";
				statement = connection.prepareStatement(Query);
				statement.setString(1, AgencyName);
				result = statement.executeQuery();
				
				while(result.next()) {
					Depot depot = new Depot();
					depot.setCode("Depot "+result.getString("code"));
					depot.setAdress(result.getString("adress"));
					depot.setCapacite(result.getInt("capacite"));
					depot.setCapacite_libre(result.getInt("capacite_libre"));
					depot.setAgence_nom(result.getString("agence_nom"));
					depot.setLat(result.getString("lat"));
					depot.setLon(result.getString("lon"));
					depot.setBookings(result.getInt("Bookings"));
					depot.setEmployee(getBuildingEmployee(depot));
					depot.setCapacityPercentile((depot.getCapacite_libre()*100)/depot.getCapacite());
					
					buildings.add(depot);
				}
			}else if(Type.equals("secretary")) {
				connectDB();
				Query = "select * \r\n"
						+ "from offices \r\n"
						+ "where agency_name  = ? and email_secretaire is null";
				statement = connection.prepareStatement(Query);
				statement.setString(1, AgencyName);
				result = statement.executeQuery();
				
				while(result.next()) {
					Office office = new Office();
					office.setCode("Office"+result.getString("code"));
					office.setAdress(result.getString("address"));
					office.setAgence_nom(result.getString("agency_name"));
					office.setLat(result.getString("lat"));
					office.setLon(result.getString("lon"));
					office.setBookings(result.getInt("Bookings"));
					office.setEmployee(getBuildingEmployee(office));
					
					buildings.add(office);
				}
			}
			statement.close();
		} catch (SQLException | InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buildings;
	}
	public ArrayList<Employee> getAvailableEmployees(String agence , String type ){
		ArrayList<Employee> Employees = new ArrayList<Employee>();
		String Query;
		PreparedStatement statement; 
		ResultSet result ;
		try {
			connectDB();
			if(type.equals("depot")) {
				Query = "Select * from garagiste where agency_name = ? and email not in(Select garagiste_email from depot where agence_nom = ? and garagiste_email is not null);";
			}else {
				Query = "Select * from secretary where agency_name = ? and email not in(Select email_secretaire from offices where agency_name = ? and email_secretaire is not null);";
			}
			statement = connection.prepareStatement(Query);
			statement.setString(1, agence);
			statement.setString(2, agence);
			result = statement.executeQuery();
			while(result.next()) {
				Employee employee = new Employee();
				employee.setEmail(result.getString("email"));
				employee.setImage(result.getString("photo"));
				employee.setNom(result.getString("nom"));
				employee.setPrenom(result.getString("prenom"));
				Employees.add(employee);
			}
			statement.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return Employees;
	}
	public Employee getBuildingEmployee(Building building) {
		Employee employee = null;
		String query;
		PreparedStatement statement;
		String type;
		
		if (building.getType() == "depot") {
			query = "SELECT * FROM atelier.garagiste WHERE email = ?";
			type = "depot manager";
		} else {
			query = "SELECT * FROM atelier.secretary WHERE email = ?";
			type = "secretary";
		}
		try {
			connectDB();
			statement = connection.prepareStatement(query);
			statement.setString(1, building.getEmployee_email());
			ResultSet result = statement.executeQuery();
			if(result.next()) {
				employee = new Employee();
				employee.setNom(result.getString("nom"));
				employee.setPrenom(result.getString("prenom"));
				employee.setImage(result.getString("photo"));
				employee.setEmail(result.getString("email"));
				employee.setWorkingLocation(result.getString("working_location"));
				//employee.setMonthlySession(result.getString("monthly_session"));
				employee.setType(type);
			}
		} catch (SQLException | InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return employee;
	}
	
	public ArrayList<Employee> getAgencyPersonals(String AgencyName) {
		String Query;
		PreparedStatement statement;
		
		ArrayList<Employee> employees = new ArrayList<Employee>();
		Employee employee;
		
		ResultSet result;
		try {
			connectDB();
			Query = "SELECT * \r\n"
					+ "FROM atelier.garagiste \r\n"
					+ "WHERE agency_name = ? and nom is not null";
			statement = connection.prepareStatement(Query);
			statement.setString(1, AgencyName);
			
			result = statement.executeQuery();
			while(result.next()) {
				employee = new Garagiste();
				employee.setEmail(result.getString("email"));
				employee.setPrenom(result.getString("prenom"));
				employee.setNom(result.getString("nom"));
				employee.setImage(result.getString("photo"));
				employee.setWorkingLocation(result.getString("working_location"));
				employee.setMonthlySession(result.getString("monthly_session"));
				employee.setType("depot manager");
				
				employees.add(employee);
			}
			
			Query = "SELECT * \r\n"
					+ "FROM atelier.secretary \r\n"
					+ "WHERE agency_name = ? and nom is not null";
			statement = connection.prepareStatement(Query);
			statement.setString(1, AgencyName);
			
			result = statement.executeQuery();
			while(result.next()) {
				employee = new Employee();
				employee.setEmail(result.getString("email"));
				employee.setPrenom(result.getString("prenom"));
				employee.setNom(result.getString("nom"));
				employee.setImage(result.getString("photo"));
				employee.setWorkingLocation(result.getString("working_location"));
				//employee.setMonthlySession(result.getString("monthly_session"));
				employee.setType("secretary");
				
				employees.add(employee);
			}
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return employees;
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
	
	public void ReadMessage(int conversationId) throws InstantiationException, IllegalAccessException, SQLException {
		connectDB();
		String Query = "update messages set status='read' where id_conversation="+conversationId;
		PreparedStatement statement = connection.prepareStatement(Query);
		statement.executeUpdate();
		Query = "update conversation set not_read_count = 0 where id="+conversationId;
		statement = connection.prepareStatement(Query);
		statement.executeUpdate();
		statement.close();
	}
	
	public InboxReturn getRecievedMessages(String email){
		String Query;
		PreparedStatement statement;
		InboxReturn inbox = new InboxReturn();
		Conversation conversation = null;
		ArrayList<Message> messages = null;
		Message message;
		ResultSet result;
		try {
			connectDB();
			Query = "select * from conversation where destination=? Order by last_updated DESC";
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result = statement.executeQuery();
			while(result.next()) {
				messages= new ArrayList<>();
				conversation =  new Conversation();
				conversation.setId(result.getInt("id"));
				conversation.setDestination(result.getString("destination"));
				conversation.setSource(result.getString("source"));
				conversation.setTitle(result.getString("title"));
				conversation.setLast_updated(result.getString("last_updated"));
				conversation.setTags(result.getString("tags"));
				
				Query = "select * from messages where id_conversation=? Order by creationTime DESC";
				statement = connection.prepareStatement(Query);
				statement.setInt(1, conversation.getId());
				ResultSet result1 = statement.executeQuery();
				while(result1.next()) {
					message = new Message();
					message.setId(result1.getInt("id"));
					message.setSource(result1.getString("source"));
					message.setDestination(result1.getString("destination"));
					message.setContent(result1.getString("content"));
					message.setTime(result1.getString("creationTime"));
					message.setStatus(result1.getString("status"));
					if(message.getStatus().equals("not read")) {
						conversation.not_read_count++;
						inbox.NotReadMessages++;	
					}
					Query = "select type from users where email=? limit 1";
					statement = connection.prepareStatement(Query);
					statement.setString(1, message.getSource());
					ResultSet result2 = statement.executeQuery();	
					if(result2.next()) {
						if(result2.getString("type").equals("client")) {
							Query = "select user_name , image from client where email=? limit 1";
							statement = connection.prepareStatement(Query);
							
							statement.setString(1, message.getSource());
							ResultSet result3 = statement.executeQuery();
							if(result3.next()) {
								message.setSourceName(result3.getString("user_name"));
								message.setSourceImage(result3.getString("image"));
							}
						}else if(result2.getString("type").equals("service_client")) {
							Query = "select user_name , image from serviceclient where email=? limit 1";
							statement = connection.prepareStatement(Query);
							
							statement.setString(1, message.getSource());
							ResultSet result3 = statement.executeQuery();
							if(result3.next()) {
								message.setSourceName(result3.getString("user_name"));
								message.setSourceImage(result3.getString("image"));
							}
						}
					}
					messages.add(message);
				}
				conversation.setMessages(messages);
				inbox.conversation.add(conversation);
			}
			statement.close();
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return inbox;
	}
	public InboxReturn getSentMessages(String email){
		String Query;
		PreparedStatement statement;
		InboxReturn inbox = new InboxReturn();
		Conversation conversation = null;
		ArrayList<Message> messages = null;
		Message message;
		ResultSet result;
		try {
			connectDB();
			Query = "select * from conversation where source=? Order by last_updated DESC";
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result = statement.executeQuery();
			while(result.next()) {
				messages= new ArrayList<>();
				conversation =  new Conversation();
				conversation.setId(result.getInt("id"));
				conversation.setDestination(result.getString("destination"));
				conversation.setSource(result.getString("source"));
				conversation.setTitle(result.getString("title"));
				conversation.setLast_updated(result.getString("last_updated"));
				conversation.setTags(result.getString("tags"));
				
				Query = "select * from messages where id_conversation=? Order by creationTime DESC";
				statement = connection.prepareStatement(Query);
				statement.setInt(1, conversation.getId());
				ResultSet result1 = statement.executeQuery();
				while(result1.next()) {
					message = new Message();
					message.setId(result1.getInt("id"));
					message.setSource(result1.getString("source"));
					message.setDestination(result1.getString("destination"));
					message.setContent(result1.getString("content"));
					message.setTime(result1.getString("creationTime"));
					message.setStatus(result1.getString("status"));
					if(message.getStatus().equals("not read")) {
						conversation.not_read_count++;
						inbox.NotReadMessages++;	
					}
					Query = "select type from users where email=? limit 1";
					statement = connection.prepareStatement(Query);
					statement.setString(1, message.getSource());
					ResultSet result2 = statement.executeQuery();	
					if(result2.next()) {
						if(result2.getString("type").equals("client")) {
							Query = "select user_name , image from client where email=? limit 1";
							statement = connection.prepareStatement(Query);
							
							statement.setString(1, message.getSource());
							ResultSet result3 = statement.executeQuery();
							if(result3.next()) {
								message.setSourceName(result3.getString("user_name"));
								message.setSourceImage(result3.getString("image"));
							}
						}else if(result2.getString("type").equals("service_client")) {
							Query = "select user_name , image from serviceclient where email=? limit 1";
							statement = connection.prepareStatement(Query);
							
							statement.setString(1, message.getSource());
							ResultSet result3 = statement.executeQuery();
							if(result3.next()) {
								message.setSourceName(result3.getString("user_name"));
								message.setSourceImage(result3.getString("image"));
							}
						}
					}
					messages.add(message);
				}
				conversation.setMessages(messages);
				inbox.conversation.add(conversation);
			}
			statement.close();
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return inbox;
	}
	
	public int addDepot(Depot depot) {
		String Query;
		PreparedStatement statement;
		int result = 0;
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
			
			result = statement.executeUpdate();
			
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
			
		}
		return result ;
	}
	
	public int addOffice(Office office) {
		String Query;
		PreparedStatement statement;
		int result = 0;
		
		try {
			connectDB();
			Query = "INSERT INTO `atelier`.`offices` (`agency_name`, `address`, `email_secretaire`, `lat`, `lon`) \r\n" 
					+ "VALUES (?, ?, ?, ?, ?)";
			statement = connection.prepareStatement(Query);

			statement.setString(1, office.getAgence_nom());
			statement.setString(2, office.getAdress());
			statement.setString(3, office.getSecretary_email());
			statement.setString(4, office.getLat());
			statement.setString(5, office.getLon());
			
			result = statement.executeUpdate();
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return result ;
	}
	
	public int deleteBuilding(String code, String type , String agence_Name) {
		String Query;
		PreparedStatement statement;
		int result = 0 ;
		try {
			connectDB();
			if (type.equals("depot"))
				Query = "DELETE FROM `atelier`.`depot` WHERE (`code` = ? and agence_nom = ?) limit 1";
			else
				Query = "DELETE FROM `atelier`.`offices` WHERE (`code` = ? and agency_name = ?) limit 1";
			
			statement = connection.prepareStatement(Query);
			
			statement.setString(1, code);
			statement.setString(2, agence_Name);			
			result = statement.executeUpdate();
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();	
		}
		return result;
	}
	
	public Building getBuilding(String code, String type , String agence) {
		String Query;
		PreparedStatement statement;
		Building building = null;
		
		ResultSet result;
		try {
			connectDB();
			System.out.println(type);
			if(type.equals("depot")) {
				Query = "SELECT * \r\n"
						+ "FROM atelier.depot \r\n"
						+ "WHERE code = ? and agence_nom = ?";
				
				statement = connection.prepareStatement(Query);
				statement.setString(1, code);
				statement.setString(2, agence);
				
				result = statement.executeQuery();
				
				if(result.next()) {
					building = new Depot();
					building.setCode(result.getString("code"));
					building.setAdress(result.getString("adress"));
					((Depot)building).setCapacite(result.getInt("capacite"));
					((Depot)building).setCapacite_libre(result.getInt("capacite_libre"));
					building.setAgence_nom(result.getString("agence_nom"));
					building.setEmployee_email(result.getString("garagiste_email"));
					building.setLat(result.getString("lat"));
					building.setLon(result.getString("lon"));
					building.setBookings(result.getInt("Bookings"));
					building.setEmployee(getBuildingEmployee(building));
					((Depot)building).setCapacityPercentile((((Depot)building).getCapacite_libre()*100)/((Depot)building).getCapacite());
				}
			} else {
				Query = "SELECT * \r\n"
						+ "FROM atelier.offices \r\n"
						+ "WHERE code = ? and agency_name = ?";
				
				statement = connection.prepareStatement(Query);
				statement.setString(1, code);
				statement.setString(2, agence);
				
				result = statement.executeQuery();
				
				if(result.next()) {
					building = new Office();
					building.setCode(result.getString("code"));
					building.setAdress(result.getString("address"));
					building.setAgence_nom(result.getString("agency_name"));
					building.setEmployee_email(result.getString("email_secretaire"));
					building.setLat(result.getString("lat"));
					building.setLon(result.getString("lon"));
					building.setBookings(result.getInt("Bookings"));
					building.setEmployee(getBuildingEmployee(building));
				}
			}
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return building;
	}
	
	public int editBuilding(Building building) {
		String Query;
		PreparedStatement statement;
		int result = 0;
		try {
			connectDB();
			if(building.getType().equals("depot")) {
				Query = "UPDATE `atelier`.`depot` \r\n"
						+ "SET `adress` = ?, `garagiste_email` = ?, `lat` = ?, `lon` = ?, `Bookings` = ?, `capacite` = ?, `capacite_libre` = ?\r\n"
						+ "WHERE (`code` = ?) and (`agence_nom` = ?)";
				statement = connection.prepareStatement(Query);
				
				statement.setInt(6, ((Depot)building).getCapacite());
				statement.setInt(7, ((Depot)building).getCapacite_libre());
				statement.setString(8, building.getCode());
				statement.setString(9, building.getAgence_nom());
			} else {
				Query = "UPDATE `atelier`.`offices` \r\n"
						+ "SET `address` = ?, `email_secretaire` = ?, `lat` = ?, `lon` = ?,`Bookings` = ?\r\n"
						+ "WHERE (`code` = ?) and (`agency_name` = ?)";
				statement = connection.prepareStatement(Query);
				
				statement.setString(6, building.getCode());
				statement.setString(7, building.getAgence_nom());
			}
			
			statement.setString(1, building.getAdress());
			statement.setString(2, building.getEmployee_email());
			statement.setString(3, building.getLat());
			statement.setString(4, building.getLon());
			statement.setInt(5, building.getBookings());
			
			result = statement.executeUpdate();
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Message> ReadConversation(int id) {
		String Query = "Select * from messages where id_conversation = ? Order by creationTime DESC";
		PreparedStatement statement; 
		ArrayList<Message> messages =new ArrayList<>();
		Message message = null;
		ResultSet result ; 
		try {
			connectDB();
			statement= connection.prepareStatement(Query);
			statement.setInt(1, id);
			result = statement.executeQuery();
			while(result.next()) {
				message = new Message();
				message.setId(result.getInt("id"));
				message.setSource(result.getString("source"));
				message.setDestination(result.getString("destination"));
				message.setContent(result.getString("content"));
				message.setTime(result.getString("creationTime"));
				message.setStatus(result.getString("status"));
				String source = result.getString("source");
				String usertype = getUserType(source);
				if(usertype.equals("client")) {
					Query = "select user_name , image from client where email=? limit 1";
					statement = connection.prepareStatement(Query);
					
					statement.setString(1, message.getSource());
					ResultSet result3 = statement.executeQuery();
					if(result3.next()) {
						message.setSourceName(result3.getString("user_name"));
						message.setSourceImage(result3.getString("image"));
					}
				}else if(usertype.equals("service_client")) {
					Query = "select user_name , image from serviceclient where email=? limit 1";
					
					statement = connection.prepareStatement(Query);
					statement.setString(1, message.getSource());
					ResultSet result3 = statement.executeQuery();
					if(result3.next()) {
						message.setSourceName(result3.getString("user_name"));
						message.setSourceImage(result3.getString("image"));
					}
				}else if(usertype.equals("secretary")) {
					Query = "select nom, prenom , photo from secretary where email=? limit 1";
					
					statement = connection.prepareStatement(Query);
					statement.setString(1, message.getSource());
					ResultSet result3 = statement.executeQuery();
					if(result3.next()) {
						message.setSourceName(result3.getString("nom")+" "+result3.getString("prenom"));
						message.setSourceImage(result3.getString("photo"));
					}
				}else if(usertype.equals("depot manager")) {
					Query = "select nom, prenom , photo from garagiste where email=? limit 1";
					
					statement = connection.prepareStatement(Query);
					statement.setString(1, message.getSource());
					ResultSet result3 = statement.executeQuery();
					if(result3.next()) {
						message.setSourceName(result3.getString("nom")+" "+result3.getString("prenom"));
						message.setSourceImage(result3.getString("photo"));
					}
				}
				messages.add(message);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return messages;
	}
	
	public void SendMessage(Message message , Conversation conversation,String Uploadedpath) throws SQLException {
		String query ; 
		PreparedStatement statement = null ;
		try {
			connectDB();
			query = "Insert into conversation(source , destination , title , tags , not_read_count)"
					+ " values(?,?,?,?,?);";
			statement = connection.prepareStatement(query, statement.RETURN_GENERATED_KEYS);
			statement.setString(1, conversation.getSource());
			statement.setString(2, conversation.getDestination());
			statement.setString(3, conversation.getTitle());
			statement.setString(4, conversation.getTags());
			statement.setInt(5, 0);
			statement.executeUpdate();
			try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
				long conversation_id = 0;
				if(generatedKeys.next()) {
					conversation_id = generatedKeys.getLong(1);
				}
				query = "Insert into messages(id_conversation,source , destination , content , status)"
						+ " values(?,?,?,?,?);";
				statement = connection.prepareStatement(query);
				statement.setLong(1, conversation_id);
				statement.setString(2, message.getSource());
				statement.setString(3, message.getDestination());
				statement.setString(4, message.getContent());
				statement.setString(5, "not read");
				statement.executeUpdate();
				String userType = getUserType(conversation.getDestination());
				if (userType.equals("service_client")) {
					query ="Insert into requests(conversation_id,status,additional_info) values(?,?,?)";
					statement = connection.prepareStatement(query);
					statement.setLong(1, conversation_id);
					statement.setString(2, "available");
					statement.setString(3,Uploadedpath);
					statement.executeUpdate();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		statement.close();
	}
	
	public void reply_message(Message message) throws SQLException {
		String query ; 
		PreparedStatement statement = null ;
		try {
			connectDB();
			query = "Insert into messages(id_conversation,source , destination , content , status)"
					+ " values(?,?,?,?,?);";
			statement = connection.prepareStatement(query);
			statement.setLong(1, message.getCoversation_id());
			statement.setString(2, message.getSource());
			statement.setString(3, message.getDestination());
			statement.setString(4, message.getContent());
			statement.setString(5, "not read");
			statement.executeUpdate();
			String userType = getUserType(message.getDestination());
			String sourceType = getUserType(message.getSource());
			if (userType.equals("service_client") && !sourceType.equals("service_client")) {
				query ="update requests set status= available where conversation_id=?";
				statement = connection.prepareStatement(query);
				statement.setLong(1, message.getCoversation_id());
				statement.executeUpdate();
			}
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

	public void editVehicule(Vehicule vehicule) {
		String Query;
		PreparedStatement statement;
		
		try {
			connectDB();
			Query = "UPDATE `atelier`.`vehicule` \r\n"
					+ "SET `marque` = ?, `modele` = ?, `PLJ` = ?, `PLH` = ?, `type` = ?, `year` = ?, `color` = ?, `seats` = ?, `doors` = ?, `suit_case` = ? \r\n"
					+ "WHERE (`matricule` = ?)";
			statement = connection.prepareStatement(Query);
			
			
			statement.setString(1, vehicule.getMarque());
			statement.setString(2, vehicule.getModele());
			statement.setDouble(3, vehicule.getPLJ());
			statement.setDouble(4, vehicule.getPLH());
			statement.setString(5, vehicule.getType());
			statement.setInt(6, vehicule.getYear());
			statement.setString(7, vehicule.getColor());
			statement.setInt(8, vehicule.getNumberSeats());
			statement.setInt(9, vehicule.getNumberDoors());
			statement.setInt(10, vehicule.getNumberSuitCase());
			
			statement.setString(11, vehicule.getMatricule());
			
			statement.executeUpdate();
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
	}
	
	public Employee getEmployee(String email, String type) {
		String Query;
		PreparedStatement statement;
		Employee employee = null;
		
		ResultSet result;
		try {
			connectDB();
			if(type.equals("depot manager")) {
				Query = "SELECT * \r\n"
						+ "FROM atelier.garagiste \r\n"
						+ "WHERE email = ?";
				
				statement = connection.prepareStatement(Query);
				statement.setString(1, email);
				
				result = statement.executeQuery();
				
				if(result.next()) {
					employee = new Garagiste();
					employee.setEmail(result.getString("email"));
					employee.setPrenom(result.getString("prenom"));
					employee.setNom(result.getString("nom"));
					employee.setImage(result.getString("photo"));
					employee.setWorkingLocation(result.getString("working_location"));
					employee.setMonthlySession(result.getString("monthly_session"));
					employee.setType("depot manager");
				}
			} else {
				Query = "SELECT * \r\n"
						+ "FROM atelier.secretary \r\n"
						+ "WHERE email = ?";
				
				statement = connection.prepareStatement(Query);
				statement.setString(1, email);
				
				result = statement.executeQuery();
				if(result.next()) {
					employee = new Employee();
					employee.setEmail(result.getString("email"));
					employee.setPrenom(result.getString("prenom"));
					employee.setNom(result.getString("nom"));
					employee.setImage(result.getString("photo"));
					employee.setWorkingLocation(result.getString("working_location"));
					//employee.setMonthlySession(result.getString("monthly_session"));
					employee.setType("secretary");
				}
			}
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return employee;
	}
		
	public int addEmployee(Employee employee) {
		String Query;
		PreparedStatement statement;
		int result = 0;
		try {
			Query="INSERT INTO users VALUES (? , ? , ?) ";
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, employee.getEmail());
			statement.setString(2, employee.getPassword());
			statement.setString(3, employee.getType());
			result = statement.executeUpdate();
			if(result == 1) {
				
				if (employee.getType().equals("depot manager")) {
					Query = "INSERT INTO `atelier`.`garagiste` (`email`, `working_location`, `agency_name`) \r\n"
							+ "VALUES (?, ?, ?)";
				} else {
					Query = "INSERT INTO `atelier`.`secretary` (`email`, `working_location`, `agency_name`) \r\n"
							+ "VALUES (?, ?, ?)";
				}
				statement = connection.prepareStatement(Query);
				
				statement.setString(1, employee.getEmail());
				statement.setString(2, employee.getWorkingLocation());
				statement.setString(3, employee.getAgencyName());
				result = statement.executeUpdate();	
				if(result == 1) {
					if (employee.getType().equals("depot manager")) {
					Query = "Update depot set garagiste_email = ? where code=?";
					} else {
					Query = "Update offices set email_secretaire = ? where code=?";
					}
					statement = connection.prepareStatement(Query);
					statement.setString(1, employee.getEmail());
					statement.setString(2, employee.getWorkingLocation());
					result = statement.executeUpdate();
					statement.close();	
				}	
			}
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();	
		}
		return result ;
	}
	
	public int deleteEmployee(String email) {
		String Query;
		PreparedStatement statement;
		int result = 0;
		
		try {
			connectDB();

			String AccountType = getUserType(email);
			Query = "Delete from users where email = ? limit 1";
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			statement.executeUpdate();
			if (AccountType.equals("depot manager")) {
				Query = "Update depot set garagiste_email = NULL where garagiste_email = ? limit 1";
			}else {
				Query = "Update offices set email_secretaire = NULL where email_secretaire = ? limit 1";
			}
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			statement.executeUpdate();
			if (AccountType.equals("depot manager"))
				Query = "DELETE FROM `atelier`.`garagiste` WHERE (`email` = ?)";
			else
				Query = "DELETE FROM `atelier`.`secretary` WHERE (`email` = ?)";
			
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result = statement.executeUpdate();
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();	
		}
		return result;
	}
	
	public int editEmployee(Employee employee) {
		String Query;
		PreparedStatement statement;
		int result = 0;
		try {
			connectDB();
			if(employee.getType().equals("depot manager")) {
				Query = "UPDATE `atelier`.`garagiste` \r\n"
						+ "SET email=? ,`working_location` = ? \r\n"
						+ "WHERE (`email` = ?);";
			} else {
				Query = "UPDATE `atelier`.`secretary` \r\n"
						+ "SET email=? ,`working_location` = ? \r\n"
						+ "WHERE (`email` = ?);";
			}
			
			statement = connection.prepareStatement(Query);
			
			statement.setString(1, employee.getEmail());
			statement.setString(2, employee.getWorkingLocation());
			statement.setString(3, employee.getEmail());
			
			result = statement.executeUpdate();
			if(result == 1) {
				Query = "Update users set mot_pass = ? where email = ? limit 1";
				statement = connection.prepareStatement(Query);
				statement.setString(1, employee.getPassword());
				statement.setString(2, employee.getEmail());
				result = statement.executeUpdate();
			}
			
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return result ;
	}
	
	public void RespondToRequest(String requestId) {
		String Query = "Update requests set status = ? where id = ?";
		PreparedStatement statement ; 
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, "not_available");
			statement.setString(2, requestId);
			statement.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<request> GetRequests(){
		ArrayList<request> requests = new ArrayList<request>();
		request req = null;
		String Query = "Select * from requests where status = ? limit 5";
		PreparedStatement statement ;
		ResultSet result ;
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, "available");
			result = statement.executeQuery();
			while(result.next()) {
				req = new request();
				req.setId(result.getString("id"));
				req.setImages(result.getString("additional_info"));
				req.setStatus(result.getString("status"));
				Query = "Select * from conversation where id=? limit 1";
				statement = connection.prepareStatement(Query);
				statement.setString(1, result.getString("conversation_id"));
				ResultSet result1 = statement.executeQuery();
				if(result1.next()) {
					Conversation conversation = new Conversation();
					conversation.setId(result1.getInt("id"));
					conversation.setSource(result1.getString("source"));
					conversation.setTitle(result1.getString("title"));
					conversation.setNot_read_count(result1.getInt("not_read_count"));
					conversation.setTags(result1.getString("tags"));
					conversation.setLast_updated(result1.getString("last_updated"));
					ArrayList<Message> msgs = ReadConversation(conversation.getId());
					conversation.setMessages(msgs);
					req.setConversation(conversation);
				}
				requests.add(req);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return requests;
	}
	
	public request GetRequestsById(String id){
		request requests = null;
		String Query = "Select * from requests where id= ? limit 1";
		PreparedStatement statement ;
		ResultSet result ;
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, id);
			result = statement.executeQuery();
			while(result.next()) {
				requests = new request();
				requests.setId(result.getString("id"));
				requests.setStatus(result.getString("status"));
				Query = "Select * from conversation where id=? limit 1";
				statement = connection.prepareStatement(Query);
				statement.setString(1, result.getString("conversation_id"));
				ResultSet result1 = statement.executeQuery();
				if(result1.next()) {
					Conversation conversation = new Conversation();
					conversation.setId(result1.getInt("id"));
					conversation.setSource(result1.getString("source"));
					conversation.setTitle(result1.getString("title"));
					conversation.setNot_read_count(result1.getInt("not_read_count"));
					conversation.setTags(result1.getString("tags"));
					conversation.setLast_updated(result1.getString("last_updated"));
					ArrayList<Message> msgs = ReadConversation(conversation.getId());
					conversation.setMessages(msgs);
					requests.setConversation(conversation);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return requests;
	}
	public HashMap<String ,User> getMeetings(String email){
		HashMap<String ,User> map = new HashMap<>();
		String Query = "Select * from meetings where secretary=?";
		PreparedStatement statement;
		ResultSet result;
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result = statement.executeQuery();
			while(result.next()) {
				User user = new User();
				user = getClientInfo(result.getString("client"));
				String date = result.getString("date");
				map.put(date, user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	public HashMap<String ,User> getMeetingsWithClient(String email,String client_email){
		HashMap<String ,User> map = new HashMap<>();
		String Query = "Select * from meetings where secretary=? and client = ?";
		PreparedStatement statement;
		ResultSet result;
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			statement.setString(2, client_email);
			result = statement.executeQuery();
			while(result.next()) {
				User user = new User();
				user = getClientInfo(result.getString("client"));
				String date = result.getString("date");
				map.put(date, user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	public HashMap<String ,User> getUpcomingMeetings(String email ,String limit){
		HashMap<String ,User> map = new HashMap<>();
		String Query = "Select * from meetings where secretary=? and date > ? Order By date asc limit "+limit;
		 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		 LocalDateTime now = LocalDateTime.now(); 
		 String Time = now.toString();
		PreparedStatement statement;
		ResultSet result;
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			statement.setString(2, Time);
			result = statement.executeQuery();
			while(result.next()) {
				User user = new User();
				user = getClientInfo(result.getString("client"));
				String date = result.getString("date");
				map.put(date, user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	public String GetReservationCounter(String email) {
		String Query = "select count(id) as count from reservation where locataire_email = ?";
		PreparedStatement statement;
		ResultSet result;
		String counter = null;
		try {
			connectDB();
			statement = connection.prepareStatement(Query);
			statement.setString(1, email);
			result = statement.executeQuery();
			if (result.next()) {
				counter = result.getString("count");
			}
			statement.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return counter;
	}
	public ArrayList<Reservation> getDepotReservations(String depotCode) {
		return getDepotReservations(depotCode, null, null, 0);
	}
	
	public ArrayList<Reservation> getDepotReservations(String depotCode, int limit) {
		return getDepotReservations(depotCode, null, null, limit);
	}
	
	public ArrayList<Reservation> getDepotReservations(String depotCode, String begin, String end) {
		return getDepotReservations(depotCode, begin, end, 0);
	}
	
	public ArrayList<Reservation> getDepotReservations(String depotCode, String begin, String end, int limit) {
		String query;
		ArrayList<Reservation> reservations = new ArrayList<Reservation>();
		PreparedStatement statement;
		Reservation reservation = null;
		ResultSet result;
		try {
			connectDB();
			if (begin == null && end == null) {
				query = "SELECT *, TIMEDIFF(CONCAT(date_1, \" \", hour_1), NOW()) AS `timeLeft`\r\n"
						+ "FROM reservation AS r\r\n"
						+ "JOIN vehicule AS v ON r.vehicule_matricule = v.matricule\r\n"
						+ "JOIN client AS c ON r.locataire_email = c.email\r\n"
						+ "WHERE depot_code = ?\r\n"
						+ "AND TIMEDIFF(CONCAT(date_1, \" \", hour_1), NOW()) >= 0\r\n"
						+ "ORDER BY CONCAT(date_1, \" \", hour_1) ASC";
			} else {
				query = "SELECT *\r\n"
						+ "FROM reservation AS r\r\n"
						+ "JOIN vehicule AS v ON r.vehicule_matricule = v.matricule\r\n"
						+ "JOIN client AS c ON r.locataire_email = c.email\r\n"
						+ "WHERE depot_code = ?\r\n"
						+ "AND timediff(CONCAT(date_1, \" \", hour_1), ?) >= 0\r\n"
						+ "AND timediff(?, CONCAT(date_1, \" \", hour_1)) > 0\r\n"
						+ "ORDER BY CONCAT(date_1, \" \", hour_1) ASC";
			}
			if (limit != 0) {
				query = query + " limit " + limit;
			}
			
			statement = connection.prepareStatement(query);
			statement.setString(1, depotCode);
			if (begin != null && end != null) {
				statement.setString(2, begin);
				statement.setString(3, end);
			}
			result = statement.executeQuery();
			
			
			
			while(result.next()) {
				reservation = new Reservation();
				
				reservation.setId(result.getInt("id"));
				reservation.setEmail(result.getString("locataire_email"));
				reservation.setVehicule(result.getString("vehicule_matricule"));
				reservation.setPick_up_date(result.getString("date_1"));
				reservation.setReturn_date(result.getString("date_2"));
				reservation.setStatus(result.getString("etat"));
				reservation.setContrat(result.getString("contrat"));
				reservation.setPick_up_hour(result.getString("hour_1"));
				reservation.setReturn_hour(result.getString("hour_2"));
				reservation.setReservation_date(result.getString("date_reservation"));
				reservation.setLocation(result.getString("location"));
				reservation.setCarName(result.getString("marque") + " " + result.getString("modele"));
				reservation.setPLH(result.getInt("PLH"));
				reservation.setPLJ(result.getInt("PLJ"));
				reservation.setCarImage(result.getString("v.image"));
				reservation.setRenterName(result.getString("nom") + " " + result.getString("prenom"));
				reservation.setRenterImage(result.getString("c.image"));
				if (begin == null && end == null) {
					reservation.setTimeLeft(result.getString("timeLeft"));
				}
				
				reservations.add(reservation);
			}
			statement.close();
		}catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return reservations;
	}
	
	public HashMap<String,Integer> depotCarStatByMarque(String depotCode) {
		String query;
		PreparedStatement statement;
		HashMap<String,Integer> carStat = new HashMap<String,Integer>();
		ResultSet result;
		
		try {
			connectDB();
			query = "SELECT marque, count(matricule) AS `total`\r\n"
					+ "FROM atelier.vehicule GROUP BY marque";
			
			statement = connection.prepareStatement(query);
			result = statement.executeQuery();
			
			while (result.next()) {
				carStat.put(result.getString("marque"),result.getInt("total"));
			}
		} catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return carStat;
	}
	
	public HashMap<String,Integer> depotCarStatByRating(String depotCode) {
		String query;
		PreparedStatement statement;
		HashMap<String,Integer> carStat = new HashMap<String,Integer>();
		ResultSet result;
		
		try {
			connectDB();
			query = "SELECT ROUND(rating) AS `rating`, count(matricule) AS `total`\r\n"
					+ "FROM atelier.vehicule\r\n"
					+ "GROUP BY ROUND(rating) ORDER BY ROUND(rating)";
			
			statement = connection.prepareStatement(query);
			result = statement.executeQuery();
			
			while (result.next()) {
				carStat.put(result.getString("rating"),result.getInt("total"));
			}
		} catch (SQLException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return carStat;
	}
}