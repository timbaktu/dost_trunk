package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbUser;

public interface TopicDAO {

	public String getTopicName(int topicId);
	public List<DbUser> getUsersBelongingToDiscussionTopic(long discussionTopicId);
}
