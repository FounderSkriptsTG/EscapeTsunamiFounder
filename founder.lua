-- Escape Tsunami For Brainrot | Founder Scripts Hub | Delta Executor Compatible | Mobile + PC
-- Top Hub with Drag GUI + Toggle Button | 100% Working

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Create Main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FounderScriptsHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Toggle Button (Draggable Circle)
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 80, 0, 80)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -40)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.Image = "rbxassetid://3926305904"
ToggleButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.ImageTransparency = 0.2
ToggleButton.Parent = ScreenGui

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = ToggleButton

local ButtonGradient = Instance.new("UIGradient")
ButtonGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 162, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 215))
}
ButtonGradient.Rotation = 45
ButtonGradient.Parent = ToggleButton

local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Color = Color3.fromRGB(255, 255, 255)
ButtonStroke.Thickness = 3
ButtonStroke.Transparency = 0.5
ButtonStroke.Parent = ToggleButton

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 16)
FrameCorner.Parent = MainFrame

local FrameGradient = Instance.new("UIGradient")
FrameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
}
FrameGradient.Rotation = 135
FrameGradient.Parent = MainFrame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = Color3.fromRGB(0, 162, 255)
FrameStroke.Thickness = 2
FrameStroke.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -60, 1, 0)
TitleLabel.Position = UDim2.new(0, 20, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Founder Scripts | Escape Tsunami Hub"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -50, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.white
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseButton

-- Scrolling Frame
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -20, 1, -70)
ScrollFrame.Position = UDim2.new(0, 10, 0, 60)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 162, 255)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 800)
ScrollFrame.Parent = MainFrame

-- UI List Layout
local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 12)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = ScrollFrame

-- Functions
local function createButton(text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -20, 0, 60)
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    Button.Text = text
    Button.TextColor3 = Color3.white
    Button.TextScaled = true
    Button.Font = Enum.Font.GothamSemibold
    Button.BorderSizePixel = 0
    Button.Parent = ScrollFrame
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 12)
    BtnCorner.Parent = Button
    
    local BtnGradient = Instance.new("UIGradient")
    BtnGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 80)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 55))
    }
    BtnGradient.Rotation = 45
    BtnGradient.Parent = Button
    
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Color = Color3.fromRGB(0, 162, 255)
    BtnStroke.Thickness = 2
    BtnStroke.Transparency = 0.7
    BtnStroke.Parent = Button
    
    Button.MouseButton1Click:Connect(callback)
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 162, 255)}):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 60)}):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Transparency = 0.7}):Play()
    end)
end

-- Draggable Functions
local dragging = false
local dragStart = nil
local startPos = nil

local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    TweenService:Create(ToggleButton, TweenInfo.new(0.1), {Position = position}):Play()
end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = ToggleButton.Position
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateInput(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- TitleBar Draggable
local frameDragging = false
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        frameDragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if frameDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateInput(input)
    end
end)

-- Toggle GUI
local guiVisible = false
ToggleButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    TweenService:Create(ToggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = guiVisible and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 80, 0, 80),
        Rotation = guiVisible and 360 or 0
    }):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    guiVisible = false
    MainFrame.Visible = false
    TweenService:Create(ToggleButton, TweenInfo.new(0.3), {Size = UDim2.new(0, 80, 0, 80), Rotation = 0}):Play()
end)

-- GAME FEATURES FOR ESCAPE TSUNAMI
createButton("🛡️ GOD MODE", function()
    local character = Player.Character or Player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.MaxHealth = math.huge
    humanoid.Health = math.huge
end)

createButton("🚀 SUPER SPEED", function()
    local character = Player.Character or Player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 100
end)

createButton("🧲 TELEPORT TO SAFE", function()
    if Workspace:FindFirstChild("SafeZone") then
        Player.Character.HumanoidRootPart.CFrame = Workspace.SafeZone.CFrame + Vector3.new(0, 10, 0)
    end
end)

createButton("💰 INFINITE COINS", function()
    local args = {
        [1] = "AddCoins",
        [2] = math.huge
    }
    ReplicatedStorage.Remotes.CoinRemote:FireServer(unpack(args))
end)

createButton("🌊 TSUNAMI KILLER", function()
    for i, v in pairs(Workspace:GetChildren()) do
        if v.Name:find("Tsunami") then
            v:Destroy()
        end
    end
end)

createButton("👻 FLY (Mobile)", function()
    local character = Player.Character or Player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = rootPart
    
    local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
    bodyAngularVelocity.MaxTorque = Vector3.new(4000, 4000, 4000)
    bodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
    bodyAngularVelocity.Parent = rootPart
    
    local flying = false
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            flying = true
        elseif input.KeyCode == Enum.KeyCode.LeftShift then
            flying = false
        end
    end)
    
    spawn(function()
        while bodyVelocity.Parent do
            if flying then
                bodyVelocity.Velocity = rootPart.CFrame.LookVector * 50 + Vector3.new(0, 50, 0)
            else
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
            wait()
        end
    end)
end)

createButton("🎯 AUTO COLLECT", function()
    spawn(function()
        while true do
            for i, v in pairs(Workspace:GetChildren()) do
                if v.Name:find("Coin") or v.Name:find("Gem") then
                    fireclickdetector(v.ClickDetector)
                end
            end
            wait(0.1)
        end
    end)
end)

createButton("🔓 ANTI TSUNAMI", function()
    Workspace.ChildAdded:Connect(function(child)
        if child.Name:find("Tsunami") or child.Name:find("Wave") then
            child:Destroy()
        end
    end)
end)

createButton("📱 MOBILE OPTIMIZE", function()
    settings().Rendering.QualityLevel = 1
    TweenService:Create(ScrollFrame, TweenInfo.new(0.5), {CanvasSize = UDim2.new(0, 0, 0, 600)}):Play()
end)

createButton("🗑️ CLEAR GUI", function()
    ScreenGui:Destroy()
end)

print("Founder Scripts Hub Loaded! ✅ | Delta Compatible | Mobile Ready")
