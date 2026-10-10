-- [[ Roblox Advanced Multi-Tool GUI (Scanner, Logger, GUI Manager) ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or CoreGui

if playerGui:FindFirstChild("AdvancedMultiTool") then
    playerGui.AdvancedMultiTool:Destroy()
end

-- ScreenGui Utama
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdvancedMultiTool"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Tombol Floating Toggle (Menu)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleBtn"
toggleBtn.Size = UDim2.new(0, 55, 0, 55)
toggleBtn.Position = UDim2.new(0, 20, 0, 100)
toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
toggleBtn.Text = "MENU"
toggleBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
toggleBtn.TextSize = 11
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleBtn

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(0, 170, 255)
toggleStroke.Thickness = 2
toggleStroke.Parent = toggleBtn

-- Frame Utama GUI
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 600, 0, 380)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
mainFrame.Visible = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(45, 45, 60)
mainStroke.Thickness = 1.5
mainStroke.Parent = mainFrame

-- Title Bar (Bisa Digeser / Draggable)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -50, 1, 0)
titleText.Position = UDim2.new(0, 15, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Advanced Roblox Multi-Tool"
titleText.TextColor3 = Color3.fromRGB(230, 230, 240)
titleText.TextSize = 13
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -35, 0.5, -14)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 11
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

-- Tab Bar (Navigasi Atas)
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -20, 0, 32)
tabBar.Position = UDim2.new(0, 10, 0, 50)
tabBar.BackgroundTransparency = 1
tabBar.Parent = mainFrame

local function createTabBtn(text, posX, active)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 185, 1, 0)
    btn.Position = UDim2.new(0, posX, 0, 0)
    btn.BackgroundColor3 = active and Color3.fromRGB(0, 120, 210) or Color3.fromRGB(28, 28, 38)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.Parent = tabBar
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    return btn
end

local tab1Btn = createTabBtn("1. Remote Scanner", 0, true)
local tab2Btn = createTabBtn("2. Remote Logger", 195, false)
local tab3Btn = createTabBtn("3. GUI Manager", 390, false)

-- Content Pages Container
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -95)
contentFrame.Position = UDim2.new(0, 10, 0, 88)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame


-- ==================== TAB 1: REMOTE SCANNER ====================
local page1 = Instance.new("Frame")
page1.Size = UDim2.new(1, 0, 1, 0)
page1.BackgroundTransparency = 1
page1.Visible = true
page1.Parent = contentFrame

local scanList = Instance.new("ScrollingFrame")
scanList.Size = UDim2.new(0.42, 0, 1, -35)
scanList.Position = UDim2.new(0, 0, 0, 35)
scanList.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
scanList.BorderSizePixel = 0
scanList.ScrollBarThickness = 4
scanList.Parent = page1

local scanListLayout = Instance.new("UIListLayout")
scanListLayout.SortOrder = Enum.SortOrder.LayoutOrder
scanListLayout.Padding = UDim.new(0, 4)
scanListLayout.Parent = scanList

local scanSearch = Instance.new("TextBox")
scanSearch.Size = UDim2.new(0.42, 0, 0, 28)
scanSearch.Position = UDim2.new(0, 0, 0, 0)
scanSearch.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
scanSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
scanSearch.TextSize = 11
scanSearch.Font = Enum.Font.Gotham
scanSearch.PlaceholderText = "🔍 Cari remote..."
scanSearch.Parent = page1

local scanCodeBox = Instance.new("TextBox")
scanCodeBox.Size = UDim2.new(0.56, 0, 1, -70)
scanCodeBox.Position = UDim2.new(0.44, 10, 0, 0)
scanCodeBox.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
scanCodeBox.TextColor3 = Color3.fromRGB(120, 220, 255)
scanCodeBox.TextSize = 11
scanCodeBox.Font = Enum.Font.Code
scanCodeBox.MultiLine = true
scanCodeBox.ClearTextOnFocus = false
scanCodeBox.TextXAlignment = Enum.TextXAlignment.Left
scanCodeBox.TextYAlignment = Enum.TextYAlignment.Top
scanCodeBox.PlaceholderText = "-- Pilih remote di samping kiri untuk melihat kode..."
scanCodeBox.Parent = page1

