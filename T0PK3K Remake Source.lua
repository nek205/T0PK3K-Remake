setfpscap(0)

--{ Instances: }--

local TKR = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Topbar = Instance.new("Frame")
local Exit = Instance.new("TextButton")
local Controllers = Instance.new("Frame")
local Hide = Instance.new("TextButton")
local DisabledLabel = Instance.new("TextLabel")
local Holder = Instance.new("Frame")
local Home = Instance.new("Frame")
local Welcome = Instance.new("TextLabel")
local Container = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local TextLabel_7 = Instance.new("TextLabel")
local TextLabel_8 = Instance.new("TextLabel")
local TextLabel_9 = Instance.new("TextLabel")
local TextLabel_11 = Instance.new("TextLabel")
local Scripts = Instance.new("Frame")
local Container_3 = Instance.new("ScrollingFrame")
local TextBox = Instance.new("TextBox")
local Script = Instance.new("TextButton")
local Script_2 = Instance.new("TextButton")
local Script_3 = Instance.new("TextButton")
local Script_4 = Instance.new("TextButton")
local Script_5 = Instance.new("TextButton")
local Script_6 = Instance.new("TextButton")
local Script_7 = Instance.new("TextButton")
local Script_8 = Instance.new("TextButton")
local Script_9 = Instance.new("TextButton")
local Script_10 = Instance.new("TextButton")
local Script_11 = Instance.new("TextButton")
local Script_12 = Instance.new("TextButton")
local Script_13 = Instance.new("TextButton")
local Script_14 = Instance.new("TextButton")
local Script_15 = Instance.new("TextButton")
local Script_16 = Instance.new("TextButton")
local Script_17 = Instance.new("TextButton")
local Script_18 = Instance.new("TextButton")
local Script_19 = Instance.new("TextButton")
local Script_20 = Instance.new("TextButton")
local Script_21 = Instance.new("TextButton")
local Script_22 = Instance.new("TextButton")
local Script_23 = Instance.new("TextButton")
local Script_24 = Instance.new("TextButton")
local Info = Instance.new("Frame")
local Container_4 = Instance.new("ScrollingFrame")
local TextLabel_12 = Instance.new("TextLabel")
local Settings = Instance.new("Frame")
local Container_5 = Instance.new("ScrollingFrame")
local TextLabel_13 = Instance.new("TextLabel")
local TextLabel_14 = Instance.new("TextLabel")
local TextLabel_15 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local Navigation = Instance.new("Frame")
local Topbar_2 = Instance.new("Frame")
local Scroll = Instance.new("ScrollingFrame")
local TextButton_2 = Instance.new("TextButton")
local TextButton_3 = Instance.new("TextButton")
local TextButton_4 = Instance.new("TextButton")
local TextButton_5 = Instance.new("TextButton")
local TextButton_6 = Instance.new("TextButton")
local TextButton_29 = Instance.new("TextButton")
local TextBox_2 = Instance.new("TextBox")
local TextBox_3 = Instance.new("TextBox")
local TextBox_4 = Instance.new("TextBox")
local DisabledCommand = Instance.new("TextBox")
local Label = Instance.new("TextLabel")

wait(0.5)
print("Loading...")

--{ Properties: }--

TKR.Name = "TKR"
TKR.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
TKR.ResetOnSpawn = false




local lpr = game.Players.LocalPlayer

--{ Text Stuff: }--

local name = game.Players.LocalPlayer.DisplayName
local place = game.PlaceId
local ping = "-"
local filteringenabled = game.Workspace.FilteringEnabled

--{ Topbar Buttons: }--

local exitdirectory = game.Players.LocalPlayer.PlayerGui.TKR
local closed = UDim2.new(0, 470,0, 30)
local winState = 0


Main.Name = "Main"
Main.Parent = TKR
Main.Active = true
Main.BackgroundColor3 = Color3.fromRGB(32, 66, 190)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Draggable = true
Main.Position = UDim2.new(0, 418, 0, 40)
Main.Selectable = true
Main.Size = UDim2.new(0, 470, 0, 395)

Topbar.Name = "Topbar"
Topbar.Parent = Main
Topbar.BackgroundColor3 = Color3.fromRGB(60, 119, 191)
Topbar.BorderSizePixel = 0
Topbar.Position = UDim2.new(0, 150, 0, 0)
Topbar.Size = UDim2.new(0, 320, 0, 30)

