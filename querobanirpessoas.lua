local SCRIPT_FILENAME = "TargetHunter.lua"
local CONFIG_FILENAME = "TargetHunter_Config.json"

local scriptContent = [==[
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local requestFunc = request or http_request or (syn and syn.request) or (http and http.request)
local queueTeleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)

local CONFIG_FILE = "TargetHunter_Config.json"
local SCRIPT_FILE = "TargetHunter.lua"

local MIN_FREE_SLOTS = 1
local MAX_SEARCH_PAGES = 12

local CURRENT_GAME_ID = game.PlaceId

local placeDetailsCache = {}
local function getPlaceDetails(pId)
    pId = tonumber(pId) or CURRENT_GAME_ID
    if placeDetailsCache[pId] then
        return placeDetailsCache[pId].Name, placeDetailsCache[pId].Icon
    end

    local title = "Place #" .. tostring(pId)
    local thumb = "rbxthumb://type=GameIcon&id=" .. tostring(pId) .. "&w=150&h=150"

    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(pId)
    end)

    if success and info and info.Name then
        title = info.Name
        if info.IconImageAssetId and info.IconImageAssetId > 0 then
            thumb = "rbxassetid://" .. tostring(info.IconImageAssetId)
        end
    end

    placeDetailsCache[pId] = { Name = title, Icon = thumb }
    return title, thumb
end

local function setClip(text)
    if setclipboard then
        setclipboard(text)
    elseif toclipboard then
        toclipboard(text)
    elseif syn and syn.write_clipboard then
        syn.write_clipboard(text)
    end
end

local state = {
    Active = false,
    PlaceId = CURRENT_GAME_ID,
    PlacePresets = { CURRENT_GAME_ID },
    Keywords = { "yt", "ttk", "ttv" },
    VisitedJobIdsByPlace = {},
    SavedTargets = {}
}

local function saveState()
    if writefile then
        pcall(function()
            writefile(CONFIG_FILE, HttpService:JSONEncode(state))
        end)
    end
end

local function loadState()
    if isfile and readfile and isfile(CONFIG_FILE) then
        local success, result = pcall(function()
            return HttpService:JSONDecode(readfile(CONFIG_FILE))
        end)
        if success and type(result) == "table" then
            state.Active = result.Active or false
            state.PlaceId = tonumber(result.PlaceId) or CURRENT_GAME_ID
            state.PlacePresets = result.PlacePresets or { CURRENT_GAME_ID }
            state.Keywords = result.Keywords or { "yt", "ttk", "ttv" }
            state.SavedTargets = result.SavedTargets or {}
            state.VisitedJobIdsByPlace = result.VisitedJobIdsByPlace or {}
        end
    end
end

loadState()

local presetExists = false
for _, id in ipairs(state.PlacePresets) do
    if id == CURRENT_GAME_ID then
        presetExists = true
        break
    end
end
if not presetExists then
    table.insert(state.PlacePresets, 1, CURRENT_GAME_ID)
    saveState()
end

local currentPlaceKey = tostring(CURRENT_GAME_ID)
state.VisitedJobIdsByPlace[currentPlaceKey] = state.VisitedJobIdsByPlace[currentPlaceKey] or {}

local currentJob = game.JobId
if currentJob and currentJob ~= "" then
    state.VisitedJobIdsByPlace[currentPlaceKey][currentJob] = true
    saveState()
end

local function countVisited(placeId)
    local targetKey = tostring(placeId or state.PlaceId or CURRENT_GAME_ID)
    local bucket = state.VisitedJobIdsByPlace[targetKey]
    if not bucket then return 0 end
    local count = 0
    for _ in pairs(bucket) do count = count + 1 end
    return count
end

if CoreGui:FindFirstChild("TargetHunterUI") then
    CoreGui.TargetHunterUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TargetHunterUI"
ScreenGui.ResetOnSpawn = false

pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 570)
MainFrame.Position = UDim2.new(0.5, -190, 0.13, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(13, 14, 21)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(38, 42, 64)
MainStroke.Thickness = 1.4
MainStroke.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 44)
Header.BackgroundColor3 = Color3.fromRGB(19, 21, 32)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderStroke = Instance.new("UIStroke")
HeaderStroke.Color = Color3.fromRGB(30, 34, 52)
HeaderStroke.Thickness = 1
HeaderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
HeaderStroke.Parent = Header