local scanRunBtn = Instance.new("TextButton")
scanRunBtn.Size = UDim2.new(0.27, 0, 0, 32)
scanRunBtn.Position = UDim2.new(0.44, 10, 1, -60)
scanRunBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
scanRunBtn.Text = "RUN"
scanRunBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanRunBtn.TextSize = 11
scanRunBtn.Font = Enum.Font.GothamBold
scanRunBtn.Parent = page1

local scanCopyBtn = Instance.new("TextButton")
scanCopyBtn.Size = UDim2.new(0.27, 0, 0, 32)
scanCopyBtn.Position = UDim2.new(0.73, 10, 1, -60)
scanCopyBtn.BackgroundColor3 = Color3.fromRGB(40, 110, 200)
scanCopyBtn.Text = "COPY"
scanCopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanCopyBtn.TextSize = 11
scanCopyBtn.Font = Enum.Font.GothamBold
scanCopyBtn.Parent = page1

local scanRefreshBtn = Instance.new("TextButton")
scanRefreshBtn.Size = UDim2.new(0.42, 0, 0, 28)
scanRefreshBtn.Position = UDim2.new(0, 0, 1, -28)
scanRefreshBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
scanRefreshBtn.Text = "REFRESH LIST"
scanRefreshBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanRefreshBtn.TextSize = 11
scanRefreshBtn.Font = Enum.Font.GothamBold
scanRefreshBtn.Parent = page1

-- ==================== TAB 2: REMOTE LOGGER ====================
local page2 = Instance.new("Frame")
page2.Size = UDim2.new(1, 0, 1, 0)
page2.BackgroundTransparency = 1
page2.Visible = false
page2.Parent = contentFrame

local logList = Instance.new("ScrollingFrame")
logList.Size = UDim2.new(0.42, 0, 1, -35)
logList.Position = UDim2.new(0, 0, 0, 35)
logList.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
logList.BorderSizePixel = 0
logList.ScrollBarThickness = 4
logList.Parent = page2

local logListLayout = Instance.new("UIListLayout")
logListLayout.SortOrder = Enum.SortOrder.LayoutOrder
logListLayout.Padding = UDim.new(0, 4)
logListLayout.Parent = logList

local logSearch = Instance.new("TextBox")
logSearch.Size = UDim2.new(0.42, 0, 0, 28)
logSearch.Position = UDim2.new(0, 0, 0, 0)
logSearch.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
logSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
logSearch.TextSize = 11
logSearch.Font = Enum.Font.Gotham
logSearch.PlaceholderText = "🔍 Filter logs..."
logSearch.Parent = page2

local logCodeBox = Instance.new("TextBox")
logCodeBox.Size = UDim2.new(0.56, 0, 1, -70)
logCodeBox.Position = UDim2.new(0.44, 10, 0, 0)
logCodeBox.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
logCodeBox.TextColor3 = Color3.fromRGB(120, 220, 255)
logCodeBox.TextSize = 11
logCodeBox.Font = Enum.Font.Code
logCodeBox.MultiLine = true
logCodeBox.ClearTextOnFocus = false
logCodeBox.TextXAlignment = Enum.TextXAlignment.Left
logCodeBox.TextYAlignment = Enum.TextYAlignment.Top
logCodeBox.PlaceholderText = "-- Klik log di samping kiri..."
logCodeBox.Parent = page2

local logRunBtn = Instance.new("TextButton")
logRunBtn.Size = UDim2.new(0.27, 0, 0, 32)
logRunBtn.Position = UDim2.new(0.44, 10, 1, -60)
logRunBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
logRunBtn.Text = "RUN"
logRunBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
logRunBtn.TextSize = 11
logRunBtn.Font = Enum.Font.GothamBold
logRunBtn.Parent = page2