Controllers.Name = "Controllers"
Controllers.Parent = Topbar
Controllers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Controllers.BackgroundTransparency = 1.000
Controllers.Position = UDim2.new(1, -128, 0, 3)
Controllers.Size = UDim2.new(0, 125, 1, -6)

Exit.Name = "Exit"
Exit.Parent = Controllers
Exit.BackgroundColor3 = Color3.fromRGB(141, 27, 27)
Exit.BorderSizePixel = 0
Exit.Position = UDim2.new(1, -24, 0, 0)
Exit.Size = UDim2.new(0, 24, 0, 24)
Exit.AutoButtonColor = false
Exit.Font = Enum.Font.SourceSans
Exit.Text = ""
Exit.TextSize = 14.000
Exit.MouseButton1Click:Connect(function()
	exitdirectory:Destroy()
end)

Hide.Name = "Hide"
Hide.Parent = Controllers
Hide.BackgroundColor3 = Color3.fromRGB(199, 89, 0)
Hide.BorderSizePixel = 0
Hide.Position = UDim2.new(1, -50, 0, 0)
Hide.Size = UDim2.new(0, 24, 0, 24)
Hide.AutoButtonColor = false
Hide.Font = Enum.Font.SourceSans
Hide.Text = ""
Hide.TextSize = 14.000
Hide.MouseButton1Click:Connect(function()
	if winState == 0 then
		winState = 1
		Main:TweenSize(UDim2.new(0, 470, 0, 30), 'Out', 'Quad', 0.3, true)
	else
		winState = 0
		Main:TweenSize(UDim2.new(0, 470, 0, 395), 'In', 'Quad', 0.3, true)
	end

end)

DisabledLabel.Name = "DisabledLabel"
DisabledLabel.Parent = Controllers
DisabledLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DisabledLabel.BackgroundTransparency = 1.000
DisabledLabel.Size = UDim2.new(0, 65, 1, 0)
DisabledLabel.Visible = false
DisabledLabel.Font = Enum.Font.SourceSans
DisabledLabel.Text = "?"
DisabledLabel.TextColor3 = Color3.fromRGB(13, 105, 172)
DisabledLabel.TextSize = 16.000
DisabledLabel.TextStrokeTransparency = 0.700
DisabledLabel.TextXAlignment = Enum.TextXAlignment.Right

Holder.Name = "Holder"
Holder.Parent = Main
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.Position = UDim2.new(0, 150, 0, 30)
Holder.Size = UDim2.new(0, 320, 0, 365)

Home.Name = "Home"
Home.Parent = Holder
Home.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home.BackgroundTransparency = 1.000
Home.Size = UDim2.new(1, 0, 1, 0)

Welcome.Name = "Welcome"
Welcome.Parent = Home
Welcome.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Welcome.BackgroundTransparency = 1.000
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0, 15, 0, 0)
Welcome.Selectable = true
Welcome.Size = UDim2.new(1, -30, 0, 40)
Welcome.Font = Enum.Font.SourceSansBold
Welcome.Text = "Welcome, "..tostring(name)
Welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
Welcome.TextSize = 34.000
Welcome.TextStrokeTransparency = 0.500
Welcome.TextXAlignment = Enum.TextXAlignment.Left

Container.Name = "Container"
Container.Parent = Home
Container.BackgroundColor3 = Color3.fromRGB(32, 66, 190)
Container.BorderColor3 = Color3.fromRGB(45, 72, 200)
Container.Position = UDim2.new(0, 15, 0, 41)
Container.Size = UDim2.new(1, -30, 0.145205483, 250)

TextLabel.Parent = Container
TextLabel.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 6, 0, 6)
TextLabel.Size = UDim2.new(1, -12, 0, 20)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "T0PK3K REMAKE FE EDITION"
TextLabel.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel.TextSize = 14.000

TextLabel_2.Parent = Container
TextLabel_2.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 6, 0, 29)
TextLabel_2.Size = UDim2.new(1, -12, 0, 20)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Patch version 26"
TextLabel_2.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_2.TextSize = 14.000

TextLabel_3.Parent = Container
TextLabel_3.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, 6, 0, 270)
TextLabel_3.Size = UDim2.new(1, -12, 0, 20)
TextLabel_3.Visible = false
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "?"
TextLabel_3.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_3.TextSize = 14.000

TextLabel_4.Parent = Container
TextLabel_4.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0, 6, 0, 53)
TextLabel_4.Size = UDim2.new(1, -12, 0, 20)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_4.TextSize = 14.000

