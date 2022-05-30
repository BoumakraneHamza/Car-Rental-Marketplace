package model;


public class Meeting {

	private User client ;
	private String MeetingType;
	private String MeetingDate;
	private String secretary;
	private Integer booking_Id;

	public Integer getBooking_Id() {
		return booking_Id;
	}
	public void setBooking_Id(int booking_Id) {
		this.booking_Id = booking_Id;
	}
	public User getClient() {
		return client;
	}
	public String getMeetingDate() {
		return MeetingDate;
	}
	public String getMeetingType() {
		return MeetingType;
	}
	public String getSecretary() {
		return secretary;
	}
	public void setClient(User client) {
		this.client = client;
	}
	public void setMeetingDate(String meetingDate) {
		MeetingDate = meetingDate;
	}
	public void setMeetingType(String meetingType) {
		MeetingType = meetingType;
	}
	public void setSecretary(String secretary) {
		this.secretary = secretary;
	}
}
