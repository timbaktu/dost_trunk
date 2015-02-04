package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbUser;

public interface TopicService {

	public String getTopicName(int topicId);
	public List<DbUser> getUsersBelongingToDiscussionTopic(long topicId);
	
}
