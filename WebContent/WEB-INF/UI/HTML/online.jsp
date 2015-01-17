<html>
<head>
<style>
Document */
body {
    font:12px arial;
    color: #222;
    text-align:center;
    padding:35px; }
  
form, p, span {
    margin:0;
    padding:0; }
  
input { font:12px arial; }
  
a {
    color:#0000FF;
    text-decoration:none; }
  
    a:hover { text-decoration:underline; }
  
#wrapper, #loginform {
    margin:0 auto;
    padding-bottom:25px;
    background:#EBF4FB;
    width:504px;
    border:1px solid #ACD8F0; }
  
#loginform { padding-top:18px; }
  
    #loginform p { margin: 5px; }
  
#chatbox {
    text-align:left;
    margin:0 auto;
    margin-bottom:25px;
    padding:10px;
    background:#fff;
    height:270px;
    width:430px;
    border:1px solid #ACD8F0;
    overflow:auto; }
  
#usermsg {
    width:395px;
    border:1px solid #ACD8F0; }
  
#submit { width: 60px; }
  
.error { color: #ff0000; }
  
#menu { padding:12.5px 25px 12.5px 25px; }
  
.welcome { float:left; }
  
.logout { float:right; }
  
.msgln { margin:0 0 2px 0; }
</style> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://localhost:8800/dost/strophejs-1.1.3/strophe.js" type="text/javascript"></script>
<script>
var BOSH_SERVICE = 'http://localhost:7070/http-bind/?<body rid=/"1/"/>';
var connection = null;

function log(msg) 
{
    $('#log').append('<div></div>').append(document.createTextNode(msg));
}

function rawInput(data)
{
    log('RECV: ' + data);
}

function rawOutput(data)
{
    log('SENT: ' + data);
}

function onConnect(status)
{
    debugger;
	if (status == Strophe.Status.CONNECTING) {
  log('Strophe is connecting.');
    } else if (status == Strophe.Status.CONNFAIL) {
	log('Strophe failed to connect.');
	$('#connect').get(0).value = 'connect';
    } else if (status == Strophe.Status.DISCONNECTING) {
	log('Strophe is disconnecting.');
    } else if (status == Strophe.Status.DISCONNECTED) {
	log('Strophe is disconnected.');
	$('#connect').get(0).value = 'connect';
    } else if (status == Strophe.Status.CONNECTED) {
	log('Strophe is connected.');
	//connection.disconnect();
	log('ECHOBOT: Send a message to ' + connection.jid + ' to talk to me.');
	
	log('ECHOBOT: Send a message to ' + connection.jid + ' to talk to me.');

	connection.addHandler(onMessage, null,    'message', null, null,  null); 
	connection.addHandler(onOwnMessage, null, 'iq', 'set', null,  null); 
	connection.send($pres().tree());
    }
	
	
}

function onOwnMessage(msg) {
	debugger;
  console.log(msg);
  var elems = msg.getElementsByTagName('own-message');
  if (elems.length > 0) {
      var own = elems[0];
      var to = msg.getAttribute('to');
      var from = msg.getAttribute('from');
      var iq = $iq({
	  to: from,
	  type: 'error',
	  id: msg.getAttribute('id')
      }).cnode(own).up().c('error', {type: 'cancel', code: '501'})
      .c('feature-not-implemented', {xmlns: 'urn:ietf:params:xml:ns:xmpp-stanzas'});

      connection.sendIQ(iq);
  }

  return true;
}

function onMessage(msg) {
	debugger;
    var to = msg.getAttribute('to');
    var from = msg.getAttribute('from');
    var type = msg.getAttribute('type');
    var elems = msg.getElementsByTagName('body');

    if (type == "chat" && elems.length > 0) {
	var body = elems[0];

	log('ECHOBOT: I got a message from ' + from + ': ' + 
	    Strophe.getText(body));

	var text = Strophe.getText(body);
    log(text);
	//var reply = $msg({to: from, from: to, type: 'chat', id: 'purple4dac25e4'}).c('active', {xmlns: "http://jabber.org/protocol/chatstates"}).up().cnode(body);
            //.cnode(Strophe.copyElement(body)); 
	//connection.send(reply.tree());

	log('ECHOBOT: I sent ' + from + ': ' + Strophe.getText(body));
    }
    $("#chatbox").append('<br>' + $("#to").val() + ': ' + text);
    // we must return true to keep the handler alive.  
    // returning false would remove it after it finishes.
    return true;
}


function sendMessage() {
	debugger;
    var message = $('#message').get(0).value;
    var to = $('#to').get(0).value;
    if(message && to){
	var reply = $msg({
	    to: to,
	    type: 'chat'
	})
	.cnode(Strophe.xmlElement('body', message)).up()
	.c('active', {xmlns: "http://jabber.org/protocol/chatstates"});

	connection.send(reply);

	log('I sent ' + to + ': ' + message);
	$("#chatbox").append('<br>' + $("#jid").val() + ': ' + message);
    }
}

function onConnected() {
    alert("not sure who's calling");
	// SEE http://xmpp.org/rfcs/rfc6121.html#roster-login
    // the order of setting initial presence and requesting the roster is important.
    // Get the roster for the first time (we might need to keep a copy on session storage)
    connection.roster.get(onGetRoster, 0);
    // pres is an strophe helper to represent a presence status. after connecting, we tell the server we are online.
    connection.send($pres());

}

function onGetRoster(items) {
    if (!items || items.length == 0)
        return;
    console.log(items);
    alert(items);
}

function getRoster(iq){
	 	alert('alert');
	 
	   $(iq).find('item').each(function(){
	    var jid = $(this).attr('jid'); 
	   	//$('#online').children('ul').append('<li id="'+jid+'"><a href="#" class="online_member"><img src="images/Offline.png" class="status"><p>'+jid+'</p></a></li>');
	   	alert('jid : ' + jid);
	  });
	  console.log(iq);
	  connection.addHandler(on_presence, null, "presence");
	  connection.send($pres());
	}
	
function on_presence(presence){
	console.log(presence);
	 	alert('inner method');
	   var presence_type = $(presence).attr('type'); // unavailable, subscribed, etc...
	   var from = $(presence).attr('from'); // the jabber_id of the contact
	  
	   if (presence_type != 'error'){
	     if (presence_type === 'unavailable'){
	        alert('offline');
	     }else{
	       var show = $(presence).find("show").text(); // this is what gives away, dnd, etc.
	       if (show === 'chat' || show === ''){
	         alert('online');
	       }else{
	         // etc...
	         alert('etc');
	       }
	     }
	   }
	  
	   //RETURN TRUE!!!!!!!!!
	   return true;
	}


$(document).ready(function () {
	var access_token;
          
          debugger;
    connection = new Strophe.Connection(BOSH_SERVICE);
    connection.rawInput = rawInput;
    connection.rawOutput = rawOutput;

    $('#connect').bind('click', function () {
	var button = $('#connect').get(0);
	if (button.value == 'connect') {
	    button.value = 'disconnect';

		connection.connect($('#jid').get(0).value,$('#pass').get(0).value,
					onConnect);
	} else {
	    button.value = 'connect';
	    connection.disconnect();
	}
    });

    $('#send').bind('click', function () {

    	alert('sending');
        iq = $iq({type: 'get'}).c('query', {xmlns: 'jabber:iq:roster'});
        connection.sendIQ(iq, getRoster);

    });
    
    var iq = $iq({type: 'get'}).c('query', {xmlns: 'jabber:iq:roster'});
    log(iq);
    connection.sendIQ(iq,
                function success(iq){
                    $(iq).find('item').each(function () { //all contacts 
                        var jid = $(this).attr('jid');
                        var name = $(this).attr('name') || jid;
                        var subscr = $(this).attr('subscription'); //type subscription
                        console.log('contacts: jid:' + jid + '  Name:' + name);
                        alert('done');
                    });
                },
                function failure(iq){
                    console.log(iq);
                    alert('error');
                },30000/*timeout sendIQ*/
            );
    
    /**
    var iq = $iq({type: 'get'}).c('query', {xmlns: 'jabber:iq:roster'});
    connection.sendIQ(iq,
                function success(iq){
    				debugger;
                    $(iq).find('item').each(function () { //all contacts 
                        var jid = $(this).attr('jid');
                        var name = $(this).attr('name') || jid;
                        var subscr = $(this).attr('subscription'); // type subscription
                        console.log('contacts: jid:' + jid + '  Name:' + name);
                        alert('contacts: jid:' + jid + '  Name:' + name);
                    });
                },
                function failure(iq){
                    console.log(iq);
                    alert('failure');
                },30000
            );
	*/
});
</script>
</head>

<body>
<div id="fb-root"></div>
<!-- 
	<div id='login' style='text-align: center'>
      <form name='cred'>
        <label for='jid'>JID:</label>
        <input type='text' id='jid'>
        <label for='pass'>Password:</label>
        <input type='password' id='pass'>
        <input type='button' id='connect' value='connect'>
      </form>

      <label for='to'>
	  to:
      </label>
      <input type='text' id='to'>
      <label for='message'>
	  message:
      </label>
      <input type='text' id='message'>
      <input type='button' id='send' value='send'>
    </div>
    -->
    <hr>
      <input type='text' id='message' value="hi therr">
      <input type='button' id='send' value='send'>		    
		    
		    
		    
			<form name="message">
			    <input name="usermsg" type="text" id="usermsg" size="63" />
			    <input name="submitmsg" type="button"  id="connect" value="Send" />
			</form>
	</div>
</body>
</html>