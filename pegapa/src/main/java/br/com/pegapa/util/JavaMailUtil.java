package br.com.pegapa.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUtil {


	public static void enviarEmail(String emailDestinatario, String assunto, String texto) throws MessagingException{
		String host = "smtps.gmail.com";

		Properties props = new Properties();
		/** Parâmetros de conexão com servidor Gmail */
		props.put("mail.transport.protocol", "smtps");
		props.put("mail.smtp.host", host);
		props.put("mail.smtps.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.starttls.enable", "true");




		Session sessionSSL = Session.getInstance(props);
		sessionSSL.setDebug(true);

		Message messageSSL = new MimeMessage(sessionSSL);
		try {
			messageSSL.setFrom(new InternetAddress("pegapanoreply@gmail.com", "Atendimento PegaPá"));
		} catch (UnsupportedEncodingException e) {
			throw new MessagingException("Erro de Encoding", e);
		}
		messageSSL.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailDestinatario)); // real recipient
		messageSSL.setSubject(assunto);
		messageSSL.setText(texto);

		Transport transportSSL = sessionSSL.getTransport();
		// EVEN IF YOU SKIP PORT NUMBER , IT WOULD WORK
		transportSSL.connect("smtp.gmail.com", 465, "pegapanoreply@gmail.com", "pegapa12345"); // account used
		transportSSL.sendMessage(messageSSL, messageSSL.getAllRecipients());
		transportSSL.close();

		System.out.println("SSL done.");

		System.out.println("Feito!!!");

	}

}
