-- [[ Roblox Multi-Tool GUI: Scanner, Logger, & GUI Manager ]]
-- Mobile & PC Friendly

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or CoreGui

-- Hapus GUI lama jika ada
if playerGui:FindFirstChild("MultiToolGUI") then
    playerGui.MultiToolGUI:Destroy()
end

-- ScreenGui Utama
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MultiToolGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Tombol Floating Toggle (Membuka / Menutup GUI Utama)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleBtn"
toggleBtn.Size = UDim2.new(0.12, 0, 0.08, 0)
toggleBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
toggleBtn.Text = "MENU"
toggleBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0.3, 0)
toggleCorner.Parent = toggleBtn

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(0, 170, 255)
toggleStroke.Thickness = 2
toggleStroke.Parent = toggleBtn

-- Frame Utama GUI
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.85, 0, 0.8, 0)
mainFrame.Position = UDim2.new(0.075, 0, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0.04, 0)
mainCorner.Parent = mainFrame

-- Title Bar (Bisa Digeser)
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0.1, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0.2, 0)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.6, 0, 1, 0)
titleText.Position = UDim2.new(0.03, 0, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Multi-Tool Utility GUI"
titleText.TextColor3 = Color3.fromRGB(240, 240, 240)
titleText.TextScaled = true
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0.09, 0, 0.7, 0)
closeBtn.Position = UDim2.new(0.88, 0, 0.15, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0.3, 0)
closeCorner.Parent = closeBtn

-- Tab Bar (Tombol Pindah Tab)
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(0.96, 0, 0.08, 0)
tabBar.Position = UDim2.new(0.02, 0, 0.12, 0)
tabBar.BackgroundTransparency = 1
tabBar.Parent = mainFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.SpaceBetween
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = tabBar

local function createTabButton(text, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.32, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.LayoutOrder = order
    btn.Parent = tabBar
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0.2, 0)
    c.Parent = btn
    return btn
end

local tab1Btn = createTabButton("1. Scanner", 1)
local tab2Btn = createTabButton("2. Logger", 2)
local tab3Btn = createTabButton("3. GUI Manager", 3)

-- Content Container (Wadah Halaman Tab)
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(0.96, 0, 0.76, 0)
contentContainer.Position = UDim2.new(0.02, 0, 0.22, 0)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = mainFrame

-- // TAB 1: REMOTE SCANNER //
local tab1Frame = Instance.new("Frame")
tab1Frame.Size = UDim2.new(1, 0, 1, 0)
tab1Frame.BackgroundTransparency = 1
tab1Frame.Visible = true
tab1Frame.Parent = contentContainer

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, 0, 0.1, 0)
searchBox.Position = UDim2.new(0, 0, 0, 0)
searchBox.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.TextSize = 11
searchBox.Font = Enum.Font.Gotham
searchBox.PlaceholderText = "🔍 Cari nama remote map..."
searchBox.Parent = tab1Frame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0.2, 0)
searchCorner.Parent = searchBox

local scanLeftPanel = Instance.new("ScrollingFrame")
scanLeftPanel.Size = UDim2.new(0.44, 0, 0.86, 0)
scanLeftPanel.Position = UDim2.new(0, 0, 0.12, 0)
scanLeftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scanLeftPanel.BorderSizePixel = 0
scanLeftPanel.ScrollBarThickness = 3
scanLeftPanel.Parent = tab1Frame

local scanLeftCorner = Instance.new("UICorner")
scanLeftCorner.CornerRadius = UDim.new(0.04, 0)
scanLeftCorner.Parent = scanLeftPanel

local scanLeftLayout = Instance.new("UIListLayout")
scanLeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
scanLeftLayout.Padding = UDim.new(0, 4)
scanLeftLayout.Parent = scanLeftPanel

local scanRightPanel = Instance.new("Frame")
scanRightPanel.Size = UDim2.new(0.53, 0, 0.86, 0)
scanRightPanel.Position = UDim2.new(0.47, 0, 0.12, 0)
scanRightPanel.BackgroundTransparency = 1
scanRightPanel.Parent = tab1Frame

local scanCodeBox = Instance.new("TextBox")
scanCodeBox.Size = UDim2.new(1, 0, 0.65, 0)
scanCodeBox.Position = UDim2.new(0, 0, 0, 0)
scanCodeBox.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scanCodeBox.TextColor3 = Color3.fromRGB(120, 220, 255)
scanCodeBox.TextSize = 11
scanCodeBox.Font = Enum.Font.Code
scanCodeBox.ClearTextOnFocus = false
scanCodeBox.MultiLine = true
scanCodeBox.TextXAlignment = Enum.TextXAlignment.Left
scanCodeBox.TextYAlignment = Enum.TextYAlignment.Top
scanCodeBox.PlaceholderText = "-- Klik remote di kiri..."
scanCodeBox.Parent = scanRightPanel

