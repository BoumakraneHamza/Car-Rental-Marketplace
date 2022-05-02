package utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

@MultipartConfig
public class UploadImage {
	HttpServletRequest request ; 
	public UploadImage(HttpServletRequest request) {
		this.request = request;
	}
	
	public String UploadProfilePicture(String path) throws IOException, ServletException {
		
		Part filePart = request.getPart("file");
		String type = filePart.getContentType();
		path = path + type.replace("image/", ".");
		for (Part part : request.getParts()) {
	      part.write(path);
	    }
		return path;
	}
}
