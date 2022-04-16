package model;

import java.util.ArrayList;

public class InboxReturn {
	public ArrayList<Conversation> conversation;
	public int NotReadMessages;
	
	public InboxReturn() {
		conversation = new ArrayList<>();
	}
	
	public int getNotReadMessages() {
		return NotReadMessages;
	}
	public void setNotReadMessages(int notReadMessages) {
		NotReadMessages = notReadMessages;
	}
}
