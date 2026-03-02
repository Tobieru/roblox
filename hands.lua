--[[
    GASTER HANDS GUI - МОБИЛЬНАЯ ВЕРСИЯ (ИСПРАВЛЕННАЯ)
    - Исправлено отображение списка игроков
    - Добавлены кнопки создания
    - Исправлено сворачивание/разворачивание
]]

local player = game.Players.LocalPlayer
local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local touchEnabled = userInputService.TouchEnabled

-- Удаление старого GUI
local oldGui = coreGui:FindFirstChild("GasterHandsMobile")
if oldGui then
    oldGui:Destroy()
end

-- Создание основного GUI
local gui = Instance.new("ScreenGui")
gui.Name = "GasterHandsMobile"
gui.Parent = coreGui
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 100

-- =================== МИНИМИЗИРОВАННОЕ ОКНО ===================
local minimizedFrame = Instance.new("Frame")
minimizedFrame.Size = UDim2.new(0, 70, 0, 70)  -- Чуть больше для удобства
minimizedFrame.Position = UDim2.new(0, 20, 0.5, -35)
minimizedFrame.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
minimizedFrame.BorderSizePixel = 2
minimizedFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
minimizedFrame.Active = true
minimizedFrame.Draggable = true
minimizedFrame.Parent = gui
minimizedFrame.Visible = false
minimizedFrame.ZIndex = 10

local minimizedCorner = Instance.new("UICorner")
minimizedCorner.CornerRadius = UDim.new(0, 35)  -- Полностью круглое
minimizedCorner.Parent = minimizedFrame

local minimizedIcon = Instance.new("TextLabel")
minimizedIcon.Size = UDim2.new(1, 0, 1, 0)
minimizedIcon.BackgroundTransparency = 1
minimizedIcon.Text = "👐"
minimizedIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizedIcon.Font = Enum.Font.GothamBold
minimizedIcon.TextSize = 40
minimizedIcon.Parent = minimizedFrame

-- =================== РАЗВЕРНУТОЕ ОКНО ===================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 340, 0, 480)  -- Немного увеличил
mainFrame.Position = UDim2.new(0.5, -170, 0.5, -240)
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
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "Gaster Hands"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar
titleLabel.ZIndex = 22

-- Кнопка свернуть
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 35, 0, 35)
minimizeButton.Position = UDim2.new(1, -80, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
minimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
minimizeButton.Text = "−"
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 24
minimizeButton.Parent = titleBar
minimizeButton.ZIndex = 22

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 8)
minimizeCorner.Parent = minimizeButton

-- Кнопка закрыть
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, -40, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 20
closeButton.Parent = titleBar
closeButton.ZIndex = 22

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

-- Панель вкладок
local tabPanel = Instance.new("Frame")
tabPanel.Size = UDim2.new(1, -20, 0, 40)
tabPanel.Position = UDim2.new(0, 10, 0, 50)
tabPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
tabPanel.Parent = mainFrame
tabPanel.ZIndex = 21

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 8)
tabCorner.Parent = tabPanel

-- Вкладки
local tab1 = Instance.new("TextButton")
tab1.Size = UDim2.new(0.33, -5, 0, 30)
tab1.Position = UDim2.new(0, 5, 0, 5)
tab1.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
tab1.TextColor3 = Color3.fromRGB(0, 0, 0)
tab1.Text = "7 шт"
tab1.Font = Enum.Font.GothamBold
tab1.TextSize = 14
tab1.Parent = tabPanel
tab1.ZIndex = 22

local tab1Corner = Instance.new("UICorner")
tab1Corner.CornerRadius = UDim.new(0, 6)
tab1Corner.Parent = tab1

local tab2 = Instance.new("TextButton")
tab2.Size = UDim2.new(0.33, -5, 0, 30)
tab2.Position = UDim2.new(0.335, 0, 0, 5)
tab2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
tab2.Text = "6 шт А"
tab2.Font = Enum.Font.GothamBold
tab2.TextSize = 14
tab2.Parent = tabPanel
tab2.ZIndex = 22

