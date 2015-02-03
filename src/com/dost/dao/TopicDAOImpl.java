package com.dost.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("topicDAO")
public class TopicDAOImpl implements TopicDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public String getTopicName(int topicId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select topic_title from jforum_topics where topic_id = :id").addScalar("topic_title", new StringType());
		query.setParameter("id", topicId);
		
		String topicName = (String)query.uniqueResult();
		return topicName;
	}
	
	

}
