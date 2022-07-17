ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)    
RegisterServerEvent('RS_weaponcraft')
AddEventHandler('RS_weaponcraft', function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
                if xPlayer.getInventoryItem('gusi_feder','gusi_lauf','gusi_pulver').count < 10 then 
                 TriggerClientEvent('b-notify', source, 'Du hast nicht genug Material') else
                        xPlayer.removeInventoryItem('gusi_feder', 10)
                        xPlayer.removeInventoryItem('gusi_lauf', 10)
                        xPlayer.removeInventoryItem('gusi_pulver', 10)
                        xPlayer.addWeapon('weapon_gusenberg', 1)
                        TriggerEvent('b-notify', source 'Waffen-Crafter' 'Die hast eine Gusenberg Sweeper hergestellt')
            end
        end)

RegisterServerEvent('RS_weaponcraft2')
AddEventHandler('RS_weaponcraft2', function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
               if xPlayer.getInventoryItem('advanced_feder','advanced_lauf','advanced_rifle').count < 10 then
                 TriggerClientEvent('b-notify', source, 'Du hast nicht genug Material.') else
                        xPlayer.removeInventoryItem('advanced_feder', 10)
                        xPlayer.removeInventoryItem('advanced_lauf', 10)
                        xPlayer.removeInventoryItem('advanced_rifle', 10)
                        xPlayer.addWeapon('weapon_advancedrifle', 1)
                        TriggerEvent('b-notify', source 'Waffen-Crafter' 'Die hast eine Advanced Rifle hergestellt')
            end
        end)

RegisterServerEvent('RS_weaponcraft3')
AddEventHandler('RS_weaponcraft3', function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
               if xPlayer.getInventoryItem('bullpup_feder','bullpup_lauf','bullpup_pulver').count < 10 then
                 TriggerClientEvent('b-notify', source, 'Du hast nicht genug Material.') else
                        xPlayer.removeInventoryItem('bullpup_feder', 10)
                        xPlayer.removeInventoryItem('bullpup_lauf', 10)
                        xPlayer.removeInventoryItem('bullpup_pulver', 10)
                        xPlayer.addWeapon('weapon_bullpuprifle', 1)
                        TriggerEvent('b-notify', source 'Waffen-Crafter' 'Die hast eine Bullpup Rifle hergestellt')
            end
        end)