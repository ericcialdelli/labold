package ar.com.labold.listener;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import ar.com.labold.exception.BackupException;
import ar.com.labold.fachada.ParametroFachada;
import ar.com.labold.utils.Fecha;

public class LaboContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("Se destruyo la aplicacion");

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("Se inicio la aplicacion");

		try {
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());		
			ParametroFachada parametroFachada = (ParametroFachada)ctx.getBean("parametroFachada");
			String carpeta = parametroFachada.getNombreCarpetaBackup();		
			String nombreArchivoCompleto = carpeta+File.separatorChar+"LaboLD_"+Fecha.dateToStringAAAAMMDD(new Date())+".sql";			
			this.backup(nombreArchivoCompleto, ctx);
			System.out.println("Se realizo backup en "+nombreArchivoCompleto);
		} catch (Exception e) {
			e.printStackTrace();
		}					
	}

	private void backup(String nombre, WebApplicationContext ctx) throws Exception {
	   try {
			
			ParametroFachada parametroFachada = (ParametroFachada)ctx.getBean("parametroFachada");		   
			String carpeta = parametroFachada.getNombreCarpetaMotorBD(); 
   
			Process p = Runtime.getRuntime()
								.exec(carpeta+File.separatorChar+"mysqldump --opt --password=labold --user=labold labold");
							   //.exec("C:"+File.separatorChar+"Program Files"+File.separatorChar+"MySQL"+File.separatorChar+"MySQL Server 5.1"+File.separatorChar+"bin"+File.separatorChar+"mysqldump --opt --password=labold --user=labold labold");	            	           

			InputStream is = p.getInputStream();
			//FileOutputStream fos = new FileOutputStream("c:"+File.separatorChar+"LaboLD_"+Fecha.dateToStringAAAAMMDD(new Date())+".sql");
			FileOutputStream fos = new FileOutputStream(nombre);
			byte[] buffer = new byte[1000];

			int leido = is.read(buffer);
  
			if(leido < 0){
				throw new BackupException("Error al realizar el backup");
			}
      
			while (leido > 0) {
				fos.write(buffer, 0, leido);
				leido = is.read(buffer);
			}

			fos.close();
	
	   } catch (FileNotFoundException e) {
		   e.printStackTrace();
		   throw new BackupException(e.getMessage());	
	   } catch (Exception e) {
		   e.printStackTrace();
		   throw e;
	   }
	}	
	
}
