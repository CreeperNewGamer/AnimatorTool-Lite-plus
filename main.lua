-- wip!

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local GUINAME = "AnimatorToolLitePlusGui"
local TOOLNAME = "AnimatorTool Lite+"
local MINPOPUPSIZE = UDim2.new(0, 150, 0, 100)
local ACCLR = Color3.fromRGB(51, 95, 255)
local BGCLR = Color3.fromRGB(18, 18, 21)

local function customWarn(msg)
	warn("⚠️ " .. TOOLNAME .. " warned: \"" .. msg .. "\".")
end

local function popup(elementToDestory, gui, name)
	local frame = Instance.new("CanvasGroup")
	frame.Size = MINPOPUPSIZE
	frame.BackgroundColor3 = BGCLR
	frame.AutomaticSize = Enum.AutomaticSize.XY
	frame.Name = name
	frame.Parent = gui

	local drag = Instance.new("UIDragDetector")
	drag.Parent = frame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = frame

	local contents = Instance.new("Frame")
	contents.Name = "Contents"
	contents.Size = UDim2.new(1, 0, 1, 0)
	contents.Parent = frame
	contents.BackgroundTransparency = 1

	local title = Instance.new("Frame")
	title.Name = "Title"
	title.Size = UDim2.new(1, 0, 0, 35)
	title.Parent = frame
	title.BackgroundColor3 = ACCLR

	local titleText = Instance.new("TextLabel")
	titleText.AutomaticSize = Enum.AutomaticSize.XY
	titleText.Name = "TitleText"
	titleText.Text = name
	titleText.Size = UDim2.new(0, 0, 0, 0)
	titleText.Parent = title
	titleText.LayoutOrder = 1
	titleText.BackgroundTransparency = 1
	titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	
	local listLayout = Instance.new("UIListLayout")
	listLayout.FillDirection = Enum.FillDirection.Horizontal
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	listLayout.Parent = title
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.HorizontalFlex = "SpaceBetween"

	local padding = Instance.new("UIPadding")
	
	local uniformPadding = UDim.new(0, 5)
		
	padding.PaddingTop = uniformPadding
	padding.PaddingBottom = uniformPadding
	padding.PaddingLeft = uniformPadding
	padding.PaddingRight = uniformPadding

	padding.Parent = title
	
	local button = Instance.new("TextButton")
	button.Name = "CloseBtn"
	button.Parent = title
	button.Text = "×"
	button.Size = UDim2.new(0, 23, 0, 23)
	button.TextSize = 12
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	button.BackgroundTransparency = 0.6
	button.LayoutOrder = 2
	button.MouseButton1Click:Connect(function() 
		if elementToDestory then
			elementToDestory:Destroy()
		else
			frame:Destroy()
		end
	end)

	corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0.5, 0)
	corner.Parent = button
	
	return contents
end

local function main(gui)
	local mainPopup = popup(gui, gui, TOOLNAME)
end

if LocalPlayer and PlayerGui then
	local gui = Instance.new("ScreenGui")
	gui.Name = GUINAME
	gui.Parent = PlayerGui
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	main(gui)
else
    customWarn("LocalPlayer and PlayerGui are not yet available!")
end
