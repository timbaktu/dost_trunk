package com.dost.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbUser;

@Repository("topicDAO")
public class TopicDAOImpl implements TopicDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired 
	UserDAO userDAO;
	
	public String getTopicName(int topicId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select topic_title from jforum_topics where topic_id = :id").addScalar("topic_title", new StringType());
		query.setParameter("id", topicId);
		
		String topicName = (String)query.uniqueResult();
		return topicName;
	}
	

	public List<DbUser> getUsersBelongingToDiscussionTopic(long discussionTopicId) {
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createSQLQuery("select user_id from jforum_posts where topic_id = :id").addScalar("user_id", new LongType());
		query.setParameter("id", discussionTopicId);
		
		List<Long> userIds = query.list();
		List<DbUser> users = null;
		if(userIds != null) {
			users = userDAO.getUsers(userIds);
		}
		return users;
	}

}