TextLabel_5.Parent = Container
TextLabel_5.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0, 6, 0, 75)
TextLabel_5.Size = UDim2.new(1, -12, 0, 20)
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "Server Size: "
TextLabel_5.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_5.TextSize = 14.000

TextLabel_6.Parent = Container
TextLabel_6.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(0, 6, 0, 98)
TextLabel_6.Size = UDim2.new(1, -12, 0, 20)
TextLabel_6.Font = Enum.Font.SourceSans
TextLabel_6.Text = "FilteringEnabled: "..tostring(filteringenabled)
TextLabel_6.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_6.TextSize = 14.000

TextLabel_7.Parent = Container
TextLabel_7.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_7.BorderSizePixel = 0
TextLabel_7.Position = UDim2.new(0, 6, 0, 124)
TextLabel_7.Size = UDim2.new(1, -12, 0, 20)
TextLabel_7.Font = Enum.Font.SourceSans
TextLabel_7.Text = "PlaceId: "..tostring(place)
TextLabel_7.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_7.TextSize = 14.000

TextLabel_8.Parent = Container
TextLabel_8.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_8.BorderSizePixel = 0
TextLabel_8.Position = UDim2.new(0, 6, 0, 150)
TextLabel_8.Size = UDim2.new(1, -12, 0, 20)
TextLabel_8.Font = Enum.Font.SourceSans
TextLabel_8.Text = "FPS: "
TextLabel_8.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_8.TextSize = 14.000

TextLabel_9.Parent = Container
TextLabel_9.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_9.BorderSizePixel = 0
TextLabel_9.Position = UDim2.new(0, 6, 0, 176)
TextLabel_9.Size = UDim2.new(1, -12, 0, 20)
TextLabel_9.Font = Enum.Font.SourceSans
TextLabel_9.Text = "?: "..tostring(ping)
TextLabel_9.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_9.TextSize = 14.000

Scripts.Name = "Scripts"
Scripts.Parent = Holder
Scripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scripts.BackgroundTransparency = 1.000
Scripts.Size = UDim2.new(1, 0, 1, 0)
Scripts.Visible = false

Container_3.Name = "Container"
Container_3.Parent = Scripts
Container_3.Active = true
Container_3.BackgroundColor3 = Color3.fromRGB(45, 72, 200)
Container_3.BorderColor3 = Color3.fromRGB(32, 66, 190)
Container_3.Position = UDim2.new(0, 15, 0, 10)
Container_3.Size = UDim2.new(1, -30, 0, 320)
Container_3.BottomImage = "rbxassetid://368504177"
Container_3.CanvasSize = UDim2.new(0, 0, 0, 2000) -- 818
Container_3.MidImage = "rbxassetid://368504177"
Container_3.ScrollBarThickness = 5
Container_3.TopImage = "rbxassetid://368504177"

TextBox.Parent = Container_3
TextBox.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 6, 0, 6)
TextBox.Size = UDim2.new(1, -17, 0, 20)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(199, 199, 199)
TextBox.TextSize = 14.000

--{ Searcbar: }--

local scroll = exitdirectory.Main.Holder.Scripts.Container
local searchbar = scroll.TextBox

searchbar.Changed:Connect(function()
	local text = searchbar.Text:lower()
	if text ~= "" then
		local buttons = scroll:GetDescendants()
		for _, button in pairs(buttons) do
			if button:IsA("TextButton") then
				local buttonText = button.Text:lower()
				if string.find(buttonText, text) then
					button.Visible = true
					--button.Position = UDim2.new(0, 6,0, 29)
				else
					button.Visible = false
				end
			end
		end
	else
		local buttons = scroll:GetDescendants()
		for _, button in pairs(buttons) do
			if button:IsA("TextButton") then
				button.Visible = true
			end
		end
	end
end)

Script.Name = "Script"
Script.Parent = Container_3
Script.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script.BorderSizePixel = 0
Script.Position = UDim2.new(0, 6, 0, 29)
Script.Size = UDim2.new(1, -16, 0, 25)
Script.Font = Enum.Font.SourceSans
Script.Text = "Adonis"
Script.TextColor3 = Color3.fromRGB(199, 199, 199)
Script.TextSize = 14.000
Script.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Adonis", true))()
end)

