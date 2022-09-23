-- this is old code broother

local opt = {
	prefix = ';',			-- ;ff me | /ff me
	tupleSeparator = ',',	-- ;ff me,others,all | ;ff me/others/all
	ui = {					-- never did anything with this
		
	},
	keybinds = {			-- never did anything with this
		
	},
}

--[[ VARIABLES ]]--
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character
local mouse = localPlayer:GetMouse()
local camera = workspace.CurrentCamera
local camtype = camera.CameraType
local Commands, Aliases = {}, {}
player, plr, lp = localPlayer, localPlayer, localPlayer, localPlayer

localPlayer.CharacterAdded:Connect(function(c)
	character = c
end)

--[[ COMMAND FUNCTIONS ]]--
cmd = {}
cmd.add = function(...)
	local vars = {...}
	local aliases, info, func = vars[1], vars[2], vars[3]
	for i, cmdName in pairs(aliases) do
		if i == 1 then
			Commands[cmdName:lower()] = {func, info}
		else
			Aliases[cmdName:lower()] = {func, info}
		end
	end
end

cmd.run = function(args)
	local caller, arguments = args[1], args; table.remove(args, 1);
	local success, msg = pcall(function()
		if Commands[caller:lower()] then
			Commands[caller:lower()][1](unpack(arguments))
		elseif Aliases[caller:lower()] then
			Aliases[caller:lower()][1](unpack(arguments))
		end
	end)
	if not success then
		lib.messageOut("Admin error", msg)
	end
end

--[[ LIBRARY FUNCTIONS ]]--
lib = {}
lib.wrap = function(f)
	return coroutine.wrap(f)()
end
wrap = lib.wrap

lib.messageOut = function(title, msg)
	StarterGui:SetCore("SendNotification", 
		{
			Title = title,
			Text = msg
		}
	)
end

local wait = function(int)
	if not int then int = 0 end
	local t = tick()
	repeat
		RunService.Heartbeat:Wait(0)
	until (tick() - t) >= int
	return (tick() - t), t
end
spawn(function()
	lib.messageOut("Admin successfully loaded", "Have fun!")
end)

lib.lock = function(instance, par)
	locks[instance] = true
	instance.Parent = par or instance.Parent
	instance.Name = "RightGrip"
end
lock = lib.lock
locks = {}
if hookfunction then	-- i believe this was for hiding stuff like bodyvelocity
	local pseudo = Instance.new("Motor6D")
	_1 = hookfunction(pseudo.IsA, function(...)
		local p, ret = ({...})[1], _1(...)
		if checkcaller() then return ret end
		if locks[p] then
			return false
		end
		return ret
	end)
	_2 = hookfunction(pseudo.FindFirstChildWhichIsA, function(...)
		local p = _2(...)
		if checkcaller() then return p end
		if locks[p] then
			return nil
		end
		return p
	end)
	_3 = hookfunction(pseudo.FindFirstChildOfClass, function(...)
		local p = _3(...)
		if checkcaller() then return p end
		if locks[p] then
			return nil
		end
		return p
	end)
	_4 = hookfunction(pseudo.Destroy, function(...)
		local args = {...}
		if checkcaller() then return _4(...) end
		if locks[args[1]] then return end
		return
	end)
	
	local mt = getrawmetatable(game)
	local _ni = mt.__newindex
	local _nc = mt.__namecall
	local _i = mt.__index
	setreadonly(mt, false)
	
	mt.__index = newcclosure(function(t, i)
		if locks[t] and not checkcaller() then
			return _i(pseudo, i)
		end
		return _i(t, i)
	end)
	mt.__newindex = newcclosure(function(t, i, v)
		if locks[t] and not checkcaller() then
			return _ni(pseudo, i, v)
		end
		return _ni(t, i, v)
	end)
	mt.__namecall = newcclosure(function(t, ...)
		if locks[t] and not checkcaller() then
			return _nc(pseudo, ...)
		end
		return _nc(t, ...)
	end)
end

lib.find = function(t, v)	-- mmmmmm
	for i, e in pairs(t) do
		if i == v or e == v then
			return i
		end
	end
	return nil
end

lib.parseText = function(text, watch)
	local parsed = {}
	if not text then return nil end
	for arg in text:gmatch("[^" .. watch .. "]+") do
		arg = arg:gsub("-", "%%-")
		local pos = text:find(arg)
		arg = arg:gsub("%%", "")
		if pos then
			local find = text:sub(pos - opt.prefix:len(), pos - 1)
			if (find == opt.prefix and watch == opt.prefix) or watch ~= opt.prefix then
				table.insert(parsed, arg)
			end
		else
			table.insert(parsed, nil)
		end
	end
	return parsed
end

lib.parseCommand = function(text)
	wrap(function()
		local commands = lib.parseText(text, opt.prefix)
		for _, parsed in pairs(commands) do
			local args = {}
			for arg in parsed:gmatch("[^ ]+") do
				table.insert(args, arg)
			end
			cmd.run(args)
		end
	end)
end

local connections = {}