local TitleIcon = Instance.new("Frame")
TitleIcon.Size = UDim2.new(0, 8, 0, 8)
TitleIcon.Position = UDim2.new(0, 14, 0.5, -4)
TitleIcon.BackgroundColor3 = Color3.fromRGB(114, 135, 253)
TitleIcon.BorderSizePixel = 0
TitleIcon.Parent = Header

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = TitleIcon

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 30, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "Target Hunter • Suite"
Title.TextColor3 = Color3.fromRGB(240, 243, 255)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local ServerPill = Instance.new("TextLabel")
ServerPill.Size = UDim2.new(0, 80, 0, 22)
ServerPill.Position = UDim2.new(1, -92, 0.5, -11)
ServerPill.BackgroundColor3 = Color3.fromRGB(26, 29, 44)
ServerPill.Font = Enum.Font.Code
ServerPill.Text = "SRV: " .. (currentJob ~= "" and currentJob:sub(1, 4) or "LOC")
ServerPill.TextColor3 = Color3.fromRGB(140, 150, 190)
ServerPill.TextSize = 10
ServerPill.Parent = Header

local PillCorner = Instance.new("UICorner")
PillCorner.CornerRadius = UDim.new(0, 5)
PillCorner.Parent = ServerPill

local ActiveGameCard = Instance.new("Frame")
ActiveGameCard.Size = UDim2.new(1, -24, 0, 72)
ActiveGameCard.Position = UDim2.new(0, 12, 0, 52)
ActiveGameCard.BackgroundColor3 = Color3.fromRGB(19, 21, 33)
ActiveGameCard.BorderSizePixel = 0
ActiveGameCard.Parent = MainFrame

local ActiveGameCorner = Instance.new("UICorner")
ActiveGameCorner.CornerRadius = UDim.new(0, 8)
ActiveGameCorner.Parent = ActiveGameCard

local ActiveGameStroke = Instance.new("UIStroke")
ActiveGameStroke.Color = Color3.fromRGB(34, 38, 60)
ActiveGameStroke.Thickness = 1
ActiveGameStroke.Parent = ActiveGameCard

local ActiveGameThumb = Instance.new("ImageLabel")
ActiveGameThumb.Size = UDim2.new(0, 54, 0, 54)
ActiveGameThumb.Position = UDim2.new(0, 9, 0, 9)
ActiveGameThumb.BackgroundColor3 = Color3.fromRGB(13, 14, 21)
ActiveGameThumb.BorderSizePixel = 0
ActiveGameThumb.ScaleType = Enum.ScaleType.Crop
ActiveGameThumb.Parent = ActiveGameCard

local ThumbCorner = Instance.new("UICorner")
ThumbCorner.CornerRadius = UDim.new(0, 6)
ThumbCorner.Parent = ActiveGameThumb

local ActiveGameTitle = Instance.new("TextLabel")
ActiveGameTitle.Size = UDim2.new(1, -74, 0, 18)
ActiveGameTitle.Position = UDim2.new(0, 72, 0, 8)
ActiveGameTitle.BackgroundTransparency = 1
ActiveGameTitle.Font = Enum.Font.GothamBold
ActiveGameTitle.TextColor3 = Color3.fromRGB(240, 245, 255)
ActiveGameTitle.TextSize = 11.5
ActiveGameTitle.TextXAlignment = Enum.TextXAlignment.Left
ActiveGameTitle.TextTruncate = Enum.TextTruncate.AtEnd
ActiveGameTitle.Parent = ActiveGameCard

local PlaceInput = Instance.new("TextBox")
PlaceInput.Size = UDim2.new(0.52, -4, 0, 26)
PlaceInput.Position = UDim2.new(0, 72, 0, 36)
PlaceInput.BackgroundColor3 = Color3.fromRGB(26, 29, 46)
PlaceInput.TextColor3 = Color3.fromRGB(120, 210, 255)
PlaceInput.PlaceholderText = tostring(CURRENT_GAME_ID)
PlaceInput.PlaceholderColor3 = Color3.fromRGB(90, 95, 120)
PlaceInput.Text = tostring(state.PlaceId)
PlaceInput.Font = Enum.Font.Code
PlaceInput.TextSize = 10.5
PlaceInput.ClearTextOnFocus = false
PlaceInput.Parent = ActiveGameCard

