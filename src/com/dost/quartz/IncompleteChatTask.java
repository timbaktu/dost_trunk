package com.dost.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class IncompleteChatTask {
	@Scheduled(fixedDelay=30000)
	public void incompleteChatTask() {
		System.out.println("IncompleteChatTask Started" );
		
		System.out.println("IncompleteChatTask Ended" );
	}
}