local logCopyBtn = Instance.new("TextButton")
logCopyBtn.Size = UDim2.new(0.27, 0, 0, 32)
logCopyBtn.Position = UDim2.new(0.73, 10, 1, -60)
logCopyBtn.BackgroundColor3 = Color3.fromRGB(40, 110, 200)
logCopyBtn.Text = "COPY"
logCopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
logCopyBtn.TextSize = 11
logCopyBtn.Font = Enum.Font.GothamBold
logCopyBtn.Parent = page2

local logClearBtn = Instance.new("TextButton")
logClearBtn.Size = UDim2.new(0.42, 0, 0, 28)
logClearBtn.Position = UDim2.new(0, 0, 1, -28)
logClearBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
logClearBtn.Text = "CLEAR LOGS"
logClearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
logClearBtn.TextSize = 11
logClearBtn.Font = Enum.Font.GothamBold
logClearBtn.Parent = page2


-- ==================== TAB 3: GUI MANAGER ====================
local page3 = Instance.new("Frame")
page3.Size = UDim2.new(1, 0, 1, 0)
page3.BackgroundTransparency = 1
page3.Visible = false
page3.Parent = contentFrame

-- Kontrol Global Atas
local showAllBtn = Instance.new("TextButton")
showAllBtn.Size = UDim2.new(0.48, 0, 0, 32)
showAllBtn.Position = UDim2.new(0, 0, 0, 0)
showAllBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
showAllBtn.Text = "BUKA SEMUA GUI"
showAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
showAllBtn.TextSize = 11
showAllBtn.Font = Enum.Font.GothamBold
showAllBtn.Parent = page3

local hideAllBtn = Instance.new("TextButton")
hideAllBtn.Size = UDim2.new(0.48, 0, 0, 32)
hideAllBtn.Position = UDim2.new(0.52, 0, 0, 0)
hideAllBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
hideAllBtn.Text = "TUTUP SEMUA GUI"
hideAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
hideAllBtn.TextSize = 11
hideAllBtn.Font = Enum.Font.GothamBold
hideAllBtn.Parent = page3

-- Daftar List ScreenGui di PlayerGui
local guiListScroll = Instance.new("ScrollingFrame")
guiListScroll.Size = UDim2.new(1, 0, 1, -45)
guiListScroll.Position = UDim2.new(0, 0, 0, 40)
guiListScroll.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
guiListScroll.BorderSizePixel = 0
guiListScroll.ScrollBarThickness = 4
guiListScroll.Parent = page3

local guiListLayout = Instance.new("UIListLayout")
guiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
guiListLayout.Padding = UDim.new(0, 5)
guiListLayout.Parent = guiListScroll


-- ==================== NAVIGASI TAB ====================
tab1Btn.MouseButton1Click:Connect(function()
    page1.Visible = true; page2.Visible = false; page3.Visible = false
    tab1Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 210)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    tab3Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
end)

tab2Btn.MouseButton1Click:Connect(function()
    page1.Visible = false; page2.Visible = true; page3.Visible = false
    tab1Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 210)
    tab3Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
end)

tab3Btn.MouseButton1Click:Connect(function()
    page1.Visible = false; page2.Visible = false; page3.Visible = true
    tab1Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    tab3Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 210)
end)


