--> Overdrive H On Top.

local shared = odh_shared_plugins

-- Step 1: Create your Tab
local guns_skins_tab = shared.CreateTab("Guns Skins", "/sharkbloxdark-arch/GunsSkinsPlugin/refs/heads/main/Gunsicon")

-- Step 2: Create your Section
local customs_section = guns_skins_tab:AddSection("Weapon Customs", "SKIN SELECTION & COLOR")

-- Step 3: Add UI Elements

-- [1] Credits Label
customs_section:AddLabel("Plugin Created by Grave")

-- [2] Weapon Selection Dropdown
local selected_gun = "AWP"
local gun_dropdown = customs_section:AddDropdown("Select Weapon", {"AWP", "AK-47", "M4A1"}, function(choice)
    selected_gun = choice
    shared.Notify("Selected: " .. choice, 3)
end)

-- [3] Colorpicker for skin color
local current_color = Color3.fromRGB(255, 0, 0)
local skin_color = customs_section:AddColorpicker("Skin Color", current_color, function(selected_color)
    current_color = selected_color
end)

-- [4] Slider for skin intensity / glossiness
local current_intensity = 50
local skin_intensity = customs_section:AddSlider("Skin Intensity", 0, 100, current_intensity, function(value)
    current_intensity = value
end)

-- [5] Toggle for extra visual effects
local glow_enabled = false
local effects_toggle = customs_section:AddToggle("Enable Glow Effect", function(state)
    glow_enabled = state
    if state then
        shared.Notify("Glow Effect Enabled", 2)
    else
        shared.Notify("Glow Effect Disabled", 0)
    end
end)

-- [6] Button to apply the skin
customs_section:AddButton("Turn On / Apply Skin", function()
    shared.Notify("Applied skin to " .. selected_gun .. "!", 2)
end)

-- [7] Keybind to trigger skin toggle quickly
customs_section:AddKeybind("Toggle Skin Shortcut", "U", function()
    shared.Notify("Shortcut pressed: Skin toggled!", 1)
end)

-- Notification on successful plugin load
shared.Notify("Guns Skins plugin loaded successfully!", 2)
