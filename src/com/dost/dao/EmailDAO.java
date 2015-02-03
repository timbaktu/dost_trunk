package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbDostEmail;

public interface EmailDAO {

	public List<DbDostEmail> getAllEmailEntries();
	public List<DbDostEmail> getEmailEntriesByType(String type);
	public List<DbDostEmail> getEmailEntriesByTypeAndStatus(String type, String status);
	
	public void updateEmailEntry(DbDostEmail email);
	DbDostEmail getGenericEmailEntriesByTypeAndStatus(String type, String status);
	public void createEmailEntry(DbDostEmail email);
	public void deleteEmailEntry(DbDostEmail email);
}
 