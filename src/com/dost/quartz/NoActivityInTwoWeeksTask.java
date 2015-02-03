package com.dost.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class NoActivityInTwoWeeksTask {
	@Scheduled(fixedDelay=30*60000)
	public void noActivityInTwoWeeksTask() {
		System.out.println("NoActivityInTwoWeeksTask Started" );
		
		System.out.println("NoActivityInTwoWeeksTask Ended" );
	}
}
