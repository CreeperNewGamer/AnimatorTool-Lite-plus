-- wip!

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local GUINAME = "AnimatorToolLitePlusGui"
local TOOLNAME = "AnimatorTool Lite+"
local MINPOPUPSIZE = UDim2.new(0, 150, 0, 100)

local function customWarn(msg)
	warn("⚠️ " .. TOOLNAME .. " warned: \"" .. msg .. "\".")
end

local function popup(gui, name)
	local frame = Instance.new("Frame")
	frame.Size = MINPOPUPSIZE
	frame.AutomaticSize = Enum.AutomaticSize.XY
	frame.Name = name
	frame.Parent = gui
	
	return frame
end

local function main(gui)
	local mainPopup = popup(gui, TOOLNAME)
end

if LocalPlayer and PlayerGui then
	local gui = Instance.new("ScreenGui")
	gui.Name = GUINAME
	gui.Parent = PlayerGui
	
	main(gui)
else
    -- This block is mainly for safety or when the script runs very early
    customWarn("LocalPlayer and PlayerGui are not yet available!")
end