local tab2Corner = Instance.new("UICorner")
tab2Corner.CornerRadius = UDim.new(0, 6)
tab2Corner.Parent = tab2

local tab3 = Instance.new("TextButton")
tab3.Size = UDim2.new(0.33, -5, 0, 30)
tab3.Position = UDim2.new(0.67, 0, 0, 5)
tab3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tab3.TextColor3 = Color3.fromRGB(255, 255, 255)
tab3.Text = "6 шт Б"
tab3.Font = Enum.Font.GothamBold
tab3.TextSize = 14
tab3.Parent = tabPanel
tab3.ZIndex = 22

local tab3Corner = Instance.new("UICorner")
tab3Corner.CornerRadius = UDim.new(0, 6)
tab3Corner.Parent = tab3

-- Контейнер для контента
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 0, 360)
contentFrame.Position = UDim2.new(0, 10, 0, 95)
contentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
contentFrame.Parent = mainFrame
contentFrame.ZIndex = 21

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentFrame

local currentContent = nil
local connections = {}

-- Функция очистки контента
local function clearContent()
    if currentContent then
        currentContent:Destroy()
        currentContent = nil
    end
    for _, conn in ipairs(connections) do
        conn:Disconnect()
    end
    connections = {}
end

-- Функция переключения окон (свернуть/развернуть) - ИСПРАВЛЕНО
local function toggleMinimize()
    if mainFrame.Visible then
        -- Сворачиваем
        mainFrame.Visible = false
        minimizedFrame.Visible = true
    else
        -- Разворачиваем
        mainFrame.Visible = true
        minimizedFrame.Visible = false
    end
end

minimizeButton.MouseButton1Click:Connect(toggleMinimize)
minimizedFrame.MouseButton1Click:Connect(toggleMinimize)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Функция создания кнопки игрока
local function createPlayerButton(playerObj, parent, yPos, isSelected)
    local character = playerObj.Character
    local hasRoot = character and character:FindFirstChild("HumanoidRootPart")
    local statusColor = hasRoot and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)  -- Увеличил высоту
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = isSelected and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = playerObj.Name .. (hasRoot and " ✓" or " ✗")
    btn.Font = Enum.Font.Gotham
    btn.TextSize = touchEnabled and 14 or 16
    btn.BorderSizePixel = 2
    btn.BorderColor3 = statusColor
    btn.Parent = parent
    btn.ZIndex = 25
    
    -- Добавляем скругление углов
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    return btn
end