local scanCodeCorner = Instance.new("UICorner")
scanCodeCorner.CornerRadius = UDim.new(0.04, 0)
scanCodeCorner.Parent = scanCodeBox

local scanBtnFrame = Instance.new("Frame")
scanBtnFrame.Size = UDim2.new(1, 0, 0.18, 0)
scanBtnFrame.Position = UDim2.new(0, 0, 0.68, 0)
scanBtnFrame.BackgroundTransparency = 1
scanBtnFrame.Parent = scanRightPanel

local function createMiniBtn(parent, text, posScale, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.3, 0, 1, 0)
    btn.Position = UDim2.new(posScale, 0, 0, 0)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = parent
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0.2, 0)
    c.Parent = btn
    return btn
end

local scanRunBtn = createMiniBtn(scanBtnFrame, "RUN", 0, Color3.fromRGB(0, 170, 80))
local scanCopyBtn = createMiniBtn(scanBtnFrame, "COPY", 0.35, Color3.fromRGB(40, 120, 210))
local scanRefreshBtn = createMiniBtn(scanBtnFrame, "REFRESH", 0.7, Color3.fromRGB(180, 50, 50))

local scanStatus = Instance.new("TextLabel")
scanStatus.Size = UDim2.new(1, 0, 0.12, 0)
scanStatus.Position = UDim2.new(0, 0, 0.88, 0)
scanStatus.BackgroundTransparency = 1
scanStatus.Text = "Status: Scanner siap."
scanStatus.TextColor3 = Color3.fromRGB(150, 150, 170)
scanStatus.TextScaled = true
scanStatus.Font = Enum.Font.Gotham
scanStatus.TextXAlignment = Enum.TextXAlignment.Left
scanStatus.Parent = scanRightPanel


-- // TAB 2: REMOTE LOGGER //
local tab2Frame = Instance.new("Frame")
tab2Frame.Size = UDim2.new(1, 0, 1, 0)
tab2Frame.BackgroundTransparency = 1
tab2Frame.Visible = false
tab2Frame.Parent = contentContainer

local logLeftPanel = Instance.new("ScrollingFrame")
logLeftPanel.Size = UDim2.new(0.44, 0, 1, 0)
logLeftPanel.Position = UDim2.new(0, 0, 0, 0)
logLeftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
logLeftPanel.BorderSizePixel = 0
logLeftPanel.ScrollBarThickness = 3
logLeftPanel.Parent = tab2Frame

local logLeftCorner = Instance.new("UICorner")
logLeftCorner.CornerRadius = UDim.new(0.04, 0)
logLeftCorner.Parent = logLeftPanel

local logLeftLayout = Instance.new("UIListLayout")
logLeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
logLeftLayout.Padding = UDim.new(0, 4)
logLeftLayout.Parent = logLeftPanel

local logRightPanel = Instance.new("Frame")
logRightPanel.Size = UDim2.new(0.53, 0, 1, 0)
logRightPanel.Position = UDim2.new(0.47, 0, 0, 0)
logRightPanel.BackgroundTransparency = 1
logRightPanel.Parent = tab2Frame

local logCodeBox = Instance.new("TextBox")
logCodeBox.Size = UDim2.new(1, 0, 0.65, 0)
logCodeBox.Position = UDim2.new(0, 0, 0, 0)
logCodeBox.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
logCodeBox.TextColor3 = Color3.fromRGB(120, 220, 255)
logCodeBox.TextSize = 11
logCodeBox.Font = Enum.Font.Code
logCodeBox.ClearTextOnFocus = false
logCodeBox.MultiLine = true
logCodeBox.TextXAlignment = Enum.TextXAlignment.Left
logCodeBox.TextYAlignment = Enum.TextYAlignment.Top
logCodeBox.PlaceholderText = "-- Pilih log remote di kiri..."
logCodeBox.Parent = logRightPanel

local logCodeCorner = Instance.new("UICorner")
logCodeCorner.CornerRadius = UDim.new(0.04, 0)
logCodeCorner.Parent = logCodeBox

local logBtnFrame = Instance.new("Frame")
logBtnFrame.Size = UDim2.new(1, 0, 0.18, 0)
logBtnFrame.Position = UDim2.new(0, 0, 0.68, 0)
logBtnFrame.BackgroundTransparency = 1
logBtnFrame.Parent = logRightPanel

