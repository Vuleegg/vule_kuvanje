ESX	= nil

PlayerData = {}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000) 
	end


	Citizen.Wait(2000)
	PlayerData = ESX.GetPlayerData()
end)
-------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    for k, v in pairs(Config.Mestokuvanje) do
      exports.qtarget:RemoveZone(v.name.. 'kuvanje')
      exports.qtarget:AddBoxZone(v.name.. 'kuvanje', v.coords, v.width, v.length, {
        name= v.nama,
        heading= v.heading,
        debugPoly= v.debug,
        minZ= v.coords.z -1,
        maxZ= v.coords.z +2,
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
			header = "🍉Otvorili ste meni za kuvanje",
			txt = "Izaberite opciju molimo!",
			params = {
				event = "",
			}
		},
		{
			id = 2,
			header = "🍲Skuvajte lovacku corbu",
			txt = "Meso 5kom,voda5kom",
			params = {
				event = "vule:corba",
			}
		},
    	{
			id = 3,
			header = "🥗Napravite salatu",
			txt = "Trebace vam : paradajz 15kom i krastavac 8kom",
			params = {
				event = "vule:salata",
			}
		},
		{
			id = 4,
			header = "🥗Napravite mesni narezak",
			txt = "Trebace vam : meso 4kom i grasak 28kom",
			params = {
				event = "vule:mesninarezak",
			}
		},
		{
			id = 5,
			header = "🥗Napravite sendvic",
			txt = "Trebace vam : salata 2kom,meso 4kom,hleb 1kom",
			params = {
				event = "vule:sendvic",
			}
		},
		{
			id = 6,
			header = "🥗Napravite riblju corbu",
			txt = "Trebace vam : voda  5kom,losos 15kom,pastrmka 10kom",
			params = {
				event = "vule:ribljacorba",
			}
		},
	})
end)

RegisterNetEvent("vule:komanda", function()
	ExecuteCommand("kuvanje")
end)	



RegisterNetEvent("vule:corba", function()
	ESX.TriggerServerCallback('vule:kuva1',function(provera)
	if provera then
  exports.ox_inventory:Progress({
		duration = 30000,
		label = 'Kuvas corbu...',
		useWhileDead = false,
		canCancel = true,
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
end)

RegisterNetEvent("vule:salata", function()
	ESX.TriggerServerCallback('vule:kuva3',function(provera)
		if provera then
	exports.ox_inventory:Progress({
		  duration = 15000,
		  label = 'Spremas salatu...',
		  useWhileDead = false,
		  canCancel = true,
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
  end)

  RegisterNetEvent("vule:mesninarezak", function()
	ESX.TriggerServerCallback('vule:kuva3',function(provera)
   if provera then
	exports.ox_inventory:Progress({
		  duration = 25000,
		  label = 'Spremas narezak...',
		  useWhileDead = false,
		  canCancel = true,
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
  end)

  RegisterNetEvent("vule:sendvic", function()
	ESX.TriggerServerCallback('vule:kuva4',function(provera)
if provera then		
	exports.ox_inventory:Progress({
		  duration = 10000,
		  label = 'Spremas sendvic...',
		  useWhileDead = false,
		  canCancel = true,
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
  end)

  RegisterNetEvent("vule:ribljacorba", function()
	ESX.TriggerServerCallback('vule:kuva5',function(provera)
		if provera then
	exports.ox_inventory:Progress({
		  duration = 45000,
		  label = 'Kuvas corbu...',
		  useWhileDead = false,
		  canCancel = true,
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
  end)

---------------pravljenje blipova
Citizen.CreateThread(function()

    for k, v in pairs(Config.Mestokuvanje) do
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

