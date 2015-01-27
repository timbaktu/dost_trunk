package com.dost.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class ChatFeedbackTask {
	@Scheduled(fixedDelay=30000)
	public void chatFeedbackTask() {
		System.out.println("ChatFeedbackTask Started" );
		
		System.out.println("ChatFeedbackTask Ended" );
	}
}
