<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	
	<body class="theme-default testimonial_container">
		<jsp:include page="includes/header.jsp"></jsp:include>
				
		<div class="container row-fluid ">
			<div class="col-md-12">
				<div class="pageTop">
					<h2 class="pull-left pageHeading">What do users say about us?</h2>
					<div class="clearfix"></div>
					<ul >
				    	<li class="stickyNote col-md-3 testimonial ">
				      		<a href="#">
				      			<p><strong>&ldquo;</strong>i was thinking to personally meet a professional life coach or something because i was getting overwhelmed with my recursive thoughts but since i have you guys helping me... i think my search has ended here</p>
				        		<em>(BTech, preparing for banking exam and struggling to find herself)</em>
				      		</a>
				    	</li>
				    	<li class="stickyNote testimonial  col-md-3">
				      		<a href="#">
				      			<p><strong>&ldquo;</strong>Thank you so much for all your help, god bless you, you are such a beautiful soul</p>
				        		<em>(Young girl stressed about her relationship)</em>
				      		</a>
				    	</li>
				    	<li class="stickyNote testimonial  col-md-3">
					      	<a href="#">
					      		<p><strong>&ldquo;</strong>seriously feels good, the work you guys are doing for others, hats off
I am so thankful to you for such an inspiring reply. Really a heartfelt thanks. I have already started working towards getting a job.</p>
					        	<em>(Gay person feeling rejected from society, speaking to us at 3am and then again few days later)</em>
				      		</a>
				    	</li>
				    	<li class="stickyNote testimonial col-md-3">
				      		<a href="#">
				      			<p><strong>&ldquo;</strong>Thanks a lot, its a brilliant initiative. I certainly feel better</p>
				        		<em>(Preparing for IAS exams and feeling directionless)</em>
				      		</a>
				    	</li>
				    	<li class="stickyNote testimonial  col-md-3">
				      		<a href="#">
				      			<p><strong>&ldquo;</strong>i am not going to give up...let life throw any thing on me</p>
				        		<em>(Dejected, lost due to failure in exams)</em>
				      		</a>
				    	</li>
				    	<li class="stickyNote testimonial  col-md-3">
					      	<a href="#">
					      		<p><strong>&ldquo;</strong>thank you so very much, I am feeling very sorted, at least for now</p>
					      		<em>(Young independent girl, overwhelmed with her problems)</em>
				      		</a>
				    	</li>
				    	<li class="stickyNote testimonial col-md-3">
				      		<a href="#">
				      			<p><strong>&ldquo;</strong>i really dont have words to thank you!! you have motivated me to achieve my dream!! you all are doing a great work!! may god bless u all!! once again thanxx a lott
</p>
				        		<em>(A youngster, feeling broken and lost the zeal of life, burdened with expectations)</em>
				      		</a>
				    	</li>
				    	<li class="stickyNote testimonial  col-md-3">
				      		<a href="#">
				      			<p><strong>&ldquo;</strong>Thank you folks for replying .. somewhere today i was feeeling good .. hd a nyc breakfast. went fr a walk wid my dog... .. so overall a smiling and healthy day. feeling positive for sometime... Thank u..
</p>
				        		<em>(stressed with relationship and not able to concentrate on exam preparation)</em>
				      		</a>
				    	</li>
				    	<li class="stickyNote testimonial  col-md-3">
					      	<a href="#">
					      		<p><strong>&ldquo;</strong>Sir, definitely your words are encouraging and thank you for your support. now-a-days I am trying to get over my fear and stay cool in interviews .
</p>
					      		<em>(Btech Graduate stressed with job hunt)</em>
				      		</a>
				    	</li>
				 	</ul>
				 </div>
			</div> 
			
			<sec:authorize access="!hasRole('ROLE_ADMIN')">
				<sec:authorize ifNotGranted="ROLE_USER">
					<a href="${pageContext.request.contextPath}/signupNow" class="testimonial_signup btn btn-primary btn-large signup_now">SIGNUP NOW & START TALKING TO YOUR FRIEND</a>
    			</sec:authorize>
    			<sec:authorize access="hasRole('ROLE_USER')">
    				<a href="${pageContext.request.contextPath}/talkToFriend" class="testimonial_signup btn btn-primary btn-large signup_now">START TALKING TO YOUR FRIEND</a>
    			</sec:authorize>
    		</sec:authorize>
    		<br/><br/>
			
    	</div> <!-- /container -->
		
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	
	</body>
</html>
