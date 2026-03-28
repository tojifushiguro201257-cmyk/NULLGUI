
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NULLGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- flotante "N"
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0,40,0,40)
toggle.Position = UDim2.new(0,10,0.5,-20)
toggle.BackgroundColor3 = Color3.new(0,0,0)
toggle.BorderColor3 = Color3.new(1,1,1)
toggle.BorderSizePixel = 1
toggle.Text = "N"
toggle.TextColor3 = Color3.new(1,1,1)
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 24
toggle.Parent = gui

local main = Instance.new("Frame")
main.Size = UDim2.new(0,640,0,320)
main.Position = UDim2.new(0.5,-320,0.5,-160)
main.BackgroundColor3 = Color3.new(0,0,0)
main.BorderColor3 = Color3.new(1,1,1)
main.BorderSizePixel = 1
main.Visible = false
main.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.BackgroundColor3 = Color3.new(0,0,0)
title.BorderColor3 = Color3.new(1,1,1)
title.BorderSizePixel = 1
title.Text = "NULLGUI"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = main

local scroll = Instance.new("ScrollingFrame")
scroll.Position = UDim2.new(0,6,0,36)
scroll.Size = UDim2.new(1,-12,1,-42)
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.ScrollBarImageTransparency = 1
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.Parent = main

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0,140,0,95)
grid.CellPadding = UDim2.new(0,12,0,12)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Left
grid.Parent = scroll

-- Función para crear slots
local function addScriptSlot(name, scriptUrl)
    local frame = Instance.new("Frame")
    frame.BackgroundColor3 = Color3.new(0,0,0)
    frame.BorderColor3 = Color3.new(1,1,1)
    frame.BorderSizePixel = 1
    frame.Parent = scroll

    local btn = Instance.new("TextButton")
    btn.Position = UDim2.new(0,3,0,3)
    btn.Size = UDim2.new(1,-6,1,-6)
    btn.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
    btn.BorderColor3 = Color3.new(0.8,0.8,0.8)
    btn.BorderSizePixel = 1
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.TextWrapped = true
    btn.Text = name
    btn.Parent = frame

    btn.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(scriptUrl, true))()
        end)
        if not success then
            warn("Error cargando script '" .. name .. "': " .. tostring(err))
        end
    end)
end

-- === LISTA DE SCRIPTS ===

addScriptSlot("PANEL OF THE VOID\", 
    "https://raw.githubusercontent.com/tojifushiguro201257-cmyk/PANEL-OF-THE-VOID/refs/heads/main/PANEL%20OF%20THE%20VOID.lua")

addScriptSlot("NULL VELOCITY GUI\n(Speed)", 
    "https://raw.githubusercontent.com/tojifushiguro201257-cmyk/NULL-VELOCITY-GUI-/refs/heads/main/NULL%20VELOCITY%20GUI.lua")

addScriptSlot("NULL FLY GUI V2")
 "https://raw.githubusercontent.com/tojifushiguro201257-cmyk/NULL-FLY-GUI-V2/refs/heads/main/NULL.lua")

addScriptSlot("Skybox of the Void\n(Emote/Sky fixed)", 
    "https://raw.githubusercontent.com/felipecardoso98625-ctrl/Skybox-of-the-void/refs/heads/main/Source.lua")

addScriptSlot("Bring Parts\n(Universal)", 
    "https://rawscripts.net/raw/Universal-Script-Bring-Parts-27586")

-- Toggle de visibilidad
toggle.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- Ajuste automático del canvas
grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0,0,0,grid.AbsoluteContentSize.Y + 20)
end)