Script_2.Name = "Script"
Script_2.Parent = Container_3
Script_2.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_2.BorderSizePixel = 0
Script_2.Position = UDim2.new(0, 6, 0, 57)
Script_2.Size = UDim2.new(1, -16, 0, 25)
Script_2.Font = Enum.Font.SourceSans
Script_2.Text = "Fiery"
Script_2.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_2.TextSize = 14.000
Script_2.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Fiery"))()
end)

Script_3.Name = "Script"
Script_3.Parent = Container_3
Script_3.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_3.BorderSizePixel = 0
Script_3.Position = UDim2.new(0, 6, 0, 85)
Script_3.Size = UDim2.new(1, -16, 0, 25)
Script_3.Font = Enum.Font.SourceSans
Script_3.Text = "Flash"
Script_3.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_3.TextSize = 14.000
Script_3.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Flash"))()
end)

Script_4.Name = "Script"
Script_4.Parent = Container_3
Script_4.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_4.BorderSizePixel = 0
Script_4.Position = UDim2.new(0, 6, 0, 113)
Script_4.Size = UDim2.new(1, -16, 0, 25)
Script_4.Font = Enum.Font.SourceSans
Script_4.Text = "Grapple"
Script_4.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_4.TextSize = 14.000
Script_4.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Grapple"))()
end)

Script_5.Name = "Script"
Script_5.Parent = Container_3
Script_5.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_5.BorderSizePixel = 0
Script_5.Position = UDim2.new(0, 6, 0, 141)
Script_5.Size = UDim2.new(1, -16, 0, 25)
Script_5.Font = Enum.Font.SourceSans
Script_5.Text = "Gravity"
Script_5.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_5.TextSize = 14.000
Script_5.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Gravity"))()
end)

Script_6.Name = "Script"
Script_6.Parent = Container_3
Script_6.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_6.BorderSizePixel = 0
Script_6.Position = UDim2.new(0, 6, 0, 169)
Script_6.Size = UDim2.new(1, -16, 0, 25)
Script_6.Font = Enum.Font.SourceSans
Script_6.Text = "Homebrew"
Script_6.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_6.TextSize = 14.000
Script_6.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Homebrew"))()
end)

Script_7.Name = "Script"
Script_7.Parent = Container_3
Script_7.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_7.BorderSizePixel = 0
Script_7.Position = UDim2.new(0, 6, 0, 197)
Script_7.Size = UDim2.new(1, -16, 0, 25)
Script_7.Font = Enum.Font.SourceSans
Script_7.Text = "Parkour"
Script_7.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_7.TextSize = 14.000
Script_7.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Parkour"))()
end)

Script_8.Name = "Script"
Script_8.Parent = Container_3
Script_8.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_8.BorderSizePixel = 0
Script_8.Position = UDim2.new(0, 6, 0, 225)
Script_8.Size = UDim2.new(1, -16, 0, 25)
Script_8.Font = Enum.Font.SourceSans
Script_8.Text = "Selexity"
Script_8.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_8.TextSize = 14.000
Script_8.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githuberscontent.com/nek205/T0PK3K-Remake/blob/Scripts/Selexity"))()
end)

Script_9.Name = "Script"
Script_9.Parent = Container_3
Script_9.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_9.BorderSizePixel = 0
Script_9.Position = UDim2.new(0, 6, 0, 253)
Script_9.Size = UDim2.new(1, -16, 0, 25)
Script_9.Font = Enum.Font.SourceSans
Script_9.Text = "Typical Hub"
Script_9.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_9.TextSize = 14.000
Script_9.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Typical%20Hub"))()
end)

Script_10.Name = "Script"
Script_10.Parent = Container_3
Script_10.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_10.BorderSizePixel = 0
Script_10.Position = UDim2.new(0, 6, 0, 281)
Script_10.Size = UDim2.new(1, -16, 0, 25)
Script_10.Font = Enum.Font.SourceSans
Script_10.Text = "Lag Switch"
Script_10.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_10.TextSize = 14.000
Script_10.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://paste.gg/p/anonymous/d3492bd620bd4c46b54680ac80b0fa0d/files/161ddd9c992c4ceba3c298458d45188a/raw"))()
end)

Script_11.Name = "Script"
Script_11.Parent = Container_3
Script_11.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_11.BorderSizePixel = 0
Script_11.Position = UDim2.new(0, 6, 0, 309)
Script_11.Size = UDim2.new(1, -16, 0, 25)
Script_11.Font = Enum.Font.SourceSans
Script_11.Text = "Flu Gui"
Script_11.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_11.TextSize = 14.000
Script_11.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Flu%20Gui"))()
end)

