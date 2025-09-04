local newvals = {
	["string"] = "StringValue",
	["number"] = "NumberValue",
	["boolean"] = "BoolValue",
	["EnumItem"] = "StringValue",
	["Color3"] = "Color3Value",
	["Vector3"] = "Vector3Value",
	["CFrame"] = "CFrameValue"
}

function attrib(v)
	for q,v2 in v:GetAttributes() do
		if not v:FindFirstChild("__ATTRIBUTES") then
			Instance.new("Model",v).Name = "__ATTRIBUTES"
		end
		local new = Instance.new(newvals[typeof(v2)],v.__ATTRIBUTES)
		new.Name = q
		if typeof(v2) == "EnumItem" then
			new.Value = v2.Name
		else
			new.Value = v2
		end
	end
end
function Attributify(v3)
	for _,v in pairs(v3:GetDescendants())  do
		attrib(v)
	end
	attrib(v3)
end

Attributify(workspace)
Attributify(game.ServerStorage)
Attributify(game.Lighting)
Attributify(game.ServerScriptService)
Attributify(game.ReplicatedStorage)
Attributify(game.StarterGui)
Attributify(game.Players)
