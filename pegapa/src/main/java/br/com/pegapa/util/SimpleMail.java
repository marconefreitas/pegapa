package br.com.pegapa.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class SimpleMail {
	
	public void sendEmail() throws EmailException {
	    
		   SimpleEmail email = new SimpleEmail();
		   //Utilize o hostname do seu provedor de email
		   System.out.println("alterando hostname...");
		   email.setHostName("smtp.gmail.com");
		   //Quando a porta utilizada n�o � a padr�o (gmail = 465)
		   email.setSmtpPort(465);
		   //Adicione os destinat�rios
		   email.addTo("marcfreitas0@gmail.com", "Marcone");
		   //Configure o seu email do qual enviar�
		   email.setFrom("pegapanoreply@gmail.com", "Atendimento PegaPa");
		   //Adicione um assunto
		   email.setSubject("Test message");
		   //Adicione a mensagem do email
		   email.setMsg("This is a simple test of commons-email");
		   //Para autenticar no servidor � necess�rio chamar os dois m�todos abaixo
		   System.out.println("autenticando...");
		   email.setSSLOnConnect(true);
		   email.setAuthentication("pegapanoreply@gmail.com", "pegapa12345");
		   System.out.println("enviando...");
		   email.send();
		   System.out.println("Email enviado!");
	}
	public static void main(String[] args) throws EmailException {
		new SimpleMail().sendEmail();
	}

}
