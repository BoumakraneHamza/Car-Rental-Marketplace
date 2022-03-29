package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.channels.FileChannel;


public class PdfManipulator {
	private int reservationID ; 
	private int locataire_email ;
	
	@SuppressWarnings("resource")
	public static void createPdf(int reservationID, String path) throws IOException {
		
		
		File sourcePath = new File(path + "/facture.pdf");
		File targetPath = new File(path + "/facture_"+reservationID+".pdf");
		FileChannel source = null ;
		FileChannel target = null ;
		
		source = new FileInputStream(sourcePath).getChannel();
		target = new FileOutputStream(targetPath).getChannel();
			
		target.transferFrom(source, 0, source.size());
			
	}
}
