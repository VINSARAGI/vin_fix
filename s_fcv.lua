--Terinspirasi dari murfaza FCV, sudah terupdate tanpa menambah bahan bakar ke default

local everyoneAllowed = false 

local allowed = 
{
	'steam:110000134a0ea37',
}

AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/fix" then
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('vin_fix', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('vin_fix', source)
			else
				TriggerClientEvent('vin_noPerms', source)
			end
		end
	elseif msg == "/clean" then 
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('vin_clean', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('vin_clean', source)
			else
				TriggerClientEvent('vin_noPerms', source)
			end
		end
	end
end)

function checkAllowed(id)
	for k, v in pairs(allowed) do
		if id == v then
			return true
		end
	end
	
	return false
end