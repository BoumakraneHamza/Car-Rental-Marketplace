package model;

public class request {
	private String id;
	public Conversation conversation;
	private String status;
	
	public Conversation getConversation() {
		return conversation;
	}
	public String getId() {
		return id;
	}
	public String getStatus() {
		return status;
	}
	public void setConversation(Conversation conversation) {
		this.conversation = conversation;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
