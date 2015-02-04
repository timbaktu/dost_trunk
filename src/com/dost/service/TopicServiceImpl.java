package com.dost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.TopicDAO;
import com.dost.hibernate.DbUser;

@Service("topicService")
@Transactional(propagation = Propagation.SUPPORTS)
public class TopicServiceImpl implements TopicService {

	@Autowired
	TopicDAO topicDAO;
	
	public String getTopicName(int topicId) {
		return topicDAO.getTopicName(topicId);
	}
	
	
	public List<DbUser> getUsersBelongingToDiscussionTopic(long discussionTopicId) {
		return topicDAO.getUsersBelongingToDiscussionTopic(discussionTopicId);
	}
}