-- Функция создания вкладки 1 (7 шт)
local function createTab1()
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 1, -20)
    container.Position = UDim2.new(0, 10, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = contentFrame
    container.ZIndex = 25

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 170, 0)
    title.Text = "Набор 1 (7 аттачментов)"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.Parent = container
    title.ZIndex = 26

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 0, 220)  -- Увеличил
    scrollFrame.Position = UDim2.new(0, 0, 0, 35)
    scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    scrollFrame.BorderSizePixel = 1
    scrollFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = touchEnabled and 6 or 8
    scrollFrame.Parent = container
    scrollFrame.ZIndex = 26

    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.Size = UDim2.new(1, 0, 0, 25)
    selectedLabel.Position = UDim2.new(0, 0, 0, 260)
    selectedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    selectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectedLabel.Text = "Выбран: никто"
    selectedLabel.Font = Enum.Font.Gotham
    selectedLabel.TextSize = 14
    selectedLabel.Parent = container
    selectedLabel.ZIndex = 26

    -- КНОПКА СОЗДАНИЯ - ДОБАВЛЕНА
    local createButton = Instance.new("TextButton")
    createButton.Size = UDim2.new(1, 0, 0, 45)
    createButton.Position = UDim2.new(0, 0, 0, 290)
    createButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    createButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    createButton.Text = "СОЗДАТЬ АТТАЧМЕНТЫ (7 шт)"
    createButton.Font = Enum.Font.GothamBold
    createButton.TextSize = touchEnabled and 14 or 16
    createButton.Parent = container
    createButton.ZIndex = 26

    local createButtonCorner = Instance.new("UICorner")
    createButtonCorner.CornerRadius = UDim.new(0, 8)
    createButtonCorner.Parent = createButton

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

        local y = 5  -- Отступ сверху
        local playerList = game.Players:GetPlayers()
        table.sort(playerList, function(a, b)
            return a.Name < b.Name
        end)

        -- Добавляем кнопку для каждого игрока
        for _, plr in ipairs(playerList) do
            local btn = createPlayerButton(plr, scrollFrame, y, plr == selectedPlayer)
            btn.MouseButton1Click:Connect(function()
                selectedPlayer = plr
                selectedLabel.Text = "Выбран: " .. plr.Name
                -- Обновляем цвета всех кнопок
                for _, b in pairs(playerButtons) do
                    b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                end
                btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
            end)
            playerButtons[plr] = btn
            y = y + 40  -- Отступ между кнопками
        end

        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, y + 5)
    end

    -- Функция применения аттачментов
    local function applyAttachments(attachments)
        local character = player.Character
        if not character then
            print("У вас нет персонажа!")
            return false
        end

        local gasterHands = character:FindFirstChild("GasterHands")
        if not gasterHands then
            print("Модель GasterHands не найдена!")
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
                        end
                        if alignPos and attachments[index] then
                            alignPos.Attachment1 = attachments[index]
                        end

                        if alignOri or alignPos then
                            applied = applied + 1
                        end
                    end
                end
                index = index + 1
            end
        end

        print("Применено аттачментов: " .. applied)
        return applied > 0
    end

    -- Обработчик кнопки создания
    createButton.MouseButton1Click:Connect(function()
        if not selectedPlayer then
            print("Сначала выберите игрока!")
            return
        end

        local targetChar = selectedPlayer.Character
        if not targetChar then
            print("У выбранного игрока нет персонажа!")
            return
        end

        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot then
            print("У персонажа нет HumanoidRootPart!")
            return
        end

        -- Удаляем старую папку если есть
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
        
        attachments[1] = Instance.new("Attachment")
        attachments[1].Name = "Attach1_0X_-1Y_1Z"
        attachments[1].CFrame = CFrame.new(0, -1, 1)
        attachments[1].Parent = attachFolder

        attachments[2] = Instance.new("Attachment")
        attachments[2].Name = "Attach2_0X_-1Y_2Z"
        attachments[2].CFrame = CFrame.new(0, -1, 2)
        attachments[2].Parent = attachFolder

        attachments[3] = Instance.new("Attachment")
        attachments[3].Name = "Attach3_0X_-1Y_3Z"
        attachments[3].CFrame = CFrame.new(0, -1, 3)
        attachments[3].Parent = attachFolder

        attachments[4] = Instance.new("Attachment")
        attachments[4].Name = "Attach4_0X_-1Y_4Z"
        attachments[4].CFrame = CFrame.new(0, -1, 4)
        attachments[4].Parent = attachFolder

        attachments[5] = Instance.new("Attachment")
        attachments[5].Name = "Attach5_0X_-1Y_5Z"
        attachments[5].CFrame = CFrame.new(0, -1, 5)
        attachments[5].Parent = attachFolder

        attachments[6] = Instance.new("Attachment")
        attachments[6].Name = "Attach6_1X_-1Y_5Z"
        attachments[6].CFrame = CFrame.new(1, -1, 5)
        attachments[6].Parent = attachFolder

        attachments[7] = Instance.new("Attachment")
        attachments[7].Name = "Attach7_-1X_-1Y_5Z"
        attachments[7].CFrame = CFrame.new(-1, -1, 5)
        attachments[7].Parent = attachFolder

        print("Создано 7 аттачментов для игрока: " .. selectedPlayer.Name)
        applyAttachments(attachments)
    end)

    -- Обновляем список при добавлении/удалении игроков
    table.insert(connections, game.Players.PlayerAdded:Connect(updatePlayerList))
    table.insert(connections, game.Players.PlayerRemoving:Connect(updatePlayerList))

    -- Первоначальное заполнение списка
    updatePlayerList()
    
    return container
