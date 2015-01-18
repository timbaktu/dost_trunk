<div class="col-md-4" >
	<div class="login_unit right_unit well">
		<p class="header_message">Is something bothering you? Feeling lonely/uninterested?</p>
		<p>We are here to support you and help you in every way we can - think of me as your friend who will be there for you when you need him</p>
		<p class="message_signup">Get into 1 to 1 chat with professional psychologists and experienced people</p>
		<div class="signupLoginOption">
			<p><a href="signupNow" class="btn btn-primary btn-large signup_now">SIGNUP NOW</a></p>
			<a href="login" class="login_acc">Login to your account</a></p> 
			<p class="counter" id="counter"></p>
		</div>
		
		
	</div>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<script>
		$(document).ready(function(){
			$.getJSON('/dost/api/users/count', function(count) {
				$("#counter").append(count.count + ' people already seeking help from special friends!');
			});
		});
	</script>
</div>