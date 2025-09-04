function typeof(value)
	if pcall(function() local Ae = value.lookVector end) == true then
		return "CFrame"
	elseif pcall(function() local Ae = value.z end) == true then --yes
		return "Vector3"
	end
end