end

-- Функция создания вкладки 2 (6 шт - А)
local function createTab2()
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 1, -20)
    container.Position = UDim2.new(0, 10, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = contentFrame
    container.ZIndex = 25

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 170, 0)
    title.Text = "Набор 2А (6 аттачментов)"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.Parent = container
    title.ZIndex = 26

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 0, 220)
    scrollFrame.Position = UDim2.new(0, 0, 0, 35)
    scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    scrollFrame.BorderSizePixel = 1
    scrollFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = touchEnabled and 6 or 8
    scrollFrame.Parent = container
    scrollFrame.ZIndex = 26

    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.Size = UDim2.new(1, 0, 0, 25)
    selectedLabel.Position = UDim2.new(0, 0, 0, 260)
    selectedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    selectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectedLabel.Text = "Выбран: никто"
    selectedLabel.Font = Enum.Font.Gotham
    selectedLabel.TextSize = 14
    selectedLabel.Parent = container
    selectedLabel.ZIndex = 26

    -- КНОПКА СОЗДАНИЯ
    local createButton = Instance.new("TextButton")
    createButton.Size = UDim2.new(1, 0, 0, 45)
    createButton.Position = UDim2.new(0, 0, 0, 290)
    createButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    createButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    createButton.Text = "СОЗДАТЬ АТТАЧМЕНТЫ (6 шт - А)"
    createButton.Font = Enum.Font.GothamBold
    createButton.TextSize = touchEnabled and 14 or 16
    createButton.Parent = container
    createButton.ZIndex = 26

    local createButtonCorner = Instance.new("UICorner")
    createButtonCorner.CornerRadius = UDim.new(0, 8)
    createButtonCorner.Parent = createButton

    local selectedPlayer = nil
    local playerButtons = {}

    local function updatePlayerList()
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

        for _, plr in ipairs(playerList) do
            local btn = createPlayerButton(plr, scrollFrame, y, plr == selectedPlayer)
            btn.MouseButton1Click:Connect(function()
                selectedPlayer = plr
                selectedLabel.Text = "Выбран: " .. plr.Name
                for _, b in pairs(playerButtons) do
                    b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                end
                btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
            end)
            playerButtons[plr] = btn
            y = y + 40
        end

        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, y + 5)
    end

    local function applyAttachments(attachments)
        local character = player.Character
        if not character then
            return false
        end

        local gasterHands = character:FindFirstChild("GasterHands")
        if not gasterHands then
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
                        end
                        if alignPos and attachments[index] then
                            alignPos.Attachment1 = attachments[index]
                        end

                        if alignOri or alignPos then
                            applied = applied + 1
                        end
                    end
                end
                index = index + 1
            end
        end

        return applied > 0
    end

    createButton.MouseButton1Click:Connect(function()
        if not selectedPlayer then
            print("Сначала выберите игрока!")
            return
        end

        local targetChar = selectedPlayer.Character
        if not targetChar then
            print("У выбранного игрока нет персонажа!")
            return
        end

        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot then
            print("У персонажа нет HumanoidRootPart!")
            return
        end

        local attachFolder = targetRoot:FindFirstChild("AttachmentsFolder")
        if attachFolder then
            attachFolder:Destroy()
        end

        attachFolder = Instance.new("Folder")
        attachFolder.Name = "AttachmentsFolder"
        attachFolder.Parent = targetRoot

        local attachments = {}
        attachments[1] = Instance.new("Attachment")
        attachments[1].Name = "Attach1_0X_1Y_1Z"
        attachments[1].CFrame = CFrame.new(0, 1, 1)
        attachments[1].Parent = attachFolder

        attachments[2] = Instance.new("Attachment")
        attachments[2].Name = "Attach2_0X_-1Y_1Z"
        attachments[2].CFrame = CFrame.new(0, -1, 1)
        attachments[2].Parent = attachFolder

        attachments[3] = Instance.new("Attachment")
        attachments[3].Name = "Attach3_1X_0Y_1Z"
        attachments[3].CFrame = CFrame.new(1, 0, 1)
        attachments[3].Parent = attachFolder

        attachments[4] = Instance.new("Attachment")
        attachments[4].Name = "Attach4_-1X_0Y_1Z"
        attachments[4].CFrame = CFrame.new(-1, 0, 1)
        attachments[4].Parent = attachFolder

        attachments[5] = Instance.new("Attachment")
        attachments[5].Name = "Attach5_0X_2Y_1Z"
        attachments[5].CFrame = CFrame.new(0, 2, 1)
        attachments[5].Parent = attachFolder

        attachments[6] = Instance.new("Attachment")
        attachments[6].Name = "Attach6_0X_-2Y_1Z"
        attachments[6].CFrame = CFrame.new(0, -2, 1)
        attachments[6].Parent = attachFolder

        print("Создано 6 аттачментов (тип А) для игрока: " .. selectedPlayer.Name)
        applyAttachments(attachments)
    end)

    table.insert(connections, game.Players.PlayerAdded:Connect(updatePlayerList))
    table.insert(connections, game.Players.PlayerRemoving:Connect(updatePlayerList))

    updatePlayerList()
    return container
