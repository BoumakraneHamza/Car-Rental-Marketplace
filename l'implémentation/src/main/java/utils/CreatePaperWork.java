package utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.imageio.ImageIO;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFPictureData;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import fr.opensagres.poi.xwpf.converter.pdf.PdfOptions;
import model.Agence;
import model.DAO;
import model.Reservation;
import model.User;
import model.Vehicule;
import net.coobird.thumbnailator.Thumbnails;
import fr.opensagres.poi.xwpf.converter.pdf.PdfConverter;

public class CreatePaperWork {
	
	public static void main(String[] args) {
		String path = "C:/Users/Hamza/eclipseJee-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Atelier/assets/documents/contracts";
		ConvertToPDF(path,"37");
	}
	
     public static void CreateContract(Reservation reservation , User user ,String path ,String output) throws InvalidFormatException, IOException {	 
    	 Map <String , String> map = init(reservation , user);
    	 ReplaceData(map,path,output);
    	 ConvertToPDF(path, output);
     }
     public static void FinishContract(String path ,String doc, byte[] image) throws Exception {
    	 byte[] data = resizeImage(image);
    	 addSignature(path,doc,data);
    	 ConvertToPDF(path, doc);
     }
     private static void addSignature(String path,String doc,byte[] image) throws FileNotFoundException, IOException {
    	 String docPathTemplate = path+"/"+doc+".docx";
    	  String docPathAfterReplacing = path+"/"+doc+".docx";
    	  XWPFDocument document = new XWPFDocument(new FileInputStream(docPathTemplate));
	       FileOutputStream out = new FileOutputStream(docPathAfterReplacing);
    	  try {
    	    for (XWPFPictureData pictureData : document.getAllPictures()) {
    	     String fileName =  pictureData.getFileName();
    	      byte[] bytes = image;
    	      replacePictureData(pictureData, bytes);
    	    }
    	   document.write(out);
    	  } catch (Exception ex) {
    	   ex.printStackTrace();  
    	  }
    	}

     private static void replacePictureData(XWPFPictureData source, byte[] data) {
		  try ( ByteArrayInputStream in = new ByteArrayInputStream(data); 
		        OutputStream out = source.getPackagePart().getOutputStream();
		       ) {
		   byte[] buffer = new byte[2048];
		   int length;
		   while ((length = in.read(buffer)) > 0) {
		    out.write(buffer, 0, length);
		   }
		  } catch (Exception ex) {
		   ex.printStackTrace();  
		  }
	 }

     private static byte[] resizeImage(byte[] image) throws Exception {
    	 InputStream is = new ByteArrayInputStream(image);
    	 BufferedImage in = ImageIO.read(is);
    	 ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
    	 int targetWidth = 150;
    	 int targetHeight = 100; 
    	 Thumbnails.of(in)
	        .size(targetWidth, targetHeight)
	        .outputFormat("png")
	        .outputQuality(1)
	        .toOutputStream(outputStream);
    	 byte[] data = outputStream.toByteArray();
    	 return data;
     }
    
     private static Map<String ,String> init(Reservation reservation,User user){
    	 Map <String , String > map = new HashMap<String, String>();
    	 DAO dao = new DAO();
    	 Agence agence  = dao.getAgence(reservation.getVehicule().getAgence());
    	 Vehicule vehicule = dao.getVehicule(reservation.getVehicule().getMatricule());
    	 map.put("AgencyName", agence.getName());
    	 map.put("AgencyAddress", agence.getAddress());
    	 map.put("AgencyPhone", agence.getPhone());
    	 map.put("date1", reservation.getPick_up_date());
    	 map.put("LocataireNom", user.getNom());
    	 map.put("LocatairePrenom", user.getPrenom());
    	 map.put("LocataireEmail", user.getEmail());
    	 map.put("LocatairePhone", user.getTelephone());
    	 map.put("LocataireLicense", user.getNum_carte());
    	 map.put("VehiculeMarque", vehicule.getMarque());
    	 map.put("VehiculeModel", vehicule.getModele());
    	 map.put("VehiculeYear", String.valueOf(vehicule.getYear()));
    	 map.put("VehiculeColor", vehicule.getColor());
    	 map.put("VehiculeMatricule", vehicule.getMatricule());
    	 map.put("date2", reservation.getReturn_date());
    	 map.put("dateReservation", reservation.getReservation_date());
    	 
    	 return map;
     }
     
     private static void ReplaceData(Map<String , String> map ,String path ,String output)throws IOException, InvalidFormatException {
		 InputStream stream = new FileInputStream(new File(path+"/contract.docx"));
         XWPFDocument doc = new XWPFDocument(OPCPackage.open(stream));
    		 try {
    			 for(Entry<String, String>entry :map.entrySet()) {
	                 for (XWPFParagraph p : doc.getParagraphs()) {
		                  List<XWPFRun> runs = p.getRuns();
		                  if (runs != null) {
			                   for (XWPFRun r : runs) {
				                    String text = r.getText(0);
					                    if (text != null && text.equals(entry.getKey())) {
					                    	text = text.replace(entry.getKey(), entry.getValue());
					                    	r.setText(text, 0);
					                    }
			                   }
		                  }
	                 }
                 for (XWPFTable tbl : doc.getTables()) {
                     for (XWPFTableRow row : tbl.getRows()) {
                      for (XWPFTableCell cell : row.getTableCells()) {
                       for (XWPFParagraph p : cell.getParagraphs()) {
                        for (XWPFRun r : p.getRuns()) {
                         String text = r.getText(0);
                         if (text != null && text.equals(entry.getKey())) {
                          text = text.replace(entry.getKey(), entry.getValue());
                          r.setText(text, 0);
                         }
                        }
                       }
                      }
                     }
                    }
    			 }
                }finally {}
    		 doc.write(new FileOutputStream(path+"/"+output+".docx"));
     }
     
     private static void ConvertToPDF(String path, String output) {
    	 try {
             InputStream doc = new FileInputStream(new File(path+"/"+output+".docx"));
             XWPFDocument document = new XWPFDocument(doc);
             PdfOptions options = PdfOptions.create();
             OutputStream out = new FileOutputStream(new File(path+"/"+output+".pdf"));
             PdfConverter.getInstance().convert(document, out, options);
         } catch (IOException ex) {
             System.out.println(ex.getMessage());
         }
     } 	

     private static void deleteTempData(String path ,String file ) {
    	 File Temp = new File(path+"/"+file+".docx");
    	 Temp.delete();
     }
}