local PlaceInputCorner = Instance.new("UICorner")
PlaceInputCorner.CornerRadius = UDim.new(0, 5)
PlaceInputCorner.Parent = PlaceInput

local TagsInput = Instance.new("TextBox")
TagsInput.Size = UDim2.new(0.48, -8, 0, 26)
TagsInput.Position = UDim2.new(0.52, 74, 0, 36)
TagsInput.BackgroundColor3 = Color3.fromRGB(26, 29, 46)
TagsInput.TextColor3 = Color3.fromRGB(245, 245, 255)
TagsInput.PlaceholderText = "yt, ttk, ttv"
TagsInput.PlaceholderColor3 = Color3.fromRGB(90, 95, 120)
TagsInput.Text = table.concat(state.Keywords, ", ")
TagsInput.Font = Enum.Font.GothamMedium
TagsInput.TextSize = 10.5
TagsInput.ClearTextOnFocus = false
TagsInput.Parent = ActiveGameCard

local TagsInputCorner = Instance.new("UICorner")
TagsInputCorner.CornerRadius = UDim.new(0, 5)
TagsInputCorner.Parent = TagsInput

local PresetsScroll = Instance.new("ScrollingFrame")
PresetsScroll.Size = UDim2.new(1, -24, 0, 26)
PresetsScroll.Position = UDim2.new(0, 12, 0, 130)
PresetsScroll.BackgroundTransparency = 1
PresetsScroll.BorderSizePixel = 0
PresetsScroll.ScrollBarThickness = 0
PresetsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PresetsScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
PresetsScroll.Parent = MainFrame

local PresetsLayout = Instance.new("UIListLayout")
PresetsLayout.FillDirection = Enum.FillDirection.Horizontal
PresetsLayout.Padding = UDim.new(0, 6)
PresetsLayout.Parent = PresetsScroll

local function updateActiveGameBanner()
    local title, icon = getPlaceDetails(state.PlaceId)
    ActiveGameTitle.Text = title
    ActiveGameThumb.Image = icon
    PlaceInput.Text = tostring(state.PlaceId)
end

local function renderPresets()
    for _, child in ipairs(PresetsScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    for _, pId in ipairs(state.PlacePresets) do
        local btn = Instance.new("TextButton")
        local isSelected = (pId == state.PlaceId)
        local isCurrent = (pId == CURRENT_GAME_ID)

        btn.Size = UDim2.new(0, 0, 1, 0)
        btn.AutomaticSize = Enum.AutomaticSize.X
        btn.BackgroundColor3 = isSelected and Color3.fromRGB(50, 75, 150) or Color3.fromRGB(22, 25, 38)
        btn.Font = Enum.Font.Code
        btn.Text = string.format("  %s%s  ", tostring(pId), isCurrent and " (Atual)" or "")
        btn.TextColor3 = isSelected and Color3.fromRGB(240, 245, 255) or (isCurrent and Color3.fromRGB(120, 220, 160) or Color3.fromRGB(150, 155, 180))
        btn.TextSize = 10
        btn.Parent = PresetsScroll

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 5)
        corner.Parent = btn

        local stroke = Instance.new("UIStroke")
        stroke.Color = isSelected and Color3.fromRGB(100, 140, 255) or Color3.fromRGB(34, 38, 58)
        stroke.Thickness = 1
        stroke.Parent = btn

        btn.MouseButton1Click:Connect(function()
            state.PlaceId = pId
            saveState()
            updateActiveGameBanner()
            renderPresets()
        end)
    end
end

renderPresets()
updateActiveGameBanner()

local TargetHeader = Instance.new("Frame")
TargetHeader.Size = UDim2.new(1, -24, 0, 20)
TargetHeader.Position = UDim2.new(0, 12, 0, 162)
TargetHeader.BackgroundTransparency = 1
TargetHeader.Parent = MainFrame