local logRunBtn = createMiniBtn(logBtnFrame, "RUN", 0, Color3.fromRGB(0, 170, 80))
local logCopyBtn = createMiniBtn(logBtnFrame, "COPY", 0.35, Color3.fromRGB(40, 120, 210))
local logClearBtn = createMiniBtn(logBtnFrame, "CLEAR", 0.7, Color3.fromRGB(180, 50, 50))

local logStatus = Instance.new("TextLabel")
logStatus.Size = UDim2.new(1, 0, 0.12, 0)
logStatus.Position = UDim2.new(0, 0, 0.88, 0)
logStatus.BackgroundTransparency = 1
logStatus.Text = "Status: Logger aktif mendengarkan..."
logStatus.TextColor3 = Color3.fromRGB(150, 150, 170)
logStatus.TextScaled = true
logStatus.Font = Enum.Font.Gotham
logStatus.TextXAlignment = Enum.TextXAlignment.Left
logStatus.Parent = logRightPanel


-- // TAB 3: GUI MANAGER //
local tab3Frame = Instance.new("Frame")
tab3Frame.Size = UDim2.new(1, 0, 1, 0)
tab3Frame.BackgroundTransparency = 1
tab3Frame.Visible = false
tab3Frame.Parent = contentContainer

local managerContainer = Instance.new("Frame")
managerContainer.Size = UDim2.new(0.8, 0, 0.6, 0)
managerContainer.Position = UDim2.new(0.1, 0, 0.2, 0)
managerContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
managerContainer.Parent = tab3Frame

local managerCorner = Instance.new("UICorner")
managerCorner.CornerRadius = UDim.new(0.05, 0)
managerCorner.Parent = managerContainer

local managerLayout = Instance.new("UIListLayout")
managerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
managerLayout.VerticalAlignment = Enum.VerticalAlignment.Center
managerLayout.SortOrder = Enum.SortOrder.LayoutOrder
managerLayout.Padding = UDim.new(0, 20)
managerLayout.Parent = managerContainer

local managerTitle = Instance.new("TextLabel")
managerTitle.Size = UDim2.new(0.9, 0, 0, 40)
managerTitle.BackgroundTransparency = 1
managerTitle.Text = "Kelola Semua GUI di PlayerGui"
managerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
managerTitle.TextScaled = true
managerTitle.Font = Enum.Font.GothamBold
managerTitle.Parent = managerContainer

local function createManagerBtn(text, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.8, 0, 0, 45)
    b.BackgroundColor3 = color
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold
    b.Parent = managerContainer
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0.2, 0)
    c.Parent = b
    return b
end

local showAllBtn = createManagerBtn("Buka (Show) Semua GUI", Color3.fromRGB(0, 170, 90))
local hideAllBtn = createManagerBtn("Tutup (Hide) Semua GUI", Color3.fromRGB(200, 50, 50))

local managerStatus = Instance.new("TextLabel")
managerStatus.Size = UDim2.new(0.90, 0, 0, 30)
managerStatus.BackgroundTransparency = 1
managerStatus.Text = "Status: Siap."
managerStatus.TextColor3 = Color3.fromRGB(150, 150, 170)
managerStatus.TextScaled = true
managerStatus.Font = Enum.Font.Gotham
managerStatus.Parent = managerContainer


-- // SISTEM NAVIGASI TAB //
local function switchTab(tabIndex)
    tab1Frame.Visible = (tabIndex == 1)
    tab2Frame.Visible = (tabIndex == 2)
    tab3Frame.Visible = (tabIndex == 3)
    
    tab1Btn.BackgroundColor3 = (tabIndex == 1) and Color3.fromRGB(0, 120, 210) or Color3.fromRGB(35, 35, 45)
    tab2Btn.BackgroundColor3 = (tabIndex == 2) and Color3.fromRGB(0, 120, 210) or Color3.fromRGB(35, 35, 45)
    tab3Btn.BackgroundColor3 = (tabIndex == 3) and Color3.fromRGB(0, 120, 210) or Color3.fromRGB(35, 35, 45)
end

tab1Btn.MouseButton1Click:Connect(function() switchTab(1) end)
tab2Btn.MouseButton1Click:Connect(function() switchTab(2) end)
tab3Btn.MouseButton1Click:Connect(function() switchTab(3) end)
switchTab(1) -- Default Tab 1