-- ==================== LOGIKA SCANNER ====================
local function scanRemotes()
    for _, child in ipairs(scanList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    pcall(function()
        for _, obj in ipairs(game:GetDescendants()) do
            if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                local isEv = obj:IsA("RemoteEvent")
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -6, 0, 30)
                btn.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
                btn.Text = (isEv and " [Event] " or " [Func] ") .. obj.Name
                btn.TextColor3 = isEv and Color3.fromRGB(100, 210, 255) or Color3.fromRGB(255, 180, 80)
                btn.TextSize = 10
                btn.Font = Enum.Font.Gotham
                btn.TextXAlignment = Enum.TextXAlignment.Left
                btn.Parent = scanList
                
                local c = Instance.new("UICorner")
                c.CornerRadius = UDim.new(0, 5)
                c.Parent = btn
                
                local codeStr = "local remote = " .. obj:GetFullName() .. "\n\n"
                if isEv then
                    codeStr = codeStr .. "remote:FireServer()"
                else
                    codeStr = codeStr .. "local res = remote:InvokeServer()\nprint(res)"
                end
                
                btn.MouseButton1Click:Connect(function()
                    scanCodeBox.Text = codeStr
                end)
            end
        end
    end)
    scanList.CanvasSize = UDim2.new(0, 0, 0, scanListLayout.AbsoluteContentSize.Y + 10)
end

scanRefreshBtn.MouseButton1Click:Connect(scanRemotes)

scanSearch:GetPropertyChangedSignal("Text"):Connect(function()
    local q = scanSearch.Text:lower()
    for _, b in ipairs(scanList:GetChildren()) do
        if b:IsA("TextButton") then
            b.Visible = (q == "" or b.Text:lower():find(q))
        end
    end
end)

scanCopyBtn.MouseButton1Click:Connect(function()
    if scanCodeBox.Text ~= "" and setclipboard then setclipboard(scanCodeBox.Text) end
end)

scanRunBtn.MouseButton1Click:Connect(function()
    if scanCodeBox.Text ~= "" and loadstring then
        local fn = loadstring(scanCodeBox.Text)
        if fn then pcall(fn) end
    end
end)

scanRemotes()


-- ==================== LOGIKA LOGGER ====================
local function addLog(remote, method, args)
    pcall(function()
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -6, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        btn.Text = " [" .. method:sub(1,1) .. "] " .. remote.Name
        btn.TextColor3 = method == "FireServer" and Color3.fromRGB(100, 210, 255) or Color3.fromRGB(255, 180, 80)
        btn.TextSize = 10
        btn.Font = Enum.Font.Gotham
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = logList
        
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 5)
        c.Parent = btn
        
        local scriptStr = "local remote = " .. remote:GetFullName() .. "\n\n"
        if method == "FireServer" then
            scriptStr = scriptStr .. "remote:FireServer("
        else
            scriptStr = scriptStr .. "remote:InvokeServer("
        end
        for i, v in ipairs(args) do
            scriptStr = scriptStr .. tostring(v)
            if i < #args then scriptStr = scriptStr .. ", " end
        end
        scriptStr = scriptStr .. ")"
        
        btn.MouseButton1Click:Connect(function()
            logCodeBox.Text = scriptStr
        end)
        logList.CanvasSize = UDim2.new(0, 0, 0, logListLayout.AbsoluteContentSize.Y + 10)
    end)
end

logClearBtn.MouseButton1Click:Connect(function()
    for _, v in ipairs(logList:GetChildren()) do
        if v:IsA("TextButton") then v:Destroy() end
    end
    logCodeBox.Text = ""
end)

logCopyBtn.MouseButton1Click:Connect(function()
    if logCodeBox.Text ~= "" and setclipboard then setclipboard(logCodeBox.Text) end
end)

logRunBtn.MouseButton1Click:Connect(function()
    if logCodeBox.Text ~= "" and loadstring then
        local fn = loadstring(logCodeBox.Text)
        if fn then pcall(fn) end
    end
end)

-- Hooking Logger Aman
pcall(function()
    if getrawmetatable and setreadonly then
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if (method == "FireServer" or method == "InvokeServer") and (self:IsA("RemoteEvent") or self:IsA("RemoteFunction")) then
                addLog(self, method, {...})
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end
end)