local TargetListTitle = Instance.new("TextLabel")
TargetListTitle.Size = UDim2.new(0.65, 0, 1, 0)
TargetListTitle.BackgroundTransparency = 1
TargetListTitle.Font = Enum.Font.GothamBold
TargetListTitle.Text = string.format("ALVOS (%d) • HOP: %d", #state.SavedTargets, countVisited(state.PlaceId))
TargetListTitle.TextColor3 = Color3.fromRGB(140, 145, 175)
TargetListTitle.TextSize = 10
TargetListTitle.TextXAlignment = Enum.TextXAlignment.Left
TargetListTitle.Parent = TargetHeader

local ClearTargetsBtn = Instance.new("TextButton")
ClearTargetsBtn.Size = UDim2.new(0.35, 0, 1, 0)
ClearTargetsBtn.Position = UDim2.new(0.65, 0, 0, 0)
ClearTargetsBtn.BackgroundTransparency = 1
ClearTargetsBtn.Font = Enum.Font.GothamMedium
ClearTargetsBtn.Text = "Limpar Tudo"
ClearTargetsBtn.TextColor3 = Color3.fromRGB(240, 110, 110)
ClearTargetsBtn.TextSize = 10
ClearTargetsBtn.TextXAlignment = Enum.TextXAlignment.Right
ClearTargetsBtn.Parent = TargetHeader

local TargetsScroll = Instance.new("ScrollingFrame")
TargetsScroll.Size = UDim2.new(1, -24, 0, 298)
TargetsScroll.Position = UDim2.new(0, 12, 0, 186)
TargetsScroll.BackgroundColor3 = Color3.fromRGB(17, 18, 28)
TargetsScroll.BorderSizePixel = 0
TargetsScroll.ScrollBarThickness = 3
TargetsScroll.ScrollBarImageColor3 = Color3.fromRGB(65, 70, 100)
TargetsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
TargetsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
TargetsScroll.Parent = MainFrame

local TargetsScrollCorner = Instance.new("UICorner")
TargetsScrollCorner.CornerRadius = UDim.new(0, 8)
TargetsScrollCorner.Parent = TargetsScroll

local TargetsScrollStroke = Instance.new("UIStroke")
TargetsScrollStroke.Color = Color3.fromRGB(26, 29, 44)
TargetsScrollStroke.Thickness = 1
TargetsScrollStroke.Parent = TargetsScroll

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 6)
ListLayout.Parent = TargetsScroll

local ListPadding = Instance.new("UIPadding")
ListPadding.PaddingTop = UDim.new(0, 6)
ListPadding.PaddingBottom = UDim.new(0, 6)
ListPadding.PaddingLeft = UDim.new(0, 6)
ListPadding.PaddingRight = UDim.new(0, 6)
ListPadding.Parent = TargetsScroll

