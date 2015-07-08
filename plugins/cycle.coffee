# Ingress cycle calculator
kernel = require '../lib/kernel'

module.exports.doSomething = (data, option) ->
	if option==null 
		console.log "null option"
		n=Date.now()
		console.log n
		kernel.sendMessage data.chat.id, calculateCycleCurrent(n), (resp) ->
    	  console.log resp
	else
	 a=option.match(/^(((0[1-9]|[12][0-9]|3[01])[- /.](0[13578]|1[02])|(0[1-9]|[12][0-9]|30)[- /.](0[469]|11)|(0[1-9]|1\d|2[0-8])[- /.]02)[- /.]\d{4}|29[- /.]02[- /.](\d{2}(0[48]|[2468][048]|[13579][26])|([02468][048]|[1359][26])00))$/)
	 console.log a
	 if a!=null
	 	res=a[0].split("/")
	 	console.log res
	 	y=parseInt(res[2])
	 	m=parseInt(res[1])
	 	m=m-1
	 	d=parseInt(res[0])
	 	n=new Date(y, m ,d)
	 	console.log n
	 	kernel.sendMessage data.chat.id, calculateCycleDate(n), (resp) ->
    	  console.log resp

calculateCycleCurrent = (n) ->
	# milliseconds per cycle
	mCycle = 175*60*60*1000
	# millisecond in a checkpoint
	mCheck = 5*60*60*1000
	# current time
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
	message = "Cycle start: "+formatDate(startCycle)
	message +="\n"
	message +="Cycle end "+formatDate(endCycle)
	message +="\n"
	message +="Prev Check "+formatDate(startCheck)
	message +="\n"
	message +="Next Check "+formatDate(endCheck)
	return message

calculateCycleDate = (n) ->
		# milliseconds per cycle
	mCycle = 175*60*60*1000
	# millisecond in a checkpoint
	mCheck = 5*60*60*1000
	# current time
	#  start of current cycle
	startCycle=Math.floor(n/mCycle)*mCycle
	# end of current cycle
	endCycle= startCycle+mCycle
	#convert them to date format
	startCycle= new Date(startCycle)
	endCycle= new Date(endCycle)
	# end and start of next checkpoint
	startCheck = Math.floor(n/mCheck)*mCheck
	startCheck = new Date(startCheck)
	message = "Cycle start: "+formatDate(startCycle)
	message +="\n"
	message +="Cycle end "+formatDate(endCycle)
	message +="\n"
	message +="List of Chekcpoint \n"
	message +=formatDate(startCheck)+"\n"
	startCheck.setHours(startCheck.getHours()+5)
	message +=formatDate(startCheck)+"\n"
	startCheck.setHours(startCheck.getHours()+5)
	message +=formatDate(startCheck)+"\n"
	startCheck.setHours(startCheck.getHours()+5)
	message +=formatDate(startCheck)+"\n"
	startCheck.setHours(startCheck.getHours()+5)
	message +=formatDate(startCheck)+"\n"
	startCheck.setHours(startCheck.getHours()+5)
	message +=formatDate(startCheck)+"\n"
	return message
	

formatDate = (date) ->
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
