package com.dost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.TopicDAO;

@Service("topicService")
@Transactional(propagation = Propagation.SUPPORTS)
public class TopicServiceImpl implements TopicService {

	@Autowired
	TopicDAO topicDAO;
	
	public String getTopicName(int topicId) {
		return topicDAO.getTopicName(topicId);
	}
}
