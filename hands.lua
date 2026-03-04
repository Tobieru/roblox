--// GASTER HANDS FULL FIXED VERSION

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Удаляем старый GUI если есть
if CoreGui:FindFirstChild("GasterHandsGUI") then
    CoreGui.GasterHandsGUI:Destroy()
end

local SelectedPlayer = nil

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GasterHandsGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Основное окно
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0,400,0,500)
MainFrame.Position = UDim2.new(0.5,-200,0.5,-250)
MainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
MainFrame.BorderColor3 = Color3.fromRGB(255,170,0)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundColor3 = Color3.fromRGB(35,35,35)
Title.Text = "GASTER HANDS"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Кнопка свернуть
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0,40,0,40)
MinBtn.Position = UDim2.new(1,-80,0,0)
MinBtn.Text = "-"
MinBtn.TextScaled = true
MinBtn.BackgroundColor3 = Color3.fromRGB(255,170,0)
MinBtn.Parent = Title

-- Кнопка закрыть
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0,40,0,40)
CloseBtn.Position = UDim2.new(1,-40,0,0)
CloseBtn.Text = "X"
CloseBtn.TextScaled = true
CloseBtn.BackgroundColor3 = Color3.fromRGB(255,50,50)
CloseBtn.Parent = Title

-- Мини окно
local MiniFrame = Instance.new("Frame")
MiniFrame.Size = UDim2.new(0,70,0,70)
MiniFrame.Position = UDim2.new(0,20,0.5,-35)
MiniFrame.BackgroundColor3 = Color3.fromRGB(255,170,0)
MiniFrame.Visible = false
MiniFrame.Active = true
MiniFrame.Draggable = true
MiniFrame.Parent = ScreenGui

local MiniText = Instance.new("TextLabel")
MiniText.Size = UDim2.new(1,0,1,0)
MiniText.Text = "GH"
MiniText.TextScaled = true
MiniText.BackgroundTransparency = 1
MiniText.Parent = MiniFrame

-- Сворачивание
local function Toggle()
    MainFrame.Visible = not MainFrame.Visible
    MiniFrame.Visible = not MiniFrame.Visible
end

MinBtn.MouseButton1Click:Connect(Toggle)
MiniFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Toggle()
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Вкладки
local TabsFrame = Instance.new("Frame")
TabsFrame.Size = UDim2.new(1,0,0,40)
TabsFrame.Position = UDim2.new(0,0,0,40)
TabsFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
TabsFrame.Parent = MainFrame

local TabNames = {"Chucambala","Other","Fun"}
local CurrentTab = nil
local TabFrames = {}

for i,name in ipairs(TabNames) do
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1/#TabNames,0,1,0)
    Btn.Position = UDim2.new((i-1)/#TabNames,0,0,0)
    Btn.Text = name
    Btn.TextScaled = true
    Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Btn.Parent = TabsFrame

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1,0,1,-80)
    Frame.Position = UDim2.new(0,0,0,80)
    Frame.Visible = false
    Frame.BackgroundTransparency = 1
    Frame.Parent = MainFrame

    TabFrames[name] = Frame

    Btn.MouseButton1Click:Connect(function()
        for _,f in pairs(TabFrames) do
            f.Visible = false
        end
        Frame.Visible = true
        CurrentTab = name
    end)
end

TabFrames["Chucambala"].Visible = true

-- Список игроков
local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Size = UDim2.new(1,-20,0,250)
PlayerList.Position = UDim2.new(0,10,0,10)
PlayerList.CanvasSize = UDim2.new(0,0,0,0)
PlayerList.ScrollBarThickness = 6
PlayerList.Parent = TabFrames["Chucambala"]

local Layout = Instance.new("UIListLayout")
Layout.Parent = PlayerList

local function UpdatePlayers()
    PlayerList:ClearAllChildren()
    Layout.Parent = PlayerList

    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local Btn = Instance.new("TextButton")
            Btn.Size = UDim2.new(1,-5,0,35)
            Btn.Text = plr.Name
            Btn.TextScaled = true
            Btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            Btn.Parent = PlayerList

            Btn.MouseButton1Click:Connect(function()
                SelectedPlayer = plr
            end)
        end
    end

    task.wait()
    PlayerList.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 5)
end

Players.PlayerAdded:Connect(UpdatePlayers)
Players.PlayerRemoving:Connect(UpdatePlayers)

UpdatePlayers()

-- Create Attachments
local CreateBtn = Instance.new("TextButton")
CreateBtn.Size = UDim2.new(1,-20,0,40)
CreateBtn.Position = UDim2.new(0,10,1,-50)
CreateBtn.Text = "Create Attachments"
CreateBtn.TextScaled = true
CreateBtn.BackgroundColor3 = Color3.fromRGB(255,170,0)
CreateBtn.Parent = TabFrames["Chucambala"]

CreateBtn.MouseButton1Click:Connect(function()
    if not SelectedPlayer then return end

    local Character = SelectedPlayer.Character
    if not Character then return end

    local Root = Character:FindFirstChild("HumanoidRootPart")
    if not Root then return end

    for i = 1,6 do
        local Part = Instance.new("Part")
        Part.Size = Vector3.new(2,2,2)
        Part.Shape = Enum.PartType.Ball
        Part.Material = Enum.Material.Neon
        Part.Color = Color3.fromRGB(255,255,255)
        Part.CanCollide = false
        Part.Anchored = false
        Part.Parent = workspace

        local Weld = Instance.new("WeldConstraint")
        Weld.Part0 = Part
        Weld.Part1 = Root
        Weld.Parent = Part

        Part.Position = Root.Position + Vector3.new(math.random(-5,5),math.random(2,6),math.random(-5,5))
    end
end)

print("Gaster Hands Loaded Successfully")