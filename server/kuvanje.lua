ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj 
end)
print("vule kao nesto kastm")

---------------------------------------------------------------------

ESX.RegisterServerCallback('vule:kuva1', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('meat').count >= 5 and xPlayer.getInventoryItem('water').count >= 5 then
		xPlayer.removeInventoryItem('meat',5)
		xPlayer.removeInventoryItem('water',5)
    xPlayer.addInventoryItem('lovacka_corba',2)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('vule:kuva2', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('paradajz').count >= 15 and xPlayer.getInventoryItem('krastavac').count >= 8 then
		xPlayer.removeInventoryItem('paradajz',15)
		xPlayer.removeInventoryItem('krastavac',8)
    xPlayer.addInventoryItem('salata',4)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('vule:kuva3', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('meat').count >= 4 and xPlayer.getInventoryItem('grasak').count >= 28 then
		xPlayer.removeInventoryItem('grasak',28)
    xPlayer.addInventoryItem('mesni_narezak',6)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('vule:kuva4', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('meat').count >= 4 and xPlayer.getInventoryItem('hleb').count >= 1 and xPlayer.getInventoryItem('salata').count >= 2 then
		xPlayer.removeInventoryItem('meat',4)
		xPlayer.removeInventoryItem('hleb',1)
		xPlayer.removeInventoryItem('salata',2)
    xPlayer.addInventoryItem('sendvic',6)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('vule:kuva5', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('trout').count >= 15 and xPlayer.getInventoryItem('salmon').count >= 10 and xPlayer.getInventoryItem('water').count >= 5 then 
		xPlayer.removeInventoryItem('pileca_prsa',4)
		xPlayer.removeInventoryItem('hleb',1)
		xPlayer.removeInventoryItem('salata',2)
    xPlayer.addInventoryItem('sendvic',6)
		cb(true)
	else
		cb(false)
	end
end)