local function onPlaceInputChanged()
    local cleaned = PlaceInput.Text:gsub("%D", "")
    local num = tonumber(cleaned)
    if num and num > 0 then
        state.PlaceId = num
        local exists = false
        for _, id in ipairs(state.PlacePresets) do
            if id == num then exists = true; break end
        end
        if not exists then
            table.insert(state.PlacePresets, 1, num)
            if #state.PlacePresets > 10 then table.remove(state.PlacePresets) end
        end
        saveState()
        updateActiveGameBanner()
        renderPresets()
        TargetListTitle.Text = string.format("ALVOS (%d) • HOP: %d", #state.SavedTargets, countVisited(state.PlaceId))
    end
end

PlaceInput:GetPropertyChangedSignal("Text"):Connect(onPlaceInputChanged)
PlaceInput.FocusLost:Connect(function()
    PlaceInput.Text = tostring(state.PlaceId)
end)

local queueReinject = nil

local function renderCard(data)
    local hasNickChange = data.changedNick and data.previousUsername and data.previousUsername ~= ""
    local cardHeight = hasNickChange and 88 or 74

    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, cardHeight)
    card.BackgroundColor3 = Color3.fromRGB(22, 24, 37)
    card.BorderSizePixel = 0
    card.Parent = TargetsScroll

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 7)
    cardCorner.Parent = card

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = Color3.fromRGB(34, 38, 60)
    cardStroke.Thickness = 1
    cardStroke.Parent = card

    local gameThumb = Instance.new("ImageLabel")
    gameThumb.Size = UDim2.new(0, 44, 0, 44)
    gameThumb.Position = UDim2.new(0, 8, 0, 8)
    gameThumb.BackgroundColor3 = Color3.fromRGB(14, 15, 23)
    gameThumb.BorderSizePixel = 0
    gameThumb.ScaleType = Enum.ScaleType.Crop
    gameThumb.Image = data.placeIcon or ("rbxthumb://type=GameIcon&id=" .. tostring(data.placeId or CURRENT_GAME_ID) .. "&w=150&h=150")
    gameThumb.Parent = card

    local thumbCorner = Instance.new("UICorner")
    thumbCorner.CornerRadius = UDim.new(0, 5)
    thumbCorner.Parent = gameThumb

    local tagBadge = Instance.new("TextLabel")
    tagBadge.Size = UDim2.new(0, 44, 0, 15)
    tagBadge.Position = UDim2.new(0, 8, 0, 54)
    tagBadge.BackgroundColor3 = Color3.fromRGB(38, 44, 72)
    tagBadge.Font = Enum.Font.GothamBold
    tagBadge.Text = data.tag
    tagBadge.TextColor3 = Color3.fromRGB(120, 205, 255)
    tagBadge.TextSize = 8.5
    tagBadge.Parent = card

    local badgeCorner = Instance.new("UICorner")
    badgeCorner.CornerRadius = UDim.new(0, 3)
    badgeCorner.Parent = tagBadge

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -195, 0, 16)
    nameLabel.Position = UDim2.new(0, 58, 0, 6)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = (hasNickChange and "[NOVO NICK] " or "") .. data.displayName .. " (@" .. data.currentUsername .. ")"
    nameLabel.TextColor3 = hasNickChange and Color3.fromRGB(120, 240, 170) or Color3.fromRGB(240, 245, 255)
    nameLabel.TextSize = 10.5
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.Parent = card

    local currY = 23

    if hasNickChange then
        local oldNickLabel = Instance.new("TextLabel")
        oldNickLabel.Size = UDim2.new(1, -195, 0, 14)
        oldNickLabel.Position = UDim2.new(0, 58, 0, currY)
        oldNickLabel.BackgroundTransparency = 1
        oldNickLabel.Font = Enum.Font.GothamMedium
        oldNickLabel.Text = "↺ Antigo: @" .. data.previousUsername
        oldNickLabel.TextColor3 = Color3.fromRGB(245, 185, 75)
        oldNickLabel.TextSize = 9.5
        oldNickLabel.TextXAlignment = Enum.TextXAlignment.Left
        oldNickLabel.TextTruncate = Enum.TextTruncate.AtEnd
        oldNickLabel.Parent = card
        currY = currY + 15
    end

    local gameNameLabel = Instance.new("TextLabel")
    gameNameLabel.Size = UDim2.new(1, -195, 0, 14)
    gameNameLabel.Position = UDim2.new(0, 58, 0, currY)
    gameNameLabel.BackgroundTransparency = 1
    gameNameLabel.Font = Enum.Font.GothamMedium
    gameNameLabel.Text = string.format("🎮 %s (%s)", data.placeTitle or "Jogo", tostring(data.placeId or CURRENT_GAME_ID))
    gameNameLabel.TextColor3 = Color3.fromRGB(130, 215, 200)
    gameNameLabel.TextSize = 9
    gameNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    gameNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    gameNameLabel.Parent = card

    currY = currY + 15

    local serverInfo = Instance.new("TextLabel")
    serverInfo.Size = UDim2.new(1, -16, 0, 13)
    serverInfo.Position = UDim2.new(0, 58, 0, currY)
    serverInfo.BackgroundTransparency = 1
    serverInfo.Font = Enum.Font.Code
    serverInfo.Text = string.format("Job: %s • %s", (data.jobId and data.jobId:sub(1, 10) .. "..." or "N/A"), data.seenAt or "Agora")
    serverInfo.TextColor3 = Color3.fromRGB(110, 115, 140)
    serverInfo.TextSize = 8.5
    serverInfo.TextXAlignment = Enum.TextXAlignment.Left
    serverInfo.Parent = card

    local joinBtn = Instance.new("TextButton")
    joinBtn.Size = UDim2.new(0, 58, 0, 26)
    joinBtn.Position = UDim2.new(1, -130, 0, 8)
    joinBtn.BackgroundColor3 = Color3.fromRGB(48, 56, 90)
    joinBtn.Font = Enum.Font.GothamBold
    joinBtn.Text = "Entrar"
    joinBtn.TextColor3 = Color3.fromRGB(210, 225, 255)
    joinBtn.TextSize = 10
    joinBtn.Parent = card

    local joinCorner = Instance.new("UICorner")
    joinCorner.CornerRadius = UDim.new(0, 5)
    joinCorner.Parent = joinBtn

    if data.jobId == game.JobId then
        joinBtn.Text = "Atual"
        joinBtn.BackgroundColor3 = Color3.fromRGB(28, 56, 42)
        joinBtn.TextColor3 = Color3.fromRGB(100, 240, 140)
    else
        joinBtn.MouseButton1Click:Connect(function()
            if not data.jobId or data.jobId == "" then return end
            joinBtn.Text = "Indo..."
            joinBtn.TextColor3 = Color3.fromRGB(255, 210, 100)
            if queueReinject then queueReinject() end
            task.wait(0.2)
            TeleportService:TeleportToPlaceInstance(data.placeId or state.PlaceId or CURRENT_GAME_ID, data.jobId, LocalPlayer)
        end)
    end

    local copyBtn = Instance.new("TextButton")
    copyBtn.Size = UDim2.new(0, 58, 0, 26)
    copyBtn.Position = UDim2.new(1, -66, 0, 8)
    copyBtn.BackgroundColor3 = Color3.fromRGB(34, 38, 58)
    copyBtn.Font = Enum.Font.GothamBold
    copyBtn.Text = "Copiar"
    copyBtn.TextColor3 = Color3.fromRGB(220, 225, 245)
    copyBtn.TextSize = 10
    copyBtn.Parent = card

    local copyBtnCorner = Instance.new("UICorner")
    copyBtnCorner.CornerRadius = UDim.new(0, 5)
    copyBtnCorner.Parent = copyBtn

    copyBtn.MouseButton1Click:Connect(function()
        setClip(data.currentUsername)
        copyBtn.Text = "Copiado!"
        copyBtn.TextColor3 = Color3.fromRGB(100, 240, 140)
        copyBtn.BackgroundColor3 = Color3.fromRGB(28, 52, 42)
        task.delay(1.5, function()
            if copyBtn and copyBtn.Parent then
                copyBtn.Text = "Copiar"
                copyBtn.TextColor3 = Color3.fromRGB(220, 225, 245)
                copyBtn.BackgroundColor3 = Color3.fromRGB(34, 38, 58)
            end
        end)
    end)
