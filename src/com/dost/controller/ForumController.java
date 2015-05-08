package com.dost.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.jforum.SessionFacade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbForumForum;
import com.dost.hibernate.DbForumPost;
import com.dost.hibernate.DbForumTopic;
import com.dost.service.ForumService;
import com.dost.util.Utils;

@Controller
@RequestMapping("api")
public class ForumController {

	@Autowired
	private ForumService forumService;

	@RequestMapping(value = "/topics/count/{count}", method = RequestMethod.GET)
	@ResponseBody
	public List<DbForumTopic> getLastFiveTopics(@PathVariable Integer count) {
		List<DbForumTopic> topics = forumService.getLastNTopics(count);
		for (DbForumTopic topic : topics) {
			List<DbForumPost> posts = topic.getForumPosts();
			List<String> postDates = new ArrayList<String>();
			for(DbForumPost post : posts) {
				postDates.add(post.getPostTime());
			}
			String recentPostDate = latestDate(postDates);

//			Date tempDate = Utils.formatDate("yyyy-MM-dd HH:mm:ss.S", recentPostDate);	
//			recentPostDate = Utils.formatDate("hh:mm a, dd MMMM yyyy", tempDate);	
			
			// Create return data
			List<DbForumPost> outputPosts = new ArrayList<DbForumPost>();
			DbForumPost forumPost = new DbForumPost();
			if(recentPostDate != null) {
				// Format date as needed by below method
				String formattedDate = Utils.formatDateBasedOnInputFormat("yyyy-MM-dd HH:mm:ss.S", recentPostDate);
				// Set IST, this was done for IITG, they have RDS at Southeast
				// No need for live, it has RDS in EST
				forumPost.setPostTime(Utils.convertDatetoIST(formattedDate));
				//forumPost.setPostTime(formattedDate);
			}
			else {
				forumPost.setPostTime("");
			}
			outputPosts.add(forumPost);
			topic.setForumPosts(outputPosts);
		}
		return topics;
	}
	
	@RequestMapping(value = "/forums/all", method = RequestMethod.GET)
	@ResponseBody
	public List<DbForumForum> getForumList() {
		List<DbForumForum> forumList = new ArrayList<DbForumForum>();
		forumList = forumService.getForumList();
		return forumList;
	}

	
	@RequestMapping(value = "/forums/checkForAccess", method = RequestMethod.GET)
	@ResponseBody
	public Boolean checkForUserAccess( HttpServletRequest request ) {
		boolean isLoggedIn = false;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		System.out.println("Auth : " + auth);
		if(auth != null) {
			System.out.println("Authenticated : " + auth.isAuthenticated());
		}
		if(!(auth instanceof AnonymousAuthenticationToken))
		{ 
			System.out.println("Returning true from first if block");
			isLoggedIn = true; 
		}
		return isLoggedIn;
//		boolean canAccess = Utils.showSignUpPage(request);
//		System.out.println("canAccess returned : " + canAccess);
//		if(canAccess) {
//			return true ;
//		} else {
//			return false ; 
//		}
	}

	
	
	private String latestDate(List<String> postDates) {
		Collections.sort(postDates, new Comparator<String>() {
			DateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");

			public int compare(String o1, String o2) {
				try {
					return f.parse(o1).compareTo(f.parse(o2));
				} catch (ParseException e) {
					throw new IllegalArgumentException(e);
				}
			}
		});
		return postDates.get(postDates.size() - 1);
	}
}
