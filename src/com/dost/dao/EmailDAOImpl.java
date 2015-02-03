package com.dost.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbDostEmail;

@Repository("emailDAO")
public class EmailDAOImpl implements EmailDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<DbDostEmail> getAllEmailEntries() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbDostEmail dde");
		List<DbDostEmail> emails = query.list();
		
		if(emails == null) {
			emails = new ArrayList<DbDostEmail>();
		}
		return emails;
	}

	public List<DbDostEmail> getEmailEntriesByType(String type) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbDostEmail dde where dde.emailType = :type");
		query.setParameter("type", type);
		List<DbDostEmail> emails = query.list();
		
		if(emails == null) {
			emails = new ArrayList<DbDostEmail>();
		}
		return emails;
	}

	public List<DbDostEmail> getEmailEntriesByTypeAndStatus(String type, String status) {
		List<DbDostEmail> emails = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from DbDostEmail dde where dde.emailType = :type and dde.status = :status and dde.recipientEmail is not null");
			query.setParameter("type", type);
			query.setParameter("status", status);
			emails = query.list();
			
			if(emails == null) {
				emails = new ArrayList<DbDostEmail>();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return emails;	
	}
	
	public void updateEmailEntry(DbDostEmail email) {
		Session session = sessionFactory.getCurrentSession();
		session.update(email);
	}
	
	public DbDostEmail getGenericEmailEntriesByTypeAndStatus(String type, String status) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbDostEmail dde where dde.emailType = :type and dde.status = :status and dde.recipientEmail is null and dde.recipient is null");
		query.setParameter("type", type);
		query.setParameter("status", status);
		DbDostEmail genericEmail = (DbDostEmail)query.uniqueResult();
		
		return genericEmail;
	}

	public void createEmailEntry(DbDostEmail email) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(email);
	}

	public void deleteEmailEntry(DbDostEmail email) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(email);
	}
	
	
}
