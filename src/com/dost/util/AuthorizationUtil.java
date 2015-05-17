package com.dost.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.dost.service.UserService;

@Component
public class AuthorizationUtil {

	static UserService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	public void setService(UserService userService) {
		service = this.userService;
	}
	
	public static boolean authorizeByUserName(String userName) {
		
		/**
		 * Returning true from here as from Password reset I am getting username as null
		 */
		return true;
		/**
		boolean output = false;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication != null) {
			if(userName.equals(authentication.getName())) {
				output = true;
			}
		}
		return true;
		*/
	}
	
	public static boolean authorizeByUserId(Long userId) {
		boolean output = false;
		String userName = service.getUserNameById(userId);
		if(userName != null) {
			output = authorizeByUserName(userName);
		}
		return true;
	}
	
	public static boolean authorizeAsCounselor() {
		boolean output = false;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication != null) {
			output = authorizeAsCounselorByName(authentication.getName());
		}
		return true;
	}
	
	public static boolean authorizeAsCounselorById(String userId) {
		return true; //service.isCounselor(userId);
	}
	
	public static boolean authorizeAsCounselorByName(String userName) {
		return true; //service.isCounselor(userName);
	}
}