end

local function refreshTargetsDisplay()
    for _, child in ipairs(TargetsScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    for _, target in ipairs(state.SavedTargets) do
        renderCard(target)
    end
    TargetListTitle.Text = string.format("ALVOS (%d) • HOP: %d", #state.SavedTargets, countVisited(state.PlaceId))
end
refreshTargetsDisplay()

ClearTargetsBtn.MouseButton1Click:Connect(function()
    state.SavedTargets = {}
    saveState()
    refreshTargetsDisplay()
end)

local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, -24, 0, 24)
StatusFrame.Position = UDim2.new(0, 12, 0, 490)
StatusFrame.BackgroundTransparency = 1
StatusFrame.Parent = MainFrame

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 6, 0, 6)
StatusDot.Position = UDim2.new(0, 2, 0.5, -3)
StatusDot.BackgroundColor3 = state.Active and Color3.fromRGB(100, 240, 140) or Color3.fromRGB(130, 135, 160)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = StatusFrame

local StatusDotCorner = Instance.new("UICorner")
StatusDotCorner.CornerRadius = UDim.new(1, 0)
StatusDotCorner.Parent = StatusDot

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -16, 1, 0)
StatusLabel.Position = UDim2.new(0, 16, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = state.Active and "Varredura contínua ativa..." or "Aguardando início..."
StatusLabel.TextColor3 = state.Active and Color3.fromRGB(110, 210, 255) or Color3.fromRGB(150, 155, 180)
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.TextTruncate = Enum.TextTruncate.AtEnd
StatusLabel.Parent = StatusFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(1, -24, 0, 42)
ToggleButton.Position = UDim2.new(0, 12, 0, 516)
ToggleButton.BackgroundColor3 = state.Active and Color3.fromRGB(225, 65, 75) or Color3.fromRGB(85, 105, 235)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = state.Active and "Parar Varredura" or "Iniciar Varredura & Hop"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 13
ToggleButton.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

local function parseKeywords(inputString)
    local list = {}
    for item in string.gmatch(inputString, "[^,]+") do
        local cleaned = item:match("^%s*(.-)%s*$"):lower()
        if #cleaned > 0 then table.insert(list, cleaned) end
    end
    return list
end

local function scanPlayers()
    local matched = {}
    local currentTitle, currentThumb = getPlaceDetails(game.PlaceId)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local username = player.Name:lower()
            local display = player.DisplayName:lower()

            for _, tag in ipairs(state.Keywords) do
                if string.find(username, tag, 1, true) or string.find(display, tag, 1, true) then
                    table.insert(matched, {
                        userId = player.UserId,
                        displayName = player.DisplayName,
                        currentUsername = player.Name,
                        tag = tag:upper(),
                        jobId = game.JobId,
                        placeId = game.PlaceId,
                        placeTitle = currentTitle,
                        placeIcon = currentThumb,
                        seenAt = os.date("%H:%M:%S")
                    })
                    break
                end
            end
        end
    end
    return matched
end

queueReinject = function()
    if queueTeleport then
        queueTeleport([[
            repeat task.wait() until game:IsLoaded()
            task.wait(0.8)
            if isfile and isfile("TargetHunter.lua") then
                loadstring(readfile("TargetHunter.lua"))()
            end
        ]])
    end
end

local function rawGet(url)
    if requestFunc then
        local res = requestFunc({Url = url, Method = "GET"})
        if res and res.Body then return res.Body end
    end
    local ok, res = pcall(function() return game:HttpGet(url) end)
    if ok then return res end
    return nil
end

local isHopping = false
local function hopToUniqueServer()
    if isHopping then return end
    isHopping = true

    local targetPlaceId = state.PlaceId or CURRENT_GAME_ID
    state.PlaceId = targetPlaceId

    local placeKey = tostring(targetPlaceId)
    state.VisitedJobIdsByPlace[placeKey] = state.VisitedJobIdsByPlace[placeKey] or {}
    saveState()

    task.spawn(function()
        local candidate = nil
        local cursor = nil
        local page = 0

        while not candidate and page < MAX_SEARCH_PAGES do
            page = page + 1
            StatusDot.BackgroundColor3 = Color3.fromRGB(245, 185, 65)
            StatusLabel.TextColor3 = Color3.fromRGB(245, 185, 65)
            StatusLabel.Text = string.format("[%s] Pág. %d buscando JobId...", tostring(targetPlaceId):sub(1, 8), page)

            local url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100%s", tostring(targetPlaceId), cursor and ("&cursor=" .. cursor) or "")
            local body = rawGet(url)

            if body then
                local success, data = pcall(function() return HttpService:JSONDecode(body) end)
                if success and data and data.data then
                    local freshServers = {}

                    for _, srv in ipairs(data.data) do
                        local srvId = tostring(srv.id)
                        local freeSlots = (srv.maxPlayers or 0) - (srv.playing or 0)
                        local isSelf = (srvId == game.JobId and targetPlaceId == game.PlaceId)
                        local alreadyVisited = (state.VisitedJobIdsByPlace[placeKey][srvId] == true)

                        if not isSelf and not alreadyVisited and freeSlots >= MIN_FREE_SLOTS and srv.playing >= 1 then
                            table.insert(freshServers, srvId)
                        end
                    end

                    if #freshServers > 0 then
                        candidate = freshServers[math.random(1, #freshServers)]
                        break
                    end

                    cursor = data.nextPageCursor
                    if not cursor or cursor == "" then break end
                else
                    break
                end
            else
                break
            end
            task.wait(0.2)
        end

        if candidate then
            state.VisitedJobIdsByPlace[placeKey][candidate] = true
            saveState()

            StatusDot.BackgroundColor3 = Color3.fromRGB(100, 240, 140)
            StatusLabel.TextColor3 = Color3.fromRGB(100, 240, 140)
            StatusLabel.Text = "Saltando: " .. candidate:sub(1, 10) .. "..."
            queueReinject()

            TeleportService:TeleportToPlaceInstance(targetPlaceId, candidate, LocalPlayer)
        else
            StatusDot.BackgroundColor3 = Color3.fromRGB(240, 140, 90)
            StatusLabel.TextColor3 = Color3.fromRGB(240, 140, 90)
            StatusLabel.Text = "Resetando instâncias visitadas do mapa..."
            state.VisitedJobIdsByPlace[placeKey] = {}
            if game.PlaceId == targetPlaceId and currentJob and currentJob ~= "" then
                state.VisitedJobIdsByPlace[placeKey][currentJob] = true
            end
            saveState()

            task.wait(2)
            isHopping = false
            if state.Active then
                hopToUniqueServer()
            end
        end
    end)
end

local function runSearchPipeline()
    if not state.Active then return end

    if state.PlaceId ~= game.PlaceId then
        StatusDot.BackgroundColor3 = Color3.fromRGB(255, 200, 80)
        StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 80)
        StatusLabel.Text = "Indo para o Place ID alvo: " .. tostring(state.PlaceId) .. "..."
        task.wait(0.8)
        hopToUniqueServer()
        return
    end

    StatusDot.BackgroundColor3 = Color3.fromRGB(100, 210, 255)
    StatusLabel.TextColor3 = Color3.fromRGB(100, 210, 255)
    StatusLabel.Text = "Varrendo jogadores do servidor..."
    task.wait(1.2)

    local found = scanPlayers()
    if #found > 0 then
        for _, item in ipairs(found) do
            local foundIndex = nil

            for idx, existing in ipairs(state.SavedTargets) do
                if (item.userId and existing.userId and existing.userId == item.userId) or (existing.currentUsername:lower() == item.currentUsername:lower()) then
                    foundIndex = idx
                    break
                end
            end

            if foundIndex then
                local existing = state.SavedTargets[foundIndex]
                if existing.currentUsername ~= item.currentUsername then
                    item.previousUsername = existing.currentUsername
                    item.changedNick = true
                else
                    item.previousUsername = existing.previousUsername
                    item.changedNick = existing.changedNick
                end
                state.SavedTargets[foundIndex] = item
            else
                item.changedNick = false
                table.insert(state.SavedTargets, 1, item)
            end
        end

        saveState()
        refreshTargetsDisplay()

        StatusDot.BackgroundColor3 = Color3.fromRGB(100, 240, 140)
        StatusLabel.TextColor3 = Color3.fromRGB(100, 240, 140)
        StatusLabel.Text = string.format("Detectado: @%s! Saltando em 2s...", found[1].currentUsername)

        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "Target Hunter",
                Text = "Alvo: @" .. found[1].currentUsername .. (found[1].changedNick and " (Nick Alterado!)" or ""),
                Duration = 5
            })
        end)

        task.wait(2)
    else
        StatusDot.BackgroundColor3 = Color3.fromRGB(240, 120, 120)
        StatusLabel.TextColor3 = Color3.fromRGB(240, 120, 120)
        StatusLabel.Text = "Nenhum alvo. Buscando próximo JobId..."
        task.wait(0.6)
    end

    if state.Active then
        hopToUniqueServer()
    end