-- ==================== LOGIKA GUI MANAGER ====================
local function refreshGuiManager()
    for _, child in ipairs(guiListScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    pcall(function()
        for _, gui in ipairs(playerGui:GetChildren()) do
            if gui:IsA("ScreenGui") and gui ~= screenGui then
                local row = Instance.new("Frame")
                row.Size = UDim2.new(1, -6, 0, 36)
                row.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
                row.Parent = guiListScroll
                
                local rc = Instance.new("UICorner")
                rc.CornerRadius = UDim.new(0, 6)
                rc.Parent = row
                
                local nameLbl = Instance.new("TextLabel")
                nameLbl.Size = UDim2.new(0.55, 0, 1, 0)
                nameLbl.Position = UDim2.new(0, 10, 0, 0)
                nameLbl.BackgroundTransparency = 1
                nameLbl.Text = gui.Name
                nameLbl.TextColor3 = Color3.fromRGB(240, 240, 240)
                nameLbl.TextSize = 11
                nameLbl.Font = Enum.Font.GothamMedium
                nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                nameLbl.Parent = row
                
                local toggleStateBtn = Instance.new("TextButton")
                toggleStateBtn.Size = UDim2.new(0, 80, 0, 24)
                toggleStateBtn.Position = UDim2.new(0.58, 0, 0.5, -12)
                toggleStateBtn.BackgroundColor3 = gui.Enabled and Color3.fromRGB(0, 160, 80) or Color3.fromRGB(180, 50, 50)
                toggleStateBtn.Text = gui.Enabled and "HIDDEN (ON)" or "SHOW (OFF)"
                toggleStateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                toggleStateBtn.TextSize = 10
                toggleStateBtn.Font = Enum.Font.GothamBold
                toggleStateBtn.Parent = row
                
                local tsc = Instance.new("UICorner")
                tsc.CornerRadius = UDim.new(0, 4)
                tsc.Parent = toggleStateBtn
                
                toggleStateBtn.MouseButton1Click:Connect(function()
                    gui.Enabled = not gui.Enabled
                    toggleStateBtn.BackgroundColor3 = gui.Enabled and Color3.fromRGB(0, 160, 80) or Color3.fromRGB(180, 50, 50)
                    toggleStateBtn.Text = gui.Enabled and "HIDDEN (ON)" or "SHOW (OFF)"
                end)
                
                local deleteBtn = Instance.new("TextButton")
                deleteBtn.Size = UDim2.new(0, 60, 0, 24)
                deleteBtn.Position = UDim2.new(0.82, 0, 0.5, -12)
                deleteBtn.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
                deleteBtn.Text = "Hapus"
                deleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                deleteBtn.TextSize = 10
                deleteBtn.Font = Enum.Font.GothamBold
                deleteBtn.Parent = row
                
                local dc = Instance.new("UICorner")
                dc.CornerRadius = UDim.new(0, 4)
                dc.Parent = deleteBtn
                
                deleteBtn.MouseButton1Click:Connect(function()
                    gui:Destroy()
                    row:Destroy()
                end)
            end
        end
    end)
    guiListScroll.CanvasSize = UDim2.new(0, 0, 0, guiListLayout.AbsoluteContentSize.Y + 10)
end

showAllBtn.MouseButton1Click:Connect(function()
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui ~= screenGui then gui.Enabled = true end
    end
    refreshGuiManager()
end)

hideAllBtn.MouseButton1Click:Connect(function()
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui ~= screenGui then gui.Enabled = false end
    end
    refreshGuiManager()
end)

refreshGuiManager()


-- ==================== DRAGGABLE & TOGGLE ====================
local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true; dragStart = input.Position; startPos = mainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

closeBtn.MouseButton1Click:Connect(function() mainFrame.Visible = false end)
toggleBtn.MouseButton1Click:Connect(function() 
    mainFrame.Visible = not mainFrame.Visible
    if mainFrame.Visible then refreshGuiManager() end
end)
