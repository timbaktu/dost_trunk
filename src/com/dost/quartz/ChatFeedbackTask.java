package com.dost.quartz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.dost.hibernate.DbDostEmail;
import com.dost.service.EmailService;
import com.dost.util.MessageUtil;

public class ChatFeedbackTask {
	
	@Autowired
	EmailService emailService; 
	
	
	@Scheduled(fixedDelay=30*60000)
	public void chatFeedbackTask() {
		System.out.println("ChatFeedbackTask Started" );
		List<DbDostEmail> emails = getEntriesToProcess();
		for(DbDostEmail email : emails) {
			try {
				sendEmail(email);
				email.setStatus("SENT");
				updateEmailUpdate(email);
			}
			catch (Exception e) {
				System.out.println("Error sending email to : " + email.getRecipient());
				email.setErrorMessage(e.getMessage());
			}
		}
		System.out.println("ChatFeedbackTask Ended" );
	}
	
	private void sendEmail(DbDostEmail email) {
		String subject = "Chat Feedback";
		String content = createEmailContent(email);
		MessageUtil.sendEmail(email.getSender(), email.getRecipientEmail(), subject, content);
	}
	
	private String createEmailContent(DbDostEmail email) {
		StringBuffer content = new StringBuffer();
		content.append("Hi " + email.getRecipient() + ",");
		content.append("<br><br>");
		content.append("I am Richa, Co-Founder for <a href='www.yourdost.com'>Your D.O.S.T</a>. I notice that you had a one to one chat with " + email.getAgent() + ".");
		content.append("<br><br>");
		content.append("Please give us your <a href='https://secure.jotform.me/form/43353828159462?utm_source=email&utm_medium=target%2Bemail&utm_campaign=Interaction%2BFeedback'>feedback</a> regarding your experience with " + email.getAgent() + ". It will not take more than 30 seconds.");
		content.append("<br><br>");
		content.append("I assure you, your information will never be shared with anyone.");
		content.append("<br><br>");
		content.append("Your feedback will help us serve you  and others better.");
		content.append("<br><br>");
		content.append("Regards,");
		content.append("<br>");
		content.append("Richa");
		return content.toString();
	}
	
	private void updateEmailUpdate(DbDostEmail email) {
		email.setStatus("SENT");
		emailService.updateEmailEntry(email);
	}
	
	private List<DbDostEmail> getEntriesToProcess() {
		return emailService.getEmailEntriesByTypeAndStatus("CHAT_FEEDBACK", "NOT_SENT");
	}
}