-- // FITUR TAB 1 (SCANNER) //
local function scanMapRemotes()
    for _, child in ipairs(scanLeftPanel:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    local count = 0
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            count += count
            local isEvent = obj:IsA("RemoteEvent")
            
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.96, 0, 0, 28)
            btn.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
            btn.Text = (isEvent and " [Event] " or " [Func] ") .. obj.Name
            btn.TextColor3 = isEvent and Color3.fromRGB(100, 210, 255) or Color3.fromRGB(255, 180, 80)
            btn.TextSize = 10
            btn.Font = Enum.Font.Gotham
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Parent = scanLeftPanel
            
            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(0.2, 0)
            c.Parent = btn

            local codeTemp = "local remote = " .. obj:GetFullName() .. "\n\n"
            if isEvent then
                codeTemp = codeTemp .. "remote:FireServer()"
            else
                codeTemp = codeTemp .. "local res = remote:InvokeServer()\nprint(res)"
            end

            btn.MouseButton1Click:Connect(function()
                scanCodeBox.Text = codeTemp
                scanStatus.Text = "Pilih: " .. obj.Name
            end)
        end
    end
    scanLeftPanel.CanvasSize = UDim2.new(0, 0, 0, scanLeftPanel.AbsoluteSize.Y + 50)
    scanStatus.Text = "Scan selesai."
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q = searchBox.Text:lower()
    for _, b in ipairs(scanLeftPanel:GetChildren()) do
        if b:IsA("TextButton") then
            b.Visible = (q == "" or b.Text:lower():find(q))
        end
    end
end)

scanRefreshBtn.MouseButton1Click:Connect(scanMapRemotes)
scanCopyBtn.MouseButton1Click:Connect(function()
    if scanCodeBox.Text ~= "" and setclipboard then
        setclipboard(scanCodeBox.Text)
        scanStatus.Text = "Disalin ke clipboard!"
    end
end)
scanRunBtn.MouseButton1Click:Connect(function()
    if scanCodeBox.Text ~= "" and loadstring then
        local fn, err = loadstring(scanCodeBox.Text)
        if fn then pcall(fn) scanStatus.Text = "Berhasil di-run!" else scanStatus.Text = "Error" end
    end
end)
scanMapRemotes()


-- // FITUR TAB 2 (LOGGER) //
local selectedLogRemote = nil
local function addLogEntry(remote, method, args)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.96, 0, 0, 28)
    btn.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
    btn.Text = " [" .. method:sub(1,1) .. "] " .. remote.Name
    btn.TextColor3 = method == "FireServer" and Color3.fromRGB(100, 210, 255) or Color3.fromRGB(255, 180, 80)
    btn.TextSize = 10
    btn.Font = Enum.Font.Gotham
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = logLeftPanel
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0.2, 0)
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
        logStatus.Text = "Log dipilih: " .. remote.Name
    end)
    logLeftPanel.CanvasSize = UDim2.new(0, 0, 0, logLeftPanel.AbsoluteSize.Y + 50)
end

logClearBtn.MouseButton1Click:Connect(function()
    for _, v in ipairs(logLeftPanel:GetChildren()) do
        if v:IsA("TextButton") then v:Destroy() end
    end
    logCodeBox.Text = ""
    logStatus.Text = "Log dibersihkan."
end)
logCopyBtn.MouseButton1Click:Connect(function()
    if logCodeBox.Text ~= "" and setclipboard then setclipboard(logCodeBox.Text) logStatus.Text = "Disalin!" end
end)
logRunBtn.MouseButton1Click:Connect(function()
    if logCodeBox.Text ~= "" and loadstring then
        local fn, err = loadstring(logCodeBox.Text)
        if fn then pcall(fn) logStatus.Text = "Berhasil di-run!" else logStatus.Text = "Error" end
    end
end)

-- Metatable Hooking Aman untuk Logger
pcall(function()
    if getrawmetatable and setreadonly then
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if (method == "FireServer" or method == "InvokeServer") and (self:IsA("RemoteEvent") or self:IsA("RemoteFunction")) then
                addLogEntry(self, method, {...})
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end
end)


-- // FITUR TAB 3 (GUI MANAGER) //
showAllBtn.MouseButton1Click:Connect(function()
    local count = 0
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui ~= screenGui then
            gui.Enabled = true
            count += 1
        end
    end
    managerStatus.Text = count .. " GUI diaktifkan (ditampilkan)."
end)

hideAllBtn.MouseButton1Click:Connect(function()
    local count = 0
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui ~= screenGui then
            gui.Enabled = false
            count += 1
        end
    end
    managerStatus.Text = count .. " GUI disembunyikan."
end)


-- // FUNGSI DRAGGABLE (Bisa Digeser di HP/PC) //
local function makeDraggable(frame, handle)
    local dragging, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    local function stopDrag(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end
    handle.InputEnded:Connect(stopDrag)
    UserInputService.TouchEnded:Connect(stopDrag)
end

makeDraggable(mainFrame, titleBar)
makeDraggable(toggleBtn, toggleBtn)

closeBtn.MouseButton1Click:Connect(function() mainFrame.Visible = false end)
toggleBtn.MouseButton1Click:Connect(function() mainFrame.Visible = not mainFrame.Visible end)
