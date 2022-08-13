ESX = nil
local ox_inventory = exports.ox_inventory

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
        
    end
     while ESX.GetPlayerData() == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()


end)
Objects = {}
AddEventHandler("onResourceStop", function(res)
  if GetCurrentResourceName() == res then


    for i = 1, #Objects do
      DeleteObject(Objects[i])
    end


  end
end)



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
	
	for _,v in pairs(Config.Mestokuvanje) do  
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


