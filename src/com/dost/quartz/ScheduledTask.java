package com.dost.quartz;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;

public class ScheduledTask {
	@Scheduled(fixedDelay=30000)
	public void sayHello() {
		System.out.println("Hello !!! " + new Date());
	}
}