end

-- Функция создания вкладки 3 (6 шт - Б)
local function createTab3()
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 1, -20)
    container.Position = UDim2.new(0, 10, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = contentFrame
    container.ZIndex = 25

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 170, 0)
    title.Text = "Набор 2Б (6 аттачментов)"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.Parent = container
    title.ZIndex = 26

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 0, 220)
    scrollFrame.Position = UDim2.new(0, 0, 0, 35)
    scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    scrollFrame.BorderSizePixel = 1
    scrollFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = touchEnabled and 6 or 8
    scrollFrame.Parent = container
    scrollFrame.ZIndex = 26

    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.Size = UDim2.new(1, 0, 0, 25)
    selectedLabel.Position = UDim2.new(0, 0, 0, 260)
    selectedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    selectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectedLabel.Text = "Выбран: никто"
    selectedLabel.Font = Enum.Font.Gotham
    selectedLabel.TextSize = 14
    selectedLabel.Parent = container
    selectedLabel.ZIndex = 26

    -- КНОПКА СОЗДАНИЯ
    local createButton = Instance.new("TextButton")
    createButton.Size = UDim2.new(1, 0, 0, 45)
    createButton.Position = UDim2.new(0, 0, 0, 290)
    createButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    createButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    createButton.Text = "СОЗДАТЬ АТТАЧМЕНТЫ (6 шт - Б)"
    createButton.Font = Enum.Font.GothamBold
    createButton.TextSize = touchEnabled and 14 or 16
    createButton.Parent = container
    createButton.ZIndex = 26

    local createButtonCorner = Instance.new("UICorner")
    createButtonCorner.CornerRadius = UDim.new(0, 8)
    createButtonCorner.Parent = createButton

    local selectedPlayer = nil
    local playerButtons = {}

    local function updatePlayerList()
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

        for _, plr in ipairs(playerList) do
            local btn = createPlayerButton(plr, scrollFrame, y, plr == selectedPlayer)
            btn.MouseButton1Click:Connect(function()
                selectedPlayer = plr
                selectedLabel.Text = "Выбран: " .. plr.Name
                for _, b in pairs(playerButtons) do
                    b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                end
                btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
            end)
            playerButtons[plr] = btn
            y = y + 40
        end

        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, y + 5)
    end

    local function applyAttachments(attachments)
        local character = player.Character
        if not character then
            return false
        end

        local gasterHands = character:FindFirstChild("GasterHands")
        if not gasterHands then
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
                        end
                        if alignPos and attachments[index] then
                            alignPos.Attachment1 = attachments[index]
                        end

                        if alignOri or alignPos then
                            applied = applied + 1
                        end
                    end
                end
                index = index + 1
            end
        end

        return applied > 0
    end

    createButton.MouseButton1Click:Connect(function()
        if not selectedPlayer then
            print("Сначала выберите игрока!")
            return
        end

        local targetChar = selectedPlayer.Character
        if not targetChar then
            print("У выбранного игрока нет персонажа!")
            return
        end

        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot then
            print("У персонажа нет HumanoidRootPart!")
            return
        end

        local attachFolder = targetRoot:FindFirstChild("AttachmentsFolder")
        if attachFolder then
            attachFolder:Destroy()
        end

        attachFolder = Instance.new("Folder")
        attachFolder.Name = "AttachmentsFolder"
        attachFolder.Parent = targetRoot

        local attachments = {}
        attachments[1] = Instance.new("Attachment")
        attachments[1].Name = "Attach1_-2X_0Y_1Z"
        attachments[1].CFrame = CFrame.new(-2, 0, 1)
        attachments[1].Parent = attachFolder

        attachments[2] = Instance.new("Attachment")
        attachments[2].Name = "Attach2_2X_0Y_1Z"
        attachments[2].CFrame = CFrame.new(2, 0, 1)
        attachments[2].Parent = attachFolder

        attachments[3] = Instance.new("Attachment")
        attachments[3].Name = "Attach3_2X_-1Y_1Z"
        attachments[3].CFrame = CFrame.new(2, -1, 1)
        attachments[3].Parent = attachFolder

        attachments[4] = Instance.new("Attachment")
        attachments[4].Name = "Attach4_-2X_1Y_1Z"
        attachments[4].CFrame = CFrame.new(-2, 1, 1)
        attachments[4].Parent = attachFolder

        attachments[5] = Instance.new("Attachment")
        attachments[5].Name = "Attach5_1X_2Y_1Z"
        attachments[5].CFrame = CFrame.new(1, 2, 1)
        attachments[5].Parent = attachFolder

        attachments[6] = Instance.new("Attachment")
        attachments[6].Name = "Attach6_-1X_-1Y_1Z"
        attachments[6].CFrame = CFrame.new(-1, -2, 1)
        attachments[6].Parent = attachFolder

        print("Создано 6 аттачментов (тип Б) для игрока: " .. selectedPlayer.Name)
        applyAttachments(attachments)
    end)

    table.insert(connections, game.Players.PlayerAdded:Connect(updatePlayerList))
    table.insert(connections, game.Players.PlayerRemoving:Connect(updatePlayerList))

    updatePlayerList()
    return container
