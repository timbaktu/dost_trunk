package com.dost.quartz;

import org.springframework.scheduling.annotation.Scheduled;

public class SignupOnlyTask {
	@Scheduled(fixedDelay=30*60000)
	public void signupOnlyTask() {
		System.out.println("SignupOnlyTask Started" );
		
		System.out.println("SignupOnlyTask Ended" );
	}
}
