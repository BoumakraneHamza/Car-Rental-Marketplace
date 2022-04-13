package model;

import java.util.ArrayList;

public class InboxReturn {
	public ArrayList<Message> Messages;
	public int NotReadMessages;
	
	public InboxReturn() {
		Messages = new ArrayList<Message>();
	}
	
	public ArrayList<Message> getMessages() {
		return Messages;
	}
	public int getNotReadMessages() {
		return NotReadMessages;
	}
	public void setMessages(ArrayList<Message> messages) {
		Messages = messages;
	}
	public void setNotReadMessages(int notReadMessages) {
		NotReadMessages = notReadMessages;
	}
}
