package com.dost.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class MobileUsageTask {
	@Scheduled(fixedDelay=30000)
	public void mobileUsageTask() {
		System.out.println("MobileUsageTask Started" );
		
		System.out.println("MobileUsageTask Ended" );
	}
}
