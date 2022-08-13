ESX, PlayerData = nil, {}

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(5000)
	end
	Wait(2000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

-------------------------------------------------------------------------------------------------

CreateThread(function()
	Wait(1000)
	for k, v in pairs(Config.MestoKuvanje) do
		exports.qtarget:RemoveZone(v.name .. 'kuvanje')
		exports.qtarget:AddBoxZone(v.name .. 'kuvanje', v.coords, v.width, v.length, {
			name = v.nama,
			heading = v.heading,
			debugPoly = v.debug,
			minZ = v.coords.z - 1,
			maxZ = v.coords.z + 2,
		}, {
			options = {
				{
					event = v.event,
					icon = "fas fa-sign-in-alt",
					label = "Spremite hranu",
					job = v.job,
				},
			},
			distance = 6.5
		})
	end
end)

RegisterNetEvent('vule:kuhinja')
AddEventHandler('vule:kuhinja', function()
	TriggerEvent('nh-context:sendMenu', {
		{
			id = 1,
			header = "🍉 Otvorili ste meni za kuvanje",
			txt = "Izaberite opciju molimo!",
			params = {
				event = "",
			}
		},
		{
			id = 2,
			header = "🍲 Lovacka corba",
			txt = "x5 Meso | x5 Voda",
			params = {
				event = "vule:kuhajopciju",
				args = {
					tip = "corba"
				}
			}
		},
		{
			id = 3,
			header = "🥗 Napravite salatu",
			txt = "x15 Paradajz | x8 Krastavac",
			params = {
				event = "vule:kuhajopciju",
				args = {
					tip = "salata"
				}
			}
		},
		{
			id = 4,
			header = "🥗 Napravite mesni narezak",
			txt = "x4 Meso | x28 Grasak",
			params = {
				event = "vule:kuhajopciju",
				args = {
					tip = "mesninarezak"
				}
			}
		},
		{
			id = 5,
			header = "🥗 Napravite sendvic",
			txt = "x2 Salata | x4 Meso | x1 Hleb",
			params = {
				event = "vule:kuhajopciju",
				args = {
					tip = "sendvic"
				}
			}
		},
		{
			id = 6,
			header = "🥗 Napravite riblju corbu",
			txt = "x5 Voda | x15 Losos | x10 Pastrmka",
			params = {
				event = "vule:kuhajopciju",
				args = {
					tip = "ribljacorba"
				}
			}
		},
	})
end)

AddEventHandler("vule:kuhajopciju")
RegisterNetEvent("vule:kuhajopciju", function(tip)
	if tip == "corba" then
		ESX.TriggerServerCallback('vule:kuva1', function(provera)
			if provera then
				exports.ox_inventory:Progress({
					duration = 30000,
					label = 'Kuvate corbu...',
					useWhileDead = false,
					canCancel = false,
					disable = {
						move = true,
						car = true,
						combat = true,
						mouse = true
					},
					anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' },
				})
			else
				ESX.ShowNotification("Nemate dovoljno sastojaka!")
			end
		end)
	elseif tip == "salata" then
		ESX.TriggerServerCallback('vule:kuva2', function(provera)
			if provera then
				exports.ox_inventory:Progress({
					duration = 15000,
					label = 'Spremate salatu...',
					useWhileDead = false,
					canCancel = false,
					disable = {
						move = true,
						car = true,
						combat = true,
						mouse = true
					},
					anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' },
				})
			else
				ESX.ShowNotification("Nemate dovoljno sastojaka!")
			end
		end)
	elseif tip == "mesninarezak" then
		ESX.TriggerServerCallback('vule:kuva3', function(provera)
			if provera then
				exports.ox_inventory:Progress({
					duration = 25000,
					label = 'Spremate narezak...',
					useWhileDead = false,
					canCancel = false,
					disable = {
						move = true,
						car = true,
						combat = true,
						mouse = true
					},
					anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' },
				})
			else
				ESX.ShowNotification("Nemate dovoljno sastojaka!")
			end
		end)
	elseif tip == "sendvic" then
		ESX.TriggerServerCallback('vule:kuva4', function(provera)
			if provera then
				exports.ox_inventory:Progress({
					duration = 10000,
					label = 'Spremate sendvic...',
					useWhileDead = false,
					canCancel = false,
					disable = {
						move = true,
						car = true,
						combat = true,
						mouse = true
					},
					anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' },
				})
			else
				ESX.ShowNotification("Nemate dovoljno sastojaka!")
			end
		end)
	elseif tip == "ribljacorba" then
		ESX.TriggerServerCallback('vule:kuva5', function(provera)
			if provera then
				exports.ox_inventory:Progress({
					duration = 45000,
					label = 'Kuvate corbu...',
					useWhileDead = false,
					canCancel = false,
					disable = {
						move = true,
						car = true,
						combat = true,
						mouse = true
					},
					anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' },
				})
			else
				ESX.ShowNotification("Nemate dovoljno sastojaka!")
			end
		end)
	end
end)

-- Blipovi
CreateThread(function()
	for k, v in pairs(Config.MestoKuvanje) do
		v.blip = AddBlipForCoord(v.coords)
		SetBlipSprite(v.blip, v.id)
		SetBlipDisplay(v.blip, 4)
		SetBlipScale(v.blip, 0.8)
		SetBlipColour(v.blip, v.colour)
		SetBlipAsShortRange(v.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.title)
		EndTextCommandSetBlipName(v.blip)
	end
end)
