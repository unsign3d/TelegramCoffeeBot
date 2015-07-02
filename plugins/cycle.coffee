# Ingress cycle calculator
kernel = require '../lib/kernel'

module.exports.doSomething = (data) ->
	# milliseconds per cycle 
	mCycle = 175*60*60*1000
	# millisecond in a checkpoint
	mCheck = 5*60*60*1000
	# current time
	n=Date.Now()
	#  start of current cycle
	startCycle=Math.floor(n/mCycle)*mCycle
	# end of current cycle
	endCycle= startCycle+mCycle
	#convert them to date format
	startCycle= new Date(startCycle)
	endCycle= new Date(endCycle)
	# end and start of next checkpoint
	startCheck = Math.floor(n/mCheck)*mCheck
	endCheck = startCheck + mCheck
	#convert them to date
	startCheck = new Date(startCheck)
	endCheck = new Date(endCheck)
	message = "Cycle start: "+formatdate(startCycle)
	message +="\n"
	message +="Cycle end "+formatdate(endCycle)
	message +="\n"
	message +="Prev Check "+formatdate(startCheck)
	message +="\n"
	message +="Next Check "+formatdate(endCheck)
	kernel.sendMessage data.chat.id, message, (resp) ->
    	console.log resp
formatdate = (date) ->
	g=date.getDate()
	m=date.getMonth()+1
	y=date.getFullYear();
	h=date.getHours();
	if(g<9)
		g = "0"+ g
	if(m<9)
		m= "0"+m
	datafromatted=g+"/"+m+"/"+y+"  "+h+":00"
	return datafromatted
