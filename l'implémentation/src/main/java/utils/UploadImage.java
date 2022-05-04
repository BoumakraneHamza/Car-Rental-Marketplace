package utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;

@MultipartConfig
public class UploadImage {
	HttpServletRequest request ; 
	public UploadImage(HttpServletRequest request) {
		this.request = request;
	}
	
	public String UploadProfilePicture(String path , String directoryPath) throws IOException, ServletException {
		
		Part filePart = request.getPart("file");
		String type = filePart.getContentType();
		path = path + type.replace("image/", ".");
		for (Part part : request.getParts()) {
	      part.write(path);
	    }
		//this code down below is used to copy images from the server side to the web app to be stored permanently
		File Source = new File(directoryPath);
		File dest = new File("C:\\Users\\Hamza\\eclipseJee-workspace\\Atelier\\src\\main\\webapp\\assets\\profile_pics");
		try {
			FileUtils.copyDirectory(Source, dest);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return path;
	}
}
