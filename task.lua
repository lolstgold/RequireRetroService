local task = {
  spawn = function(thing,...)
  	if type(thing) == "thread" then
  		coroutine.resume(thing)
  		return thing
  	end
  	local AAA,AAB,AAC,AAD,AAE,AAF,AAG,AAH,AAI,AAK,AAL,AAM,AAN,AAO,AAP,AAQ,AAR,AAS,AAT,AAU,AAV,AAW,AAX,AAY,AAZ = ...
  	local new = coroutine.create(function()	
  		thing(AAA,AAB,AAC,AAD,AAE,AAF,AAG,AAH,AAI,AAK,AAL,AAM,AAN,AAO,AAP,AAQ,AAR,AAS,AAT,AAU,AAV,AAW,AAX,AAY,AAZ)
  	end)
  	return new
  end,

  defer = function(thing,...)
  	game:service("RunService").Heartbeat:wait()
  	return module.spawn(thing,...)
  end,

  wait = function(number)
  	if type(number)~="number" then number = 0 end
  	local timeRan = game:service("RunService").Heartbeat:wait()
  	while timeRan < (number or 0) do
  		timeRan = timeRan + game:service("RunService").Heartbeat:wait()
  	end
  	return timeRan
  end,
  
  delay = function(number,thing,...)
  	module.wait(number)
  	return module.spawn(thing,...)
  end,

  cancel = function(thing)
  	coroutine.resume(thing)
  	coroutine.resume(thing)
  end
}
