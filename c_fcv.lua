--Terinspirasi dari murfaza FCV, sudah terupdate tanpa menambah bahan bakar ke default

RegisterNetEvent('vin_fix')
AddEventHandler('vin_fix', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local fuelLevel = GetVehicleFuelLevel(vehicle)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		SetVehicleFuelLevel(vehicle, fuelLevel)
		notification("~g~Kendaraanmu Sudah Diperbaiki!")
	else
		notification("~o~Kamu Tidak Didalam Kendaraan!")
	end
end)

RegisterNetEvent('vin_clean')
AddEventHandler('vin_clean', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
		notification("~g~Kendaraanmu Sudah Bersih!")
	else
		notification("~o~Kamu Tidak Ada Dalam Kendaraan!")
	end
end)

RegisterNetEvent('vin_noPerms')
AddEventHandler('vin_noPerms', function()
	notification("~r~Kamu Tidak Memiliki Hak Untuk Menggunakan Ini.")
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

