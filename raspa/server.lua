ESX = nil

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('raspa', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem("raspa", 1)
	TriggerClientEvent('raspa:usar', source)
end)


RegisterServerEvent('raspa:win')
AddEventHandler('raspa:win', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local array = {1000, 1200, 1500}
	local money = array[math.random(3)]
	xPlayer.addAccountMoney("bank", money)
	TriggerClientEvent('esx:showNotification', source, "Foi adicionado ~g~"..money.."$~w~ na sua ~y~Conta do Banco~w~.")
end)

AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
	if item.name == 'raspa' then
		TriggerClientEvent('raspa:addcalc', source)
	end
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	if item.name == 'raspa' and item.count < 1 then
		TriggerClientEvent('raspa:removecalc', source)
	end
end)