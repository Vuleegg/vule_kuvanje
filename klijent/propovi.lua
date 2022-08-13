local ESX, Objects = nil, {}

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(5000)
	end
end)

AddEventHandler("onResourceStop", function(res)
	if GetCurrentResourceName() == res then
		for i = 1, #Objects do
			DeleteObject(Objects[i])
		end
	end
end)

CreateThread(function()
	for _, v in pairs(Config.MestoKuvanje) do
		RequestModel(GetHashKey(v.prop))
		--while not HasModelLoaded(v.prop) do Wait(100) print("cekam model", model) end
		PostaviSef = CreateObject(v.prop, v.lokacija, false, true)
		SetEntityHeading(PostaviSef, v.headings)
		FreezeEntityPosition(PostaviSef, true)
		SetEntityInvincible(PostaviSef, true)
		--SetBlockingOfNonTemporaryEvents(PostaviSef, true)
		PlaceObjectOnGroundProperly(PostaviSef)
		table.insert(Objects, PostaviSef)
		SetModelAsNoLongerNeeded(v.prop)
		--return PostaviSef
	end
end)