Script_12.Name = "Script"
Script_12.Parent = Container_3
Script_12.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_12.BorderSizePixel = 0
Script_12.Position = UDim2.new(0, 6, 0, 337)
Script_12.Size = UDim2.new(1, -16, 0, 25)
Script_12.Font = Enum.Font.SourceSans
Script_12.Text = "Fate's Admin"
Script_12.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_12.TextSize = 14.000
Script_12.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Fates%20Admin"))()
end)

Script_13.Name = "Script"
Script_13.Parent = Container_3
Script_13.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_13.BorderSizePixel = 0
Script_13.Position = UDim2.new(0, 6, 0, 365)
Script_13.Size = UDim2.new(1, -16, 0, 25)
Script_13.Font = Enum.Font.SourceSans
Script_13.Text = "Aspect Hub"
Script_13.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_13.TextSize = 14.000
Script_13.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Aspect%20Hub"))()
end)

Script_14.Name = "Script"
Script_14.Parent = Container_3
Script_14.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_14.BorderSizePixel = 0
Script_14.Position = UDim2.new(0, 6, 0, 393)
Script_14.Size = UDim2.new(1, -16, 0, 25)
Script_14.Font = Enum.Font.SourceSans
Script_14.Text = "Selexity Reborn"
Script_14.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_14.TextSize = 14.000
Script_14.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Selexity%20Reborn"))()
end)

Script_15.Name = "Script"
Script_15.Parent = Container_3
Script_15.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_15.BorderSizePixel = 0
Script_15.Position = UDim2.new(0, 6, 0, 421)
Script_15.Size = UDim2.new(1, -16, 0, 25)
Script_15.Font = Enum.Font.SourceSans
Script_15.Text = "UTG Reborn"
Script_15.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_15.TextSize = 14.000
Script_15.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/UTG%20Reborn"))()
end)

Script_16.Name = "Script"
Script_16.Parent = Container_3
Script_16.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_16.BorderSizePixel = 0
Script_16.Position = UDim2.new(0, 6, 0, 449)
Script_16.Size = UDim2.new(1, -16, 0, 25)
Script_16.Font = Enum.Font.SourceSans
Script_16.Text = "Annoy Gui v2"
Script_16.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_16.TextSize = 14.000
Script_16.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Annoy%20Gui%20v2"))()
end)

Script_17.Name = "Script"
Script_17.Parent = Container_3
Script_17.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_17.BorderSizePixel = 0
Script_17.Position = UDim2.new(0, 6, 0, 477)
Script_17.Size = UDim2.new(1, -16, 0, 25)
Script_17.Font = Enum.Font.SourceSans
Script_17.Text = "FE Neko"
Script_17.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_17.TextSize = 14.000
Script_17.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Neko"))()
end)

Script_18.Name = "Script"
Script_18.Parent = Container_3
Script_18.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_18.BorderSizePixel = 0
Script_18.Position = UDim2.new(0, 6, 0, 505)
Script_18.Size = UDim2.new(1, -16, 0, 25)
Script_18.Font = Enum.Font.SourceSans
Script_18.Text = "FE Server Admin"
Script_18.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_18.TextSize = 14.000
Script_18.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("loadstring(game:HttpGet('https://raw.githubusercontent.com/ONEReverseCard/My-Scripts/main/Netless%20Server%20Admin.md'))()"))()
end)

Script_19.Name = "Script"
Script_19.Parent = Container_3
Script_19.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_19.BorderSizePixel = 0
Script_19.Position = UDim2.new(0, 6, 0, 533)
Script_19.Size = UDim2.new(1, -16, 0, 25)
Script_19.Font = Enum.Font.SourceSans
Script_19.Text = "Domain X"
Script_19.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_19.TextSize = 14.000
Script_19.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/DomainX/main/source',true))()
end)

Script_20.Name = "Script"
Script_20.Parent = Container_3
Script_20.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_20.BorderSizePixel = 0
Script_20.Position = UDim2.new(0, 6, 0, 561)
Script_20.Size = UDim2.new(1, -16, 0, 25)
Script_20.Font = Enum.Font.SourceSans
Script_20.Text = "Stream Sniper"
Script_20.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_20.TextSize = 14.000
Script_20.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/Miscellaneous/main/StreamSniper.lua"))()
end)

