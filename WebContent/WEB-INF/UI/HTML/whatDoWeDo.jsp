<!DOCTYPE html>

<%@taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="en">
<head>
	<meta name="description" content="Is something bothering you - career, relationships, family, work, education, parents? Your D.O.S.T is a your emotional support system where you can be complete anonymous and vent out your feelings to special friends consiting of compassionate psychologists and others. You can privately discuss all your problems with special friends through one to one chat, explore self help and engage with others going through tough times on discussion forums"/>
	<meta name="keywords" content="virtual counseling system, emotional support system, share your feelings, online counseling, share your problems, speak to counselor for free, free therapy, shre emotions, speak to a therapist, find a listener, your trusted friend, your supportive friend"/>
	<meta name="author" content="Your D.O.S.T.">
	<title>Your D.O.S.T - An Emotional Support System</title>
	<link rel="shortcut icon" href="http://yourdost.com/favicon.ico" />
	<link rel="image_src" href="http://yourdost.com/resources/img/dostLogo.jpg" />
	<meta property="og:image" content="http://yourdost.com/resources/img/dostLogo.jpg"/>
	<meta property="og:title" content="Your D.O.S.T - An Emotional Support System"/>
	<meta property="og:image" content="Is something bothering you - career, relationships, family, work, education, parents? Your D.O.S.T is a your emotional support system where you can be complete anonymous and vent out your feelings to special friends consiting of compassionate psychologists and others. You can privately discuss all your problems with special friends through one to one chat, explore self help and engage with others going through tough times on discussion forums"/>
</head>

<jsp:include page="includes/commonHeader.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/jquery.more.css"> 
<script src="${pageContext.request.contextPath}/resources/JS/jquery.plugin.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/JS/jquery.more.js" type="text/javascript"></script>

<body class="container-fluid   theme-default welcome">
	<jsp:include page="includes/header.jsp"></jsp:include>
	<div class=" row-fluid">
		<div class="bannerCloud">
				<p class="col-md-9 messageWhatDoWeDo">
					<strong class="quotesIcon">&ldquo;</strong>
						When someone really hears us without passing judgment on us, it feels <strong>damn good</strong> and makes it possible for us to listen more accurately to ourselves and make meanings of our vaguely felt feelings.
				</p>
				<div class="clearfix"></div>	
		</div>
		<div class="container about_yourdost">
			<div class="col-md-12 message_what_we_do">
				<img src="${pageContext.request.contextPath}/resources/img/whatDoWeDoGraphic.png" border="0" class="responsive-image" alt="Null">
			</div>
			<div class="col-md-12">
				<div class="col-md-6 what_we_are" >
					<h1> Who we  <strong>ARE</strong> </h1>
					<ul>
						<li>Your D.O.S.T is an effort to provide an emotional support to people going through tough times but are not able to talk about their problems due to the fear of society or other external factors. </li>
						<li>The people you are talking to <a href="${pageContext.request.contextPath}/team">(special friends)</a> are hand-picked compassionate and non judgmental individuals. The team of special consists of people from the field of psychology, entrepreneurs, engineers and other experienced people from various walks of life and you could choose whom you want to talk to. </li>
						<li>We believe a "Problem is Problem, no problem is small or big", and if discussed with non-judgemental people, it makes one feel better and helps them see things more objectively.</li>
						<!-- <li>We believe venting out helps us to help ourselves</li> -->
					</ul>
				</div>
				<div class="col-md-6 what_we_are_not" >
					<h1> Who we are <strong> NOT</strong> </h1>
					<ul>
						<li>NOT a medical service.</li>
						<li>DOES NOT give mental health diagnosis. Please consult a mental health practitioner (psychologist/psychiatrist) for that</li>
						<li>NOT a suicide prevention helpline. If you are feeling suicidal, please call up <a href="http://www.satyamevjayate.in/nurturing-mental-health/episode-5article.aspx?uid=s3e5-ar-a3">hotlines</a>
							<ul>
								<li><strong>Vandrevala Foundation Helpline</strong> -  1 860 266 2345 (24x7)</li>
								<li><strong>Aasra</strong> -   +91 22 2754 6669 (24x7)</li>
							</ul>
						</li>
						<!-- <li>DOES NOT have solutions to all your problems but we are definitely here to support you through your lows.</li> -->
					</ul>
				</div>
			</div>				
		</div>
	</div>
<jsp:include page="includes/commonFooter.jsp"></jsp:include>
</body>
</html>