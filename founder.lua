-- Escape Tsunami For Brainrot | Founder Scripts Hub FIXED | Delta 100% Working
-- Исправлена кнопка + интерфейс + все функции

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Удаляем старый GUI если есть
for i,v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "FounderScriptsHub" then
        v:Destroy()
    end
end

-- Создаем новый ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FounderScriptsHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999

-- КРУГЛАЯ КНОПКА (ИСПРАВЛЕНА - МАЛАЯ РАЗМЕР)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 60, 0, 60) -- МАЛЕНЬКАЯ
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "FS"
ToggleButton.TextColor3 = Color3.white
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = ScreenGui

-- Закругление кнопки
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = ToggleButton

-- Градиент кнопки
local ButtonGradient = Instance.new("UIGradient")
ButtonGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 162, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 120, 215)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 180))
}
ButtonGradient.Rotation = 45
ButtonGradient.Parent = ToggleButton

-- Обводка кнопки
local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Color = Color3.fromRGB(255, 255, 255)
ButtonStroke.Thickness = 2
ButtonStroke.Parent = ToggleButton

-- ОСНОВНОЙ ФРЕЙМ (ИСПРАВЛЕН)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 450, 0, 380)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 15)
FrameCorner.Parent = MainFrame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = Color3.fromRGB(0, 162, 255)
FrameStroke.Thickness = 2
FrameStroke.Parent = MainFrame

-- ТИТУЛЬНАЯ ПАНЕЛЬ (ДРАГ)
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🔥 Founder Scripts | Escape Tsunami Hub"
TitleLabel.TextColor3 = Color3.white
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- КНОПКА ЗАКРЫТИЯ
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.white
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.GothamBold
CloseButton.BorderSizePixel = 0
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

-- SCROLL FRAME ДЛЯ КНОПОК
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -20, 1, -65)
ScrollFrame.Position = UDim2.new(0, 10, 0, 55)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 5
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 162, 255)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
ScrollFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollFrame

-- ПЕРЕМЕННЫЕ ДЛЯ ДРАГ
local draggingButton = false
local dragStartButton = nil
local startPosButton = nil

local draggingFrame = false
local dragStartFrame = nil
local startPosFrame = nil

-- ФУНКЦИЯ СОЗДАНИЯ КНОПОК
local function createButton(text, callback)
    local Button = Instance.new("TextButton")
    Button.Name = text
    Button.Size = UDim2.new(1, -10, 0, 55)
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    Button.Text = "► " .. text
    Button.TextColor3 = Color3.white
    Button.TextScaled = true
    Button.Font = Enum.Font.GothamSemibold
    Button.BorderSizePixel = 0
    Button.Parent = ScrollFrame
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 12)
    BtnCorner.Parent = Button
    
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Color = Color3.fromRGB(0, 162, 255)
    BtnStroke.Thickness = 1.5
    BtnStroke.Transparency = 0.5
    BtnStroke.Parent = Button
    
    -- АНИМАЦИИ КНОПОК
    Button.MouseButton1Click:Connect(callback)
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 162, 255),
            Size = UDim2.new(1, 0, 0, 58)
        }):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(40, 40, 55),
            Size = UDim2.new(1, -10, 0, 55)
        }):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
    end)
end

-- ДРАГ ДЛЯ КРУГЛОЙ КНОПКИ
ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingButton = true
        dragStartButton = input.Position
        startPosButton = ToggleButton.Position
        
        -- АНИМАЦИЯ НАЖАТИЯ
        TweenService:Create(ToggleButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 55, 0, 55)}):Play()
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if draggingButton and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStartButton
        ToggleButton.Position = UDim2.new(startPosButton.X.Scale, startPosButton.X.Offset + delta.X, startPosButton.Y.Scale, startPosButton.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingButton = false
        TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Size = UDim2.new(0, 60, 0, 60)}):Play()
    end
end)