Script_21.Name = "Script"
Script_21.Parent = Container_3
Script_21.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_21.BorderSizePixel = 0
Script_21.Position = UDim2.new(0, 6, 0, 589)
Script_21.Size = UDim2.new(1, -16, 0, 25)
Script_21.Font = Enum.Font.SourceSans
Script_21.Text = "zombie AI"
Script_21.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_21.TextSize = 14.000
Script_21.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/zombie"),true))()
end)

Script_22.Name = "Script"
Script_22.Parent = Container_3
Script_22.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_22.BorderSizePixel = 0
Script_22.Position = UDim2.new(0, 6, 0, 617)
Script_22.Size = UDim2.new(1, -16, 0, 25)
Script_22.Font = Enum.Font.SourceSans
Script_22.Text = "Tool Animator"
Script_22.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_22.TextSize = 14.000
Script_22.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Tool%20Animator"),true))()
end)

Script_23.Name = "Script"
Script_23.Parent = Container_3
Script_23.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_23.BorderSizePixel = 0
Script_23.Position = UDim2.new(0, 6, 0, 645)
Script_23.Size = UDim2.new(1, -16, 0, 25)
Script_23.Font = Enum.Font.SourceSans
Script_23.Text = "Death Note"
Script_23.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_23.TextSize = 14.000
Script_23.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Death%20Note"),true))()
end)

Script_24.Name = "Script"
Script_24.Parent = Container_3
Script_24.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
Script_24.BorderSizePixel = 0
Script_24.Position = UDim2.new(0, 6, 0, 673)
Script_24.Size = UDim2.new(1, -16, 0, 25)
Script_24.Font = Enum.Font.SourceSans
Script_24.Text = "Universal ESP"
Script_24.TextColor3 = Color3.fromRGB(199, 199, 199)
Script_24.TextSize = 14.000
Script_24.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/nek205/T0PK3K-Remake/Scripts/Universal%20ESP"),true))()
end)
Info.Name = "Info"
Info.Parent = Holder
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.Size = UDim2.new(1, 0, 1, 0)
Info.Visible = false

Container_4.Name = "Container"
Container_4.Parent = Info
Container_4.Active = true
Container_4.BackgroundColor3 = Color3.fromRGB(45, 72, 200)
Container_4.BorderColor3 = Color3.fromRGB(32, 66, 190)
Container_4.Position = UDim2.new(0, 15, 0, 10)
Container_4.Size = UDim2.new(1, -30, 0, 320)
Container_4.BottomImage = "rbxassetid://368504177"
Container_4.CanvasSize = UDim2.new(0, 0, 0, 297)
Container_4.MidImage = "rbxassetid://368504177"
Container_4.ScrollBarThickness = 5
Container_4.TopImage = "rbxassetid://368504177"

TextLabel_12.Parent = Container_4
TextLabel_12.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_12.BorderSizePixel = 0
TextLabel_12.Position = UDim2.new(0, 6, 0, 6)
TextLabel_12.Size = UDim2.new(1, -17, 0.165625006, 260)
TextLabel_12.Font = Enum.Font.SourceSans
TextLabel_12.Text = ([[

Hello and welcome to T0PK3K Remake!

This gui includes FE scripts that
have been showcased on FO10's 
and Dark Eccentric
YouTube channel.
remaked by nek205

--discord:
tinyengine#0927

--team scripted for errors:
--https://discord.gg/pZXZn9qtAY

--373RN1TY
--https://discord.gg/pzjDf5BPaS

--github:

--https://github.com/nek205

]])
TextLabel_12.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_12.TextSize = 14.000

Settings.Name = "Settings"
Settings.Parent = Holder
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 1.000
Settings.Size = UDim2.new(1, 0, 1, 0)
Settings.Visible = false

Container_5.Name = "Container"
Container_5.Parent = Settings
Container_5.Active = true
Container_5.BackgroundColor3 = Color3.fromRGB(45, 72, 200)
Container_5.BorderColor3 = Color3.fromRGB(32, 66, 190)
Container_5.Position = UDim2.new(0, 15, 0, 10)
Container_5.Size = UDim2.new(1, -30, 0, 320)
Container_5.BottomImage = "rbxassetid://368504177"
Container_5.CanvasSize = UDim2.new(0, 0, 0, 343)
Container_5.MidImage = "rbxassetid://368504177"
Container_5.ScrollBarThickness = 5
Container_5.TopImage = "rbxassetid://368504177"

