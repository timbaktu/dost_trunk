<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<head>
		<meta charset="utf-8">
		<title>Contact Us - D.O.S.T</title>
	</head>
	<body>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		
		<body class="theme-default theme-default-counselor" >
		</sec:authorize>
		<sec:authorize access="!hasRole('ROLE_ADMIN')">
		<body class="theme-default">
		</sec:authorize>
		<jsp:include page="includes/header.jsp"></jsp:include>					
			<script type="text/javascript" src="http://form.jotform.me/jsform/43601489296463"></script>
	</body>
	<jsp:include page="includes/commonFooter.jsp"></jsp:include>		
</html>
