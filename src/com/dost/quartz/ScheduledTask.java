package com.dost.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class ScheduledTask {
	@Scheduled(fixedDelay=30*60000)
	public void sayHello() {
		//System.out.println("Hello !!! " + new Date());
	}
}