--[[
    GASTER HANDS GUI - ПОЛНОСТЬЮ РАБОЧАЯ ВЕРСИЯ
    - Исправлено: список игроков
    - Исправлено: кнопки создания
    - Исправлено: сворачивание/разворачивание
    - Исправлено: кнопка закрытия
]]

local player = game.Players.LocalPlayer
local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local touchEnabled = userInputService.TouchEnabled

-- Удаление старого GUI
local oldGui = coreGui:FindFirstChild("GasterHandsFixed")
if oldGui then
    oldGui:Destroy()
end

-- Создание GUI
local gui = Instance.new("ScreenGui")
gui.Name = "GasterHandsFixed"
gui.Parent = coreGui
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 100

-- =================== МИНИМИЗИРОВАННОЕ ОКНО ===================
local minimizedFrame = Instance.new("Frame")
minimizedFrame.Size = UDim2.new(0, 70, 0, 70)
minimizedFrame.Position = UDim2.new(0, 20, 0.5, -35)
minimizedFrame.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
minimizedFrame.BackgroundTransparency = 0.2
minimizedFrame.BorderSizePixel = 2
minimizedFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
minimizedFrame.Active = true
minimizedFrame.Draggable = true
minimizedFrame.Parent = gui
minimizedFrame.Visible = false
minimizedFrame.ZIndex = 10

-- Делаем круглым
local minimizedCorner = Instance.new("UICorner")
minimizedCorner.CornerRadius = UDim.new(0, 35)
minimizedCorner.Parent = minimizedFrame

-- Иконка
local minimizedIcon = Instance.new("TextLabel")
minimizedIcon.Size = UDim2.new(1, 0, 1, 0)
minimizedIcon.BackgroundTransparency = 1
minimizedIcon.Text = "👐"
minimizedIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizedIcon.TextScaled = true
minimizedIcon.Font = Enum.Font.GothamBold
minimizedIcon.Parent = minimizedFrame

-- =================== РАЗВЕРНУТОЕ ОКНО ===================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 500)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui
mainFrame.ClipsDescendants = true
mainFrame.ZIndex = 20

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

-- Заголовок
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
titleBar.Parent = mainFrame
titleBar.ZIndex = 21

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 12)
titleBarCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -80, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "GASTER HANDS"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar
titleLabel.ZIndex = 22

-- Кнопка свернуть
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
minimizeBtn.Position = UDim2.new(1, -80, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
minimizeBtn.Text = "−"
minimizeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
minimizeBtn.TextScaled = true
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = titleBar
minimizeBtn.ZIndex = 22

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 8)
minimizeCorner.Parent = minimizeBtn

-- Кнопка закрыть
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar
closeBtn.ZIndex = 22

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

-- Функция сворачивания/разворачивания
local function toggleMinimize()
    if mainFrame.Visible then
        mainFrame.Visible = false
        minimizedFrame.Visible = true
    else
        mainFrame.Visible = true
        minimizedFrame.Visible = false
    end
end

minimizeBtn.MouseButton1Click:Connect(toggleMinimize)
minimizedFrame.MouseButton1Click:Connect(toggleMinimize)

-- Кнопка закрытия
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Панель вкладок
local tabPanel = Instance.new("Frame")
tabPanel.Size = UDim2.new(1, -20, 0, 45)
tabPanel.Position = UDim2.new(0, 10, 0, 50)
tabPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
tabPanel.Parent = mainFrame
tabPanel.ZIndex = 21

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 8)
tabCorner.Parent = tabPanel

-- Вкладки
local function createTabButton(name, pos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.33, -5, 0, 30)
    btn.Position = UDim2.new(pos, 0, 0, 7)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = tabPanel
    btn.ZIndex = 22
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    return btn
end

local tab1 = createTabButton("НАБОР 1 (7)", 0)
local tab2 = createTabButton("НАБОР 2 (6)", 0.335)
local tab3 = createTabButton("НАБОР 3 (6)", 0.67)

-- Контейнер для контента
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 0, 380)
contentFrame.Position = UDim2.new(0, 10, 0, 100)
contentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
contentFrame.Parent = mainFrame
contentFrame.ZIndex = 21

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentFrame

local currentContent = nil

-- Функция очистки контента
local function clearContent()
    if currentContent then
        currentContent:Destroy()
        currentContent = nil
    end
end