TextLabel_13.Parent = Container_5
TextLabel_13.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_13.BorderSizePixel = 0
TextLabel_13.Position = UDim2.new(0, 6, 0, 6)
TextLabel_13.Size = UDim2.new(1, -17, 0, 20)
TextLabel_13.Font = Enum.Font.SourceSans
TextLabel_13.Text = "Patch: 26"
TextLabel_13.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_13.TextSize = 14.000

TextLabel_14.Parent = Container_5
TextLabel_14.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_14.BorderSizePixel = 0
TextLabel_14.Position = UDim2.new(0, 6, 0, 29)
TextLabel_14.Size = UDim2.new(1, -17, 0, 20)
TextLabel_14.Font = Enum.Font.SourceSans
TextLabel_14.Text = "You can see updates info on our github"
TextLabel_14.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_14.TextSize = 14.000

TextLabel_15.Parent = Container_5
TextLabel_15.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
TextLabel_15.BorderSizePixel = 0
TextLabel_15.Position = UDim2.new(0, 6, 0, 75)
TextLabel_15.Size = UDim2.new(1, -17, 0, 260)
TextLabel_15.Font = Enum.Font.SourceSans
TextLabel_15.Text = ([[
~~~~~ { CREDITS } ~~~~~
	
	
FO10 - Some Scripts Provider

Bubba - Gui

nek205 - creator

Erencool#4300 - an idiot

Credit to the script owners

and you for using the script
]])
TextLabel_15.TextColor3 = Color3.fromRGB(199, 199, 199)
TextLabel_15.TextSize = 14.000

TextButton.Parent = Container_5
TextButton.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 6, 0, 52)
TextButton.Size = UDim2.new(1, -16, 0, 20)
TextButton.Visible = false
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "?"
TextButton.TextColor3 = Color3.fromRGB(199, 199, 199)
TextButton.TextSize = 14.000

Navigation.Name = "Navigation"
Navigation.Parent = Main
Navigation.Active = true
Navigation.BackgroundColor3 = Color3.fromRGB(32, 66, 190)
Navigation.BorderSizePixel = 0
Navigation.Size = UDim2.new(0, 150, 1, 0)
Navigation.ZIndex = 2

Topbar_2.Name = "Topbar"
Topbar_2.Parent = Navigation
Topbar_2.BackgroundColor3 = Color3.fromRGB(60, 119, 191)
Topbar_2.BorderSizePixel = 0
Topbar_2.Size = UDim2.new(1, 0, 0, 30)
Topbar_2.ZIndex = 3

Scroll.Name = "Scroll"
Scroll.Parent = Navigation
Scroll.BackgroundColor3 = Color3.fromRGB(45, 72, 200)
Scroll.BorderSizePixel = 0
Scroll.Position = UDim2.new(0, 0, 0, 30)
Scroll.Size = UDim2.new(1, 0, 1, -30)
Scroll.ZIndex = 2 --2
Scroll.BottomImage = "rbxassetid://368504177"
Scroll.CanvasSize = UDim2.new(0, 0, 0, 403)
Scroll.MidImage = "rbxassetid://368504177"
Scroll.ScrollBarThickness = 5
Scroll.TopImage = "rbxassetid://368504177"

TextButton_2.Parent = Scroll
TextButton_2.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
TextButton_2.BorderSizePixel = 0
TextButton_2.LayoutOrder = 8
TextButton_2.Position = UDim2.new(0, 5, 0, 79)
TextButton_2.Size = UDim2.new(1, -16, 0, 25)
TextButton_2.ZIndex = 4
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "Scripts"
TextButton_2.TextColor3 = Color3.fromRGB(199, 199, 199)
TextButton_2.TextSize = 14.000
TextButton_2.MouseButton1Click:Connect(function()
	Scripts.Visible = true
	Home.Visible = false
	Settings.Visible = false
	Info.Visible = false
	LocalPlayer.Visible = false
end)

TextButton_3.Parent = Scroll
TextButton_3.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
TextButton_3.BorderSizePixel = 0
TextButton_3.LayoutOrder = 12
TextButton_3.Position = UDim2.new(0, 5, 0, 114)
TextButton_3.Size = UDim2.new(1, -16, 0, 25)
TextButton_3.ZIndex = 4
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = "Settings"
TextButton_3.TextColor3 = Color3.fromRGB(199, 199, 199)
TextButton_3.TextSize = 14.000
TextButton_3.MouseButton1Click:Connect(function()
	Scripts.Visible = false
	Home.Visible = false
	Settings.Visible = true
	Info.Visible = false
	LocalPlayer.Visible = false
end)

