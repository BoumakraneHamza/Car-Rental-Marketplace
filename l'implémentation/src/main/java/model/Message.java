package model;

public class Message {
	
	private int id;
	private String source;
	private String sourceName ; 
	private String sourceImage;
	private String destination;
	private String content;
	private int coversation_id;
	private String time;
	private String status ;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCoversation_id() {
		return coversation_id;
	}
	public void setCoversation_id(int coversation_id) {
		this.coversation_id = coversation_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSourceImage() {
		return sourceImage;
	}
	public void setSourceImage(String sourceImage) {
		this.sourceImage = sourceImage;
	}
	public String getSourceName() {
		return sourceName;
	}
	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}
}
