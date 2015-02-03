package com.dost.hibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dost_email")
public class DbDostEmail extends DbGeneric implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4665594591445884015L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "emailid")
	private Long emailId;
	@Column(name="conversationid")
	private Long conversationId;
	@Column(name="email_type")
	private String emailType;
	@Column(name="sender")
	private String sender;
	@Column(name="agent")
	private String agent;
	@Column(name="recipient")
	private String recipient;
	@Column(name="recipient_email")
	private String recipientEmail;
	@Column(name="status")
	private String status;
	@Column(name="error_message")
	private String errorMessage;

	public Long getEmailId() {
		return emailId;
	}
	public void setEmailId(Long emailId) {
		this.emailId = emailId;
	}
	public Long getConversationId() {
		return conversationId;
	}
	public void setConversationId(Long conversationId) {
		this.conversationId = conversationId;
	}
	public String getEmailType() {
		return emailType;
	}
	public void setEmailType(String emailType) {
		this.emailType = emailType;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getRecipientEmail() {
		return recipientEmail;
	}
	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	
}