TextButton_4.Parent = Scroll
TextButton_4.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
TextButton_4.BorderSizePixel = 0
TextButton_4.LayoutOrder = 4
TextButton_4.Position = UDim2.new(0, 5, 0, 148)
TextButton_4.Size = UDim2.new(1, -16, 0, 25)
TextButton_4.Visible = false
TextButton_4.ZIndex = 4
TextButton_4.Font = Enum.Font.SourceSans
TextButton_4.Text = "?"
TextButton_4.TextColor3 = Color3.fromRGB(199, 199, 199)
TextButton_4.TextSize = 14.000

TextButton_5.Parent = Scroll
TextButton_5.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
TextButton_5.BorderSizePixel = 0
TextButton_5.LayoutOrder = 1
TextButton_5.Position = UDim2.new(0, 6, 0, 10)
TextButton_5.Size = UDim2.new(1, -16, 0, 25)
TextButton_5.ZIndex = 4
TextButton_5.Font = Enum.Font.SourceSans
TextButton_5.Text = "Home"
TextButton_5.TextColor3 = Color3.fromRGB(199, 199, 199)
TextButton_5.TextSize = 14.000
TextButton_5.MouseButton1Click:Connect(function()
	Scripts.Visible = false
	Home.Visible = true
	Settings.Visible = false
	Info.Visible = false
	LocalPlayer.Visible = false
end)

TextButton_6.Parent = Scroll
TextButton_6.BackgroundColor3 = Color3.fromRGB(71, 106, 197)
TextButton_6.BorderSizePixel = 0
TextButton_6.LayoutOrder = 2
TextButton_6.Position = UDim2.new(0, 6, 0, 43)
TextButton_6.Size = UDim2.new(1, -16, 0, 25)
TextButton_6.ZIndex = 4
TextButton_6.Font = Enum.Font.SourceSans
TextButton_6.Text = "Info"
TextButton_6.TextColor3 = Color3.fromRGB(199, 199, 199)
TextButton_6.TextSize = 14.000
TextButton_6.MouseButton1Click:Connect(function()
	Scripts.Visible = false
	Home.Visible = false
	Settings.Visible = false
	Info.Visible = true
	LocalPlayer.Visible = false
end)

DisabledCommand.Name = "DisabledCommand"
DisabledCommand.Parent = Main
DisabledCommand.BackgroundColor3 = Color3.fromRGB(51, 76, 209)
DisabledCommand.BorderColor3 = Color3.fromRGB(54, 81, 151)
DisabledCommand.Position = UDim2.new(0, 163, 0, 366)
DisabledCommand.Size = UDim2.new(1, -176, 0, 20)
DisabledCommand.Visible = false
DisabledCommand.Font = Enum.Font.Code
DisabledCommand.PlaceholderText = "Press ; to enter a DisabledCommand"
DisabledCommand.ShowNativeInput = false
DisabledCommand.Text = ""
DisabledCommand.TextColor3 = Color3.fromRGB(209, 209, 209)
DisabledCommand.TextSize = 12.000
DisabledCommand.TextStrokeTransparency = 0.800
DisabledCommand.TextTransparency = 0.300

Label.Name = "Label"
Label.Parent = Main
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0.0191489346, 0, -0.00253164582, 0)
Label.Size = UDim2.new(0, 113, 0, 30)
Label.ZIndex = 4
Label.Font = Enum.Font.SourceSansBold
Label.Text = "T0PK3K REMAKE"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 18.000

--{ Scripts: }--

local RunService = game:GetService("RunService")

spawn(function()
	while true do
		TextLabel_4.Text = "Server Time: "..tostring(game:GetService('Workspace').DistributedGameTime)
		wait(.5)
	end
end)

spawn(function()
	while true do
		TextLabel_5.Text = "Server Size: "..tostring(game:GetService('Players').NumPlayers)
		wait(.5)
	end
end)

spawn(function()
	RunService.RenderStepped:Connect(function(frame)
		TextLabel_8.Text = "FPS: "..(math.round(1/frame))
	end)
end)

print("Script Loaded!")
print("thank you for using T0PK3K Remake")
--{ End of Code }--



--less important stuff--

--discord:

--team scripted for errors:
--https://discord.gg/pZXZn9qtAY

--373RN1TY
--https://discord.gg/pzjDf5BPaS

--github:
--https://github.com/nek205

print("created by nek205 ;)")

print("T0PK3K REMAKE PATCH 26")
