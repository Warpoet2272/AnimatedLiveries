	local loaded = false
	
	function loadTxd(source, args, raw) 
    local txd = CreateRuntimeTxd('duiTxd')
    local duiObj = CreateDui('http://play.z3rosum.com/ff2.gif', 480, 480)
    _G.duiObj = duiObj
    local dui = GetDuiHandle(duiObj)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, 'duiTex', dui)
    AddReplaceTexture('69charger', 'dukes_sign_1', 'duiTxd', 'duiTex')
end
Citizen.CreateThread(function ()
	while loaded == false do
		Wait(0)
		local playerCar = GetVehiclePedIsIn(GetPlayerPed(-1))
		if playerCar ~= 0 then
			if GetEntityModel(playerCar) == GetHashKey('69charger') then
				loadTxd()
				loaded = true
			end
		end
		if not loaded then
			local veh = nil
			if GetEntityModel(playerCar) == GetHashKey('69charger') then
				loadTxd()
				loaded = true
				break
			end
		end
	end
end)