lib.connect = function(name, connection)	-- no :(
	connections[name .. tostring(math.random(1000000, 9999999))] = connection
	return connection
end

lib.disconnect = function(name)
	for title, connection in pairs(connections) do
		if title:find(name) == 1 then
			connection:Disconnect()
		end
	end
end

m = math			-- prepare for annoying and unnecessary tool grip math
rad = m.rad
clamp = m.clamp
sin = m.sin
tan = m.tan
cos = m.cos

--[[ PLAYER FUNCTIONS ]]--
argument = {}
argument.getPlayers = function(str)
	local playerNames, players = lib.parseText(str, opt.tupleSeparator), {}
	for _, arg in pairs(playerNames or {"me"}) do
		arg = arg:lower()
		local playerList = Players:GetPlayers()
		if arg == "me" or arg == nil then
			table.insert(players, localPlayer)
			
		elseif arg == "all" then
			for _, plr in pairs(playerList) do
				table.insert(players, plr)
			end
			
		elseif arg == "others" then
			for _, plr in pairs(playerList) do
				if plr ~= localPlayer then
					table.insert(players, plr)
				end
			end
			
		elseif arg == "random" then
			table.insert(players, playerList[math.random(1, #playerList)])
			
		elseif arg:find("%%") == 1 then
			local teamName = arg:sub(2)
			for _, plr in pairs(playerList) do
				if tostring(plr.Team):lower():find(teamName) == 1 then
					table.insert(players, plr)
				end
			end
			
		else
			for _, plr in pairs(playerList) do
				if plr.Name:lower():find(arg) == 1 then
					table.insert(players, plr)
				end
			end
		end
	end
	return players
end

--[[ COMMANDS ]]--

--[ SCRIPT ]--
cmd.add({"script", "ls", "s", "run"}, {"script <source>", "Run the code requested"}, function(source)
	loadstring(source)()
end)

cmd.add({"httpget", "hl", "get"}, {"httpget <url>", "Run the contents of a given URL"}, function(url)
	loadstring(game:HttpGet(url, true))()
end)

--[ UTILITY ]--
cmd.add({"devconsole", "developerconsole", "console"}, {"devconsole", "Open the old developer console"}, function()
	StarterGui:SetCore("DeveloperConsoleVisible", true)
end)

cmd.add({"chatlogs", "clogs"}, {"chatlogs", "Open the chat logs"}, function()
	gui.chatlogs()
end)

cmd.add({"commands", "cmds"}, {"commands", "Open the command list"}, function()
	gui.commands()
end)

cmd.add({"print", "p"}, {"print <tuple>", "Print the given arguments"}, function(...)
	print(...)
end)

cmd.add({"warn", "w"}, {"warn <tuple>", "Warn the given arguments"}, function(...)
	warn(...)
end)

cmd.add({"rejoin", "rj"}, {"rejoin", "Rejoin the game"}, function()
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

cmd.add({"place", "game", "join"}, {"place <placeId> [player]", "Join a place with the given PlaceId or a player's server"}, function(placeid, playerName)
	game:GetService("TeleportService"):Teleport(placeid, playerName)
end)

cmd.add({"disconnectevents", "disableevents"}, {"disconnectevents <instance> <event>", "Disable the given instance's connections to the event"}, function(objDir, event)
	local obj = loadstring("return " .. objDir)()
	local events = getconnections(obj[event])
	for _, connection in pairs(events) do
		connection:Disable()
	end
end)

cmd.add({"connectevents", "enableevents"}, {"connectevents <instance> <event>", "Enable the given instance's connections to the event"}, function(objDir, event)
	local obj = loadstring("return " .. objDir)()
	local events = getconnections(obj[event])
	for _, connection in pairs(events) do
		connection:Enable()
	end
end)

wrap(function()
	--i am so not putting an emulator as a command here
end)

--[ LOCALPLAYER ]--
local function respawn()
	character:ClearAllChildren()
	local newChar = Instance.new("Model", workspace)
	local hum = Instance.new("Humanoid", newChar)
	local torso = Instance.new("Part", newChar)
	newChar.Name = "respawn_"
	torso.Name = "Torso"
	torso.Transparency = 1
	player.Character = newChar
	newChar:MoveTo(Vector3.new(999999, 999999, 999999))
	torso.Name = ""
	torso.CanCollide = false
end

local function refresh()
	local cf, p = CFrame.new(), character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
	if p then
		cf = p.CFrame
	end
	respawn()
	player.CharacterAdded:Wait(); wait(0.2);
	character:WaitForChild("HumanoidRootPart").CFrame = cf
end

local abort = 0
local function getTools(amt)
	if not amt then amt = 1 end
	local toolAmount, grabbed = 0, {}
	local lastCF = character.PrimaryPart.CFrame
	local ab = abort
	
	for i, v in pairs(localPlayer:FindFirstChildWhichIsA("Backpack"):GetChildren()) do
		if v:IsA("BackpackItem") then
			toolAmount = toolAmount + 1
		end
	end
	if toolAmount >= amt then return localPlayer:FindFirstChildWhichIsA("Backpack"):GetChildren() end
	if not localPlayer:FindFirstChildWhichIsA("Backpack"):FindFirstChildWhichIsA("BackpackItem") then return end
	
	repeat
		repeat wait() until localPlayer:FindFirstChildWhichIsA("Backpack") or ab ~= abort
		backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
		wrap(function()
			repeat wait() until backpack:FindFirstChildWhichIsA("BackpackItem")
			for _, tool in pairs(backpack:GetChildren()) do
				if #grabbed >= amt or ab ~= abort then break end
				if tool:IsA("BackpackItem") then
					tool.Parent = localPlayer
					table.insert(grabbed, tool)
				end
			end
		end)
		
		respawn()
		wait(.1)
	until
		#grabbed >= amt or ab ~= abort
	
	repeat wait() until localPlayer.Character and tostring(localPlayer.Character) ~= "respawn_" and localPlayer.Character == character
	wait(.2)
	
	repeat wait() until localPlayer:FindFirstChildWhichIsA("Backpack") or ab ~= abort
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	for _, tool in pairs(grabbed) do
		if tool:IsA("BackpackItem") then
			tool.Parent = backpack
		end
	end
	wrap(function()
		repeat wait() until character.PrimaryPart
		wait(.2)
		character:SetPrimaryPartCFrame(lastCF)
	end)
	wait(.2)
	return grabbed
end

cmd.add({"notoolscripts", "nts"}, {"notoolscripts", "Destroy all scripts in backpack"}, function()
	local bp = player:FindFirstChildWhichIsA("Backpack")
	for _, item in pairs(bp:GetChildren()) do
		for _, obj in pairs(item:GetDescendants()) do
			if obj:IsA("LocalScript") or obj:IsA("Script") then
				obj.Disabled = true
				obj:Destroy()
			end
		end
	end
end)

cmd.add({"clonetools", "dupetools"}, {"clonetools [amount]", "Clone your tools by the given amount"}, function(amt)
	amt = tonumber(amt) or 1
	getTools(math.clamp(amt, 1, 100))
end)

cmd.add({"abort"}, {"abort", "Abort most indefinite operations"}, function(amt)
	abort = abort + 1	-- terrifying system
end)

cmd.add({"blockspam"}, {"blockspam [amount]", "Spawn blocks by the given amount"}, function(amt)
	amt = tonumber(amt) or 1
	local hatAmount, grabbed = 0, {}
	local lastCF = character.PrimaryPart.CFrame
	character:ClearAllChildren()
	respawn()
	repeat
		if character.Name ~= "respawn_" then
			local c = character
			repeat wait() until c:FindFirstChildWhichIsA("Accoutrement")
			c:MoveTo(lastCF.p)
			wait(1)
			for i, v in pairs(c:GetChildren()) do
				if v:IsA("Accoutrement") then
					v:WaitForChild("Handle")
					v.Handle.CanCollide = true
					if v:FindFirstChildWhichIsA("DataModelMesh", true) then
						v:FindFirstChildWhichIsA("DataModelMesh", true):Destroy()
					end
					v.Parent = workspace
					table.insert(grabbed, v)
				end
			end
			hatAmount = hatAmount + 1
		end
		character:ClearAllChildren()
		respawn()
		wait()
	until
		hatAmount >= amt
	
	repeat wait() until tostring(localPlayer.Character) ~= "respawn_" and localPlayer.Character
	wait(0.5)
	
	spawn(function()
		repeat wait() until character.PrimaryPart
		wait(0.2)
		character:SetPrimaryPartCFrame(lastCF)
		
		for _, item in pairs(grabbed) do
			if item:IsA("Accoutrement") and item:FindFirstChild("Handle") then
				item.Parent = workspace
				wait()
			end
		end
	end)
end)

cmd.add({"toolblockspam"}, {"toolblockspam [amount]", "Spawn blocks by the given amount"}, function(amt)
	if not amt then amt = 1 end
	amt = tonumber(amt)
	local tools = getTools(amt)
	for i, tool in pairs(tools) do
		wait()
		spawn(function()
			wait(0.5)
			tool.Parent = character
			tool.CanBeDropped = true
			wait(0.4)
			for _, mesh in pairs(tool:GetDescendants()) do
				if mesh:IsA("DataModelMesh") then
					mesh:Destroy()
				end
			end
			for _, weld in pairs(character:GetDescendants()) do
				if weld.Name == "RightGrip" then
					weld:Destroy()
				end
			end
			wait(0.1)
			tool.Parent = workspace
		end)
	end
end)

cmd.add({"clonehats", "dupehats"}, {"clonehats [amount]", "Clone your hats by the given amount"}, function(amt)
	amt = tonumber(amt) or 1
	local hatAmount, grabbed = 0, {}
	local lastCF = character.PrimaryPart.CFrame
	character:ClearAllChildren()
	respawn()
	repeat
		if character.Name ~= "respawn_" then
			repeat wait() until character:FindFirstChildWhichIsA("Accoutrement")
			wait(0.75)
			character:MoveTo(lastCF.p)
			wait(0.25)
			for i, v in pairs(character:GetChildren()) do
				if v:IsA("Accoutrement") then
					v:WaitForChild("Handle")
					v.Parent = workspace
					table.insert(grabbed, v)
				end
			end
			hatAmount = hatAmount + 1
		end
		character:ClearAllChildren()
		respawn()
		wait()
	until
		hatAmount >= amt
	
	repeat wait() until tostring(localPlayer.Character) ~= "respawn_" and localPlayer.Character
	wait(0.5)
	
	spawn(function()
		repeat wait() until character.PrimaryPart
		wait(0.2)
		character:SetPrimaryPartCFrame(lastCF)
		
		for _, hat in pairs(grabbed) do
			if hat:IsA("Accoutrement") and hat:FindFirstChild("Handle") then
				hat.Parent = workspace
				wait()
			end
		end
	end)
end)

cmd.add({"equiptools", "equipall"}, {"equiptools", "Equip all of your tools"}, function()
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	if backpack then
		for _, tool in pairs(backpack:GetChildren()) do
			if tool:IsA("Tool") then
				tool.Parent = character
			end
		end
	end
end)

cmd.add({"droptools"}, {"droptools", "Drop your equipped tools"}, function()
	for _, tool in pairs(character:GetChildren()) do
		if tool:IsA("Tool") then
			tool.Parent = workspace
		end
	end
end)

cmd.add({"unequiptools"}, {"unequiptools", "Unequip your equipped tools"}, function()
	local h = character:FindFirstChildWhichIsA("Humanoid")
	if h then
		h:UnequipTools()
	end
end)

cmd.add({"notools"}, {"notools", "Remove your tools"}, function()
	for _, tool in pairs(character:GetChildren()) do
		if tool:IsA("Tool") then
			tool:Destroy()
		end
	end
	for _, tool in pairs(localPlayer.Backpack:GetChildren()) do
		if tool:IsA("Tool") then
			tool:Destroy()
		end
	end
end)

cmd.add({"toolkill"}, {"toolkill <player>", "Kill the given players without FE god"}, function(p)
	local players = argument.getPlayers(p)
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	local point = root.CFrame
	
	if not backpack:FindFirstChildWhichIsA("Tool") then
		lib.messageOut("toolkill", "Cannot bring players, no tools found")
		return
	end
	
	if backpack and hum then
		local tools = getTools(#players+1)
		wait()
		for i, v in pairs(tools) do
			v.Parent = character
		end
		wait()
		for i, v in pairs(tools) do
			v.Parent = workspace
		end
		wait(.2)
		for key, player in pairs(players) do
			local target = player.Character
			if target and player ~= localPlayer then
				root = character:FindFirstChild("HumanoidRootPart")
				local assignedTool = tools[key+1]
				local handle = assignedTool:FindFirstChild("Handle")
				local targetPart = target:FindFirstChild("HumanoidRootPart")
				if handle and targetPart then
					local schar = character
					repeat
						wait()
						root.CFrame = CFrame.new(900, workspace.FallenPartsDestroyHeight+15, 900)
						root.Velocity = Vector3.new(0, 0, 0)
						targetPart.CFrame = CFrame.new(root.Position + root.CFrame.rightVector)
					until
						assignedTool.Parent ~= workspace or localPlayer.Character ~= schar
					
					wait(0.1)
					for i, v in pairs(character:GetDescendants()) do
						if v.Name:find("Grip") and v:isA("Weld") then
							v:Destroy()
						end
					end
					wait()
					root.CFrame = point
				end
			end
		end
	end
end)

cmd.add({"void"}, {"void <player>", "Kill the given players without FE god"}, function(p)
	local players = argument.getPlayers(p)
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	local point = root.CFrame
	
	if not backpack:FindFirstChildWhichIsA("Tool") then
		lib.messageOut("void", "Cannot bring players, no tools found")
		return
	end
	
	if backpack and hum then
		local tools = getTools(#players+1)
		wait()
		for i, v in pairs(tools) do
			v.Parent = character
		end
		wait()
		for i, v in pairs(tools) do
			v.Parent = workspace
		end
		wait(.2)
		for key, player in pairs(players) do
			local target = player.Character
			if target and player ~= localPlayer then
				root = character:FindFirstChild("HumanoidRootPart")
				local assignedTool = tools[key+1]
				local handle = assignedTool:FindFirstChild("Handle")
				local targetPart = target:FindFirstChild("HumanoidRootPart")
				if handle and targetPart then
					local schar = character
					repeat
						RunService.RenderStepped:Wait()
						root.CFrame = CFrame.new(800, workspace.FallenPartsDestroyHeight + 5, 800)
						targetPart.CFrame = CFrame.new(root.Position + root.CFrame.rightVector)
					until
						assignedTool.Parent ~= workspace or localPlayer.Character ~= schar
					root.CFrame = CFrame.new(800, workspace.FallenPartsDestroyHeight + 5, 800)
				end
			end
		end
	end
end)

cmd.add({"killall", "toolkillall"}, {"killall", "Kill all players using tools"}, function()
	local players = Players:GetPlayers()
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	local point = root.CFrame
	
	if not backpack:FindFirstChildWhichIsA("Tool") then
		lib.messageOut("killall", "Cannot bring players, no tools found")
		return
	end
	
	if backpack and hum then
		local tools = getTools(#players*3)
		wait()
		for i, v in pairs(tools) do
			v.Grip = v.Grip * CFrame.new(math.random(-16, 16)/8,0,math.random(-16, 16)/8)
			v.Parent = character
		end
		wait()
		for i, v in pairs(tools) do
			v.Parent = workspace
		end
		wait(.2)
		for key, player in pairs(players) do
			local target = player.Character
			if target and player ~= localPlayer then
				root = character:FindFirstChild("HumanoidRootPart")
				local assignedTool = tools[key+1]
				local handle = assignedTool:FindFirstChild("Handle")
				local targetPart = target:FindFirstChild("HumanoidRootPart")
				if handle and targetPart then
					local schar = character
					wrap(function()
						repeat
							RunService.RenderStepped:Wait()
							root.CFrame = CFrame.new(900, workspace.FallenPartsDestroyHeight+30, 900)
							targetPart.CFrame = CFrame.new(root.Position + root.CFrame.rightVector)
						until
							assignedTool.Parent ~= workspace or localPlayer.Character ~= schar
						wait(0.4)
						for i, v in pairs(character:GetDescendants()) do
							if v:isA("Weld") then
								if v.Part0 == handle or v.Part1 == handle then
									v:Destroy()
								end
							end
						end
					end)
				end
			end
		end
	end
end)

cmd.add({"bringall"}, {"bringall", "Bring all players using tools"}, function()
	local players = Players:GetPlayers()
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	local point = root.CFrame
	
	if not backpack:FindFirstChildWhichIsA("Tool") then
		lib.messageOut("bringall", "Cannot bring players, no tools found")
		return
	end
	
	if backpack and hum then
		local tools = getTools(#players*3)
		wait()
		for i, v in pairs(tools) do
			v.Grip = v.Grip * CFrame.new(math.random(-16, 16)/8,0,math.random(-16, 16)/8)
			v.Parent = character
		end
		wait()
		for i, v in pairs(tools) do
			v.Parent = workspace
		end
		wait(.2)
		for key, player in pairs(players) do
			local target = player.Character
			if target and player ~= localPlayer then
				root = character:FindFirstChild("HumanoidRootPart")
				local assignedTool = tools[key+1]
				local handle = assignedTool:FindFirstChild("Handle")
				local targetPart = target:FindFirstChild("HumanoidRootPart")
				if handle and targetPart then
					local schar = character
					wrap(function()
						repeat
							wait()
							root.CFrame = point
							targetPart.CFrame = CFrame.new(root.Position + root.CFrame.rightVector)
						until
							assignedTool.Parent ~= workspace or localPlayer.Character ~= schar
						root.CFrame = point
					end)
				end
			end
		end
	end
end)

cmd.add({"bring"}, {"bring <player>", "Bring the given player(s)"}, function(p)
	local players = argument.getPlayers(p)
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	local point = root.CFrame
	
	if not backpack:FindFirstChildWhichIsA("Tool") then
		lib.messageOut("bring <player>", "Cannot bring players, no tools found")
		return
	end
	
	if backpack and hum then
		local tools = getTools(#players+1)
		wait()
		for i, v in pairs(tools) do
			v.Parent = character
		end
		wait()
		for i, v in pairs(tools) do
			v.Parent = workspace
		end
		wait()
		for key, player in pairs(players) do
			local target = player.Character
			if target and player ~= localPlayer then
				root = character:FindFirstChild("HumanoidRootPart")
				local assignedTool = tools[key+1]
				local handle = assignedTool:FindFirstChild("Handle")
				local targetPart = target:FindFirstChild("HumanoidRootPart")
				if handle and targetPart then
					local schar = character
					wrap(function()
						repeat
							wait()
							targetPart.CFrame = handle.CFrame
							root.CFrame = point
						until
							assignedTool.Parent ~= workspace or localPlayer.Character ~= schar
						for i, v in pairs(character:GetDescendants()) do
							if v.Name:find("Grip") and v:isA("Weld") then
								if v.Part0 == handle or v.Part1 == handle then
									v:Destroy()
								end
							end
						end
					end)
				end
			end
		end
	end
end)

cmd.add({"chatspam"}, {"chatspam <number>", "Repeatedly chat a massive string <N> at a time"}, function(n)
	local amt = tonumber(n) or 1
	lib.connect("spam", RunService.RenderStepped:Connect(function()
		for i = 1, amt do
			localPlayer:Chat(("💖"):rep(120000))
		end
	end))
end)

cmd.add({"errorlag", "animlag", "serverlag"}, {"animlag <number>", "Repeatedly error the server with a massive string <N> at a time"}, function(n)
	local amt = tonumber(n) or 1
	local i = 1234
	local symbols = {"💖","❤️","🔥","👍","🎉","😜","💯","💜","😈","💦"}
	local function err(...)
		i = i + 1
		if i > 30000 then i = 1000 end
		local hum = character:FindFirstChildWhichIsA("Humanoid")
		local animation = Instance.new("Animation")
		animation.AnimationId = (symbols[math.random(1, #symbols)]):rep(i)
		hum:LoadAnimation(animation):Play()
		animation:Destroy()
	end
	lib.connect("spam", RunService.RenderStepped:Connect(function()
		for i = 1, amt do
			err()
		end
	end))
end)

cmd.add({"soundspam", "playallsounds"}, {"soundspam", "Repeatedly play all sounds"}, function()
	if SoundService.RespectFilteringEnabled == true then lib.messageOut("soundspam", "Sounds will not replicate") return end
	local sounds = {}
	for i, v in pairs(getinstances and getinstances() or game:GetDescendants()) do
		pcall(function()
			if v:IsA("Sound") and v:IsDescendantOf(workspace) then
				table.insert(sounds, v)
			end
		end)
	end
	local c = lib.connect("spam", RunService.RenderStepped:Connect(function() end))
	while c.Connected do
		for _, sound in pairs(sounds) do
			sound:Play()
			sound.TimePosition = sound.TimeLength/3
		end
		wait(0.15)
	end
end)

cmd.add({"remotespam", "exhaust"}, {"remotespam <number>", "Repeatedly fire all remotes <N> at a time"}, function(n)
	local amt = tonumber(n) or 1
	local events, functions = {}, {}
	local str = ("💖"):rep(120000)
	for i, v in pairs(getinstances and getinstances() or game:GetDescendants()) do
		pcall(function()
			if v.Name:find("%d") == 1 then return end
			if v:IsA("RemoteEvent") then
				table.insert(events, v)
			elseif v:IsA("RemoteFunction") then
				table.insert(functions, v)
			end
		end)
	end
	lib.connect("spam", RunService.Stepped:Connect(function()
		for i = 1, amt do
			spawn(function()
				for _, remote in pairs(events) do
					remote:FireServer(str)
				end
				for _, remote in pairs(functions) do
					remote:InvokeServer(str)
				end
			end)
		end
	end))
end)

cmd.add({"unspam", "unlag", "unchatspam", "unanimlag", "unremotespam"}, {"unspam", "Stop all attempts to lag/spam"}, function()
	lib.disconnect("spam")
end)

cmd.add({"ping", "lag"}, {"ping <ms>", "Set your replication lag to a value"}, function(n)
	local ping = (tonumber(n) or 0)/1000
	settings():GetService("NetworkSettings").IncommingReplicationLag = ping
end)

cmd.add({"refresh", "re"}, {"refresh", "Respawn your character and teleport back to your previous position"}, function()
	local cf, p = CFrame.new(), character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
	if p then
		cf = p.CFrame
	end
	respawn()
	player.CharacterAdded:Wait(); wait(0.2);
	character:WaitForChild("HumanoidRootPart").CFrame = cf
end)

cmd.add({"respawn"}, {"respawn", "Respawn your character"}, function()
	respawn()
end)

cmd.add({"trip", "platformstand"}, {"trip", "Trip your player"}, function()
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if hum then
		if hrp then
			hrp.RotVelocity = Vector3.new(-5, 0, 0)
		end
		hum.PlatformStand = true
	end
end)

cmd.add({"stand", "untrip"}, {"stand", "Stand up"}, function()
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	if hum then
		hum.PlatformStand = false
	end
end)

cmd.add({"sit"}, {"sit", "Sit your player"}, function()
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	if hum then
		hum.Sit = true
	end
end)

cmd.add({"antikill", "nofekill", "antifekill"}, {"antikill", "Toggle FE kill prevention  -Cyrus"}, function()
	-- from cyrus
	if connections["antifekill"] then lib.disconnect("antifekill") return end
	local LP = game:GetService'Players'.LocalPlayer
	local OldCFrame = LP.Character.Head.CFrame
	local debounce = false
	local tools = {}
	for _,v in pairs(LP.Backpack:GetChildren()) do 
		if v:IsA'Tool' then 
			table.insert(tools,v)
		end
	end
	lib.connect("antifekill", LP.Character.ChildAdded:Connect(function(h)
		for _,v in pairs(tools) do if h == v then return end end 
		if h:IsA'Tool' then
			table.insert(tools,h)
			LP.Backpack:FindFirstChildOfClass'Tool'.Parent = LP.Character
			LP.Character:FindFirstChildOfClass'Tool'.Parent = LP.Backpack
			for i = 1,50 do 
				LP.Character.HumanoidRootPart.CFrame = OldCFrame
			end
			debounce = true 
			repeat wait(1) until not LP.Character:FindFirstChildOfClass'Tool'
			debounce = false
			if not debounce then 
				OldCFrame = LP.Character.Head.CFrame + Vector3.new(0,5,0)
			end 
		end
	end))
	
	lib.connect("antifekill", LP.Character.ChildRemoved:Connect(function(a)
		if a:IsA'Tool' then 
			table.insert(tools,a) 
		end 
	end))
end)

cmd.add({"move", "addpos", "translate", "trans"}, {"move <X,Y,Z>", "Moves your character by the given X,Y,Z coordinates"}, function(p)
	local players = argument.getPlayers(p)
	local pos = lib.parseText(p, opt.tupleSeparator)
	if character then
		if pos and #pos == 3 then
			local x,y,z = pos[1], pos[2], pos[3]
			character:TranslateBy(Vector3.new(x, y, z))
		end
	end
end)

local flyPart
cmd.add({"fly"}, {"fly [speed]", "Enable flight"}, function(speed)
	if not speed then speed = 5 end
	if connections["fly"] then lib.disconnect("fly") character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false end
	local dir = {w = false, a = false, s = false, d = false}
	local cf = Instance.new("CFrameValue")
	
	flyPart = flyPart or Instance.new("Part")
	flyPart.Anchored = true
	pcall(function()
		flyPart.CFrame = character.HumanoidRootPart.CFrame
	end)
	
	lib.connect("fly", RunService.RenderStepped:Connect(function()
		if not character:FindFirstChild("HumanoidRootPart") then return end
		local primaryPart = character.HumanoidRootPart
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		
		local x, y, z = 0, 0, 0
		if dir.w then z = -1 * speed end
		if dir.a then x = -1 * speed end
		if dir.s then z = 1 * speed end
		if dir.d then x = 1 * speed end
		if dir.q then y = 1 * speed end
		if dir.e then y = -1 * speed end
		
		for i, v in pairs(character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Velocity = Vector3.new(0, 0, 0)
				v.RotVelocity = Vector3.new(0, 0, 0)
			end
		end
		flyPart.CFrame = CFrame.new(
			flyPart.CFrame.p,
			(camera.CFrame * CFrame.new(0, 0, -100)).p
		)
		
		local moveDir = CFrame.new(x,y,z)
		cf.Value = cf.Value:lerp(moveDir, 0.2)
		flyPart.CFrame = flyPart.CFrame:lerp(flyPart.CFrame * cf.Value, 0.2)
		primaryPart.CFrame = flyPart.CFrame
		humanoid.PlatformStand = true
	end))
	lib.connect("fly", UserInputService.InputBegan:Connect(function(input, event)
		if event then return end
		local code, codes = input.KeyCode, Enum.KeyCode
		if code == codes.W then
			dir.w = true
		elseif code == codes.A then
			dir.a = true
		elseif code == codes.S then
			dir.s = true
		elseif code == codes.D then
			dir.d = true
		elseif code == codes.Q then
			dir.q = true
		elseif code == codes.E then
			dir.e = true
		elseif code == codes.Space then
			dir.q = true
		end
	end))
	lib.connect("fly", UserInputService.InputEnded:Connect(function(input, event)
		if event then return end
		local code, codes = input.KeyCode, Enum.KeyCode
		if code == codes.W then
			dir.w = false
		elseif code == codes.A then
			dir.a = false
		elseif code == codes.S then
			dir.s = false
		elseif code == codes.D then
			dir.d = false
		elseif code == codes.Q then
			dir.q = false
		elseif code == codes.E then
			dir.e = false
		elseif code == codes.Space then
			dir.q = false
		end
	end))
end)
cmd.add({"unfly"}, {"unfly", "Disable flight"}, function()
	lib.disconnect("fly")
	flyPart:Destroy()
	character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
end)

cmd.add({"noclip", "nclip", "nc"}, {"noclip", "Disable your player's collision"}, function()
	if connections["noclip"] then lib.disconnect("noclip") return end
	lib.connect("noclip", RunService.Stepped:Connect(function()
		if not character then return end
		for i, v in pairs(character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end))
end)
cmd.add({"clip", "c"}, {"clip", "Enable your player's collision"}, function()
	lib.disconnect("noclip")
end)

cmd.add({"freecam", "fc", "fcam"}, {"freecam [speed]", "Enable free camera"}, function(speed)
	if not speed then speed = 5 end
	if connections["freecam"] then lib.disconnect("freecam") camera.CameraSubject = character 	wrap(function() character.PrimaryPart.Anchored = false end) end
	local dir = {w = false, a = false, s = false, d = false}
	local cf = Instance.new("CFrameValue")
	local camPart = Instance.new("Part")
	camPart.Transparency = 1
	camPart.Anchored = true
	camPart.CFrame = camera.CFrame
	wrap(function()
		character.PrimaryPart.Anchored = true
	end)
	
	lib.connect("freecam", RunService.RenderStepped:Connect(function()
		local primaryPart = camPart
		camera.CameraSubject = primaryPart
		
		local x, y, z = 0, 0, 0
		if dir.w then z = -1 * speed end
		if dir.a then x = -1 * speed end
		if dir.s then z = 1 * speed end
		if dir.d then x = 1 * speed end
		if dir.q then y = 1 * speed end
		if dir.e then y = -1 * speed end
		
		primaryPart.CFrame = CFrame.new(
			primaryPart.CFrame.p,
			(camera.CFrame * CFrame.new(0, 0, -100)).p
		)
		
		local moveDir = CFrame.new(x,y,z)
		cf.Value = cf.Value:lerp(moveDir, 0.2)
		primaryPart.CFrame = primaryPart.CFrame:lerp(primaryPart.CFrame * cf.Value, 0.2)
	end))
	lib.connect("freecam", UserInputService.InputBegan:Connect(function(input, event)
		if event then return end
		local code, codes = input.KeyCode, Enum.KeyCode
		if code == codes.W then
			dir.w = true
		elseif code == codes.A then
			dir.a = true
		elseif code == codes.S then
			dir.s = true
		elseif code == codes.D then
			dir.d = true
		elseif code == codes.Q then
			dir.q = true
		elseif code == codes.E then
			dir.e = true
		elseif code == codes.Space then
			dir.q = true
		end
	end))
	lib.connect("freecam", UserInputService.InputEnded:Connect(function(input, event)
		if event then return end
		local code, codes = input.KeyCode, Enum.KeyCode
		if code == codes.W then
			dir.w = false
		elseif code == codes.A then
			dir.a = false
		elseif code == codes.S then
			dir.s = false
		elseif code == codes.D then
			dir.d = false
		elseif code == codes.Q then
			dir.q = false
		elseif code == codes.E then
			dir.e = false
		elseif code == codes.Space then
			dir.q = false
		end
	end))
end)
cmd.add({"unfreecam", "unfc", "unfcam"}, {"unfreecam", "Disable free camera"}, function()
	lib.disconnect("freecam")
	camera.CameraSubject = character
	wrap(function()
		character.PrimaryPart.Anchored = false
	end)
end)

cmd.add({"drophats"}, {"drophats", "Drop all of your hats"}, function()
	for _, hat in pairs(character:GetChildren()) do
		if hat:IsA("Accoutrement") then
			hat.Parent = workspace
		end
	end
end)

cmd.add({"hatspin"}, {"hatspin <height>", "Make your hats spin"}, function(h)
	local head = character:FindFirstChild("Head")
	if not head then return end
	for _, hat in pairs(character:GetChildren()) do
		if hat:IsA("Accoutrement") and hat:FindFirstChild("Handle") then
			local handle = hat.Handle
			handle:BreakJoints()
			
			local align = Instance.new("AlignPosition")
			local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
			align.Attachment0, align.Attachment1 = a0, a1
			align.RigidityEnabled = true
			a1.Position = Vector3.new(0, tonumber(h) or 0.5, 0)
			lock(align, handle); lock(a0, handle); lock(a1, head);
			
			local angular = Instance.new("BodyAngularVelocity")
			angular.AngularVelocity = Vector3.new(0, math.random(100, 160)/16, 0)
			angular.MaxTorque = Vector3.new(0, 400000, 0)
			lock(angular, handle);
		end
	end
end)

cmd.add({"hatorbit"}, {"hatorbit [height] [distance]", "Make your hats orbit around your head"}, function(h, d)
	local head = character:FindFirstChild("Head")
	if not head then return end
	local i = 3
	for _, hat in pairs(character:GetChildren()) do
		if hat:IsA("Accoutrement") and hat:FindFirstChild("Handle") then
			local handle = hat.Handle
			handle:BreakJoints()
			
			local align = Instance.new("AlignPosition")
			local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
			align.Attachment0, align.Attachment1 = a0, a1
			align.RigidityEnabled = true
			lock(align, handle); lock(a0, handle); lock(a1, head);
			i = i + 0.5
			local n = tonumber(d) or i
			wrap(function()
				local rotX, rotY = 0, math.pi/2
				local speed = math.random(25, 100)/1000
				while handle and handle.Parent do
					rotX, rotY = rotX + speed, rotY + speed
					a1.Position = Vector3.new(math.sin(rotX) * (n), tonumber(h) or 0, math.sin(rotY) * (n))
					RunService.RenderStepped:Wait(0)
				end
			end)
		end
	end
end)

cmd.add({"limbbounce"}, {"limbbounce [height] [distance]", "Make your limbs bounce around your head"}, function(h, d)
	local head = character:FindFirstChild("Head")
	if not head then return end
	local i = 2
	for _, part in pairs(character:GetDescendants()) do
		local name = part.Name:lower()
		if part:IsA("BasePart") and not part.Parent:IsA("Accoutrement") and not name:find("torso") and not name:find("head") and not name:find("root") then
			i = i + math.random(15,50)/100
			part:BreakJoints()
			local n = tonumber(d) or i
			
			local align = Instance.new("AlignPosition")
			local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
			align.Attachment0, align.Attachment1 = a0, a1
			align.RigidityEnabled = true
			lock(align, part); lock(a0, part); lock(a1, head);
			
			wrap(function()
				local rotX = 0
				local speed = math.random(350, 750)/10000
				while part and part.Parent do
					rotX = rotX + speed
					a1.Position = Vector3.new(0, (tonumber(h) or 0) + math.sin(rotX) * n, 0)
					RunService.RenderStepped:Wait(0)
				end
			end)
		end
	end
end)

cmd.add({"limborbit"}, {"limborbit [height] [distance]", "Make your limbs orbit around your head"}, function(h, d)
	local head = character:FindFirstChild("Head")
	if not head then return end
	local i = 2
	for _, part in pairs(character:GetDescendants()) do
		local name = part.Name:lower()
		if part:IsA("BasePart") and not part.Parent:IsA("Accoutrement") and not name:find("torso") and not name:find("head") and not name:find("root") then
			i = i + math.random(15,50)/100
			part:BreakJoints()
			local n = tonumber(d) or i
			
			local align = Instance.new("AlignPosition")
			local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
			align.Attachment0, align.Attachment1 = a0, a1
			align.RigidityEnabled = true
			lock(align, part); lock(a0, part); lock(a1, head);
			
			wrap(function()
				local rotX, rotY = 0, math.pi/2
				local speed = math.random(35, 75)/1000
				while part and part.Parent do
					rotX, rotY = rotX + speed, rotY + speed
					a1.Position = Vector3.new(math.sin(rotX) * (n), tonumber(h) or 0, math.sin(rotY) * (n))
					RunService.RenderStepped:Wait(0)
				end
			end)
		end
	end
end)

local function getAllTools()
	local tools = {}
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	if backpack then
		for i, v in pairs(backpack:GetChildren()) do
			if v:IsA("Tool") then
				table.insert(tools, v)
			end
		end
	end
	for i, v in pairs(character:GetChildren()) do
		if v:IsA("Tool") then
			table.insert(tools, v)
		end
	end
	return tools
end

cmd.add({"circlemath", "cm"}, {"circlemath <mode> <size>", "Gay circle math\nModes: abc..."}, function(mode, size)
	local mode = mode or "a"
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	lib.disconnect("cm")
	if backpack and character.Parent then
		local tools = getAllTools()
		for i, tool in pairs(tools) do
			local cpos, g = (math.pi*2)*(i/#tools), CFrame.new()
			local tcon = {}
			tool.Parent = backpack
			
			if mode == "a" then
				size = tonumber(size) or 2
				g = (
					CFrame.new(0, 0, size)*
					CFrame.Angles(rad(90), 0, cpos)
				)
			elseif mode == "b" then
				size = tonumber(size) or 2
				g = (
					CFrame.new(i - #tools/2, 0, 0)*
					CFrame.Angles(rad(90), 0, 0)
				)
			elseif mode == "c" then
				size = tonumber(size) or 2
				g = (
					CFrame.new(cpos/3, 0, 0)*
					CFrame.Angles(rad(90), 0, cpos*2)
				)
			elseif mode == "d" then
				size = tonumber(size) or 2
				g = (
					CFrame.new(clamp(tan(cpos), -3, 3), 0, 0)*
					CFrame.Angles(rad(90), 0, cpos)
				)
			elseif mode == "e" then
				size = tonumber(size) or 2
				g = (
					CFrame.new(0, 0, clamp(tan(cpos), -5, 5))*
					CFrame.Angles(rad(90), 0, cpos)
				)
			end
			tool.Grip = g
			tool.Parent = character
			
			tcon[#tcon] = lib.connect("cm", mouse.Button1Down:Connect(function()
				tool:Activate()
			end))
			tcon[#tcon] = lib.connect("cm", tool.Changed:Connect(function(p)
				if p == "Grip" and tool.Grip ~= g then
					tool.Grip = g
				end
			end))
			
			lib.connect("cm", tool.AncestryChanged:Connect(function()
				for i = 1, #tcon do
					tcon[i]:Disconnect()
				end
			end))
		end
	end
end)

local r = math.rad
local center = CFrame.new(1.5, 0.5, -1.5)

cmd.add({"toolanimate"}, {"toolanimate <mode> <int>", "Make your tools epic\nModes: ufo/ring/shutter/saturn/portal/wtf/ball/tor"}, function(mode, int)
	lib.disconnect("tooldance")
	local int = tonumber(int) or 5
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local primary = character:FindFirstChild("HumanoidRootPart")
	if backpack and primary then
		local tools = getAllTools()
		for i, tool in pairs(tools) do
			if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
				local circ = (i/#tools)*(math.pi*2)
				
				local function editGrip(tool, cframe, offset)
					local origin = CFrame.new(cframe.p):inverse()
					local x, y, z = cframe:toEulerAnglesXYZ()
					local new = CFrame.Angles(x, y, z)
					local grip = (origin * new):inverse()
					tool.Parent = backpack
					tool.Grip = offset * grip
					tool.Parent = character
					
					for i, v in pairs(tool:GetDescendants()) do
						if v:IsA("Sound") then
							v:Stop()
						end
					end
				end
				tool.Handle.Massless = true
				
				if mode == "ufo" then
					local s = {}
					local x, y = i, i + math.pi / 2
					lib.connect("tooldance", RunService.Heartbeat:Connect(function()
						s.x = math.sin(x)
						s.y = math.sin(y)
						x, y = x + 0.1, y + 0.1
						
						local cframe =
							center *
							CFrame.new() *
							CFrame.Angles(r(s.y*10), circ + r(s.y*8), r(s.x*10))
						local offset =
							CFrame.new(int, 0, 0) *
							CFrame.Angles(0, 0, 0)
						editGrip(tool, cframe, offset)
					end))
				elseif mode == "ring" then
					local s = {}
					local x, y = i, i + math.pi / 2
					lib.connect("tooldance", RunService.Heartbeat:Connect(function()
						s.x = math.sin(x)
						s.y = math.sin(y)
						x, y = x + 0.04, y + 0.04
						
						local cframe =
							center *
							CFrame.new(0, 3, 0) *
							CFrame.Angles(0, circ, x)
						local offset =
							CFrame.new(0, 0, int) *
							CFrame.Angles(0, 0, 0)
						editGrip(tool, cframe, offset)
					end))
				elseif mode == "shutter" then
					local s = {}
					local x, y = 0, math.pi / 2
					lib.connect("tooldance", RunService.Heartbeat:Connect(function()
						s.x = math.sin(x)
						s.y = math.sin(y)
						x, y = x + 0.1, y + 0.1
						
						local cframe =
							center *
							CFrame.new(0, 0, 0) *
							CFrame.Angles(0, 0, circ + 0)
						local offset =
							CFrame.new(s.y*6, 0, int) *
							CFrame.Angles(r(-90), 0, 0)
						editGrip(tool, cframe, offset)
					end))
				elseif mode == "saturn" then
					local s = {}
					local x, y = 0, math.pi / 2
					lib.connect("tooldance", RunService.Heartbeat:Connect(function()
						s.x = math.sin(x)
						s.y = math.sin(y)
						x, y = x + 0.1, y + 0.1
						local cframe =
							center *
							CFrame.new(0, 0, 0) *
							CFrame.Angles(0, circ, 0)
						local offset =
							CFrame.new(s.y*6, 0, int) *
							CFrame.Angles(0, 0, r(0))
						editGrip(tool, cframe, offset)
					end))
				elseif mode == "portal" then
					local s = {}
					local x, y = 0, math.pi / 2
					lib.connect("tooldance", RunService.Heartbeat:Connect(function()
						s.x = math.sin(x)
						s.y = math.sin(y)
						x, y = x + 0.1, y + 0.1
						
						local cframe =
							center *
							CFrame.new(0, 0, 0) *
							CFrame.Angles(0, 0, circ + r(x*45))
						local offset =
							CFrame.new(3, 0, int) *
							CFrame.Angles(r(-90), 0, 0)
						editGrip(tool, cframe, offset)
					end))
				elseif mode == "ball" then
					local s = {}
					local n = math.random()*#tools
					local x, y = n, n+math.pi / 2
					local random = math.random()
					lib.connect("tooldance", RunService.Heartbeat:Connect(function()
						s.x = math.sin(x)
						s.y = math.sin(y)
						x, y = x + 0.1, y + 0.1
						local cframe =
							center *
							CFrame.new(0, 0, 0) *
							CFrame.Angles(r(y*25), circ, r(y*25))
						local offset =
							CFrame.new(0, int + random*2, 0) *
							CFrame.Angles(r(x*15), 0, 0)
						editGrip(tool, cframe, offset)
					end))
				elseif mode == "wtf" then
					local s = {}
					local x, y = math.random()^3, math.random()^3+math.pi / 2
					lib.connect("tooldance", RunService.Heartbeat:Connect(function()
						s.x = math.sin(x)
						s.y = math.sin(y)
						x, y = x + 0.1 + math.random()/10, y + 0.1 + math.random()/10
						local cframe =
							center *
							CFrame.new(0, 0, 0) *
							CFrame.Angles(r(y*100)+math.random(), circ, r(y*100)+math.random())
						local offset =
							CFrame.new(0, int + math.random()*4, 0) *
							CFrame.Angles(r(x*100), 0, 0)
						editGrip(tool, cframe, offset)
					end))
				elseif mode == "tor" then
					local s = {}
					local x, y = i*1, i*1+math.pi / 2
					local random = math.random()
					lib.connect("tooldance", RunService.Heartbeat:Connect(function()
						s.x = math.sin(x)
						s.y = math.sin(y)
						x, y = x + (int/75), y+0.1
						local cframe =
							center *
							CFrame.new(1.5, 2, 0) *
							CFrame.Angles(r(-90-25), 0, 0)
						local offset =
							CFrame.new(0, s.x*3, -int+math.sin(y/5)*-int) *
							CFrame.Angles(r(int), s.x, -x)
						editGrip(tool, cframe, offset)
					end))
				end
			else
				table.remove(tools, i)
			end
		end
	end
end)

cmd.add({"tooldance", "td"}, {"tooldance <mode> <size>", "Make your tools dance\nModes: tor/sph/inf/rng/whl/wht/voi"}, function(mode, size)
	local size = tonumber(size) or 5
	lib.disconnect("tooldance")
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local primary = character:FindFirstChild("HumanoidRootPart")
	if backpack and primary then
		local i, tools = 0, getAllTools()
		for _, tool in pairs(tools) do
			if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
				i=i+1
				tool.Parent = character
				local n = i
				local grip = character:FindFirstChild("RightGrip", true)
				local arm = grip.Parent
				
				local function editGrip(cf)
					tool.Parent = backpack
					tool.Grip = cf
					tool.Parent = character
					
					for i, v in pairs(tool:GetDescendants()) do
						if v:IsA("Sound") and v.Name:find("sheath") then
							v:Destroy()
						end
					end
				end
				tool.Handle.Massless = true
				
				if mode == "tor" then
					local x, y = n, n+math.pi/2
					lib.connect("tooldance", RunService.RenderStepped:Connect(function()
						x,y = x+(size/75),y+0.1
						local sx,sy = math.sin(x),math.sin(y)
						editGrip(
							CFrame.new(
								Vector3.new(0, math.sin(x * 0.5), size + 3 + math.sin(y / 5) * size)
							) * 
							CFrame.Angles(
								math.rad(size), 
								math.sin(x), 
								-x
							)
						)
					end))
				elseif mode == "sph" then
					local x, y = n, n+math.pi/2
					lib.connect("tooldance", RunService.RenderStepped:Connect(function()
						x,y = x+.1,y+.1
						local sx,sy = math.sin(x),math.sin(y)
						editGrip(
							CFrame.new(
								Vector3.new(0, size, 0)
							) * 
							CFrame.Angles(
								math.deg(x/150), 
								x + rad(90), 
								0
							)
						)
					end))
				elseif mode == "inf" then
					local x, y = n, n+math.pi/2
					lib.connect("tooldance", RunService.RenderStepped:Connect(function()
						x,y = x+.1,y+.1
						local sx,sy = math.sin(x),math.sin(y)
						editGrip(
							CFrame.new(
								Vector3.new(0, size, 0)
							) * 
							CFrame.Angles(
								x, 
								x + rad(90), 
								0
							)
						)
					end))
				elseif mode == "wht" then
					local x, y = n, n+math.pi/2
					lib.connect("tooldance", RunService.RenderStepped:Connect(function()
						x,y = x+.1,y+.1
						local sx,sy = math.sin(x),math.sin(y)
						editGrip(
							CFrame.new(
								Vector3.new(0, size, 0)
							) * 
							CFrame.Angles(
								(y+math.sin(x)*10)/10, 
								x + rad(90), 
								0
							)
						)
					end))
				elseif mode == "rng" then
					local x, y = n, n+math.pi/2
					lib.connect("tooldance", RunService.RenderStepped:Connect(function()
						x,y = x+0.1,y+0.1
						local sx,sy = math.sin(x),math.sin(y)
						editGrip(
							CFrame.new(
								0, 0, size
							) * 
							CFrame.Angles(
								0, 
								x, 
								0
							)
						)
					end))
				elseif mode == "whl" then
					local x, y = n, n+math.pi/2
					lib.connect("tooldance", RunService.RenderStepped:Connect(function()
						x,y = x+0.1,y+0.1
						local sx,sy = math.sin(x),math.sin(y)
						editGrip(
							CFrame.new(
								Vector3.new(0, 0, size)
							) * 
							CFrame.Angles(
								x,
								0, 
								0
							)
						)
					end))
				elseif mode == "voi" then
					local x, y = n, n+math.pi/2
					lib.connect("tooldance", RunService.RenderStepped:Connect(function()
						x,y = x+0.1,y+0.1
						local sx,sy = math.sin(x),math.sin(y)
						editGrip(
							CFrame.new(
								Vector3.new(size, 0, 0)
							) * 
							CFrame.Angles(
								0,
								.6 + sy/3, 
								(n) + sx + x
							)
						)
					end))
				end
			end
		end
	end
end)
cmd.add({"nodance", "untooldance"}, {"nodance", "Stop making tools dance"}, function()
	lib.disconnect("tooldance")
end)

cmd.add({"toolvis", "audiovis"}, {"toolvis <size>", "Turn your tools into an audio visualizer"}, function(size)
	lib.disconnect("tooldance")
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local primary = character:FindFirstChild("HumanoidRootPart")
	local hum = character:FindFirstChild("Humanoid")
	local sound
	for i, v in pairs(character:GetDescendants()) do
		if v:IsA("Sound") and v.Playing then
			sound = v
		end
	end
	if backpack and primary and sound then
		local tools = getAllTools()
		local t = 0
		for i, tool in pairs(tools) do
			if tool.Parent == character and tool:IsA("BackpackItem") and tool:FindFirstChildWhichIsA("BasePart") and tool.Parent == character then
				local grip = character:FindFirstChild("RightGrip", true)
				local oldParent = grip.Parent
				lib.connect("tooldance", RunService.RenderStepped:Connect(function()
					if not sound then lib.disconnect("tooldance") end
					tool.Parent = character
					grip.Parent = oldParent
				end))
			end
		end
		wait()
		for i, tool in pairs(tools) do
			if tool.Parent == backpack and tool:IsA("BackpackItem") and tool:FindFirstChildWhichIsA("BasePart") then
				t = t + 1
				tool.Parent = character
				local n = i
				local grip = character:FindFirstChild("RightGrip", true)
				local arm = grip.Parent
				
				local function editGrip(cf)
					tool.Parent = backpack
					tool.Grip = tool.Grip:lerp(cf, 0.2)
					tool.Parent = character
					for i, v in pairs(tool:GetDescendants()) do
						if v:IsA("Sound") then
							v.Parent = nil
						end
					end
				end
				tool.Handle.Massless = true
				
				local x,y,z,a = n,n+math.pi/2,n,0
				lib.connect("tooldance", RunService.Heartbeat:Connect(function()
					if not sound then lib.disconnect("tooldance") end
					
					local mt, loudness = sound.PlaybackLoudness/100, sound.PlaybackLoudness
					local sx, sy, sz, sa = math.sin(x), math.sin(y), math.sin(z), math.sin(a)
					x,y,z,a = x + 0.22 + mt / 100,  y + sx + mt,  z + sx/10,  a + mt/100 + math.sin(x-n)/100
					editGrip(
						CFrame.new(
							Vector3.new(
								0,
								2 + ((sx/2) * (mt^3/15))/3 - ((sx+0.5)/1.5 * ((loudness/10)^2/400)),
								tonumber(size) or 7
							)
						) * 
						CFrame.Angles(
							math.rad((sz+1)/2)*5,
							((math.pi*2)*(n/t)) - (a), 
							math.rad(sx)*5
						)
					)
				end))
			end
		end
	end
end)

cmd.add({"toolspin"}, {"toolspin [height] [amount]", "Make your tools spin on your head"}, function(h, amt)
	if not amt then amt = 1000 end
	local head = character:FindFirstChild("Head")
	if not head then return end
	for i, tool in pairs(localPlayer.Backpack:GetChildren()) do
		if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
			if i >= (tonumber(amt) or 1000) then break end
			if tool:FindFirstChildWhichIsA("LocalScript") then
				tool:FindFirstChildWhichIsA("LocalScript").Disabled = true
			end
			tool.Parent = character
		end
	end
	wait(0.5)
	for _, tool in pairs(character:GetChildren()) do
		if tool:IsA("Tool") then
			wrap(function()
				tool:WaitForChild("Handle")
				for i, part in pairs(tool:GetDescendants()) do
					if part:IsA("BasePart") then
						part:BreakJoints()
						
						local align = Instance.new("AlignPosition")
						local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
						align.Attachment0, align.Attachment1 = a0, a1
						align.RigidityEnabled = true
						a1.Position = Vector3.new(0, tonumber(h) or 0, 0)
						lock(align, part); lock(a0, part); lock(a1, head);
						
						local angular = Instance.new("BodyAngularVelocity")
						angular.AngularVelocity = Vector3.new(0, math.random(100, 160)/16, 0)
						angular.MaxTorque = Vector3.new(0, 400000, 0)
						lock(angular, part);
						
						spawn(function()
							repeat wait() until tool.Parent ~= character
							angular:Destroy()
							align:Destroy()
						end)
					end
				end
			end)
		end
	end
end)

cmd.add({"toolorbit"}, {"toolorbit [height] [distance] [amount]", "Make your tools orbit around your head"}, function(h, d, amt)
	if not amt then amt = 1000 end
	local head = character:FindFirstChild("Head")
	if not head then return end
	for i, tool in pairs(localPlayer.Backpack:GetChildren()) do
		if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
			if i >= (tonumber(amt) or 1000) then break end
			if tool:FindFirstChildWhichIsA("LocalScript") then
				tool:FindFirstChildWhichIsA("LocalScript").Disabled = true
			end
			tool.Parent = character
		end
	end
	wait(0.5)
	for _, tool in pairs(character:GetChildren()) do
		if tool:IsA("Tool") then
			wrap(function()
				tool:WaitForChild("Handle")
				for i, part in pairs(tool:GetDescendants()) do
					if part:IsA("BasePart") then
						part:BreakJoints()
						
						local align = Instance.new("AlignPosition")
						local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
						align.Attachment0, align.Attachment1 = a0, a1
						align.RigidityEnabled = true
						lock(align, part); lock(a0, part); lock(a1, head);
						wrap(function()
							local rotX, rotY = 0, math.pi/2
							local speed = math.random(25, 100)/1000
							local n = tonumber(d) or math.random(300, 700)/100
							local y = tonumber(h) or math.random(-100, 100)/100/2
							rotY, rotX = rotY + n, rotX + n
							
							part.CollisionGroupId = math.random(1000000,9999999)
							part.Anchored = false
							part.CFrame = head.CFrame * CFrame.new(0, 3, 0)
							
							while part and part.Parent and tool.Parent == character do
								rotX, rotY = rotX + speed, rotY + speed
								a1.Position = Vector3.new(math.sin(rotX) * n, y, math.sin(rotY) * n)
								RunService.RenderStepped:Wait(0)
							end
						end)
					end
				end
			end)
		end
	end
end)

cmd.add({"blockhats"}, {"blockhats", "Remove the meshes in your hats"}, function()
	for _, hat in pairs(character:GetChildren()) do
		if hat:IsA("Accoutrement") and hat:FindFirstChild("Handle") then
			local handle = hat.Handle
			if handle:FindFirstChildWhichIsA("SpecialMesh") then
				handle:FindFirstChildWhichIsA("SpecialMesh"):Destroy()
			end
		end
	end
end)

cmd.add({"blocktools"}, {"blocktools", "Remove the meshes in your tools"}, function()
	for _, tool in pairs(character:GetChildren()) do
		if tool:IsA("Tool") then
			for _, mesh in pairs(tool:GetDescendants()) do
				if mesh:IsA("DataModelMesh") then
					mesh:Destroy()
				end
			end
		end
	end
end)

cmd.add({"nomeshes", "nomesh", "blocks"}, {"nomeshes", "Remove all character meshes"}, function()
	for _, mesh in pairs(character:GetDescendants()) do
		if mesh:IsA("DataModelMesh") then
			mesh:Destroy()
		end
	end
end)

cmd.add({"nodecals", "nodecal", "notextures"}, {"nodecals", "Remove all character images"}, function()
	for _, img in pairs(character:GetDescendants()) do
		if img:IsA("Decal") or img:IsA("Texture") then
			img:Destroy()
		end
	end
end)

cmd.add({"godmode"}, {"godmode", "Fling anyone that touches you using angular velocity"}, function()
	lib.disconnect("pfling")
	local char = player.Character
	local hum = char:FindFirstChildWhichIsA("Humanoid")
	
	if char then
		local cf = char.HumanoidRootPart.CFrame
		local bv = Instance.new("BodyAngularVelocity", char.HumanoidRootPart)
		bv.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		bv.P = math.huge
		bv.AngularVelocity = Vector3.new(0, 9e5, 0)
		bv.Name = "hum"
		lock(bv)
		
		wait()
		char.HumanoidRootPart.CFrame = cf
		char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		
		for i,v in pairs(char:GetDescendants()) do
			if v:IsA('BasePart') then
				v.Massless = true
				v.Velocity = Vector3.new(0, 0, 0)
			end
		end
		
		local c = lib.connect("pfling", game:GetService('RunService').Stepped:Connect(function()
			for i,v in pairs(char:GetDescendants()) do
				if v:IsA('BasePart') then
					v.CanCollide = false
				end
			end
		end))
		repeat
			wait()
		until
			character ~= char or not c.Connected
		
		lib.disconnect("pfling")
		if lp.Character == char then
			char:SetPrimaryPartCFrame(cf)
			bv:Destroy()
			char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
			char.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
		end
	end
end)

cmd.add({"toolfling"}, {"toolfling", "Fling anyone that touches you using an accessory"}, function()
	lib.disconnect("pfling")
	local char = player.Character
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildWhichIsA("Humanoid")
	local tors = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
	if char then
		local c = lib.connect("pfling", RunService.Stepped:Connect(function()
			for i, v in pairs(char:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end))
		tors.Anchored = true
		local tool = Instance.new("Tool", localPlayer.Backpack)
		local hat = char:FindFirstChildOfClass("Accessory")
		local hathandle = hat.Handle
		
		hathandle.Parent = tool
		hathandle.Massless = true
		tool.GripPos = Vector3.new(0, 9e99, 0)
		tool.Parent = localPlayer.Character
		
		repeat wait() until char:FindFirstChildOfClass("Tool") ~= nil
		tool.Grip = CFrame.new(Vector3.new(0, 0, 0))
		tors.Anchored = false
		
		repeat
			hrp.CFrame = hrp.CFrame
			wait()
		until not c.Connected
		
		hum:UnequipTools()
		hathandle.Parent = hat
		hathandle.Massless = false
		tool:Destroy()
	end
end)

cmd.add({"ungodmode", "untoolfling", "ungod"}, {"ungodmode", "Disable permanent fling"}, function()
	lib.disconnect("pfling")
end)

--[ PLAYER ]--
cmd.add({"orbit"}, {"orbit <player> <distance>", "Orbit around a player"}, function(p,d)
	lib.disconnect("orbit")
	local players = argument.getPlayers(p)
	local target = players[1]
	if not target then return end
	
	local tchar, char = target.Character, character
	local thrp = tchar:FindFirstChild("HumanoidRootPart")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local dist = tonumber(d) or 4
	
	if tchar and char and thrp and hrp then
		local sineX, sineZ = 0, math.pi/2
		lib.connect("orbit", RunService.Stepped:Connect(function()
			sineX, sineZ = sineX + 0.05, sineZ + 0.05
			local sinX, sinZ = math.sin(sineX), math.sin(sineZ)
			if thrp.Parent and hrp.Parent then
				hrp.Velocity = Vector3.new(0, 0, 0)
				hrp.CFrame = CFrame.new(sinX * dist, 0, sinZ * dist) *
					(hrp.CFrame - hrp.CFrame.p) +
					thrp.CFrame.p
			end
		end))
	end
end)

cmd.add({"uporbit"}, {"uporbit <player> <distance>", "Orbit around a player on the Y axis"}, function(p,d)
	lib.disconnect("orbit")
	local players = argument.getPlayers(p)
	local target = players[1]
	if not target then return end
	
	local tchar, char = target.Character, character
	local thrp = tchar:FindFirstChild("HumanoidRootPart")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local dist = tonumber(d) or 4
	
	if tchar and char and thrp and hrp then
		local sineX, sineY = 0, math.pi/2
		lib.connect("orbit", RunService.Stepped:Connect(function()
			sineX, sineY = sineX + 0.05, sineY + 0.05
			local sinX, sinY = math.sin(sineX), math.sin(sineY)
			if thrp.Parent and hrp.Parent then
				hrp.Velocity = Vector3.new(0, 0, 0)
				hrp.CFrame = CFrame.new(sinX * dist, sinY * dist, 0) *
					(hrp.CFrame - hrp.CFrame.p) +
					thrp.CFrame.p
			end
		end))
	end
end)

cmd.add({"unorbit"}, {"unorbit", "Stop orbiting a player"}, function()
	lib.disconnect("orbit")
end)

cmd.add({"fixcam", "fix"}, {"fixcam", "Fix your camera"}, function()
	camera.CameraSubject = character:FindFirstChildWhichIsA("Humanoid")
	camera.CameraType = camtype
end)

cmd.add({"fekill", "kill"}, {"fekill <player>", "Kill a player using a tool and FE god"}, function(p)
	local target = argument.getPlayers(p)[1]
	if not target then return end
	
	local char = character
	local tchar = target.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	local hrp2 = tchar:FindFirstChild("HumanoidRootPart")
	local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
	local hum = character:FindFirstChildWhichIsA("Humanoid")
	
	if hrp and hrp2 and backpack and hum then
		hum.Name = "1"
		local newHum = hum:Clone()
		newHum.Parent = char
		newHum.Name = "Humanoid"
			
		wait(0.1)
		hum:Destroy()
		camera.CameraSubject = char
		newHum.DisplayDistanceType = "None"
		wait(0.1)
		
		for i, v in pairs(localPlayer.Backpack:GetChildren()) do
			v.Parent = char
			hrp.CFrame = hrp2.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-100, 100)/200,math.random(-100, 100)/200,math.random(-100, 100)/200)
			RunService.Stepped:Wait(0)
		end
		
		local n = 0
		repeat
			RunService.RenderStepped:Wait(0)
			n = n + 1
			hrp.CFrame = hrp2.CFrame
		until (not hrp or not hrp2 or not hrp.Parent or not hrp2.Parent or tchar:FindFirstChild("RightGrip", true) or n > 250) and n > 2
		
		hrp.CFrame = CFrame.new(999999, workspace.FallenPartsDestroyHeight + 5,999999)
		camera.CameraType = Enum.CameraType.Custom
	end
end)

cmd.add({"fling"}, {"fling <player>", "Fling the given player"}, function(p)
	local players = argument.getPlayers(p)
	local char = player.Character
	local hum = char:FindFirstChildWhichIsA("Humanoid")
	local cf = char.HumanoidRootPart.CFrame
	for i, plr in pairs(players) do
		if char and plr and plr.Character then
			local enemy = plr.Character
			local bv = Instance.new("BodyAngularVelocity", char.HumanoidRootPart)
			bv.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			bv.P = math.huge
			bv.AngularVelocity = Vector3.new(9e5, 9e5, 0)
			bv.Name = "hum"
			
			wait()
			char.HumanoidRootPart.CFrame = cf
			
			for i,v in pairs(char:GetDescendants()) do
				if v:IsA('BasePart') then
					v.Massless = true
				end
			end
			
			local c = lib.connect("fling", game:GetService('RunService').Stepped:Connect(function()
				for i,v in pairs(char:GetDescendants()) do
					if v:IsA('BasePart') then
						v.CanCollide = false
						v.Velocity = Vector3.new(0, 0, 0)
					end
				end
				if char.PrimaryPart and enemy.PrimaryPart then
					char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
					char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				end
			end))
			repeat
				wait()
			until
				character ~= char or not enemy or not enemy.Parent or not c.Connected or not enemy.PrimaryPart or enemy.PrimaryPart.Velocity.magnitude > 100
			
			lib.disconnect("fling")
			if lp.Character == char then
				char:SetPrimaryPartCFrame(cf)
				bv:Destroy()
				char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
				char.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
			end
			if not c.Connected then
				break
			end
		end
	end
end)
cmd.add({"unfling"}, {"unfling", "Stop all attempts to fling"}, function()
	lib.disconnect("fling")
end)

cmd.add({"goto", "to", "tp", "teleport"}, {"goto <player/X,Y,Z>", "Teleport to the given player or X,Y,Z coordinates"}, function(p)
	local players = argument.getPlayers(p)
	local pos = lib.parseText(p, opt.tupleSeparator)
	if character then
		if pos and #pos == 3 then
			local x,y,z = pos[1], pos[2], pos[3]
			character:MoveTo(Vector3.new(x, y, z))
		elseif players[1] and players[1].Character then
			character:MoveTo((players[1].Character:GetPrimaryPartCFrame() * CFrame.new(1, 0, 2)).p)
		end
	end
end)

cmd.add({"watch", "view"}, {"watch <player>", "Watch the given player"}, function(p)
	local players = argument.getPlayers(p)
	if players[1] and players[1].Character then
		camera.CameraSubject = players[1].Character:FindFirstChildWhichIsA("Humanoid")
	end
end)
cmd.add({"unwatch", "unview"}, {"unwatch", "Stop watching a player"}, function()
	if character then
		camera.CameraSubject = character:FindFirstChildWhichIsA("Humanoid")
	end
end)

cmd.add({"copyaudio", "getaudio"}, {"copyaudio <player>", "Copy all sounds a player is playing to your clipboard  -Cyrus"}, function(p)
	local players = argument.getPlayers(p)
	local audios = ""
	for _, player in pairs(players) do
		local char = player.Character
		if char then
			audios = audios .. ("<<[ %s ]>>"):format(player.Name)
			for i, v in pairs(char:GetDescendants()) do
				if v:IsA("Sound") and v.Playing then
					audios = audios .. ("\n[ %s ]: %s"):format(v.Name, v.SoundId)
				end
			end
		end
	end
	setclipboard(audios)
end)

cmd.add({"saveaudio", "stealaudio", "steal"}, {"saveaudio <player>", "Save all sounds a player is playing to a file  -Cyrus"}, function(p)
	local players = argument.getPlayers(p)
	local audios = ""
	for _, player in pairs(players) do
		local char = player.Character
		if char then
			audios = audios .. ("<<[ %s ]>>"):format(player.Name)
			for i, v in pairs(char:GetDescendants()) do
				if v:IsA("Sound") and v.Playing then
					audios = audios .. ("\n[ %s ]: %s"):format(v.Name, v.SoundId)
				end
			end
		end
	end
	writefile(("Audio-Logs_%c"):format(math.random(1000, 9999)), audios)
end)

cmd.add({"follow", "stalk", "walk"}, {"follow <player>", "Follow a player wherever they go"}, function(p)
	lib.disconnect("follow")
	local players = argument.getPlayers(p)
	local targetPlayer = players[1]
	lib.connect("follow", RunService.Stepped:Connect(function()
		local target = targetPlayer.Character
		if target and character then
			local hum = character:FindFirstChildWhichIsA("Humanoid")
			if hum then
				local targetPart = target:FindFirstChild("Head")
				local targetPos = targetPart.Position
				hum:MoveTo(targetPos)
			end
		end
	end))
end)

cmd.add({"pathfind"}, {"pathfind <player>", "Follow a player using the pathfinder API wherever they go"}, function(p)
	lib.disconnect("follow")
	local players = argument.getPlayers(p)
	local targetPlayer = players[1]
	local debounce = false
	lib.connect("follow", RunService.Stepped:Connect(function()
		if debounce then return end
		debounce = true
		local target = targetPlayer.Character
		if target and character then
			local hum = character:FindFirstChildWhichIsA("Humanoid")
			local main = target:FindFirstChild("HumanoidRootPart")
			if hum then
				local targetPart = target:FindFirstChild("HumanoidRootPart") or target:FindFirstChild("Head")
				local targetPos = (targetPart.CFrame * CFrame.new(0, 0, -0.5)).p
				local PathService = game:GetService("PathfindingService")
				local path = PathService:CreatePath({
					AgentRadius = 2,
					AgentHeight = 5,
					AgentCanJump = true
				})
				local points = path:ComputeAsync(main.Position, targetPos)
				
				if path.Status then
					local waypoints = path:GetWaypoints()
					for i, waypoint in pairs(waypoints) do
						if i > 2 then break end
						if waypoint.Action == Enum.PathWaypointAction.Jump then
							hum.Jump = true
						end
						hum:MoveTo(waypoint.Position)
						local distance = 5
						repeat
							wait()
							distance = (waypoint.Position - main.Position).magnitude
						until
							(targetPos - targetPart.Position).magnitude > 2 or distance < 1

						if (targetPos - targetPart.Position).magnitude > 2 then
							break
						end
					end
				end
			end
		end
		debounce = false
	end))
end)

cmd.add({"unfollow", "unstalk", "unwalk", "unpathfind"}, {"unfollow", "Stop all attempts to follow a player"}, function()
	lib.disconnect("follow")
end)

--[[ FUNCTIONALITY ]]--
localPlayer.Chatted:Connect(function(str)
	lib.parseCommand(str)
end)


--[[ GUI VARIABLES ]]--
local ScreenGui
if not RunService:IsStudio() then
	ScreenGui = game:GetObjects("rbxassetid://4281507772")[1]
else
	repeat wait() until player:FindFirstChild("AdminUI", true)
	ScreenGui = player:FindFirstChild("AdminUI", true)
end

local description = ScreenGui.Description
local cmdBar = ScreenGui.CmdBar
	local centerBar = cmdBar.CenterBar
		local cmdInput = centerBar.Input
	local cmdAutofill = cmdBar.Autofill
		local cmdExample = cmdAutofill.Cmd
	local leftFill = cmdBar.LeftFill
	local rightFill = cmdBar.RightFill
local chatLogsFrame = ScreenGui.ChatLogs
	local chatLogs = chatLogsFrame.Container.Logs
		local chatExample = chatLogs.TextLabel
local commandsFrame = ScreenGui.Commands
	local commandsFilter = commandsFrame.Container.Filter
	local commandsList = commandsFrame.Container.List
		local commandExample = commandsList.TextLabel
local resizeFrame = ScreenGui.Resizeable
local resizeXY = {
	Top		= {Vector2.new(0, -1),	Vector2.new(0, -1),	"rbxassetid://2911850935"},
	Bottom	= {Vector2.new(0, 1),	Vector2.new(0, 0),	"rbxassetid://2911850935"},
	Left	= {Vector2.new(-1, 0),	Vector2.new(1, 0),	"rbxassetid://2911851464"},
	Right	= {Vector2.new(1, 0),	Vector2.new(0, 0),	"rbxassetid://2911851464"},
	
	TopLeft		= {Vector2.new(-1, -1),	Vector2.new(1, -1),	"rbxassetid://2911852219"},
	TopRight	= {Vector2.new(1, -1),	Vector2.new(0, -1),	"rbxassetid://2911851859"},
	BottomLeft	= {Vector2.new(-1, 1),	Vector2.new(1, 0),	"rbxassetid://2911851859"},
	BottomRight	= {Vector2.new(1, 1),	Vector2.new(0, 0),	"rbxassetid://2911852219"},
}

cmdExample.Parent = nil
chatExample.Parent = nil
commandExample.Parent = nil
resizeFrame.Parent = nil

local rPlayer = Players:FindFirstChildWhichIsA("Player")
local coreGuiProtection = {}

pcall(function()
	for i, v in pairs(ScreenGui:GetDescendants()) do
		coreGuiProtection[v] = rPlayer.Name
	end
	ScreenGui.DescendantAdded:Connect(function(v)
		coreGuiProtection[v] = rPlayer.Name
	end)
	coreGuiProtection[ScreenGui] = rPlayer.Name
	 
	local meta = getrawmetatable(game)
	local tostr = meta.__tostring
	setreadonly(meta, false)
	meta.__tostring = newcclosure(function(t)
		if coreGuiProtection[t] and not checkcaller() then
			return coreGuiProtection[t]
		end
		return tostr(t)
	end)
end)
if not RunService:IsStudio() then
	local newGui = game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui")
	newGui.DescendantAdded:Connect(function(v)
		coreGuiProtection[v] = rPlayer.Name
	end)
	for i, v in pairs(ScreenGui:GetChildren()) do
		v.Parent = newGui
	end
	ScreenGui = newGui
end

--[[ GUI FUNCTIONS ]]--
gui = {}
gui.txtSize = function(ui, x, y)
	local textService = game:GetService("TextService")
	return textService:GetTextSize(ui.Text, ui.TextSize, ui.Font, Vector2.new(x, y))
end
gui.commands = function()
	if not commandsFrame.Visible then
		commandsFrame.Visible = true
		commandsList.CanvasSize = UDim2.new(0, 0, 0, 0)
	end
	for i, v in pairs(commandsList:GetChildren()) do
		if v:IsA("TextLabel") then
			Destroy(v)
		end
	end
	local i = 0
	for cmdName, tbl in pairs(Commands) do
		local Cmd = commandExample:Clone()
		Cmd.Parent = commandsList
		Cmd.Name = cmdName
		Cmd.Text = " " .. tbl[2][1]
		Cmd.MouseEnter:Connect(function()
			description.Visible = true
			description.Text = tbl[2][2]
		end)
		Cmd.MouseLeave:Connect(function()
			if description.Text == tbl[2][2] then
				description.Visible = false
				description.Text = ""
			end
		end)
		i = i + 1
	end
	commandsList.CanvasSize = UDim2.new(0, 0, 0, i*20+10)
	commandsFrame.Position = UDim2.new(0.5, -283/2, 0.5, -260/2)
end
gui.chatlogs = function()
	if not chatLogsFrame.Visible then
		chatLogsFrame.Visible = true
	end
	chatLogsFrame.Position = UDim2.new(0.5, -283/2+5, 0.5, -260/2+5)
end

gui.tween = function(obj, style, direction, duration, goal)
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle[style], Enum.EasingDirection[direction])
	local tween = TweenService:Create(obj, tweenInfo, goal)
	tween:Play()
	return tween
end
gui.mouseIn = function(guiObject, range)
	local pos1, pos2 = guiObject.AbsolutePosition, guiObject.AbsolutePosition + guiObject.AbsoluteSize
	local mX, mY = mouse.X, mouse.Y
	if mX > pos1.X-range and mX < pos2.X+range and mY > pos1.Y-range and mY < pos2.Y+range then
		return true
	end
	return false
end
gui.resizeable = function(ui, min, max)
	local rgui = resizeFrame:Clone()
	rgui.Parent = ui
	
	local mode
	local UIPos
	local lastSize
	local lastPos = Vector2.new()
	
	local function update(delta)
		local xy = resizeXY[(mode and mode.Name) or '']
		if not mode or not xy then return end
		local delta = (delta * xy[1]) or Vector2.new()
		local newSize = Vector2.new(lastSize.X + delta.X, lastSize.Y + delta.Y)
		newSize = Vector2.new(
			math.clamp(newSize.X, min.X, max.X),
			math.clamp(newSize.Y, min.Y, max.Y)
		)
		ui.Size = UDim2.new(0, newSize.X, 0, newSize.Y)
		ui.Position = UDim2.new(
			UIPos.X.Scale, 
			UIPos.X.Offset + (-(newSize.X - lastSize.X) * xy[2]).X, 
			UIPos.Y.Scale, 
			UIPos.Y.Offset + (delta * xy[2]).Y
		)
	end
	
	mouse.Move:Connect(function()
		update(Vector2.new(mouse.X, mouse.Y) - lastPos)
	end)
	
	for _, button in pairs(rgui:GetChildren()) do
		local isIn = false
		button.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				mode = button
				lastPos = Vector2.new(mouse.X, mouse.Y)
				lastSize = ui.AbsoluteSize
				UIPos = ui.Position
			end
		end)
		button.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				mode = nil
			end
		end)
		button.MouseEnter:Connect(function()
			mouse.Icon = resizeXY[button.Name][3]
		end)
		button.MouseLeave:Connect(function()
			if mouse.Icon == resizeXY[button.Name][3] then
				mouse.Icon = ""
			end
		end)
	end
end
gui.draggable = function(ui, dragui)
	if not dragui then dragui = ui end
	local UserInputService = game:GetService("UserInputService")
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		ui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	dragui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = ui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	dragui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
gui.menuify = function(menu)
	local exit = menu:FindFirstChild("Exit", true)
	local mini = menu:FindFirstChild("Minimize", true)
	local minimized = false
	local sizeX, sizeY = Instance.new("IntValue", menu), Instance.new("IntValue", menu)
	mini.MouseButton1Click:Connect(function()
		minimized = not minimized
		if minimized then
			sizeX.Value = menu.Size.X.Offset
			sizeY.Value = menu.Size.Y.Offset
			gui.tween(menu, "Quart", "Out", 0.5, {Size = UDim2.new(0, 200, 0, 25)})
		else
			gui.tween(menu, "Quart", "Out", 0.5, {Size = UDim2.new(0, sizeX.Value, 0, sizeY.Value)})
		end
	end)
	exit.MouseButton1Click:Connect(function()
		menu.Visible = false
	end)
	gui.draggable(menu, menu.Topbar)
	menu.Visible = false
end
gui.barSelect = function(speed)
	centerBar.Visible = true
	gui.tween(centerBar, "Sine", "Out", speed or 0.25, {Size = UDim2.new(0, 250, 1, 15)})
	gui.tween(leftFill, "Quad", "Out", speed or 0.3, {Position = UDim2.new(0, 0, 0.5, 0)})
	gui.tween(rightFill, "Quad", "Out", speed or 0.3, {Position = UDim2.new(1, 0, 0.5, 0)})
	gui.loadCommands()
end
gui.barDeselect = function(speed)
	gui.tween(centerBar, "Sine", "Out", speed or 0.25, {Size = UDim2.new(0, 250, 0, 0)})
	gui.tween(leftFill, "Sine", "In", speed or 0.3, {Position = UDim2.new(-0.5, 100, 0.5, 0)})
	gui.tween(rightFill, "Sine", "In", speed or 0.3, {Position = UDim2.new(1.5, -100, 0.5, 0)})
	for i, v in pairs(cmdAutofill:GetChildren()) do
		if v:IsA("Frame") then
			wrap(function()
				wait(math.random(1, 200)/2000)
				gui.tween(v, "Back", "In", 0.35, {Size = UDim2.new(0, 0, 0, 25)})
			end)
		end
	end
end
gui.loadCommands = function()
	for i, v in pairs(cmdAutofill:GetChildren()) do
		if v.Name ~= "UIListLayout" then
			Destroy(v)
		end
	end
	local last = nil
	local i = 0
	for name, tbl in pairs(Commands) do
		local info = tbl[2]
		local btn = cmdExample:Clone()
		btn.Parent = cmdAutofill
		btn.Name = name
		btn.Input.Text = info[1]
		i = i + 1
		
		local size = btn.Size
		btn.Size = UDim2.new(0, 0, 0, 25)
		btn.Size = size
	end
end
gui.searchCommands = function()
	local _1, _2, _3, _0 = {}, {}, {}, {}
	local str = cmdInput.Text:gmatch("[^ ;]+")()
	if str then str = str:lower() else str = "" end
	
	for i, v in pairs(cmdAutofill:GetChildren()) do
		if v:IsA("Frame") then
			local found = Commands[v.Name]
			if Commands[v.Name] then
				if str ~= "" and v.Name:find(str) == 1 then
					v.LayoutOrder = 1
					table.insert(_1, v)
				end
				if str ~= "" and v.Name:find(str) and v.LayoutOrder ~= 1 then
					v.LayoutOrder = 2
					table.insert(_2, v)
				end
				if str == "" or v.Name:find(str) == nil then
					v.LayoutOrder = 3
					table.insert(_3, v)
				end
			end
			for CmdName, tbl in pairs(Aliases) do
				if Commands[v.Name][1] == tbl[1] then
					if str ~= "" and CmdName:find(str) == 1 then
						v.LayoutOrder = 1
						table.insert(_1, v)
					end
					if str ~= "" and CmdName:find(str) then
						v.LayoutOrder = 2
						table.insert(_2, v)
					end
					if str == "" or CmdName:find(str) == nil then
						v.LayoutOrder = 3
						table.insert(_3, v)
					end
					break
				end
			end
		end
	end
	
	for i, v in pairs(_1) do if not lib.find(_0, v) then table.insert(_0, v) end end
	for i, v in pairs(_2) do if not lib.find(_0, v) then table.insert(_0, v) end end
	for i, v in pairs(_3) do if not lib.find(_0, v) then table.insert(_0, v) end end
	
	local last
	for i, v in pairs(_0) do
		local n = (i ^ -0.5) * 125
		if last then
			local pos = last.Value.Value
			local newPos = UDim2.new(0.5, 0, 0, pos + 25 + 3)
			gui.tween(v, "Quint", "Out", 0.3, {
				Size = UDim2.new(0.5, n, 0, 25)
			})
			v.Value.Value = newPos.Y.Offset
			v.LayoutOrder = i
		else
			gui.tween(v, "Quint", "Out", 0.3, {
				Size = UDim2.new(0.5, n, 0, 25)
			})
			v.Value.Value = 0
			v.LayoutOrder = i
		end
		last = v
	end
end

--[[ GUI FUNCTIONALITY ]]--
mouse.KeyDown:Connect(function(k)
	if k:lower() == opt.prefix then
		gui.barSelect()
		cmdInput.Text = ''
		cmdInput:CaptureFocus()
	end
end)

cmdInput.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		wrap(function()
			lib.parseCommand(opt.prefix .. cmdInput.Text)
		end)
	end
	gui.barDeselect()
end)

cmdInput.Changed:Connect(function(p)
	if p ~= "Text" then return end
	gui.searchCommands()
end)

gui.barDeselect(0)
cmdBar.Visible = true
gui.menuify(chatLogsFrame)
gui.menuify(commandsFrame)
gui.resizeable(chatLogsFrame, Vector2.new(173,58), Vector2.new(1000,1000))
gui.resizeable(commandsFrame, Vector2.new(184,84), Vector2.new(1000,1000))

commandsFilter.Changed:Connect(function(p)
	if p ~= "Text" then return end
	for i, v in pairs(commandsList:GetChildren()) do
		if v:IsA("TextLabel") then
			if v.Name:find(commandsFilter.Text:lower()) and v.Name:find(commandsFilter.Text:lower()) <= 2 then
				v.Visible = true
			else
				v.Visible = false
			end
		end
	end
end)

local function bindToChat(plr, msg)
	local chatMsg = chatExample:Clone()
	for i, v in pairs(chatLogs:GetChildren()) do
		if v:IsA("TextLabel") then
			v.LayoutOrder = v.LayoutOrder + 1
		end
	end
	chatMsg.Parent = chatLogs
	chatMsg.Text = ("[%s]: %s"):format(plr.Name, msg)
	
	local txtSize = gui.txtSize(chatMsg, chatMsg.AbsoluteSize.X, 100)
	chatMsg.Size = UDim2.new(1, -5, 0, txtSize.Y)
end

for i, plr in pairs(Players:GetPlayers()) do
	plr.Chatted:Connect(function(msg)
		bindToChat(plr, msg)
	end)
end
Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		bindToChat(plr, msg)
	end)
end)

mouse.Move:Connect(function()
	description.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
	local size = gui.txtSize(description, 200, 100)
	description.Size = UDim2.new(0, size.X, 0, size.Y)
end)

RunService.Stepped:Connect(function()
	chatLogs.CanvasSize = UDim2.new(0, 0, 0, chatLogs.UIListLayout.AbsoluteContentSize.Y)
	commandsList.CanvasSize = UDim2.new(0, 0, 0, commandsList.UIListLayout.AbsoluteContentSize.Y)
end)

function Destroy(guiObject)
	if not pcall(function()guiObject.Parent = game:GetService("CoreGui")end) then
		guiObject.Parent = nil
	end
end