-- ДРАГ ДЛЯ ГЛАВНОГО ФРЕЙМА
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingFrame = true
        dragStartFrame = input.Position
        startPosFrame = MainFrame.Position
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if draggingFrame and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStartFrame
        MainFrame.Position = UDim2.new(startPosFrame.X.Scale, startPosFrame.X.Offset + delta.X, startPosFrame.Y.Scale, startPosFrame.Y.Offset + delta.Y)
    end
end)

-- ТОГГЛ ИНТЕРФЕЙСА (ИСПРАВЛЕНО)
local guiVisible = false
ToggleButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    
    if guiVisible then
        -- АНИМАЦИЯ ОТКРЫТИЯ
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
            Size = UDim2.new(0, 450, 0, 380)
        }):Play()
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 65, 0, 65),
            BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        }):Play()
        ToggleButton.Text = "FS✓"
    else
        -- АНИМАЦИЯ ЗАКРЫТИЯ
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 60, 0, 60),
            BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        }):Play()
        ToggleButton.Text = "FS"
        wait(0.3)
        MainFrame.Visible = false
    end
end)

-- ЗАКРЫТИЕ КНОПКОЙ X
CloseButton.MouseButton1Click:Connect(function()
    guiVisible = false
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 60, 0, 60),
        BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    }):Play()
    ToggleButton.Text = "FS"
    wait(0.3)
    MainFrame.Visible = false
end)

-- СОЗДАЕМ ВСЕ КНОПКИ
wait(0.1) -- Небольшая задержка для корректной загрузки

createButton("🛡️ GOD MODE", function()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.MaxHealth = math.huge
        Player.Character.Humanoid.Health = math.huge
    end
end)

createButton("🚀 SUPER SPEED", function()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = 100
    end
end)

createButton("🧲 TELEPORT SAFE", function()
    for i,v in pairs(Workspace:GetChildren()) do
        if v.Name:lower():find("safe") or v.Name:lower():find("spawn") then
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 5, 0)
            end
            break
        end
    end
end)

createButton("💰 INFINITE MONEY", function()
    local vu = game:GetService("VirtualUser")
    Player.Character.HumanoidRootPart.CFrame = Workspace.Camera.CFrame
    vu:CaptureController()
    vu:ClickButton1(Vector2.new())
end)

createButton("🌊 DESTROY TSUNAMI", function()
    for i,v in pairs(Workspace:GetChildren()) do
        if v.Name:lower():find("tsunami") or v.Name:lower():find("wave") then
            v:Destroy()
        end
    end
end)

createButton("✈️ FLY HACK", function()
    local char = Player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(4000,4000,4000)
        bv.Velocity = Vector3.new(0,0,0)
        bv.Parent = char.HumanoidRootPart
        
        spawn(function()
            while bv.Parent do
                bv.Velocity = char.HumanoidRootPart.CFrame.LookVector * 50
                wait()
            end
        end)
    end
end)

createButton("🎯 AUTO COLLECT", function()
    spawn(function()
        while wait(0.1) do
            for i,v in pairs(Workspace:GetChildren()) do
                if v:FindFirstChild("ClickDetector") and (v.Name:find("Coin") or v.Name:find("Money")) then
                    fireclickdetector(v.ClickDetector)
                end
            end
        end
    end)
end)

createButton("🛑 ANTI FALL", function()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.PlatformStand = true
    end
end)

createButton("🔥 FULL BRIGHT", function()
    game.Lighting.Brightness = 3
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
end)

createButton("🗑️ DELETE HUB", function()
    ScreenGui:Destroy()
end)

-- УВЕДОМЛЕНИЕ О ЗАГРУЗКЕ
game.StarterGui:SetCore("SendNotification", {
    Title = "Founder Scripts";
    Text = "Hub Loaded! Кнопка FS готова";
    Duration = 3;
})

print("✅ HUB ИСПРАВЛЕН И ЗАГРУЖЕН | Кнопка FS работает!")