end

-- Функция переключения вкладок
local function switchTab(tabIndex)
    tab1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab3.TextColor3 = Color3.fromRGB(255, 255, 255)

    clearContent()

    if tabIndex == 1 then
        tab1.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        tab1.TextColor3 = Color3.fromRGB(0, 0, 0)
        currentContent = createTab1()
    elseif tabIndex == 2 then
        tab2.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        tab2.TextColor3 = Color3.fromRGB(0, 0, 0)
        currentContent = createTab2()
    elseif tabIndex == 3 then
        tab3.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        tab3.TextColor3 = Color3.fromRGB(0, 0, 0)
        currentContent = createTab3()
    end
end

-- Подключение обработчиков вкладок
tab1.MouseButton1Click:Connect(function() switchTab(1) end)
tab2.MouseButton1Click:Connect(function() switchTab(2) end)
tab3.MouseButton1Click:Connect(function() switchTab(3) end)

-- Запуск с первой вкладки
switchTab(1)

-- Автоматическое определение мобильного устройства
if touchEnabled then
    mainFrame.Position = UDim2.new(0.5, -170, 0.1, 0)
    minimizedFrame.Position = UDim2.new(0, 10, 0.5, -35)
end

print("Gaster Hands GUI загружен! Нажмите на иконку с руками чтобы развернуть.")