end

TeleportService.TeleportInitFailed:Connect(function(player, result, err)
    if player == LocalPlayer and state.Active then
        isHopping = false
        StatusDot.BackgroundColor3 = Color3.fromRGB(240, 100, 100)
        StatusLabel.TextColor3 = Color3.fromRGB(240, 100, 100)
        StatusLabel.Text = "Falha no teleporte. Tentando outro JobId..."
        task.wait(1)
        hopToUniqueServer()
    end
end)

ToggleButton.MouseButton1Click:Connect(function()
    state.Active = not state.Active

    if state.Active then
        onPlaceInputChanged()
        state.Keywords = parseKeywords(TagsInput.Text)
        if #state.Keywords == 0 then
            state.Keywords = { "yt", "ttk", "ttv" }
            TagsInput.Text = "yt, ttk, ttv"
        end

        saveState()
        ToggleButton.Text = "Parar Varredura"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(225, 65, 75)
        runSearchPipeline()
    else
        saveState()
        ToggleButton.Text = "Iniciar Varredura & Hop"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(85, 105, 235)
        StatusDot.BackgroundColor3 = Color3.fromRGB(130, 135, 160)
        StatusLabel.TextColor3 = Color3.fromRGB(150, 155, 180)
        StatusLabel.Text = "Varredura pausada."
    end
end)

if state.Active then
    task.spawn(runSearchPipeline)
end
]==]

if writefile then
    writefile(SCRIPT_FILENAME, scriptContent)
end

loadstring(scriptContent)()
