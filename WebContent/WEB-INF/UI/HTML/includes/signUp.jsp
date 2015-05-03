<div class="col-md-3" >
	<div class="login_unit right_unit well">
		<p class="header_message">Is something bothering you?</p>
		<p class="message_signup">Discuss your worries by <strong>anonymously</strong> chatting with <strong>psychologists</strong> and other <strong>non-judgemental individuals</strong></p>

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