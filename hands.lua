--[[
    GASTER HANDS GUI - Автономная версия
    Полностью скопировано из "искра чит.txt" и адаптировано для работы без Rayfield
]]

-- Функция дешифровки (оригинальная v7)
local char = string.char
local byte = string.byte
local sub = string.sub
local bitLib = bit32
local bxor = bitLib.bxor
local concat = table.concat
local insert = table.insert

local function v7(encrypted, key)
    local result = {}
    for i = 1, #encrypted do
        local keyIndex = 1 + (i % #key)
        local keyByte = byte(sub(key, keyIndex, keyIndex))
        local dataByte = byte(sub(encrypted, i, i))
        insert(result, char(bxor(dataByte, keyByte) % 256))
    end
    return concat(result)
end

-- Проверка ID игры (можно заменить или убрать)
-- if game.PlaceId == 8573962925 then

    local player = game.Players.LocalPlayer
    local coreGui = game:GetService("CoreGui")

    -- Удаление старого GUI если есть
    local oldGui = coreGui:FindFirstChild("UnifiedScriptHub")
    if oldGui then
        oldGui:Destroy()
    end

    -- Создание основного GUI
    local gui = Instance.new("ScreenGui")
    gui.Name = "UnifiedScriptHub"
    gui.Parent = coreGui
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Главное окно
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = gui

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 8)
    mainCorner.Parent = mainFrame

    -- Заголовок
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = "Script Hub"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 20
    titleLabel.Parent = mainFrame

    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleLabel

    -- Кнопка закрытия
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -30, 0, 7)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 16
    closeButton.Parent = mainFrame

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeButton

    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    -- Панель вкладок
    local tabPanel = Instance.new("Frame")
    tabPanel.Size = UDim2.new(1, -20, 0, 40)
    tabPanel.Position = UDim2.new(0, 10, 0, 50)
    tabPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tabPanel.Parent = mainFrame

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabPanel

    -- Вкладка 1: Chukabumbula
    local tab1 = Instance.new("TextButton")
    tab1.Size = UDim2.new(0.33, -5, 0, 30)
    tab1.Position = UDim2.new(0, 5, 0, 5)
    tab1.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    tab1.TextColor3 = Color3.fromRGB(0, 0, 0)
    tab1.Text = "Chukabumbula"
    tab1.Font = Enum.Font.GothamBold
    tab1.TextSize = 14
    tab1.Parent = tabPanel

    local tab1Corner = Instance.new("UICorner")
    tab1Corner.CornerRadius = UDim.new(0, 4)
    tab1Corner.Parent = tab1

    -- Вкладка 2: Svaston 1
    local tab2 = Instance.new("TextButton")
    tab2.Size = UDim2.new(0.33, -5, 0, 30)
    tab2.Position = UDim2.new(0.335, 0, 0, 5)
    tab2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab2.Text = "Svaston 1"
    tab2.Font = Enum.Font.GothamBold
    tab2.TextSize = 14
    tab2.Parent = tabPanel

    local tab2Corner = Instance.new("UICorner")
    tab2Corner.CornerRadius = UDim.new(0, 4)
    tab2Corner.Parent = tab2

    -- Вкладка 3: Svaston 2
    local tab3 = Instance.new("TextButton")
    tab3.Size = UDim2.new(0.33, -5, 0, 30)
    tab3.Position = UDim2.new(0.67, 0, 0, 5)
    tab3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab3.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab3.Text = "Svaston 2"
    tab3.Font = Enum.Font.GothamBold
    tab3.TextSize = 14
    tab3.Parent = tabPanel

    local tab3Corner = Instance.new("UICorner")
    tab3Corner.CornerRadius = UDim.new(0, 4)
    tab3Corner.Parent = tab3

    -- Контейнер для контента вкладок
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -20, 0, 380)
    contentFrame.Position = UDim2.new(0, 10, 0, 100)
    contentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    contentFrame.Parent = mainFrame

    local contentCorner = Instance.new("UICorner")
    contentCorner.CornerRadius = UDim.new(0, 6)
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

    -- Функция создания кнопки игрока
    local function createPlayerButton(playerObj, parent, yPos, isSelected)
        local character = playerObj.Character
        local hasRoot = character and character:FindFirstChild("HumanoidRootPart")
        local statusColor = hasRoot and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 30)
        btn.Position = UDim2.new(0, 5, 0, yPos)
        btn.BackgroundColor3 = isSelected and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(60, 60, 60)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = playerObj.Name .. (hasRoot and " ✓" or " ✗")
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 14
        btn.BorderSizePixel = 1
        btn.BorderColor3 = statusColor
        btn.Parent = parent
        return btn
    end

    -- Функция создания вкладки 1 (Chukabumbula)
    local function createTab1()
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -20, 1, -20)
        container.Position = UDim2.new(0, 10, 0, 10)
        container.BackgroundTransparency = 1
        container.Parent = contentFrame

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 30)
        title.BackgroundTransparency = 1
        title.TextColor3 = Color3.fromRGB(255, 170, 0)
        title.Text = "Chukabumbula - Attachments (7 pcs)"
        title.Font = Enum.Font.GothamBold
        title.TextSize = 16
        title.Parent = container

        local scrollFrame = Instance.new("ScrollingFrame")
        scrollFrame.Size = UDim2.new(1, 0, 0, 200)
        scrollFrame.Position = UDim2.new(0, 0, 0, 40)
        scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        scrollFrame.BorderSizePixel = 1
        scrollFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        scrollFrame.ScrollBarThickness = 8
        scrollFrame.Parent = container

        local selectedLabel = Instance.new("TextLabel")
        selectedLabel.Size = UDim2.new(1, 0, 0, 25)
        selectedLabel.Position = UDim2.new(0, 0, 0, 250)
        selectedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        selectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        selectedLabel.Text = "Selected: none"
        selectedLabel.Font = Enum.Font.Gotham
        selectedLabel.TextSize = 14
        selectedLabel.Parent = container

        local createButton = Instance.new("TextButton")
        createButton.Size = UDim2.new(1, 0, 0, 40)
        createButton.Position = UDim2.new(0, 0, 0, 285)
        createButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        createButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        createButton.Text = "Create Attachments (7 pcs)"
        createButton.Font = Enum.Font.GothamBold
        createButton.TextSize = 14
        createButton.Parent = container

        local selectedPlayer = nil
        local playerButtons = {}

        local function updatePlayerList()
            for _, btn in pairs(playerButtons) do
                btn:Destroy()
            end
            playerButtons = {}

            local y = 0
            local playerList = game.Players:GetPlayers()
            table.sort(playerList, function(a, b)
                return a.Name < b.Name
            end)

            for _, plr in ipairs(playerList) do
                local btn = createPlayerButton(plr, scrollFrame, y, plr == selectedPlayer)
                btn.MouseButton1Click:Connect(function()
                    selectedPlayer = plr
                    selectedLabel.Text = "Selected: " .. plr.Name
                    for _, b in pairs(playerButtons) do
                        b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    end
                    btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
                end)
                playerButtons[plr] = btn
                y = y + 35
            end

            scrollFrame.CanvasSize = UDim2.new(0, 0, 0, y)
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
                print("Player not selected!")
                return
            end

            local targetChar = selectedPlayer.Character
            if not targetChar then
                return
            end

            local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
            if not targetRoot then
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

            print("Chukabumbula: 7 attachments created")
            applyAttachments(attachments)
        end)

        table.insert(connections, game.Players.PlayerAdded:Connect(updatePlayerList))
        table.insert(connections, game.Players.PlayerRemoving:Connect(updatePlayerList))

        updatePlayerList()
        return container
    end

    -- Функция создания вкладки 2 (Svaston 1)
    local function createTab2()
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -20, 1, -20)
        container.Position = UDim2.new(0, 10, 0, 10)
        container.BackgroundTransparency = 1
        container.Parent = contentFrame

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 30)
        title.BackgroundTransparency = 1
        title.TextColor3 = Color3.fromRGB(255, 170, 0)
        title.Text = "Svaston 1 - Attachments (6 pcs)"
        title.Font = Enum.Font.GothamBold
        title.TextSize = 16
        title.Parent = container

        local scrollFrame = Instance.new("ScrollingFrame")
        scrollFrame.Size = UDim2.new(1, 0, 0, 200)
        scrollFrame.Position = UDim2.new(0, 0, 0, 40)
        scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        scrollFrame.BorderSizePixel = 1
        scrollFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        scrollFrame.ScrollBarThickness = 8
        scrollFrame.Parent = container

        local selectedLabel = Instance.new("TextLabel")
        selectedLabel.Size = UDim2.new(1, 0, 0, 25)
        selectedLabel.Position = UDim2.new(0, 0, 0, 250)
        selectedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        selectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        selectedLabel.Text = "Selected: none"
        selectedLabel.Font = Enum.Font.Gotham
        selectedLabel.TextSize = 14
        selectedLabel.Parent = container

        local createButton = Instance.new("TextButton")
        createButton.Size = UDim2.new(1, 0, 0, 40)
        createButton.Position = UDim2.new(0, 0, 0, 285)
        createButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        createButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        createButton.Text = "Create Attachments (6 pcs)"
        createButton.Font = Enum.Font.GothamBold
        createButton.TextSize = 14
        createButton.Parent = container

        local selectedPlayer = nil
        local playerButtons = {}

        local function updatePlayerList()
            for _, btn in pairs(playerButtons) do
                btn:Destroy()
            end
            playerButtons = {}

            local y = 0
            local playerList = game.Players:GetPlayers()
            table.sort(playerList, function(a, b)
                return a.Name < b.Name
            end)

            for _, plr in ipairs(playerList) do
                local btn = createPlayerButton(plr, scrollFrame, y, plr == selectedPlayer)
                btn.MouseButton1Click:Connect(function()
                    selectedPlayer = plr
                    selectedLabel.Text = "Selected: " .. plr.Name
                    for _, b in pairs(playerButtons) do
                        b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    end
                    btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
                end)
                playerButtons[plr] = btn
                y = y + 35
            end

            scrollFrame.CanvasSize = UDim2.new(0, 0, 0, y)
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
                print("Player not selected!")
                return
            end

            local targetChar = selectedPlayer.Character
            if not targetChar then
                return
            end

            local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
            if not targetRoot then
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

            print("Svaston 1: 6 attachments created")
            applyAttachments(attachments)
        end)

        table.insert(connections, game.Players.PlayerAdded:Connect(updatePlayerList))
        table.insert(connections, game.Players.PlayerRemoving:Connect(updatePlayerList))

        updatePlayerList()
        return container
    end

    -- Функция создания вкладки 3 (Svaston 2)
    local function createTab3()
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -20, 1, -20)
        container.Position = UDim2.new(0, 10, 0, 10)
        container.BackgroundTransparency = 1
        container.Parent = contentFrame

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 30)
        title.BackgroundTransparency = 1
        title.TextColor3 = Color3.fromRGB(255, 170, 0)
        title.Text = "Svaston 2 - Attachments (6 pcs)"
        title.Font = Enum.Font.GothamBold
        title.TextSize = 16
        title.Parent = container

        local scrollFrame = Instance.new("ScrollingFrame")
        scrollFrame.Size = UDim2.new(1, 0, 0, 200)
        scrollFrame.Position = UDim2.new(0, 0, 0, 40)
        scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        scrollFrame.BorderSizePixel = 1
        scrollFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        scrollFrame.ScrollBarThickness = 8
        scrollFrame.Parent = container

        local selectedLabel = Instance.new("TextLabel")
        selectedLabel.Size = UDim2.new(1, 0, 0, 25)
        selectedLabel.Position = UDim2.new(0, 0, 0, 250)
        selectedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        selectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        selectedLabel.Text = "Selected: none"
        selectedLabel.Font = Enum.Font.Gotham
        selectedLabel.TextSize = 14
        selectedLabel.Parent = container

        local createButton = Instance.new("TextButton")
        createButton.Size = UDim2.new(1, 0, 0, 40)
        createButton.Position = UDim2.new(0, 0, 0, 285)
        createButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
        createButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        createButton.Text = "Create Attachments (6 pcs)"
        createButton.Font = Enum.Font.GothamBold
        createButton.TextSize = 14
        createButton.Parent = container

        local selectedPlayer = nil
        local playerButtons = {}

        local function updatePlayerList()
            for _, btn in pairs(playerButtons) do
                btn:Destroy()
            end
            playerButtons = {}

            local y = 0
            local playerList = game.Players:GetPlayers()
            table.sort(playerList, function(a, b)
                return a.Name < b.Name
            end)

            for _, plr in ipairs(playerList) do
                local btn = createPlayerButton(plr, scrollFrame, y, plr == selectedPlayer)
                btn.MouseButton1Click:Connect(function()
                    selectedPlayer = plr
                    selectedLabel.Text = "Selected: " .. plr.Name
                    for _, b in pairs(playerButtons) do
                        b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    end
                    btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
                end)
                playerButtons[plr] = btn
                y = y + 35
            end

            scrollFrame.CanvasSize = UDim2.new(0, 0, 0, y)
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
                print("Player not selected!")
                return
            end

            local targetChar = selectedPlayer.Character
            if not targetChar then
                return
            end

            local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
            if not targetRoot then
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

            print("Svaston 2: 6 attachments created")
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

-- end -- Конец проверки game.PlaceId (закомментировано)