local newvals = {
	["string"] = "StringValue",
	["number"] = "NumberValue",
	["boolean"] = "BoolValue",
	["EnumItem"] = "StringValue",
	["Color3"] = "Color3Value",
	["Vector3"] = "Vector3Value",
	["CFrame"] = "CFrameValue"
}

local valueReplacements = {
	CanTouch = true,
	CanQuery = true,
}

function typeof(value)
	if pcall(function() local Ae = value.lookVector end) == true then --yes
		return "CFrame"
	elseif pcall(function() local Ae = value.z end) == true then
		return "Vector3"
	end
	return type(value)
end

local attributesModule = {
  GetAttribute = function(part,attribute)
  	if valueReplacements[attribute] then
  		module.SetAttribute(part,attribute,valueReplacements[attribute])
  	end
  	if (part:findFirstChild("__ATTRIBUTES") and part.__ATTRIBUTES:findFirstChild(attribute) and part.__ATTRIBUTES[attribute].className ~= "Model") then
  		return part.__ATTRIBUTES[attribute].Value
  	end
  end,

SetAttribute = function(part,attribute,value)
	if not part:findFirstChild("__ATTRIBUTES") then
		Instance.new("Model",part).Name = "__ATTRIBUTES"
	end

	if value == nil then
		if part.__ATTRIBUTES:findFirstChild(attribute) then
			local bindable = part.__ATTRIBUTES[attribute]:findFirstChild("Event")
			part.__ATTRIBUTES[attribute]:Destroy()
			if bindable then
				local new = Instance.new("Model",part.__ATTRIBUTES)
				new.Name = attribute
				bindable.Parent = new
			end
		end
		return
	end
	
	if part.__ATTRIBUTES:findFirstChild(attribute) and (newvals[typeof(value)] or "StringValue") ~= part.__ATTRIBUTES[attribute].className and part.__ATTRIBUTES[attribute].className ~= "Model" then
		local bindable = part.__ATTRIBUTES[attribute]:findFirstChild("Event")
			part.__ATTRIBUTES[attribute]:Destroy()
			if bindable then
				local new = Instance.new("Model",part.__ATTRIBUTES)
				new.Name = attribute
				bindable.Parent = new
			end
	end
	
	if part.__ATTRIBUTES:findFirstChild(attribute) and part.__ATTRIBUTES[attribute].className == "Model" then
		local new = Instance.new(newvals[typeof(value)],part.__ATTRIBUTES)
		if part.__ATTRIBUTES[attribute]:findFirstChildOfClass("BindableEvent") then
			part.__ATTRIBUTES[attribute]:findFirstChildOfClass("BindableEvent").Parent = new
		end
		part.__ATTRIBUTES[attribute]:Destroy()
		new.Name = attribute
	elseif not part.__ATTRIBUTES:findFirstChild(attribute) then
		Instance.new(newvals[typeof(value)] or "StringValue",part.__ATTRIBUTES).Name = attribute
	end

	if typeof(value) == "EnumItem" then
		part.__ATTRIBUTES[attribute].Value = value.Name
	else
		part.__ATTRIBUTES[attribute].Value = value
	end
end,

GetAttributeChangedSignal = function(part,attribute) --2012+
	if not part:findFirstChild("__ATTRIBUTES") then
		Instance.new("Model",part).Name = "__ATTRIBUTES"
	end
	if not part.__ATTRIBUTES:findFirstChild(attribute) then
		Instance.new("Model",part.__ATTRIBUTES).Name = attribute
	end
	return Instance.new("BindableEvent",part.__ATTRIBUTES[attribute]).Event
end,
  
GetAttributes = function(part)
	local returning = {}
	if part:findFirstChild("__ATTRIBUTES") then
		for _,v in ipairs(part.__ATTRIBUTES:GetChildren()) do
			if v.className ~= "Model" then
				returning[v.Name] = v.Value
			end
		end
	end
	return returning
end
}
