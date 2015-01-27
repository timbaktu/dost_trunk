package com.dost.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class NewDiscussionTask {
	@Scheduled(fixedDelay=30000)
	public void newDiscussionTask() {
		System.out.println("NewDiscussionTask Started" );
		
		System.out.println("NewDiscussionTask Ended" );
	}
}
