package model;

import java.util.ArrayList;

public class Conversation{
	private int id;
	private String title;
	private String source; 
	private String destination;
	private String last_updated;
	private String tags;
	public int not_read_count;
	ArrayList<Message> messages ;
	
	public Conversation() {
		messages = new ArrayList<Message>();
	}
	
	public int getNot_read_count() {
		return not_read_count;
	}
	public void setNot_read_count(int not_read_count) {
		this.not_read_count = not_read_count;
	}
	public void setMessages(ArrayList<Message> messages) {
		this.messages = messages;
	}
	public ArrayList<Message> getMessages() {
		return messages;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getDestination() {
		return destination;
	}
	public int getId() {
		return id;
	}
	public String getSource() {
		return source;
	}
	public String getTitle() {
		return title;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLast_updated() {
		return last_updated;
	}
	public void setLast_updated(String last_updated) {
		this.last_updated = last_updated;
	}
}