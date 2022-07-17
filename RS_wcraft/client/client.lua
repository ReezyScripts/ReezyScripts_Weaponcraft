
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function notify(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local position = {
    x = 2052.0,        
    y = 3175.0,
    z = 45.2
}
local vPosition = vector3(-439.6175, -1676.9819, 19.2911)

local display = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DrawMarker(-439.6175, -1676.9819, 19.2911, 45.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 65, 160, 255, 100, false, true, 2, true, false, false, false)
        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)
        if CheckPos(position.x, position.y, position.z, pcoords.x, pcoords.y, pcoords.z, 2) then
            notify('Drücke ~INPUT_CONTEXT~ um den Waffen-Crafter zu öffnen')
            if IsControlJustPressed(0, 51) then
                SetDisplay(not display)
            end
        end
    end
end)


RegisterNUICallback("close", function(data)
TriggerEvent("b-notify","Waffen-Crafter", "Crafting abgebrochen!")
    SetDisplay(false)
end)

RegisterNUICallback("crafting", function(data)
    TriggerServerEvent('RS_weaponcraft')
    SetDisplay(false)
end)

RegisterNUICallback("crafting2", function(data)
    TriggerServerEvent('RS_weaponcraft2')
    SetDisplay(false)
end)



RegisterNUICallback("crafting3", function(data)
    TriggerServerEvent('RS_weaponcraft3')
    SetDisplay(false)
end)



RegisterNUICallback("crafting4", function(data)
    TriggerServerEvent('RS_weaponcraft4')
    SetDisplay(false)
end)





RegisterNUICallback("error", function(data)
    ESX.ShowNotification(data.error)
         TriggerEvent("b-notify", "Waffen-Crafter", "Du hast nicht genügend Materialien")
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) 
        DisableControlAction(0, 2, display) 
        DisableControlAction(0, 142, display) 
        DisableControlAction(0, 18, display) 
        DisableControlAction(0, 322, display) 
        DisableControlAction(0, 106, display) 
    end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end
