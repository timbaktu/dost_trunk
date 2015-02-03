package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbDostEmail;

public interface EmailService {
	public List<DbDostEmail> getAllEmailEntries();
	public List<DbDostEmail> getEmailEntriesByType(String type);
	public List<DbDostEmail> getEmailEntriesByTypeAndStatus(String type, String status);
	/**
	 * For few cases like new discussion, we have only one entry initially in dost_email table with no user attached to it.
	 * This is for performance reason. This API will return entries that is not attached to any user
	 * @param type
	 * @param status
	 * @return
	 */
	public DbDostEmail getGenericEmailEntriesByTypeAndStatus(String type, String status);
	
	public void updateEmailEntry(DbDostEmail email);
	public void createEmailEntry(DbDostEmail email);
	public void deleteEmailEntry(DbDostEmail email);
}
