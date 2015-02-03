package com.dost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.EmailDAO;
import com.dost.hibernate.DbDostEmail;
import com.mchange.v2.encounter.EncounterCounter;

@Service("emailService")
@Transactional(propagation = Propagation.SUPPORTS)
public class EmailServiceImpl implements EmailService {

	@Autowired
	EmailDAO emailDAO;
	
	public List<DbDostEmail> getAllEmailEntries() {
		return emailDAO.getAllEmailEntries();
	}

	public List<DbDostEmail> getEmailEntriesByType(String type) {
		return emailDAO.getEmailEntriesByType(type);
	}

	public List<DbDostEmail> getEmailEntriesByTypeAndStatus(String type,
			String status) {
		return emailDAO.getEmailEntriesByTypeAndStatus(type, status);
	}

	public void updateEmailEntry(DbDostEmail email) {
		emailDAO.updateEmailEntry(email);		
	}

	public DbDostEmail getGenericEmailEntriesByTypeAndStatus(String type, String status) {
		return emailDAO.getGenericEmailEntriesByTypeAndStatus(type, status);	
	}

	public void createEmailEntry(DbDostEmail email) {
		emailDAO.createEmailEntry(email);
		
	}

	public void deleteEmailEntry(DbDostEmail email) {
		emailDAO.deleteEmailEntry(email);		
	}
	
}