-- Функция создания кнопки игрока
local function createPlayerButton(playerObj, parent, yPos, isSelected)
    local character = playerObj.Character
    local hasRoot = character and character:FindFirstChild("HumanoidRootPart")
    local statusColor = hasRoot and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    
    local btn = Instance.new("TextButton")
    btn.Name = "PlayerBtn_" .. playerObj.Name
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = isSelected and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(60, 60, 60)
    btn.Text = playerObj.Name .. (hasRoot and " ✓" or " ✗")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.BorderSizePixel = 2
    btn.BorderColor3 = statusColor
    btn.Parent = parent
    btn.ZIndex = 25
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    return btn
end

-- Функция создания вкладки
local function createTab(attachmentsCount, attachmentsData, tabName)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 1, -20)
    container.Position = UDim2.new(0, 10, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = contentFrame
    container.ZIndex = 25
    
    -- Заголовок
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = tabName .. " (" .. attachmentsCount .. " аттачментов)"
    title.TextColor3 = Color3.fromRGB(255, 170, 0)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.Parent = container
    title.ZIndex = 26
    
    -- Скролл для игроков
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 0, 220)
    scrollFrame.Position = UDim2.new(0, 0, 0, 35)
    scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    scrollFrame.BorderSizePixel = 1
    scrollFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = 8
    scrollFrame.Parent = container
    scrollFrame.ZIndex = 26
    
    -- Выбранный игрок
    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.Size = UDim2.new(1, 0, 0, 25)
    selectedLabel.Position = UDim2.new(0, 0, 0, 260)
    selectedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    selectedLabel.Text = "Выбран: никто"
    selectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectedLabel.TextScaled = true
    selectedLabel.Font = Enum.Font.Gotham
    selectedLabel.Parent = container
    selectedLabel.ZIndex = 26
    
    -- Кнопка создания
    local createBtn = Instance.new("TextButton")
    createBtn.Size = UDim2.new(1, 0, 0, 45)
    createBtn.Position = UDim2.new(0, 0, 0, 290)
    createBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    createBtn.Text = "СОЗДАТЬ АТТАЧМЕНТЫ (" .. attachmentsCount .. " шт)"
    createBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    createBtn.TextScaled = true
    createBtn.Font = Enum.Font.GothamBold
    createBtn.Parent = container
    createBtn.ZIndex = 26
    
    local createBtnCorner = Instance.new("UICorner")
    createBtnCorner.CornerRadius = UDim.new(0, 8)
    createBtnCorner.Parent = createBtn
    
    local selectedPlayer = nil
    local playerButtons = {}
    
    -- Функция обновления списка игроков
    local function updatePlayerList()
        -- Очищаем старые кнопки
        for _, btn in pairs(playerButtons) do
            if btn and btn.Parent then
                btn:Destroy()
            end
        end
        playerButtons = {}
        
        local y = 5
        local playerList = game.Players:GetPlayers()
        table.sort(playerList, function(a, b)
            return a.Name < b.Name
        end)
        
        -- Создаем новые кнопки
        for _, plr in ipairs(playerList) do
            local btn = createPlayerButton(plr, scrollFrame, y, plr == selectedPlayer)
            
            btn.MouseButton1Click:Connect(function()
                selectedPlayer = plr
                selectedLabel.Text = "Выбран: " .. plr.Name
                
                -- Обновляем цвета всех кнопок
                for _, b in pairs(playerButtons) do
                    if b then
                        b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    end
                end
                btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
            end)
            
            playerButtons[plr] = btn
            y = y + 40
        end
        
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, y)
    end
    
    -- Функция применения аттачментов
    local function applyAttachments(attachments)
        local character = player.Character
        if not character then
            print("Ошибка: У вас нет персонажа!")
            return false
        end
        
        local gasterHands = character:FindFirstChild("GasterHands")
        if not gasterHands then
            print("Ошибка: Модель GasterHands не найдена!")
            return false
        end
        
        local applied = 0
        local index = 1
        
        for _, child in ipairs(gasterHands:GetChildren()) do
            if child:IsA("Model") and string.find(child.Name, "Hand") then
                local handRoot = child:FindFirstChild("HumanoidRootPart")
                if handRoot then
                    local mainAttach = handRoot:FindFirstChild("MainAttach")
                    if mainAttach then
                        local alignOri = mainAttach:FindFirstChild("AlignOrientation")
                        local alignPos = mainAttach:FindFirstChild("AlignPosition")
                        
                        if alignOri and attachments[index] then
                                            alignOri.Attachment1 = attachments[index]
                            applied = applied + 1
                        end
                        if alignPos and attachments[index] then
                            alignPos.Attachment1 = attachments[index]
                        end
                    end
                end
                index = index + 1
            end
        end
        
        print("Применено аттачментов: " .. applied .. " из " .. #attachments)
        return applied > 0
    end
    
    -- Обработчик кнопки создания
    createBtn.MouseButton1Click:Connect(function()
        if not selectedPlayer then
            print("Ошибка: Сначала выберите игрока!")
            return
        end
        
        local targetChar = selectedPlayer.Character
        if not targetChar then
            print("Ошибка: У выбранного игрока нет персонажа!")
            return
        end
        
        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot then
            print("Ошибка: У персонажа нет HumanoidRootPart!")
            return
        end
        
        -- Удаляем старую папку
        local attachFolder = targetRoot:FindFirstChild("AttachmentsFolder")
        if attachFolder then
            attachFolder:Destroy()
        end
        
        -- Создаем новую папку
        attachFolder = Instance.new("Folder")
        attachFolder.Name = "AttachmentsFolder"
        attachFolder.Parent = targetRoot
        
        -- Создаем аттачменты
        local attachments = {}
        for i, cframe in ipairs(attachmentsData) do
            local attach = Instance.new("Attachment")
            attach.Name = "Attach" .. i
            attach.CFrame = cframe
            attach.Parent = attachFolder
            attachments[i] = attach
        end
        
        print("Создано " .. attachmentsCount .. " аттачментов для игрока: " .. selectedPlayer.Name)
        applyAttachments(attachments)
    end)
    
    -- Обновляем список при добавлении/удалении игроков
    game.Players.PlayerAdded:Connect(updatePlayerList)
    game.Players.PlayerRemoving:Connect(updatePlayerList)
    
    -- Первоначальное заполнение
    updatePlayerList()
    
    return container
end

-- Данные для аттачментов
local attachmentsData = {
    [1] = {
        CFrame.new(0, -1, 1),
        CFrame.new(0, -1, 2),
        CFrame.new(0, -1, 3),
        CFrame.new(0, -1, 4),
        CFrame.new(0, -1, 5),
        CFrame.new(1, -1, 5),
        CFrame.new(-1, -1, 5)
    },
    [2] = {
        CFrame.new(0, 1, 1),
        CFrame.new(0, -1, 1),
        CFrame.new(1, 0, 1),
        CFrame.new(-1, 0, 1),
        CFrame.new(0, 2, 1),
        CFrame.new(0, -2, 1)
    },
    [3] = {
        CFrame.new(-2, 0, 1),
        CFrame.new(2, 0, 1),
        CFrame.new(2, -1, 1),
        CFrame.new(-2, 1, 1),
        CFrame.new(1, 2, 1),
        CFrame.new(-1, -2, 1)
    }
}

-- Переключение вкладок
local function switchTab(index)
    -- Сбрасываем цвета всех вкладок
    tab1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab3.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    clearContent()
    
    if index == 1 then
        tab1.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        tab1.TextColor3 = Color3.fromRGB(0, 0, 0)
        currentContent = createTab(7, attachmentsData[1], "НАБОР 1")
    elseif index == 2 then
        tab2.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        tab2.TextColor3 = Color3.fromRGB(0, 0, 0)
        currentContent = createTab(6, attachmentsData[2], "НАБОР 2")
    elseif index == 3 then
        tab3.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        tab3.TextColor3 = Color3.fromRGB(0, 0, 0)
        currentContent = createTab(6, attachmentsData[3], "НАБОР 3")
    end
end

-- Подключаем кнопки вкладок
tab1.MouseButton1Click:Connect(function() switchTab(1) end)
tab2.MouseButton1Click:Connect(function() switchTab(2) end)
tab3.MouseButton1Click:Connect(function() switchTab(3) end)

-- Запускаем первую вкладку
switchTab(1)

-- Для мобильных устройств
if touchEnabled then
    mainFrame.Position = UDim2.new(0.5, -175, 0.1, 0)
    minimizedFrame.Position = UDim2.new(0, 10, 0.5, -35)
end

print("✅ Gaster Hands GUI загружен! Нажмите на оранжевую иконку с руками чтобы развернуть/свернуть.")