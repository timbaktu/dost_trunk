package com.dost.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class NewPostOnYourDiscussionTask {
	@Scheduled(fixedDelay=30000)
	public void newPostOnYourDiscussionTask() {
		System.out.println("NewPostOnYourDiscussionTask Started" );
		
		System.out.println("NewPostOnYourDiscussionTask Ended" );
	}
}
