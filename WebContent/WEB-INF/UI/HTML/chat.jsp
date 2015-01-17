<html>
<head>
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
    }
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
	sendMessage();
    });

});
</script>
</head>

<body>
<div id="fb-root"></div>
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
    <hr>
    <div id='log'></div>
</body>
</html>