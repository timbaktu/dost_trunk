package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbUser;
import com.dost.hibernate.Role;

public interface UserService {

	public void saveUser(String username, String password, String role);
	public Role authenticateUser(String username, String password);
	
	public DbUser getUser(Long userId);
	public String getUserNameById(Long userId);
	public List<DbUser> getUsers(List<Long> userIds);
	
	public List<DbUser> getAllUsers(String role, String pageNo, String per_page, String sort, String order, String username);
	public List<DbUser> getAllUsersLightCall(String role, String pageNo, String per_page, String sort, String order, String username);
	
	public List<DbUser> getAllCounselors();
	
	public DbUser getUserByUsername(String username);
	
	public DbUser checkUserBySecurityQuestion(String username, String question1, String question2, String answer1, String answer2);
	public DbUser updatePassword(String username, String password);
	
	public DbUser updateUser(DbUser dbUser);
	
	public int getUsersCount();
	public List<DbUser> searchUserByUserName(String username);
	
	public DbUser getUserByIdentifier(String identifier);
	public DbUser getUserByEmail(String email);
	
	public boolean isCounselor(String userName);
	public boolean isCounselor(Long userId);
}
