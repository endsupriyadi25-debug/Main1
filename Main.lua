-- [[ Roblox Multi-Tool GUI - Simple & Clean Edition ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or CoreGui

if playerGui:FindFirstChild("SimpleMultiTool") then
    playerGui.SimpleMultiTool:Destroy()
end

-- ScreenGui Utama
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SimpleMultiTool"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Floating Toggle Button (Bisa digeser)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleBtn"
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0, 20, 0, 100)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
toggleBtn.Text = "MENU"
toggleBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
toggleBtn.TextSize = 11
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleBtn

-- Frame Utama
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 450, 0, 300)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
mainFrame.Visible = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

-- Title Bar (Bisa Digeser)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
titleBar.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Multi-Tool Utility"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 13
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0.5, -12)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 11
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeBtn

-- Tab Bar (Tombol Pindah Tab)
local tab1Btn = Instance.new("TextButton")
tab1Btn.Size = UDim2.new(0, 140, 0, 25)
tab1Btn.Position = UDim2.new(0, 10, 0, 42)
tab1Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
tab1Btn.Text = "1. Scanner"
tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
tab1Btn.TextSize = 11
tab1Btn.Font = Enum.Font.GothamBold
tab1Btn.Parent = mainFrame

local tab2Btn = Instance.new("TextButton")
tab2Btn.Size = UDim2.new(0, 140, 0, 25)
tab2Btn.Position = UDim2.new(0, 155, 0, 42)
tab2Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
tab2Btn.Text = "2. Logger"
tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
tab2Btn.TextSize = 11
tab2Btn.Font = Enum.Font.GothamBold
tab2Btn.Parent = mainFrame

local tab3Btn = Instance.new("TextButton")
tab3Btn.Size = UDim2.new(0, 130, 0, 25)
tab3Btn.Position = UDim2.new(0, 300, 0, 42)
tab3Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
tab3Btn.Text = "3. GUI Manager"
tab3Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
tab3Btn.TextSize = 11
tab3Btn.Font = Enum.Font.GothamBold
tab3Btn.Parent = mainFrame

-- Konten Tab 1 (Scanner)
local page1 = Instance.new("Frame")
page1.Size = UDim2.new(1, -20, 1, -85)
page1.Position = UDim2.new(0, 10, 0, 75)
page1.BackgroundTransparency = 1
page1.Visible = true
page1.Parent = mainFrame

local scanBox = Instance.new("TextBox")
scanBox.Size = UDim2.new(1, 0, 0, 130)
scanBox.Position = UDim2.new(0, 0, 0, 0)
scanBox.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scanBox.TextColor3 = Color3.fromRGB(120, 220, 255)
scanBox.TextSize = 11
scanBox.Font = Enum.Font.Code
scanBox.MultiLine = true
scanBox.PlaceholderText = "Tekan tombol Scan di bawah..."
scanBox.Parent = page1

local scanBtn = Instance.new("TextButton")
scanBtn.Size = UDim2.new(0, 120, 0, 30)
scanBtn.Position = UDim2.new(0, 0, 0, 140)
scanBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
scanBtn.Text = "Scan Remotes"
scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanBtn.TextSize = 11
scanBtn.Font = Enum.Font.GothamBold
scanBtn.Parent = page1

-- Konten Tab 2 (Logger)
local page2 = Instance.new("Frame")
page2.Size = UDim2.new(1, -20, 1, -85)
page2.Position = UDim2.new(0, 10, 0, 75)
page2.BackgroundTransparency = 1
page2.Visible = false
page2.Parent = mainFrame

local logLabel = Instance.new("TextLabel")
logLabel.Size = UDim2.new(1, 0, 0, 30)
logLabel.Position = UDim2.new(0, 0, 0, 10)
logLabel.BackgroundTransparency = 1
logLabel.Text = "Status Logger: Aktif mendengarkan remote."
logLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
logLabel.TextSize = 11
logLabel.Font = Enum.Font.Gotham
logLabel.Parent = page2

-- Konten Tab 3 (GUI Manager)
local page3 = Instance.new("Frame")
page3.Size = UDim2.new(1, -20, 1, -85)
page3.Position = UDim2.new(0, 10, 0, 75)
page3.BackgroundTransparency = 1
page3.Visible = false
page3.Parent = mainFrame

local showBtn = Instance.new("TextButton")
showBtn.Size = UDim2.new(0, 200, 0, 35)
showBtn.Position = UDim2.new(0.5, -100, 0, 30)
showBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
showBtn.Text = "Buka (Show) Semua GUI"
showBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
showBtn.TextSize = 11
showBtn.Font = Enum.Font.GothamBold
showBtn.Parent = page3

local hideBtn = Instance.new("TextButton")
hideBtn.Size = UDim2.new(0, 200, 0, 35)
hideBtn.Position = UDim2.new(0.5, -100, 0, 80)
hideBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
hideBtn.Text = "Tutup (Hide) Semua GUI"
hideBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
hideBtn.TextSize = 11
hideBtn.Font = Enum.Font.GothamBold
hideBtn.Parent = page3

-- Navigasi Antar Tab
tab1Btn.MouseButton1Click:Connect(function()
    page1.Visible = true; page2.Visible = false; page3.Visible = false
    tab1Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    tab3Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
end)

tab2Btn.MouseButton1Click:Connect(function()
    page1.Visible = false; page2.Visible = true; page3.Visible = false
    tab1Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
    tab3Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
end)

tab3Btn.MouseButton1Click:Connect(function()
    page1.Visible = false; page2.Visible = false; page3.Visible = true
    tab1Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    tab3Btn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
end)

-- Tombol Aksi Tab 1
scanBtn.MouseButton1Click:Connect(function()
    local text = "Daftar Remote di Map:\n"
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            text = text .. "- " .. obj.Name .. "\n"
        end
    end
    scanBox.Text = text
end)

-- Tombol Aksi Tab 3
showBtn.MouseButton1Click:Connect(function()
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui ~= screenGui then
            gui.Enabled = true
        end
    end
end)

hideBtn.MouseButton1Click:Connect(function()
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui ~= screenGui then
            gui.Enabled = false
        end
    end
end)

-- Tombol Buka/Tutup & Geser (Draggable)
closeBtn.MouseButton1Click:Connect(function() mainFrame.Visible = false end)
toggleBtn.MouseButton1Click:Connect(function() mainFrame.Visible = not mainFrame.Visible end)

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
