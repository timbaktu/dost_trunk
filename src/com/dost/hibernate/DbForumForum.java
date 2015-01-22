package com.dost.hibernate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="jforum_forums")
public class DbForumForum {
	
	@Id
	@Column(name = "forum_id")
	private Long forumId;
	@Column(name = "forum_name")
	private String forumName;
	
	@Column(name = "forum_desc")
	private String forumDesc;

	public Long getForumId() {
		return forumId;
	}

	public void setForumId(Long forumId) {
		this.forumId = forumId;
	}

	public String getForumName() {
		return forumName;
	}

	public void setForumName(String forumName) {
		this.forumName = forumName;
	}

	public String getForumDesc() {
		return forumDesc;
	}

	public void setForumDesc(String forumDesc) {
		this.forumDesc = forumDesc;
	}
	
	
}
