-- Mizu Hub

local players = game:GetService('Players')
local httpService = game:GetService('HttpService')
local userInputService = game:GetService('UserInputService')
local runService = game:GetService('RunService')
local workspaceService = game:GetService('Workspace')
local replicatedStorage = game:GetService('ReplicatedStorage')
local collectionService = game:GetService('CollectionService')
local teleportService = game:GetService('TeleportService')
local lighting = game:GetService('Lighting')
local statsService = game:GetService('Stats')
local tweenService = game:GetService('TweenService')
local virtualInputManager = game:GetService('VirtualInputManager')
local debris = game:GetService('Debris')
local virtualUser = game:GetService('VirtualUser')

local function f1()
    local v1, v2 = pcall(function()
        return loadstring(game:HttpGet('https://github.com/Footagesus/WindUI/releases/download/1.6.54/main.lua'))()
    end)
    local f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, f31, f32, f33, f34, f35, f36, localPlayer, currentCamera, v3, vyrionLoader, uiGradient, textLabel, textLabel2, textLabel3, frame, frame2, textLabel4, v4, v5, v6, window, f37, tab, v7, f38, remoteEvents, f39, v8, f40, v9, vector, f41, v10, v11, vector2, v12, v13, f42, f43, v14, f44, v15, f45, v16, v17, vector3, v18, f46, f47, v19, v20, f48, f49, v21, v22, v23, v24, f50, v25, f51, v26, v27, f52, v28, v29, v30, v31, v32, f53, f54, f55, v33, f56, v34, selectChestDropdown, v35, v36, f57, v37, f58, f59, f60, v38, v39, v40, v41, v42, v43, v44, v45, v46, f61, f62, v47, v48, v49, vector4, v50, v51, f63, v52, v53, f64, v54, index, v55, v56, f65, f66, v57, v58, v59, v60, bodyVelocity, bodyGyro, connect, character, humanoid, humanoidRootPart, v61, text, text2, v62, v63, v64, v65, v66, v67, f67, f68, v68, f69, f70, v69, color, f71, f72, f73, f74, v70, v71, v72, v73, v74, f75, v75, v76, f76, f77, v77, f78, f79, f80, v78, v79, v80

    if not v1 then
        warn('Failed to load WindUI:', v2)

        return
    else
        local frame3, frame4, uiStroke, frame5

        do
            localPlayer = players.LocalPlayer
            currentCamera = workspace.CurrentCamera
            v3 = getgenv and getgenv() or {}

            if not v3 then
                v3 = {}
            end

            local g = _G or v3

            function f2(p1)
                local text3 = ''
                local v81 = {
                    Color3.fromRGB(255, 255, 255),
                    Color3.fromRGB(242, 243, 245),
                    Color3.fromRGB(219, 222, 225),
                    Color3.fromRGB(181, 186, 193),
                    Color3.fromRGB(148, 155, 164),
                    Color3.fromRGB(110, 115, 125),
                }
                local v82 = #p1:gsub('[^%w]', '')
                local v83 = 1

                for i = 1, #p1 do
                    local sub = p1:sub(i, i)

                    if sub:match('[%w]') then
                        local v84 = (v83 - 1) / math.max(v82 - 1, 1) * (#v81 - 1)
                        local v85 = math.clamp(math.floor(v84) + 1, 1, #v81)
                        local v86 = v81[v85]
                        local v87 = v81[math.clamp(v85 + 1, 1, #v81)]
                        local v88 = v84 % 1

                        text3 = text3 .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', math.floor((v86.R + (v87.R - v86.R) * v88) * 255), math.floor((v86.G + (v87.G - v86.G) * v88) * 255), math.floor((v86.B + (v87.B - v86.B) * v88) * 255), sub)
                        v83 = v83 + 1
                    else
                        text3 = text3 .. sub
                    end
                end

                return text3
            end

            _G = g

            task.spawn(function()
                local boundaries = workspace.Map:WaitForChild('Boundaries')

                for index2, value in ipairs(boundaries:GetChildren())do
                    if value.Name ~= 'Fog' then
                        value:Destroy()
                    end
                end

                boundaries.ChildAdded:Connect(function(child)
                    if _fogRemoveEnabled and child.Name ~= 'Fog' then
                        child:Destroy()
                    end
                end)
            end)

            local playerGui = localPlayer:WaitForChild('PlayerGui')

            vyrionLoader = Instance.new('ScreenGui')
            vyrionLoader.Name = 'MizuLoader'
            vyrionLoader.ResetOnSpawn = false
            vyrionLoader.DisplayOrder = 99999
            vyrionLoader.IgnoreGuiInset = true
            vyrionLoader.Parent = playerGui
        end

        frame3 = Instance.new('Frame')
        frame3.Size = UDim2.new(1, 0, 1, 0)
        frame3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        frame3.BackgroundTransparency = 1
        frame3.BorderSizePixel = 0
        frame3.ZIndex = 1
        frame3.Parent = vyrionLoader
        frame4 = Instance.new('Frame')
        frame4.Size = UDim2.new(0, 360, 0, 130)
        frame4.AnchorPoint = Vector2.new(0.5, 0.5)
        frame4.Position = UDim2.new(0.5, 0, 0.58, 0)
        frame4.BackgroundColor3 = Color3.fromHex('#0E1013')
        frame4.BackgroundTransparency = 0.25
        frame4.BorderSizePixel = 0
        frame4.ZIndex = 2
        frame4.Parent = vyrionLoader
        Instance.new('UICorner', frame4).CornerRadius = UDim.new(0, 18)
        uiStroke = Instance.new('UIStroke')
        uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        uiStroke.Thickness = 2
        uiStroke.Transparency = 1
        uiStroke.Parent = frame4
        uiGradient = Instance.new('UIGradient')
        uiGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex('#585B64')),
            ColorSequenceKeypoint.new(0.33, Color3.fromHex('#3F4147')),
            ColorSequenceKeypoint.new(0.66, Color3.fromHex('#2B2D31')),
            ColorSequenceKeypoint.new(1, Color3.fromHex('#585B64')),
        })
        uiGradient.Rotation = 0
        uiGradient.Parent = uiStroke

        task.spawn(function()
            local v89 = 0

            while vyrionLoader.Parent do
                v89 = (v89 + 2) % 360
                uiGradient.Rotation = v89

                task.wait(0.03)
            end
        end)

        frame5 = Instance.new('Frame')
        frame5.Size = UDim2.new(1, -20, 0, 32)
        frame5.Position = UDim2.new(0, 10, 0, 12)
        frame5.BackgroundTransparency = 1
        frame5.BorderSizePixel = 0
        frame5.ZIndex = 3
        frame5.Parent = frame4
        textLabel = Instance.new('TextLabel')
        textLabel.Size = UDim2.new(0, 26, 1, 0)
        textLabel.Position = UDim2.new(0, 0, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = '*'
        textLabel.TextColor3 = Color3.fromHex('#DBDEE1')
        textLabel.TextSize = 22
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextXAlignment = Enum.TextXAlignment.Center
        textLabel.TextYAlignment = Enum.TextYAlignment.Center
        textLabel.RichText = false
        textLabel.ZIndex = 4
        textLabel.Parent = frame5

        task.spawn(function()
            local v90 = {
                22,
                24,
                22,
                19,
                22,
            }
            local v91 = 1

            while vyrionLoader.Parent do
                textLabel.TextSize = v90[v91]
                v91 = v91 % #v90 + 1

                task.wait(0.18)
            end
        end)

        do
            local textLabel5 = Instance.new('TextLabel')

            textLabel5.Size = UDim2.new(1, -30, 1, 0)
            textLabel5.Position = UDim2.new(0, 30, 0, 0)
            textLabel5.BackgroundTransparency = 1
            textLabel5.Text = 'Mizu Hub'
            textLabel5.TextColor3 = Color3.fromHex('#F2F3F5')
            textLabel5.TextSize = 17
            textLabel5.Font = Enum.Font.GothamBold
            textLabel5.TextXAlignment = Enum.TextXAlignment.Left
            textLabel5.TextYAlignment = Enum.TextYAlignment.Center
            textLabel5.RichText = false
            textLabel5.ZIndex = 3
            textLabel5.Parent = frame5
        end

        textLabel2 = Instance.new('TextLabel')
        textLabel2.Size = UDim2.new(0, 60, 1, 0)
        textLabel2.Position = UDim2.new(1, -62, 0, 0)
        textLabel2.BackgroundTransparency = 1
        textLabel2.Text = '* * *'
        textLabel2.TextColor3 = Color3.fromHex('#949BA4')
        textLabel2.TextSize = 11
        textLabel2.Font = Enum.Font.GothamBold
        textLabel2.TextXAlignment = Enum.TextXAlignment.Right
        textLabel2.TextYAlignment = Enum.TextYAlignment.Center
        textLabel2.ZIndex = 3
        textLabel2.Parent = frame5

        do
            task.spawn(function()
                local v92 = {
                    Color3.fromHex('#F2F3F5'),
                    Color3.fromHex('#DBDEE1'),
                    Color3.fromHex('#949BA4'),
                    Color3.fromHex('#585B64'),
                    Color3.fromHex('#949BA4'),
                    Color3.fromHex('#DBDEE1'),
                }
                local v93 = 1

                while vyrionLoader.Parent do
                    textLabel2.TextColor3 = v92[v93]
                    v93 = v93 % #v92 + 1

                    task.wait(0.22)
                end
            end)

            local frame6 = Instance.new('Frame')

            frame6.Size = UDim2.new(1, -20, 0, 1)
            frame6.Position = UDim2.new(0, 10, 0, 46)
            frame6.BackgroundColor3 = Color3.fromHex('#232428')
            frame6.BorderSizePixel = 0
            frame6.ZIndex = 3
            frame6.Parent = frame4
            textLabel3 = Instance.new('TextLabel')
            textLabel3.Size = UDim2.new(1, -40, 0, 18)
            textLabel3.Position = UDim2.new(0, 14, 0, 52)
            textLabel3.BackgroundTransparency = 1
        end
        do
            textLabel3.Text = '*  Starting...'
            textLabel3.TextColor3 = Color3.fromHex('#949BA4')
            textLabel3.TextSize = 12
            textLabel3.Font = Enum.Font.Gotham
            textLabel3.TextXAlignment = Enum.TextXAlignment.Left
            textLabel3.ZIndex = 3
            textLabel3.Parent = frame4

            local frame7 = Instance.new('Frame')

            frame7.Size = UDim2.new(1, -20, 0, 7)
            frame7.Position = UDim2.new(0, 10, 0, 76)
            frame7.BackgroundColor3 = Color3.fromHex('#1E1F22')
            frame7.BorderSizePixel = 0
            frame7.ZIndex = 3
            frame7.Parent = frame4
            Instance.new('UICorner', frame7).CornerRadius = UDim.new(1, 0)
            frame = Instance.new('Frame')
            frame.Size = UDim2.new(0, 0, 1, 0)
            frame.BackgroundColor3 = Color3.fromHex('#4E5058')
            frame.BorderSizePixel = 0
            frame.ZIndex = 4
            frame.Parent = frame7
        end
        do
            Instance.new('UICorner', frame).CornerRadius = UDim.new(1, 0)

            local uiGradient2 = Instance.new('UIGradient')

            uiGradient2.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex('#949BA4')),
                ColorSequenceKeypoint.new(0.5, Color3.fromHex('#6D6F78')),
                ColorSequenceKeypoint.new(1, Color3.fromHex('#383A40')),
            })
            uiGradient2.Parent = frame
            frame2 = Instance.new('Frame')
            frame2.Size = UDim2.new(0, 10, 0, 10)
            frame2.AnchorPoint = Vector2.new(0.5, 0.5)
            frame2.Position = UDim2.new(1, -5, 0.5, 0)
            frame2.BackgroundColor3 = Color3.fromHex('#DBDEE1')
            frame2.BorderSizePixel = 0
            frame2.ZIndex = 5
            frame2.Visible = false
        end

        frame2.Parent = frame
        Instance.new('UICorner', frame2).CornerRadius = UDim.new(1, 0)
        textLabel4 = Instance.new('TextLabel')
        textLabel4.Size = UDim2.new(1, -20, 0, 18)
        textLabel4.Position = UDim2.new(0, 10, 0, 89)
        textLabel4.BackgroundTransparency = 1
        textLabel4.Text = '*  0%'
        textLabel4.TextColor3 = Color3.fromHex('#DBDEE1')
        textLabel4.TextSize = 11
        textLabel4.Font = Enum.Font.GothamBold
        textLabel4.TextXAlignment = Enum.TextXAlignment.Right
        textLabel4.ZIndex = 3

        do
            textLabel4.Parent = frame4

            local textLabel6 = Instance.new('TextLabel')

            textLabel6.Size = UDim2.new(0.5, 0, 0, 18)
            textLabel6.Position = UDim2.new(0, 14, 0, 89)
            textLabel6.BackgroundTransparency = 1
            textLabel6.Text = 'v1'
            textLabel6.TextColor3 = Color3.fromHex('#80848E')
            textLabel6.TextSize = 10
            textLabel6.Font = Enum.Font.Gotham
            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
            textLabel6.ZIndex = 3
            textLabel6.Parent = frame4
        end
        do
            tweenService:Create(frame3, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {BackgroundTransparency = 0.55}):Play()
            tweenService:Create(frame4, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 0.25,
            }):Play()
            tweenService:Create(uiStroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {Transparency = 0}):Play()

            local function f81(p2, p3, p4)
                textLabel3.Text = '*  ' .. p3
                textLabel4.Text = '*  ' .. math.floor(p2 * 100) .. '%'

                local v94 = math.clamp(p2, 0, 1)

                tweenService:Create(frame, TweenInfo.new(p4 or 0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Size = UDim2.new(v94, 0, 1, 0),
                }):Play()

                frame2.Visible = v94 > 0.02
                frame2.Position = UDim2.new(1, -5, 0.5, 0)
            end

            f81(0.08, 'Connecting...', 0.2)

            v4 = os.clock()
            v5 = false
            v6 = 1

            task.spawn(function()
                pcall(function()
                    game:HttpGet('https://github.com/Footagesus/WindUI/releases/download/1.6.54/main.lua', true)
                end)

                v6 = math.clamp(os.clock() - v4, 0.05, 5)
                v5 = true
            end)

            local v95 = 0.08

            repeat
                task.wait(0.05)

                v95 = math.min(v95 + 0.012, 0.3)

                f81(v95, 'Measuring connection...', 0.12)
            until v5

            local v96 = math.clamp(v6 * 0.35, 0.15, 1.8)

            f81(0.35, 'Connection: ' .. (v6 < 0.3 and 'Fast' or v6 < 1 and 'Good' or 'Slow') .. ' (' .. math.floor(v6 * 1000) .. 'ms)', v96 * 0.5)
            task.wait(v96 * 0.4)
            f81(0.55, 'Loading services...', v96 * 0.6)
            task.wait(v96 * 0.3)
            f81(0.72, 'Building hub...', v96 * 0.5)
            task.wait(v96 * 0.25)
            f81(0.88, 'Finalizing...', v96 * 0.4)
            task.wait(v96 * 0.2)
            f81(1, 'Ready!', 0.25)
        end

        task.wait(0.35)
        tweenService:Create(frame4, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, 0, 0.42, 0),
            BackgroundTransparency = 1,
        }):Play()
        tweenService:Create(uiStroke, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Transparency = 1}):Play()
        tweenService:Create(frame3, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
        task.wait(0.35)
        vyrionLoader:Destroy()
        pcall(function()
            v2:AddTheme({
                Name = 'Mizu Amoled',
                Accent = Color3.fromHex('#2B2D31'),
                Dialog = Color3.fromHex('#0E1013'),
                Outline = Color3.fromHex('#383A40'),
                Text = Color3.fromHex('#F2F3F5'),
                Placeholder = Color3.fromHex('#949BA4'),
                Background = v2:Gradient({
                    ['0'] = {
                        Color = Color3.fromHex('#000000'),
                        Transparency = 0.25,
                    },
                    ['35'] = {
                        Color = Color3.fromHex('#0A0B0D'),
                        Transparency = 0.25,
                    },
                    ['70'] = {
                        Color = Color3.fromHex('#111214'),
                        Transparency = 0.25,
                    },
                    ['100'] = {
                        Color = Color3.fromHex('#1E1F22'),
                        Transparency = 0.25,
                    },
                }, {Rotation = 135}),
                Button = v2:Gradient({
                    ['0'] = {
                        Color = Color3.fromHex('#313338'),
                        Transparency = 0.05,
                    },
                    ['50'] = {
                        Color = Color3.fromHex('#2B2D31'),
                        Transparency = 0.05,
                    },
                    ['100'] = {
                        Color = Color3.fromHex('#1E1F22'),
                        Transparency = 0.05,
                    },
                }, {Rotation = 90}),
                Icon = v2:Gradient({
                    ['0'] = {
                        Color = Color3.fromHex('#FFFFFF'),
                        Transparency = 0,
                    },
                    ['35'] = {
                        Color = Color3.fromHex('#DBDEE1'),
                        Transparency = 0,
                    },
                    ['70'] = {
                        Color = Color3.fromHex('#949BA4'),
                        Transparency = 0,
                    },
                    ['100'] = {
                        Color = Color3.fromHex('#6D6F78'),
                        Transparency = 0,
                    },
                }, {Rotation = 135}),
            })
        end)

        window = v2:CreateWindow({
            Title = f2('Mizu Hub'),
            Author = 'Mizu                                   ',
            Icon = 'https://i.pinimg.com/736x/b9/18/f3/b918f34cea8b4e6bc6553c5602376bf8.jpg',
            Folder = 'Mizu',
            Size = UDim2.fromOffset(640, 380),
            Transparent = true,
            Resizable = true,
            Theme = 'Mizu Amoled',
            SideBarWidth = 210,
            HideSearchBar = false,
            ScrollBarEnabled = true,
            Background = v2:Gradient({
                ['0'] = {
                    Color = Color3.fromHex('#000000'),
                    Transparency = 0.25,
                },
                ['35'] = {
                    Color = Color3.fromHex('#0A0B0D'),
                    Transparency = 0.25,
                },
                ['70'] = {
                    Color = Color3.fromHex('#111214'),
                    Transparency = 0.25,
                },
                ['100'] = {
                    Color = Color3.fromHex('#1E1F22'),
                    Transparency = 0.25,
                },
            }, {Rotation = 135}),
            BackgroundImageTransparency = 0.25,
            User = {
                Enabled = true,
                Anonymous = false,
                Callback = function()
                    v2:Notify({
                        Title = f2(localPlayer.Name),
                        Content = 'Account Age: ' .. localPlayer.AccountAge .. ' days User ID: ' .. localPlayer.UserId,
                        Duration = 5,
                        Icon = 'user',
                    })
                end,
            },
        })

        if not window then
            warn('[Mizu Hub] Window failed to create \u{2014} aborting.')

            return
        else
            pcall(function()
                window:Tag({
                    Title = 'v1',
                    Color = v2:Gradient({
                        ['0'] = {
                            Color = Color3.fromHex('#383A40'),
                            Transparency = 0,
                        },
                        ['50'] = {
                            Color = Color3.fromHex('#2B2D31'),
                            Transparency = 0,
                        },
                        ['100'] = {
                            Color = Color3.fromHex('#1E1F22'),
                            Transparency = 0,
                        },
                    }, {Rotation = 90}),
                    Radius = 13,
                })
            end)
            pcall(function()
                window:Tag({
                    Title = 'Premium',
                    Color = v2:Gradient({
                        ['0'] = {
                            Color = Color3.fromHex('#4E5058'),
                            Transparency = 0,
                        },
                        ['50'] = {
                            Color = Color3.fromHex('#313338'),
                            Transparency = 0,
                        },
                        ['100'] = {
                            Color = Color3.fromHex('#1E1F22'),
                            Transparency = 0,
                        },
                    }, {Rotation = 45}),
                    Radius = 13,
                })
            end)
            pcall(function()
                window:EditOpenButton({
                    Title = 'Mizu Hub [v1]',
                    Icon = 'https://i.pinimg.com/736x/b9/18/f3/b918f34cea8b4e6bc6553c5602376bf8.jpg',
                    CornerRadius = UDim.new(0, 16),
                    StrokeThickness = 2,
                    Color = ColorSequence.new(Color3.fromHex('#383A40'), Color3.fromHex('#111214')),
                    OnlyMobile = false,
                    Enabled = true,
                    Draggable = true,
                })
            end)
            task.spawn(function()
                local playerGui2 = localPlayer:WaitForChild('PlayerGui')
                local v97

                for j = 1, 60 do
                    task.wait(0.1)

                    for index3, value2 in ipairs(playerGui2:GetChildren())do
                        if value2:IsA('ScreenGui') then
                            for index4, value3 in ipairs(value2:GetDescendants())do
                                if value3:IsA('Frame') and value3.AbsoluteSize.X >= 400 then
                                    v97 = value2

                                    break
                                end
                            end
                        end
                        if v97 then
                            break
                        end
                    end

                    if v97 then
                        break
                    end
                end

                if not v97 then
                    return
                else
                    local v98 = nil

                    for index5, value4 in ipairs(v97:GetDescendants())do
                        if value4:IsA('Frame') and value4.Visible then
                            if not v98 or value4.AbsoluteSize.X > v98.AbsoluteSize.X then
                                v98 = value4
                            end
                        end
                    end

                    if not v98 then
                        return
                    else
                        local position = v98.Position

                        v98.Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale + 0.03, position.Y.Offset)

                        tweenService:Create(v98, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = position}):Play()

                        return
                    end
                end
            end)
            task.spawn(function()
                local playerGui3 = localPlayer:WaitForChild('PlayerGui')
                local v99

                for k = 1, 80 do
                    task.wait(0.1)

                    for index6, value5 in ipairs(playerGui3:GetChildren())do
                        if value5:IsA('ScreenGui') then
                            for index7, value6 in ipairs(value5:GetDescendants())do
                                if value6:IsA('Frame') and value6.AbsoluteSize.X >= 400 then
                                    v99 = value5

                                    break
                                end
                            end
                        end
                        if v99 then
                            break
                        end
                    end

                    if v99 then
                        break
                    end
                end

                if not v99 then
                    return
                end

                local v100 = nil

                for index8, value7 in ipairs(v99:GetDescendants())do
                    if value7:IsA('Frame') and value7.Visible then
                        if not v100 or value7.AbsoluteSize.X > v100.AbsoluteSize.X then
                            v100 = value7
                        end
                    end
                end

                if not v100 then
                    return
                end

                local size = v100.Size
                local f82, v101

                function f82()
                    v101 = false
                    v100.Visible = false
                end

                local f83

                function f83()
                    v101 = true
                    v100.Visible = true
                end

                v101 = true

                local f84, v102

                function f84()
                    v102 = not v102

                    if v102 then
                        tweenService:Create(v100, TweenInfo.new(0.22, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Size = UDim2.new(size.X.Scale, size.X.Offset, 0, 26),
                        }):Play()
                    else
                        tweenService:Create(v100, TweenInfo.new(0.28, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = size}):Play()
                    end
                end

                v102 = false

                userInputService.InputBegan:Connect(function(input, p5)
                    if p5 then
                        return
                    end
                    if input.KeyCode == Enum.KeyCode.RightShift then
                        if v101 then
                            f82()
                            v2:Notify({
                                Title = 'Keybind',
                                Content = 'Hub closed  [ RightShift ]',
                                Duration = 2,
                            })
                        else
                            f83()
                            v2:Notify({
                                Title = 'Keybind',
                                Content = 'Hub opened  [ RightShift ]',
                                Duration = 2,
                            })
                        end
                    elseif input.KeyCode == Enum.KeyCode.RightControl then
                        f84()
                        v2:Notify({
                            Title = 'Keybind',
                            Content = 'Hub ' .. (v102 and 'Minimized' or 'Restored') .. '  [ RightCtrl ]',
                            Duration = 2,
                        })
                    elseif input.KeyCode == Enum.KeyCode.Delete then
                        f82()
                        v2:Notify({
                            Title = 'Keybind',
                            Content = 'Hub hidden  [ Delete ]  \u{2014} Press RightShift to reopen.',
                            Duration = 4,
                        })
                    end
                end)
            end)

            function f4(content)
                v2:Notify({
                    Title = 'Mizu Hub',
                    Content = content,
                    Duration = 3,
                })
            end
            function f3(p6)
                local v103, v104 = pcall(function()
                    if syn and syn.request then
                        return syn.request(p6)
                    end
                    if request and type(request) == 'function' then
                        return request(p6)
                    end
                    if http and http.request then
                        return http.request(p6)
                    end

                    return {
                        Body = httpService:GetAsync(p6.Url),
                        StatusCode = 200,
                        Success = true,
                    }
                end)

                if v103 then
                    return v104
                end

                return {
                    Body = '{}',
                    StatusCode = 0,
                    Success = false,
                }
            end
            function f37(p7, p8)
                for m = 1, p8 or 2 do
                    local v105 = f3(p7)

                    if v105 and v105.StatusCode == 200 then
                        return v105
                    end

                    task.wait(1)
                end

                return {Success = false}
            end

            tab = window:Tab({
                Title = f2('Introduction'),
                Icon = 'house',
                Opened = false,
            })

            tab:Section({
                Title = f2('Information'),
                Icon = 'info',
                Opened = false,
                Desc = '',
            })
            tab:Paragraph({
                Title = 'About Mizu Hub',
                Desc = '\u{2192} Mizu Hub is a Keyless scripting assistant hub.\n\u{2192} Designed to help people with Grinding and more!\n\u{2192} Free to use and constantly updated.\n\u{2192} Version: 1.0',
            })
            tab:Divider()
            tab:Section({
                Title = f2('Features'),
                Icon = 'list',
                Opened = false,
                Desc = '',
            })
            tab:Paragraph({
                Title = "What's Included",
                Desc = '\u{2192} Auto Farm Days\n\u{2192} Auto Fuel Campfire\n\u{2192} Auto Cook Food\n\u{2192} Auto Compress Items\n\u{2192} Auto Bring / Collect Items\n\u{2192} Tree Aura (Auto Chop)\n\u{2192} Landmarks Reveal (Full Map)\n\u{2192} Send to Volcano\n\u{2192} Godmode (Combat)\n\u{2192} Silent Aim + Revive Players\n\u{2192} Player & Mob ESP\n\u{2192} Detailed Game Stats\n\u{2192} And much MORE!!',
            })

            local v110 = {
                Main = window:Tab({
                    Title = f2('Main'),
                    Icon = 'star',
                    Opened = false,
                }),
                Teleport = window:Tab({
                    Title = f2('Teleport'),
                    Icon = 'rocket',
                    Opened = false,
                }),
                Bring = window:Tab({
                    Title = f2('Bring Items'),
                    Icon = 'package',
                    Opened = false,
                }),
                Scanner = window:Tab({
                    Title = f2('Scanner'),
                    Icon = 'scan',
                    Opened = false,
                }),
                AutoDays = window:Tab({
                    Title = f2('Auto Farm'),
                    Icon = 'sun',
                    Opened = false,
                }),
                Combat = window:Tab({
                    Title = f2('Combat'),
                    Icon = 'swords',
                    Opened = false,
                }),
                Esp = window:Tab({
                    Title = f2('ESP'),
                    Icon = 'eye',
                    Opened = false,
                }),
                Stats = window:Tab({
                    Title = f2('Stats'),
                    Icon = 'bar-chart-2',
                    Opened = false,
                }),
                Misc = window:Tab({
                    Title = f2('Misc'),
                    Icon = 'gift',
                    Opened = false,
                }),
            }

            remoteEvents = replicatedStorage:FindFirstChild('RemoteEvents')

            if not remoteEvents then
                warn('RemoteEvents folder not found')

                return
            else
                local items, v360

                items = workspaceService:FindFirstChild('Items') or workspaceService:WaitForChild('Items', 10)

                function f5(p9, p10)
                    for index9, value8 in ipairs(p9)do
                        if value8 == p10 then
                            return true
                        end
                    end

                    return false
                end

                v3.InfDupeSaplingsAutoPlant = false
                v3.InfDupeSaplingsAutoDelay = 0.1
                v3.InfDupeSaplingsSkybaseCount = 200
                v3.InfDupeSaplingsSkybaseHeight = 20
                v3.InfDupeSaplingsCircleRadius = 50
                v3.InfDupeSaplingsCircleCount = 30
                v3.InfDupeSaplingsShowHologram = false

                function f11()
                    local v111 = {}

                    for v112, v113 in getnilinstances()do
                        if v113.Name == 'Sapling' then
                            v111[#v111 + 1] = v113
                        end
                    end

                    return v111
                end
                function f6()
                    if not localPlayer or not localPlayer.Character then
                        return nil
                    else
                        local humanoidRootPart2 = localPlayer.Character:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart2 then
                            return nil
                        else
                            local position2 = humanoidRootPart2.Position
                            local raycastParams = RaycastParams.new()

                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                            raycastParams.FilterDescendantsInstances = {
                                localPlayer.Character,
                            }
                            raycastParams.IgnoreWater = true

                            local raycast = workspace:Raycast(position2 + Vector3.new(0, 2, 0), Vector3.new(0, -10, 0), raycastParams)

                            if raycast then
                                return Vector3.new(position2.X, raycast.Position.Y, position2.Z)
                            end

                            return Vector3.new(position2.X, position2.Y - 3, position2.Z)
                        end
                    end
                end
                function f7(p11)
                    local v114 = f11()

                    if #v114 == 0 then
                        return false
                    else
                        local v115 = false

                        for index10, value9 in ipairs(v114)do
                            if f39(value9, p11) then
                                v115 = true
                            end

                            task.wait(0.05)
                        end

                        return v115
                    end
                end
                function f39(p12, p13)
                    local remoteEvents2 = replicatedStorage:FindFirstChild('RemoteEvents')

                    if not remoteEvents2 then
                        return false
                    end

                    local requestPlantItem = remoteEvents2:FindFirstChild('RequestPlantItem')

                    if not requestPlantItem then
                        local remoteFunctions = replicatedStorage:FindFirstChild('RemoteFunctions')

                        if remoteFunctions then
                            requestPlantItem = remoteFunctions:FindFirstChild('RequestPlantItem')
                        end
                        if not requestPlantItem then
                            requestPlantItem = replicatedStorage:FindFirstChild('RequestPlantItem', true)
                        end
                        if not requestPlantItem then
                            return false
                        end
                    end

                    local className = requestPlantItem.ClassName

                    if className == 'RemoteFunction' then
                        if pcall(function()
                            requestPlantItem:InvokeServer(p12, p13)
                        end) then
                            return true
                        end
                    end
                    if className == 'RemoteEvent' then
                        if pcall(function()
                            requestPlantItem:FireServer(p12, p13)
                        end) then
                            return true
                        elseif pcall(function()
                            requestPlantItem:InvokeServer(p12, p13)
                        end) then
                            return true
                        elseif pcall(function()
                            requestPlantItem:InvokeServer(p13, p12)
                        end) then
                            return true
                        else
                            if pcall(function()
                                requestPlantItem:FireServer(p13, p12)
                            end) then
                                return true
                            end

                            return false
                        end
                    elseif pcall(function()
                        requestPlantItem:InvokeServer(p12, p13)
                    end) then
                        return true
                    elseif pcall(function()
                        requestPlantItem:InvokeServer(p13, p12)
                    end) then
                        return true
                    else
                        if pcall(function()
                            requestPlantItem:FireServer(p13, p12)
                        end) then
                            return true
                        end

                        return false
                    end
                end

                v8 = {}

                function f8()
                    f40()

                    if not v3.InfDupeSaplingsShowHologram then
                        return
                    end

                    local humanoidRootPart3 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                    if not humanoidRootPart3 then
                        return
                    else
                        local infDupeSaplingsCircleRadius = v3.InfDupeSaplingsCircleRadius
                        local infDupeSaplingsCircleCount = v3.InfDupeSaplingsCircleCount

                        for n = 1, infDupeSaplingsCircleCount do
                            local v116 = 2 * math.pi / infDupeSaplingsCircleCount * n
                            local v117 = humanoidRootPart3.Position.X + infDupeSaplingsCircleRadius * math.cos(v116)
                            local v118 = humanoidRootPart3.Position.Z + infDupeSaplingsCircleRadius * math.sin(v116)

                            pcall(function()
                                local part = Instance.new('Part')

                                part.Anchored = true
                                part.CanCollide = false
                                part.Size = Vector3.new(0.5, 0.5, 0.5)
                                part.Position = Vector3.new(v117, humanoidRootPart3.Position.Y, v118)
                                part.Material = Enum.Material.Neon
                                part.Color = Color3.fromRGB(0, 200, 255)
                                part.Transparency = 0.5
                                part.Parent = workspace

                                table.insert(v8, part)
                            end)
                        end

                        return
                    end
                end
                function f40()
                    for index11, value10 in ipairs(v8) do end

                    v8 = {}
                end

                task.spawn(function()
                    while true do
                        if v3.InfDupeSaplingsAutoPlant then
                            local v119 = f6()

                            if v119 then
                                local v120 = f11()

                                if #v120 == 0 then
                                    task.wait(1)
                                else
                                    local v121 = false

                                    for index12, value11 in ipairs(v120)do
                                        if not v3.InfDupeSaplingsAutoPlant then
                                            break
                                        end
                                        if f39(value11, v119) then
                                            v121 = true
                                        end

                                        task.wait(0.05)
                                    end

                                    if not v121 then
                                        task.wait(1 + math.random() * 2)
                                    else
                                        task.wait(math.max(0.05, v3.InfDupeSaplingsAutoDelay))
                                    end
                                end
                            else
                                task.wait(0.5)
                            end
                        else
                            task.wait(0.05)
                        end
                    end
                end)
                task.spawn(function()
                    while true do
                        if v3.InfDupeSaplingsShowHologram then
                            f8()
                        end

                        task.wait(0.5)
                    end
                end)
                v110.Main:Divider()
                v110.Main:Section({
                    Title = f2('Infinite Dupe Saplings'),
                    Icon = 'leaf',
                    Opened = false,
                    Desc = '',
                })
                v110.Main:Paragraph({
                    Title = 'INFINITE Saplings Dupe & Circle Plant',
                    Content = 'In order for the feature to work, you must plant first and enable the feature that you want to be enabled (Infinite Saplings Dupe/Circle plant)',
                })
                v110.Main:Toggle({
                    Title = 'Auto Dupe Saplings (Plant @ your position)',
                    Desc = 'Continuously plants saplings at your location at the speed you choose.',
                    Default = false,
                    Callback = function(value12)
                        v3.InfDupeSaplingsAutoPlant = value12
                    end,
                })
                v110.Main:Slider({
                    Title = 'Auto Plant Delay (seconds)',
                    Value = {
                        Min = 0.05,
                        Max = 3,
                        Default = 0.1,
                    },
                    Step = 0.05,
                    Callback = function(value13)
                        v3.InfDupeSaplingsAutoDelay = value13
                    end,
                })
                v110.Main:Divider()
                v110.Main:Button({
                    Title = 'Plant Skybase Dupe Saplings',
                    Desc = 'Creates a skybase spiral with saplings using your settings',
                    Callback = function()
                        local humanoidRootPart4 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart4 then
                            return
                        end

                        local position3 = humanoidRootPart4.Position
                        local infDupeSaplingsSkybaseCount = v3.InfDupeSaplingsSkybaseCount
                        local infDupeSaplingsSkybaseHeight = v3.InfDupeSaplingsSkybaseHeight

                        task.spawn(function()
                            for i6 = 1, infDupeSaplingsSkybaseCount do
                                local v122 = 2 * math.pi / infDupeSaplingsSkybaseCount * i6 * 5
                                local v123 = 5 + i6 / infDupeSaplingsSkybaseCount * 10

                                f7((Vector3.new(position3.X + v123 * math.cos(v122), position3.Y + i6 / infDupeSaplingsSkybaseCount * infDupeSaplingsSkybaseHeight, position3.Z + v123 * math.sin(v122))))
                                task.wait(0.05)
                            end
                        end)
                    end,
                })
                v110.Main:Slider({
                    Title = 'Skybase: Total Saplings',
                    Value = {
                        Min = 10,
                        Max = 500,
                        Default = 200,
                    },
                    Step = 10,
                    Callback = function(value14)
                        v3.InfDupeSaplingsSkybaseCount = value14
                    end,
                })
                v110.Main:Slider({
                    Title = 'Skybase: Spiral Height',
                    Value = {
                        Min = 1,
                        Max = 200,
                        Default = 20,
                    },
                    Step = 1,
                    Callback = function(value15)
                        v3.InfDupeSaplingsSkybaseHeight = value15
                    end,
                })
                v110.Main:Divider()
                v110.Main:Button({
                    Title = 'Plant Saplings in Circle',
                    Desc = 'Plants saplings at all previewed positions.',
                    Callback = function()
                        local humanoidRootPart5 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart5 then
                            return
                        end

                        local position4 = humanoidRootPart5.Position
                        local infDupeSaplingsCircleRadius2 = v3.InfDupeSaplingsCircleRadius
                        local infDupeSaplingsCircleCount2 = v3.InfDupeSaplingsCircleCount

                        task.spawn(function()
                            for i7 = 1, infDupeSaplingsCircleCount2 do
                                local v124 = 2 * math.pi / infDupeSaplingsCircleCount2 * i7

                                f7((Vector3.new(position4.X + infDupeSaplingsCircleRadius2 * math.cos(v124), position4.Y, position4.Z + infDupeSaplingsCircleRadius2 * math.sin(v124))))
                                task.wait(0.05)
                            end
                        end)
                    end,
                })
                v110.Main:Slider({
                    Title = 'Circle Planting: Radius',
                    Value = {
                        Min = 5,
                        Max = 200,
                        Default = 50,
                    },
                    Step = 1,
                    Callback = function(value16)
                        v3.InfDupeSaplingsCircleRadius = value16

                        f8()
                    end,
                })
                v110.Main:Slider({
                    Title = 'Circle Planting: Saplings Count',
                    Value = {
                        Min = 1,
                        Max = 100,
                        Default = 30,
                    },
                    Step = 1,
                    Callback = function(value17)
                        v3.InfDupeSaplingsCircleCount = value17

                        f8()
                    end,
                })
                v110.Main:Toggle({
                    Title = 'Show Hologram Preview',
                    Default = false,
                    Callback = function(value18)
                        v3.InfDupeSaplingsShowHologram = value18

                        if value18 then
                            f8()
                        else
                            f40()
                        end
                    end,
                })
                v110.Main:Divider()
                v110.Main:Section({
                    Title = f2('Auto Plant'),
                    Icon = 'sprout',
                    Opened = false,
                    Desc = '',
                })

                v3.AutoPlantSaplings = false

                v110.Main:Toggle({
                    Title = 'Auto Plant Saplings',
                    Desc = 'Do NOT use this feature, if your using Infinite Dupe Saplings',
                    Default = false,
                    Callback = function(value19)
                        v3.AutoPlantSaplings = value19
                    end,
                })

                do
                    task.spawn(function()
                        local requestPlantItem2 = remoteEvents:WaitForChild('RequestPlantItem')

                        while true do
                            if v3.AutoPlantSaplings then
                                for index13, value20 in ipairs(items:GetChildren())do
                                    local v125 = value20

                                    if v125.Name == 'Sapling' then
                                        local primaryPart = v125.PrimaryPart or v125:FindFirstChildWhichIsA('BasePart')

                                        if primaryPart then
                                            if not v125.PrimaryPart then
                                                pcall(function()
                                                    v125.PrimaryPart = primaryPart
                                                end)
                                            end

                                            remoteEvents.RequestStartDraggingItem:FireServer(v125)
                                            task.wait(0.1)
                                            requestPlantItem2:InvokeServer(v125, primaryPart.Position)
                                        end
                                    end
                                end
                            end

                            task.wait(1)
                        end
                    end)
                    v110.Main:Divider()
                    v110.Main:Section({
                        Title = f2('Auto Fuel Campfire'),
                        Icon = 'flame',
                        Opened = false,
                        Desc = '',
                    })

                    v9 = {
                        'Log',
                        'Coal',
                        'Fuel Canister',
                        'Oil Barrel',
                        'Biofuel',
                        'Chair',
                        'Wolf Corpse',
                        'Alpha Wolf Corpse',
                        'Bear Corpse',
                        'Cultist Corpse',
                    }
                    v3.AutoFuelCampfireList = {}
                    v3.AutoFuelCampfireOn = false

                    function f9(p14)
                        local v126 = {}
                        local cultistCorpse = type(p14) == 'table' and p14['Cultist Corpse']

                        local function f86(p15)
                            if not p15 then
                                return
                            end

                            for index14, value21 in ipairs(p15:GetChildren())do
                                if value21.Parent then
                                    local v127 = p14 == true or p14[value21.Name]

                                    if not v127 and cultistCorpse and value21.Name:lower():find('cultist') then
                                        v127 = true
                                    end
                                    if v127 then
                                        table.insert(v126, value21)
                                    end
                                end
                            end
                        end

                        f86(items)

                        for index15, value22 in ipairs({
                            'DroppedItems',
                            'WorldItems',
                            'Drops',
                            'Loot',
                            'Pickups',
                        })do
                            f86(workspace:FindFirstChild(value22))
                        end

                        local map = workspace:FindFirstChild('Map')

                        if map then
                            for index16, value23 in ipairs(map:GetChildren())do
                                f86(value23)
                            end
                        end

                        return v126
                    end

                    vector = Vector3.new(0, 19, 0)

                    function f41(p16, p17)
                        if not p16 or not p16.Parent then
                            return
                        else
                            local handle = p16:FindFirstChild('Handle') or p16:FindFirstChild('HumanoidRootPart') or p16:FindFirstChildWhichIsA('BasePart')

                            if not handle or handle.Locked then
                                return
                            end
                            if p16:IsA('Model') and not p16.PrimaryPart then
                                pcall(function()
                                    p16.PrimaryPart = handle
                                end)
                            end

                            pcall(function()
                                remoteEvents.RequestStartDraggingItem:FireServer(p16)

                                if p16:IsA('Model') then
                                    p16:PivotTo(CFrame.new(p17))
                                else
                                    handle.CFrame = CFrame.new(p17)
                                end

                                remoteEvents.StopDraggingItem:FireServer(p16)
                            end)

                            return
                        end
                    end
                    function f10(p18, p19)
                        task.spawn(function()
                            for index17, value24 in ipairs(p18)do
                                f41(value24, p19)
                                task.wait(v10)
                            end
                        end)
                    end

                    v10 = 0.02

                    local main = v110.Main

                    local function f87()
                        local v128 = {
                            'All',
                        }

                        for index18, value25 in ipairs(v9)do
                            v128[#v128 + 1] = value25
                        end

                        return v128
                    end

                    main:Dropdown({
                        Title = 'Select Fuel Items',
                        Desc = 'Choose which items to throw into the campfire.',
                        Values = f87(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value26)
                            v3.AutoFuelCampfireList = {}

                            if type(value26) == 'table' then
                                local v129 = false

                                for index19, value27 in ipairs(value26)do
                                    if value27 == 'All' then
                                        v129 = true

                                        break
                                    end
                                end

                                if v129 then
                                    for index20, value28 in ipairs(v9)do
                                        v3.AutoFuelCampfireList[value28] = true
                                    end
                                else
                                    for index21, value29 in ipairs(value26)do
                                        if type(value29) == 'string' then
                                            v3.AutoFuelCampfireList[value29] = true
                                        end
                                    end
                                end
                            end
                        end,
                    })
                end
                do
                    v110.Main:Button({
                        Title = '\u{26a1} Fuel Campfire Now',
                        Desc = 'Instantly drops all selected fuel items into the campfire, one by one, FAST.',
                        Callback = function()
                            task.spawn(function()
                                local v130 = f9(v3.AutoFuelCampfireList)

                                f10(v130, vector)
                                f4('Fueling ' .. #v130 .. ' items!')
                            end)
                        end,
                    })
                    v110.Main:Toggle({
                        Title = 'Auto Fuel Campfire',
                        Desc = 'Continuously drops selected fuel items into campfire, one by one, FAST.',
                        Default = false,
                        Callback = function(value30)
                            v3.AutoFuelCampfireOn = value30
                        end,
                    })
                    task.spawn(function()
                        while true do
                            task.wait(0.5)

                            if not v3.AutoFuelCampfireOn then
                            else
                                f10(f9(v3.AutoFuelCampfireList), vector)
                            end
                        end
                    end)
                    v110.Main:Divider()
                    v110.Main:Section({
                        Title = f2('Auto Compress'),
                        Icon = 'cog',
                        Opened = false,
                        Desc = '',
                    })

                    v11 = {
                        'Bolt',
                        'Sheet Metal',
                        'Broken Fan',
                        'Log',
                        'Broken Radio',
                        'Old Radio',
                        'Broken Microwave',
                        'Tyre',
                        'Chair',
                        'Metal Chair',
                        'Old Car Engine',
                        'Washing Machine',
                        'Bone',
                        'Skull',
                        'UFO Junk',
                        'UFO Component',
                        'UFO Scrap',
                    }
                    v3.AutoWoodCompressList = {}
                    v3.AutoWoodCompressOn = false
                    vector2 = Vector3.new(21.15, 19, -6.12)

                    local main2 = v110.Main

                    local function f88()
                        local v131 = {
                            'All',
                        }

                        for index22, value31 in ipairs(v11)do
                            v131[#v131 + 1] = value31
                        end

                        return v131
                    end

                    main2:Dropdown({
                        Title = 'Items to Compress',
                        Desc = 'Select which items to drop into the compressor.',
                        Values = f88(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value32)
                            v3.AutoWoodCompressList = {}

                            if type(value32) == 'table' then
                                local v132 = false

                                for index23, value33 in ipairs(value32)do
                                    if value33 == 'All' then
                                        v132 = true

                                        break
                                    end
                                end

                                if v132 then
                                    for index24, value34 in ipairs(v11)do
                                        v3.AutoWoodCompressList[value34] = true
                                    end
                                else
                                    for index25, value35 in ipairs(value32)do
                                        if type(value35) == 'string' then
                                            v3.AutoWoodCompressList[value35] = true
                                        end
                                    end
                                end
                            end
                        end,
                    })
                end
                do
                    v110.Main:Button({
                        Title = '\u{26a1} Compress Items Now',
                        Desc = 'Instantly sends all selected items to the compressor, one by one, FAST.',
                        Callback = function()
                            task.spawn(function()
                                local v133 = f9(v3.AutoWoodCompressList)

                                f10(v133, vector2)
                                f4('Compressing ' .. #v133 .. ' items!')
                            end)
                        end,
                    })
                    v110.Main:Toggle({
                        Title = 'Auto Compress Items',
                        Desc = 'Continuously compresses selected items from the whole map, one by one, FAST.',
                        Default = false,
                        Callback = function(value36)
                            v3.AutoWoodCompressOn = value36
                        end,
                    })
                    task.spawn(function()
                        while true do
                            task.wait(0.5)

                            if not v3.AutoWoodCompressOn then
                            else
                                f10(f9(v3.AutoWoodCompressList), vector2)
                            end
                        end
                    end)
                    v110.Main:Divider()
                    v110.Main:Section({
                        Title = f2('Auto Consume'),
                        Icon = 'apple',
                        Opened = false,
                        Desc = '',
                    })

                    v12 = {
                        Food = {
                            'Carrot',
                            'Apple',
                            'Berry',
                            'Corn',
                            'Pumpkin',
                            'Chili',
                            'Cake',
                            'Stew',
                            'Hearty Stew',
                            'Meat? Sandwich',
                            'Cooked Morsel',
                            'Morsel',
                            'Steak',
                            'Ribs',
                            'Cooked Meat',
                            'Cooked Fish',
                            'Cooked Rabbit Meat',
                            'Cooked Bear Meat',
                            'Cooked Wolf Meat',
                            'Cooked Mammoth Meat',
                        },
                    }
                    v3.autoConsumeList = {}

                    for index26, value37 in ipairs(v12.Food)do
                        v3.autoConsumeList[value37] = false
                    end

                    v13 = false

                    function f42(p20)
                        v13 = p20
                    end

                    local main3 = v110.Main

                    local function f89()
                        local v134 = {
                            'All',
                        }

                        for index27, value38 in ipairs(v12.Food)do
                            v134[#v134 + 1] = value38
                        end

                        return v134
                    end

                    main3:Dropdown({
                        Title = 'Food Items to Consume',
                        Values = f89(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value39)
                            v3.autoConsumeList = {}

                            if type(value39) == 'table' then
                                local v135 = false

                                for index28, value40 in ipairs(value39)do
                                    if value40 == 'All' then
                                        v135 = true

                                        break
                                    end
                                end

                                if v135 then
                                    for index29, value41 in ipairs(v12.Food)do
                                        v3.autoConsumeList[value41] = true
                                    end
                                else
                                    for index30, value42 in ipairs(value39)do
                                        if type(value42) == 'string' then
                                            v3.autoConsumeList[value42] = true
                                        end
                                    end
                                end
                            end
                        end,
                    })
                end

                v110.Main:Toggle({
                    Title = 'Auto Consume',
                    Default = false,
                    Callback = function(value43)
                        f42(value43)
                    end,
                })

                function f43(p21)
                    remoteEvents.RequestConsumeItem:InvokeServer(p21)
                end
                function f12()
                    local character2 = localPlayer.Character
                    local position5

                    if not (character2 and character2:FindFirstChild('HumanoidRootPart')) then
                        return nil
                    else
                        local humanoidRootPart6 = character2.HumanoidRootPart
                        local huge = math.huge
                        local v136 = nil

                        for index31, value44 in ipairs(items:GetChildren())do
                            if v3.autoConsumeList[value44.Name] then
                                if value44:IsA('Model') then
                                    position5 = value44:GetPivot().Position
                                else
                                    position5 = value44:FindFirstChildWhichIsA('BasePart') and value44:FindFirstChildWhichIsA('BasePart').Position or Vector3.new()
                                end

                                local magnitude = (humanoidRootPart6.Position - position5).Magnitude

                                if magnitude < huge and magnitude <= v14 then
                                    v136 = value44
                                    huge = magnitude
                                end
                            end
                        end

                        return v136
                    end
                end

                v14 = 200

                function f44()
                    local inventory = localPlayer:FindFirstChild('Inventory')

                    if not inventory then
                        return
                    end

                    for key, value45 in pairs(v3.autoConsumeList)do
                        if value45 then
                            local findFirstChild = inventory:FindFirstChild(key)

                            if findFirstChild then
                                f43(findFirstChild)
                            end
                        end
                    end
                end

                task.spawn(function()
                    while true do
                        if v13 then
                            f44()

                            local v137 = f12()

                            if v137 then
                                f43(v137)
                            end
                        end

                        task.wait(0.3)
                    end
                end)
                v110.Combat:Divider()
                v110.Combat:Section({
                    Title = f2('Godmode'),
                    Icon = 'shield',
                    Opened = false,
                    Desc = '',
                })
                v110.Combat:Paragraph({
                    Title = 'GODMODE OP',
                    Desc = 'Keeps Health and Hunger maxed out at all times. NOTE: Mob/combat damage is server-sided in this game, so this will NOT protect you from wolf/beast attacks \u{2014} only from hunger and client-side damage like fall damage.',
                })

                v3.GodModeEnabled = false

                v110.Combat:Toggle({
                    Title = 'GODMODE OP',
                    Desc = 'Currently fixing this feature, pls wait for the next update',
                    Default = false,
                    Locked = true,
                    Callback = function(value46) end,
                })
                v110.Combat:Divider()

                do
                    v110.Combat:Section({
                        Title = f2('Kill Aura'),
                        Icon = 'swords',
                        Opened = false,
                        Desc = '',
                    })

                    v15 = {
                        ['Old Axe'] = '1_8982038982',
                        ['Good Axe'] = '112_8982038982',
                        ['Strong Axe'] = '116_8982038982',
                        Chainsaw = '647_8992824875',
                        Spear = '196_8999010016',
                    }

                    local toolDamageObject = remoteEvents:FindFirstChild('ToolDamageObject') or remoteEvents:WaitForChild('ToolDamageObject', 10)
                    local equipItemHandle = remoteEvents:FindFirstChild('EquipItemHandle') or remoteEvents:WaitForChild('EquipItemHandle', 10)

                    if not remoteEvents:FindFirstChild('UnequipItemHandle') then
                        remoteEvents:WaitForChild('UnequipItemHandle', 10)
                    end

                    function f13(p22)
                        if p22 then
                            equipItemHandle:FireServer('FireAllClients', p22)
                        end
                    end
                    function f45()
                        local inventory2 = localPlayer:FindFirstChild('Inventory')

                        if not inventory2 then
                            return nil, nil
                        end

                        for key2, value47 in pairs(v15)do
                            local findFirstChild2 = inventory2:FindFirstChild(key2)

                            if findFirstChild2 then
                                return findFirstChild2, value47
                            end
                        end

                        return nil, nil
                    end

                    v3.KillAuraActive = false
                    v3.KillAuraRadius = 100

                    v110.Combat:Toggle({
                        Title = 'Kill Aura',
                        Default = false,
                        Callback = function(value48)
                            v3.KillAuraActive = value48
                        end,
                    })
                    v110.Combat:Slider({
                        Title = 'Kill Aura Radius',
                        Step = 1,
                        Value = {
                            Min = 10,
                            Max = 150,
                            Default = 100,
                        },
                        Callback = function(value49)
                            v3.KillAuraRadius = tonumber(value49)
                        end,
                    })
                    task.spawn(function()
                        while true do
                            if v3.KillAuraActive then
                                local character3 = localPlayer.Character
                                local humanoidRootPart7 = character3 and character3:FindFirstChild('HumanoidRootPart')

                                if humanoidRootPart7 then
                                    local v138, v139 = f45()

                                    if v138 and v139 then
                                        f13(v138)

                                        local characters = workspaceService:FindFirstChild('Characters')

                                        if characters then
                                            for index32, value50 in ipairs(characters:GetChildren())do
                                                local v140 = value50

                                                if v140:IsA('Model') then
                                                    local basePart = v140:FindFirstChildWhichIsA('BasePart')

                                                    if basePart and (basePart.Position - humanoidRootPart7.Position).Magnitude <= v3.KillAuraRadius then
                                                        pcall(function()
                                                            toolDamageObject:InvokeServer(v140, v138, v139, CFrame.new(basePart.Position))
                                                        end)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end

                            task.wait(0.1)
                        end
                    end)
                end

                v110.Combat:Divider()
                v110.Combat:Section({
                    Title = f2('Auto Escape'),
                    Icon = 'zap',
                    Opened = false,
                    Desc = '',
                })
                v110.Combat:Paragraph({
                    Title = 'Auto Escape',
                    Desc = 'Automatically teleports you to the campfire when you take damage. Select which enemies should trigger the escape.',
                })

                v16 = false
                v17 = {}
                vector3 = Vector3.new(1.87, 5, -3.67)
                v18 = {
                    conn = nil,
                    lastHP = math.huge,
                }

                v110.Combat:Dropdown({
                    Title = 'Escape Trigger (Enemy Type)',
                    Desc = 'Teleport to campfire when hit by these enemies.',
                    Values = {
                        'Cat',
                        'Deer',
                        'Rambo',
                        'Owl',
                    },
                    Value = {},
                    Multi = true,
                    AllowNone = true,
                    Callback = function(value51)
                        v17 = {}

                        if type(value51) == 'table' then
                            for index33, value52 in ipairs(value51)do
                                if type(value52) == 'string' then
                                    v17[value52:lower()] = true
                                end
                            end
                        end
                    end,
                })

                function f46()
                    local character4 = localPlayer.Character
                    local humanoidRootPart8 = character4 and character4:FindFirstChild('HumanoidRootPart')

                    if not humanoidRootPart8 then
                        return false
                    else
                        local v141 = false
                        local v142, v143, v144 = pairs(v17)

                        if v142(v143, v144) then
                            v141 = true
                        end
                        if not v141 then
                            return true
                        else
                            local characters2 = workspace:FindFirstChild('Characters') or workspace:FindFirstChild('Mobs') or workspace:FindFirstChild('Enemies')

                            if not characters2 then
                                return true
                            end

                            for key3, value53 in pairs(characters2:GetChildren())do
                                if value53:IsA('Model') then
                                    local lower = value53.Name:lower()

                                    for key4, value54 in pairs(v17)do
                                        if lower:find(key4) then
                                            local humanoidRootPart9 = value53:FindFirstChild('HumanoidRootPart')
                                            local basePart2 = humanoidRootPart9

                                            basePart2 = humanoidRootPart9 or value53:FindFirstChildWhichIsA('BasePart')

                                            if basePart2 and (basePart2.Position - humanoidRootPart8.Position).Magnitude <= 30 then
                                                return true
                                            end
                                        end
                                    end
                                end
                            end

                            return false
                        end
                    end
                end
                function f47()
                    local character5 = localPlayer.Character
                    local humanoidRootPart10 = character5 and character5:FindFirstChild('HumanoidRootPart')

                    if not humanoidRootPart10 then
                        return
                    end

                    pcall(function()
                        humanoidRootPart10.CFrame = CFrame.new(vector3)
                    end)
                    f4('Auto Escape: Teleported to campfire!')
                end

                v110.Combat:Toggle({
                    Title = 'Auto Escape',
                    Default = false,
                    Callback = function(value55)
                        v16 = value55

                        local f90

                        if value55 then
                            local character6 = localPlayer.Character
                            local humanoid2 = character6 and character6:FindFirstChildOfClass('Humanoid')

                            v18.lastHP = humanoid2 and humanoid2.Health or math.huge

                            if v18.conn then
                                v18.conn:Disconnect()
                            end

                            function f90(p23)
                                if v18.conn then
                                    v18.conn:Disconnect()
                                end

                                v18.conn = p23.HealthChanged:Connect(function(p24)
                                    if not v16 then
                                        return
                                    end
                                    if p24 < v18.lastHP and p24 > 0 then
                                        if f46() then
                                            f47()
                                        end
                                    end

                                    v18.lastHP = p24
                                end)
                            end

                            if humanoid2 then
                                f90(humanoid2)
                            end

                            localPlayer.CharacterAdded:Connect(function(character7)
                                if not v16 then
                                    return
                                else
                                    local waitForChild = character7:WaitForChild('Humanoid', 5)

                                    if waitForChild then
                                        v18.lastHP = waitForChild.Health

                                        f90(waitForChild)
                                    end

                                    return
                                end
                            end)
                            f4('Auto Escape: ON')
                        else
                            if v18.conn then
                                v18.conn:Disconnect()

                                v18.conn = nil
                            end

                            f4('Auto Escape: OFF')
                        end
                    end,
                })

                v19 = false
                v20 = 50
                v18.hpConn = nil
                v18.hpRespawnConn = nil

                v110.Combat:Paragraph({
                    Title = 'Auto Escape (Health)',
                    Desc = 'Automatically teleports you to the campfire when your HP drops below the set threshold.',
                })
                v110.Combat:Slider({
                    Title = 'Escape HP Threshold',
                    Desc = 'Teleport to campfire when HP falls below this value. Range: 30\u{2013}100.',
                    Value = {
                        Min = 30,
                        Max = 100,
                        Default = 50,
                    },
                    Step = 1,
                    Callback = function(value56)
                        v20 = value56
                    end,
                })

                function f48(p25)
                    if v18.hpConn then
                        v18.hpConn:Disconnect()
                    end

                    v18.hpConn = p25.HealthChanged:Connect(function(p26)
                        if not v19 then
                            return
                        end

                        local humanoidRootPart11

                        if p26 > 0 and p26 < v20 then
                            local character8 = localPlayer.Character

                            humanoidRootPart11 = character8 and character8:FindFirstChild('HumanoidRootPart')

                            if humanoidRootPart11 then
                                pcall(function()
                                    humanoidRootPart11.CFrame = CFrame.new(vector3)
                                end)
                                f4('Auto Escape (HP): HP below ' .. v20 .. ' \u{2014} teleported to campfire!')
                            end
                        end
                    end)
                end

                v110.Combat:Toggle({
                    Title = 'Auto Escape (Health)',
                    Default = false,
                    Callback = function(value57)
                        v19 = value57

                        if value57 then
                            local character9 = localPlayer.Character
                            local humanoid3 = character9 and character9:FindFirstChildOfClass('Humanoid')

                            if humanoid3 then
                                f48(humanoid3)
                            end
                            if v18.hpRespawnConn then
                                v18.hpRespawnConn:Disconnect()
                            end

                            v18.hpRespawnConn = localPlayer.CharacterAdded:Connect(function(character10)
                                if not v19 then
                                    return
                                else
                                    local waitForChild2 = character10:WaitForChild('Humanoid', 5)

                                    if waitForChild2 then
                                        f48(waitForChild2)
                                    end

                                    return
                                end
                            end)

                            f4('Auto Escape (HP): ON \u{2014} escaping below ' .. v20 .. ' HP')
                        else
                            if v18.hpConn then
                                v18.hpConn:Disconnect()

                                v18.hpConn = nil
                            end
                            if v18.hpRespawnConn then
                                v18.hpRespawnConn:Disconnect()

                                v18.hpRespawnConn = nil
                            end

                            f4('Auto Escape (HP): OFF')
                        end
                    end,
                })
                v110.Combat:Divider()
                v110.Combat:Section({
                    Title = f2('Auto Bandage'),
                    Icon = 'heart',
                    Opened = false,
                    Desc = '',
                })
                v110.Combat:Paragraph({
                    Title = 'Auto Bandage',
                    Desc = 'When your HP drops below the threshold, automatically finds bandages in workspace.Items, brings them to you and uses them.',
                })

                function f49()
                    local v145 = {}

                    for index34, value58 in ipairs(workspace.Items:GetChildren())do
                        if value58.Name:lower():find('bandage') then
                            table.insert(v145, value58)
                        end
                    end

                    return v145
                end

                v21 = {
                    enabled = false,
                    threshold = 60,
                }

                v110.Combat:Slider({
                    Title = 'Bandage HP Threshold',
                    Desc = 'Auto-use a bandage when HP falls below this value.',
                    Value = {
                        Min = 10,
                        Max = 100,
                        Default = 60,
                    },
                    Step = 5,
                    Callback = function(value59)
                        v21.threshold = value59
                    end,
                })
                v110.Combat:Toggle({
                    Title = 'Auto Bandage',
                    Desc = 'Automatically brings and uses bandages when HP is low.',
                    Default = false,
                    Callback = function(value60)
                        v21.enabled = value60

                        f4('Auto Bandage: ' .. (value60 and 'ON (threshold ' .. v21.threshold .. ' HP)' or 'OFF'))
                    end,
                })
                task.spawn(function()
                    while true do
                        task.wait(0.5)

                        if not v21.enabled then
                        else
                            local character11 = localPlayer.Character
                            local humanoid4 = character11 and character11:FindFirstChildOfClass('Humanoid')
                            local humanoidRootPart12 = character11 and character11:FindFirstChild('HumanoidRootPart')

                            if not humanoid4 or not humanoidRootPart12 or humanoid4.Health <= 0 then
                            elseif humanoid4.Health < v21.threshold then
                                local v146 = false

                                for index35, value61 in ipairs((f49()))do
                                    local v147 = value61

                                    if not v147.Parent then
                                    else
                                        pcall(function()
                                            remoteEvents.RequestStartDraggingItem:FireServer(v147)
                                            task.wait(0.05)

                                            local cframe = CFrame.new(humanoidRootPart12.Position + Vector3.new(0, 2, 0))

                                            if v147:IsA('Model') then
                                                v147:PivotTo(cframe)
                                            else
                                                local basePart3 = v147:FindFirstChildWhichIsA('BasePart')

                                                if basePart3 then
                                                    basePart3.CFrame = cframe
                                                end
                                            end

                                            task.wait(0.05)
                                            remoteEvents.StopDraggingItem:FireServer(v147)
                                        end)
                                        task.wait(0.1)
                                        pcall(function()
                                            remoteEvents.RequestConsumeItem:InvokeServer(v147)
                                        end)
                                        f4('Auto Bandage: used! HP ' .. math.floor(humanoid4.Health) .. ' \u{2192} healing')

                                        v146 = true

                                        break
                                    end
                                end

                                if not v146 then
                                    local inventory3 = localPlayer:FindFirstChild('Inventory')

                                    if inventory3 then
                                        for index36, value62 in ipairs(inventory3:GetChildren())do
                                            local v148 = value62

                                            if v148.Name:lower():find('bandage') then
                                                pcall(function()
                                                    remoteEvents.RequestConsumeItem:InvokeServer(v148)
                                                end)
                                                f4('Auto Bandage: used from inventory!')

                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
                v110.Main:Divider()
                v110.Main:Section({
                    Title = f2('Landmarks'),
                    Icon = 'map-pin',
                    Opened = false,
                    Desc = '',
                })
                v110.Main:Paragraph({
                    Title = 'Reveal Landmarks (Full Map)',
                    Desc = 'Tries to find landmarks. Re-press to catch any new ones.',
                })
                v110.Main:Button({
                    Title = '  Reveal Landmarks (Full Map)',
                    Icon = 'map-pin',
                    Description = 'Reveals all landmarks on the full map.',
                    Callback = function()
                        task.spawn(function()
                            local map2 = workspace:FindFirstChild('Map')
                            local v149, f91, humanoidRootPart13, cframe2

                            if not map2 then
                                f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                return
                            else
                                local landmarks = map2:FindFirstChild('Landmarks')

                                if not landmarks then
                                    f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                    return
                                else
                                    v149 = 0

                                    function f91(p27)
                                        if not p27 then
                                            return
                                        end

                                        for index37, value63 in ipairs(p27:GetChildren())do
                                            for index38, value64 in ipairs(value63:GetDescendants())do
                                                local v150 = value64

                                                if v150:IsA('ProximityPrompt') then
                                                    pcall(function()
                                                        fireproximityprompt(v150)
                                                    end)

                                                    v149 = v149 + 1
                                                end
                                                if v150:IsA('BillboardGui') or v150:IsA('SurfaceGui') then
                                                    pcall(function()
                                                        v150.Enabled = true
                                                    end)
                                                end
                                                if v150:IsA('SelectionBox') or v150:IsA('Highlight') then
                                                    pcall(function()
                                                        v150.Visible = true
                                                    end)
                                                end
                                            end

                                            local proximityPrompt = value63:FindFirstChildWhichIsA('ProximityPrompt')

                                            if proximityPrompt then
                                                pcall(function()
                                                    fireproximityprompt(proximityPrompt)
                                                end)
                                            end
                                            if value63:IsA('Folder') or value63:IsA('Model') then
                                                f91(value63)
                                            end
                                        end
                                    end

                                    f91(landmarks)

                                    local caves = map2:FindFirstChild('Caves')

                                    if caves then
                                        f91(caves)
                                    end

                                    local biomes = map2:FindFirstChild('Biomes')

                                    if biomes then
                                        f91(biomes)
                                    end

                                    local character12 = localPlayer.Character

                                    humanoidRootPart13 = character12 and character12:FindFirstChild('HumanoidRootPart')

                                    if humanoidRootPart13 then
                                        local vector5 = Vector3.new(0, 50, 0)
                                        local vector6 = Vector3.new(300, 50, 0)
                                        local vector7 = Vector3.new(-300, 50, 0)
                                        local vector8 = Vector3.new(0, 50, 300)
                                        local vector9 = Vector3.new(0, 50, -300)
                                        local v151 = {
                                            vector5,
                                            vector6,
                                            vector7,
                                            vector8,
                                            vector9,
                                            Vector3.new(200, 50, 200),
                                            Vector3.new(-200, 50, 200),
                                            Vector3.new(200, 50, -200),
                                            Vector3.new(-200, 50, -200),
                                            Vector3.new(400, 50, 400),
                                            Vector3.new(-400, 50, 400),
                                            Vector3.new(400, 50, -400),
                                            Vector3.new(-400, 50, -400),
                                        }

                                        cframe2 = humanoidRootPart13.CFrame

                                        for index39, value65 in ipairs(v151)do
                                            local v152 = value65

                                            pcall(function()
                                                humanoidRootPart13.CFrame = CFrame.new(v152)
                                            end)
                                            task.wait(0.06)
                                        end

                                        pcall(function()
                                            humanoidRootPart13.CFrame = cframe2
                                        end)
                                    end

                                    f4('Landmarks revealed! (' .. v149 .. ' prompts fired)')

                                    return
                                end
                            end
                        end)
                    end,
                })
                v110.Main:Divider()
                v110.Main:Section({
                    Title = f2('Send to Volcano'),
                    Icon = 'flame',
                    Opened = false,
                    Desc = '',
                })

                v22 = {
                    'Cultist Corpse',
                    'Cultist Gem',
                    'Cultist Prototype',
                    'Cultist Experiment',
                }
                v23 = {}
                v24 = false

                do
                    function f50()
                        local v153, v154 = pcall(function()
                            return workspace.Map.Landmarks.Volcano.Functional.Lava.Position
                        end)

                        if v153 and v154 then
                            return v154
                        end

                        return Vector3.new(0, 50, 0)
                    end

                    local main4 = v110.Main

                    local function f92()
                        local v155 = {
                            'All',
                        }

                        for index40, value66 in ipairs(v22)do
                            v155[#v155 + 1] = value66
                        end

                        return v155
                    end

                    main4:Dropdown({
                        Title = 'Volcano Items',
                        Desc = 'Choose what to throw into the volcano.',
                        Values = f92(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value67)
                            v23 = {}

                            if type(value67) == 'table' then
                                local v156 = false

                                for index41, value68 in ipairs(value67)do
                                    if value68 == 'All' then
                                        v156 = true

                                        break
                                    end
                                end

                                if v156 then
                                    for index42, value69 in ipairs(v22)do
                                        v23[#v23 + 1] = value69
                                    end
                                else
                                    for index43, value70 in ipairs(value67)do
                                        v23[#v23 + 1] = value70
                                    end
                                end
                            end
                        end,
                    })
                    v110.Main:Button({
                        Title = '  Send to Volcano',
                        Icon = 'flame',
                        Description = 'Drags all selected items into the volcano lava, one by one, FAST.',
                        Callback = function()
                            if #v23 == 0 then
                                f4('Select items first!')

                                return
                            end

                            task.spawn(function()
                                local v157 = {}

                                for index44, value71 in ipairs(v23)do
                                    v157[value71] = true
                                end

                                local v158 = f9(v157)

                                f10(v158, (f50()))
                                f4('Sending ' .. #v158 .. ' item(s) to the volcano!')
                            end)
                        end,
                    })
                    v110.Main:Toggle({
                        Title = 'Auto Send to Volcano (Loop)',
                        Desc = 'Continuously sends selected items to the volcano, one by one, FAST.',
                        Default = false,
                        Callback = function(value72)
                            v24 = value72

                            if value72 then
                                f4('Auto Volcano: ON')
                            else
                                f4('Auto Volcano: OFF')
                            end
                        end,
                    })
                    task.spawn(function()
                        while true do
                            task.wait(1)

                            if v24 and #v23 > 0 then
                                local v159 = {}

                                for index45, value73 in ipairs(v23)do
                                    v159[value73] = true
                                end

                                f10(f9(v159), (f50()))
                            end
                        end
                    end)
                    v110.Main:Divider()
                    v110.Main:Section({
                        Title = f2('Auto Tree Chop'),
                        Icon = 'axe',
                        Opened = false,
                        Desc = '',
                    })
                    v110.Main:Paragraph({
                        Title = 'Tree Aura',
                        Desc = 'Tree Aura Chop Trees Reach',
                    })

                    v3.AutoTreeChopRadius = 50
                    v3.AutoTreeChopOn = v3.AutoTreeChopOn or false
                end
                do
                    v3.AutoTreeChopRadius = 100
                    v3.MaxTargets = v3.MaxTargets or 5
                    v25 = {
                        typeFilter = 'All Trees',
                    }

                    function f51(p28, p29, p30)
                        local foliage = workspace:FindFirstChild('Map') and workspace.Map:FindFirstChild('Foliage')
                        local v160 = {}

                        if not foliage then
                            return v160
                        else
                            for index46, value74 in ipairs(foliage:GetChildren())do
                                if value74:IsA('Model') then
                                    if v25.typeFilter == 'All Trees' or value74.Name == v25.typeFilter or v25.typeFilter == 'Pine Tree' and value74.Name:lower():find('pine') or v25.typeFilter == 'Large Tree' and (value74.Name:lower():find('large') or value74.Name:lower():find('big')) or v25.typeFilter == 'Small Tree' and value74.Name == 'Small Tree' then
                                        local primaryPart2 = value74.PrimaryPart or value74:FindFirstChild('Trunk') or value74:FindFirstChildWhichIsA('BasePart')

                                        if primaryPart2 then
                                            local magnitude2 = (primaryPart2.Position - p28.Position).Magnitude

                                            if magnitude2 <= p29 then
                                                table.insert(v160, {
                                                    model = value74,
                                                    dist = magnitude2,
                                                })
                                            end
                                        end
                                    end
                                end
                            end

                            table.sort(v160, function(p31, p32)
                                return p31.dist < p32.dist
                            end)

                            local v161 = {}

                            for i8 = 1, math.min(#v160, p30)do
                                table.insert(v161, v160[i8].model)
                            end

                            return v161
                        end
                    end

                    local toolDamageObject2 = replicatedStorage:FindFirstChild('RemoteEvents') and replicatedStorage.RemoteEvents:FindFirstChild('ToolDamageObject') or replicatedStorage:WaitForChild('RemoteEvents', 10) and replicatedStorage.RemoteEvents:WaitForChild('ToolDamageObject', 10)

                    v110.Main:Toggle({
                        Title = 'Chop Trees Aura',
                        Desc = 'Automatically chops trees within the aura radius.',
                        Default = false,
                        Callback = function(value75)
                            v3.AutoTreeChopOn = value75

                            if value75 then
                                f4('Tree Aura ON \u{2014} radius: ' .. v3.AutoTreeChopRadius .. ' studs')
                            end
                        end,
                    })
                    v110.Main:Slider({
                        Title = 'Max Targets (Simultaneous)',
                        Desc = 'Number of trees chopped at the same time per cycle.',
                        Value = {
                            Min = 1,
                            Max = 10,
                            Default = 5,
                        },
                        Step = 1,
                        Callback = function(value76)
                            v3.MaxTargets = value76
                        end,
                    })
                    v110.Main:Dropdown({
                        Title = 'Tree Types',
                        Desc = 'Select which tree type the aura targets.',
                        Values = {
                            'All Trees',
                            'Small Tree',
                            'Large Tree',
                            'Pine Tree',
                        },
                        Default = 'All Trees',
                        Multi = false,
                        Callback = function(value77)
                            v25.typeFilter = value77
                        end,
                    })

                    v26 = {
                        ['Old Axe'] = {
                            damageID = '5_10780399414',
                            equip = false,
                        },
                        ['Good Axe'] = {
                            damageID = '5_10780399414',
                            equip = true,
                        },
                        ['Strong Axe'] = {
                            damageID = '5_10780399414',
                            equip = true,
                        },
                    }
                    v3.TreeAuraSelectedAxe = 'Old Axe'

                    v110.Main:Dropdown({
                        Title = 'Tree Aura Axe',
                        Desc = 'Choose which axe Tree Aura uses to chop trees.',
                        Values = {
                            'Old Axe',
                            'Good Axe',
                            'Strong Axe',
                        },
                        Default = 'Old Axe',
                        Multi = false,
                        Callback = function(value78)
                            local v162 = v3

                            v162.TreeAuraSelectedAxe = value78 or 'Old Axe'
                        end,
                    })

                    v3.TreeHealthESPOn = false
                    v27 = {
                        bars = {},
                        conn = nil,
                    }

                    function f52(p33)
                        local v163 = v27.bars[p33]

                        if v163 and v163.billboard then
                            pcall(function()
                                v163.billboard:Destroy()
                            end)
                        end

                        v27.bars[p33] = nil
                    end

                    v110.Main:Toggle({
                        Title = 'Tree Health ESP',
                        Desc = 'Shows a health bar above each tree. Green = healthy, Yellow = damaged, Red = almost chopped.',
                        Default = false,
                        Callback = function(value79)
                            v3.TreeHealthESPOn = value79

                            if value79 then
                                if not v27.conn then
                                    v27.conn = task.spawn(function()
                                        while v3.TreeHealthESPOn do
                                            task.wait(1)
                                        end

                                        for key5, value80 in pairs(v27.bars)do
                                            f52(key5)
                                        end

                                        v27.bars = {}
                                        v27.conn = nil
                                    end)
                                end

                                f4('Tree Health ESP: ON')
                            else
                                f4('Tree Health ESP: OFF')
                            end
                        end,
                    })
                    task.spawn(function()
                        local equipItemHandle2 = replicatedStorage.RemoteEvents.EquipItemHandle

                        while true do
                            task.wait(0.15)

                            if v3.AutoTreeChopOn then
                                local character13 = localPlayer.Character
                                local humanoidRootPart14 = character13 and character13:FindFirstChild('HumanoidRootPart')
                                local inventory4 = localPlayer:FindFirstChild('Inventory')
                                local treeAuraSelectedAxe = v3.TreeAuraSelectedAxe or 'Old Axe'
                                local v164 = v26[treeAuraSelectedAxe]
                                local findFirstChild3 = inventory4 and inventory4:FindFirstChild(treeAuraSelectedAxe)

                                if not findFirstChild3 then
                                    for index47, value81 in ipairs({
                                        'Strong Axe',
                                        'Good Axe',
                                        'Old Axe',
                                    })do
                                        local findFirstChild4 = inventory4

                                        findFirstChild4 = inventory4 and inventory4:FindFirstChild(value81)

                                        if findFirstChild4 then
                                            findFirstChild3 = findFirstChild4
                                            v164 = v26[value81]

                                            break
                                        end
                                    end
                                end
                                if humanoidRootPart14 and findFirstChild3 and v164 then
                                    if v164.equip then
                                        pcall(function()
                                            equipItemHandle2:FireServer('FireAllClients', findFirstChild3)
                                        end)
                                        task.wait(0.05)
                                    end

                                    for index48, value82 in ipairs((f51(humanoidRootPart14, v3.AutoTreeChopRadius, v3.MaxTargets)))do
                                        local v165 = value82

                                        if v165 and v165.Parent then
                                            local v166 = findFirstChild3
                                            local damageID = v164.damageID

                                            task.spawn(function()
                                                pcall(function()
                                                    toolDamageObject2:InvokeServer(v165, v166, damageID, CFrame.new(26.493185043335, 4.234091758728, 72.239311218262, -0.41380417346954, 6.059067914066e-8, -0.91036593914032, -4.020093768986E-8, 1, 8.482962243761e-8, 0.91036593914032, 7.170041271820099e-8, -0.41380417346954), false)
                                                end)
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
                do
                    v110.Teleport:Divider()

                    local teleport = v110.Teleport
                    local teleportLocations = f2('Teleport Locations')

                    function f14(p34, cframe3)
                        p34.CFrame = cframe3
                    end

                    teleport:Section({
                        Title = teleportLocations,
                        Icon = 'map-pin',
                        Opened = false,
                        Desc = '',
                    })

                    v28 = {
                        Camp = function(p35)
                            p35.CFrame = CFrame.new(13.287363052368, 3.9999997615814, 0.3621221780777, 0.60222691297531, -2.2750361594602997E-8, 0.79832494258881, 6.4304570557283e-9, 1, 2.3646721913906e-8, -0.79832494258881, -9.1070981866892E-9, 0.60222691297531)
                        end,
                        Trader = function(p36)
                            p36.CFrame = CFrame.new(Vector3.new(-37.08, 3.98, -16.33))
                        end,
                        Campfire = function(p37)
                            p37.CFrame = CFrame.new(Vector3.new(1.87, 5, -3.67))
                        end,
                        Anvil = function(p38)
                            local v167, v168 = pcall(function()
                                return workspace.Map.Landmarks.ToolWorkshop.Functional.Anvil.Position
                            end)

                            if v167 and v168 then
                                f14(p38, CFrame.new(v168 + Vector3.new(0, 4, 0)))

                                return
                            else
                                local v169, v170 = pcall(function()
                                    return workspace.Map.Landmarks.ToolWorkshop:GetPivot().Position
                                end)

                                if v169 and v170 then
                                    f14(p38, CFrame.new(v170 + Vector3.new(0, 4, 0)))

                                    return
                                end

                                f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                return
                            end
                        end,
                        Blacksmith = function(p39)
                            for index49, value83 in ipairs({
                                function()
                                    return workspace.Map.Landmarks.ToolSmith:GetPivot().Position
                                end,
                                function()
                                    return workspace.Map.Landmarks:FindFirstChild('ToolSmith'):GetPivot().Position
                                end,
                                function()
                                    return workspace.Map.Landmarks:FindFirstChild('Blacksmith'):GetPivot().Position
                                end,
                                function()
                                    return workspace.Map.Landmarks:FindFirstChild('Forge'):GetPivot().Position
                                end,
                            })do
                                local v171, v172 = pcall(value83)

                                if v171 and v172 then
                                    f14(p39, CFrame.new(v172 + Vector3.new(0, 4, 0)))

                                    return
                                end
                            end

                            local map3 = workspace:FindFirstChild('Map')

                            if map3 then
                                for key6, value84 in pairs(map3:GetDescendants())do
                                    local v173 = value84
                                    local lower2 = v173.Name:lower()

                                    if lower2 == 'toolsmith' or lower2 == 'blacksmith' or lower2 == 'forge' or lower2 == 'smith' then
                                        local position6 = nil

                                        if v173:IsA('Model') then
                                            local v174, v175 = pcall(function()
                                                return v173:GetPivot().Position
                                            end)

                                            if v174 then
                                                position6 = v175
                                            end
                                        elseif v173:IsA('BasePart') then
                                            position6 = v173.Position
                                        end
                                        if position6 then
                                            f14(p39, CFrame.new(position6 + Vector3.new(0, 4, 0)))

                                            return
                                        end
                                    end
                                end

                                f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                return
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                        Stronghold = function(p40)
                            for index50, value85 in ipairs({
                                function()
                                    return workspace.Map.Landmarks.Stronghold:GetPivot().Position
                                end,
                                function()
                                    return workspace.Map.Landmarks:FindFirstChild('Stronghold'):GetPivot().Position
                                end,
                                function()
                                    return workspace.Map.Landmarks:FindFirstChild('Castle'):GetPivot().Position
                                end,
                                function()
                                    return workspace.Map.Landmarks:FindFirstChild('Fort'):GetPivot().Position
                                end,
                            })do
                                local v176, v177 = pcall(value85)

                                if v176 and v177 then
                                    f14(p40, CFrame.new(v177 + Vector3.new(0, 6, 0)))

                                    return
                                end
                            end

                            local map4 = workspace:FindFirstChild('Map')

                            if map4 then
                                for key7, value86 in pairs(map4:GetDescendants())do
                                    local v178 = value86
                                    local lower3 = v178.Name:lower()

                                    if lower3 == 'stronghold' or lower3 == 'castle' or lower3 == 'fort' then
                                        local position7 = nil

                                        if v178:IsA('Model') then
                                            local v179, v180 = pcall(function()
                                                return v178:GetPivot().Position
                                            end)

                                            if v179 then
                                                position7 = v180
                                            end
                                        elseif v178:IsA('BasePart') then
                                            position7 = v178.Position
                                        end
                                        if position7 then
                                            f14(p40, CFrame.new(position7 + Vector3.new(0, 6, 0)))

                                            return
                                        end
                                    end
                                end

                                f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                return
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                        ['Random Tree'] = function(p41)
                            local map5 = workspace:FindFirstChild('Map')

                            if not map5 then
                                f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                return
                            else
                                local foliage2 = map5:FindFirstChild('Foliage') or map5:FindFirstChild('Landmarks')

                                if not foliage2 then
                                    f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                    return
                                else
                                    local v181 = {}

                                    for index51, value87 in ipairs(foliage2:GetChildren())do
                                        if value87.Name == 'Small Tree' and value87:IsA('Model') then
                                            local trunk = value87:FindFirstChild('Trunk') or value87.PrimaryPart

                                            if trunk then
                                                table.insert(v181, trunk)
                                            end
                                        end
                                    end

                                    if #v181 > 0 then
                                        local v182 = v181[math.random(1, #v181)]

                                        p41.CFrame = CFrame.new(v182.CFrame.Position + v182.CFrame.RightVector * 3)
                                    else
                                        f4('\u{1f4cd} No trees found \u{2014} please load the Map first!')
                                    end

                                    return
                                end
                            end
                        end,
                        Volcano = function(p42)
                            local v183, v184 = pcall(function()
                                return workspace.Map.Landmarks.Volcano
                            end)

                            if v183 and v184 then
                                local v185, v186 = pcall(function()
                                    return workspace.Map.Landmarks.Volcano.Functional.Lava.Position
                                end)

                                if v185 and v186 then
                                    f14(p42, CFrame.new(v186 + Vector3.new(0, 20, 0)))

                                    return
                                else
                                    local v187, v188 = pcall(function()
                                        return v184:GetPivot().Position
                                    end)

                                    if v187 and v188 then
                                        f14(p42, CFrame.new(v188 + Vector3.new(0, 20, 0)))

                                        return
                                    end
                                end
                            end

                            local map6 = workspace:FindFirstChild('Map')

                            if map6 then
                                for key8, value88 in pairs(map6:GetDescendants())do
                                    local v189 = value88
                                    local lower4 = v189.Name:lower()

                                    if lower4 == 'volcano' or lower4 == 'lava' then
                                        local position8 = nil

                                        if v189:IsA('BasePart') then
                                            position8 = v189.Position
                                        elseif v189:IsA('Model') then
                                            local v190, v191 = pcall(function()
                                                return v189:GetPivot().Position
                                            end)

                                            if v190 then
                                                position8 = v191
                                            end
                                        end
                                        if position8 then
                                            f14(p42, CFrame.new(position8 + Vector3.new(0, 20, 0)))

                                            return
                                        end
                                    end
                                end

                                f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                return
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                    }
                    v29 = 'Camp'

                    v110.Teleport:Dropdown({
                        Title = 'Select Destination',
                        Desc = 'Choose a location to teleport to.',
                        Values = {
                            'Camp',
                            'Trader',
                            'Campfire',
                            'Anvil',
                            'Blacksmith',
                            'Stronghold',
                            'Random Tree',
                            'Volcano',
                        },
                        Default = 'Camp',
                        Multi = false,
                        Callback = function(value89)
                            v29 = value89
                        end,
                    })
                    v110.Teleport:Button({
                        Title = '\u{26a1} Teleport Now',
                        Desc = 'Teleports you to the selected destination.',
                        Callback = function()
                            local character14 = localPlayer.Character
                            local humanoidRootPart15 = character14 and character14:FindFirstChild('HumanoidRootPart')

                            if not humanoidRootPart15 then
                                f4('No character!')

                                return
                            else
                                local v192 = v28[v29]

                                if v192 then
                                    v192(humanoidRootPart15)
                                    f4('Teleported to ' .. v29 .. '!')
                                else
                                    f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                                end

                                return
                            end
                        end,
                    })
                    v110.Teleport:Divider()
                    v110.Teleport:Section({
                        Title = f2('TP to Caves'),
                        Icon = 'landmark',
                        Opened = false,
                        Desc = '',
                    })

                    v30 = {
                        CaveLevel1 = function(p43)
                            for index52, value90 in ipairs({
                                function()
                                    return workspace.Map.Caves.CaveLevel1:GetPivot().Position
                                end,
                                function()
                                    local caves2 = workspace.Map:FindFirstChild('Caves')

                                    return caves2 and caves2:FindFirstChild('CaveLevel1') and caves2.CaveLevel1:GetPivot().Position
                                end,
                            })do
                                local v193, v194 = pcall(value90)

                                if v193 and v194 then
                                    f14(p43, CFrame.new(v194 + Vector3.new(0, 8, 0)))

                                    return
                                end
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                        CaveLevel2 = function(p44)
                            for index53, value91 in ipairs({
                                function()
                                    return workspace.Map.Caves.CaveLevel2:GetPivot().Position
                                end,
                                function()
                                    local caves3 = workspace.Map:FindFirstChild('Caves')

                                    return caves3 and caves3:FindFirstChild('CaveLevel2') and caves3.CaveLevel2:GetPivot().Position
                                end,
                            })do
                                local v195, v196 = pcall(value91)

                                if v195 and v196 then
                                    f14(p44, CFrame.new(v196 + Vector3.new(0, 8, 0)))

                                    return
                                end
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                        CaveLevel3 = function(p45)
                            for index54, value92 in ipairs({
                                function()
                                    return workspace.Map.Caves.CaveLevel3:GetPivot().Position
                                end,
                                function()
                                    local caves4 = workspace.Map:FindFirstChild('Caves')

                                    return caves4 and caves4:FindFirstChild('CaveLevel3') and caves4.CaveLevel3:GetPivot().Position
                                end,
                            })do
                                local v197, v198 = pcall(value92)

                                if v197 and v198 then
                                    f14(p45, CFrame.new(v198 + Vector3.new(0, 8, 0)))

                                    return
                                end
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                        CaveLevel4 = function(p46)
                            for index55, value93 in ipairs({
                                function()
                                    return workspace.Map.Caves.CaveLevel4:GetPivot().Position
                                end,
                                function()
                                    local caves5 = workspace.Map:FindFirstChild('Caves')

                                    return caves5 and caves5:FindFirstChild('CaveLevel4') and caves5.CaveLevel4:GetPivot().Position
                                end,
                            })do
                                local v199, v200 = pcall(value93)

                                if v199 and v200 then
                                    f14(p46, CFrame.new(v200 + Vector3.new(0, 8, 0)))

                                    return
                                end
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                        CaveLevel5 = function(p47)
                            for index56, value94 in ipairs({
                                function()
                                    return workspace.Map.Caves.CaveLevel5:GetPivot().Position
                                end,
                                function()
                                    local caves6 = workspace.Map:FindFirstChild('Caves')

                                    return caves6 and caves6:FindFirstChild('CaveLevel5') and caves6.CaveLevel5:GetPivot().Position
                                end,
                            })do
                                local v201, v202 = pcall(value94)

                                if v201 and v202 then
                                    f14(p47, CFrame.new(v202 + Vector3.new(0, 8, 0)))

                                    return
                                end
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                        CaveOuter = function(p48)
                            for index57, value95 in ipairs({
                                function()
                                    return workspace.Map.Caves.CaveOuter:GetPivot().Position
                                end,
                                function()
                                    local caves7 = workspace.Map:FindFirstChild('Caves')

                                    return caves7 and caves7:FindFirstChild('CaveOuter') and caves7.CaveOuter:GetPivot().Position
                                end,
                            })do
                                local v203, v204 = pcall(value95)

                                if v203 and v204 then
                                    f14(p48, CFrame.new(v204 + Vector3.new(0, 8, 0)))

                                    return
                                end
                            end

                            f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                        end,
                    }
                end

                v31 = 'CaveLevel1'

                v110.Teleport:Dropdown({
                    Title = 'Select Cave',
                    Desc = 'Choose a cave level to teleport to.',
                    Values = {
                        'CaveLevel1',
                        'CaveLevel2',
                        'CaveLevel3',
                        'CaveLevel4',
                        'CaveLevel5',
                        'CaveOuter',
                    },
                    Default = 'CaveLevel1',
                    Multi = false,
                    Callback = function(value96)
                        v31 = value96
                    end,
                })
                v110.Teleport:Button({
                    Title = '\u{26a1} TP to Cave',
                    Desc = 'Teleports you to the selected cave level.',
                    Callback = function()
                        local character15 = localPlayer.Character
                        local humanoidRootPart16 = character15 and character15:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart16 then
                            f4('No character!')

                            return
                        else
                            local v205 = v30[v31]

                            if v205 then
                                v205(humanoidRootPart16)
                                f4('Teleported to ' .. v31 .. '!')
                            else
                                f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')
                            end

                            return
                        end
                    end,
                })
                v110.Teleport:Divider()
                v110.Teleport:Section({
                    Title = f2('TP to Lost Children'),
                    Icon = 'user',
                    Opened = false,
                    Desc = '',
                })

                v32 = {
                    'Lost Child',
                    'Lost Child2',
                    'Lost Child3',
                    'Lost Child4',
                }

                function f53(p49)
                    local characters3 = workspace:FindFirstChild('Characters')

                    if characters3 then
                        local findFirstChild5 = characters3:FindFirstChild(p49)

                        if findFirstChild5 then
                            return findFirstChild5
                        end

                        for index58, value97 in ipairs(characters3:GetChildren())do
                            if value97.Name:lower():find('lost') and value97.Name:lower():find('child') then
                                if value97.Name == p49 or value97.Name:lower() == p49:lower() then
                                    return value97
                                end
                            end
                        end
                    end

                    local f93

                    function f93(p50, p51)
                        if p51 > 5 then
                            return nil
                        end

                        for index59, value98 in ipairs(p50:GetChildren())do
                            if value98.Name == p49 then
                                return value98
                            end
                            if value98.Name:lower():find('lost') and value98.Name:lower():find('child') and (value98.Name == p49 or value98.Name:lower() == p49:lower()) then
                                return value98
                            end
                            if value98:IsA('Folder') or value98:IsA('Model') then
                                local v206 = f93(value98, p51 + 1)

                                if v206 then
                                    return v206
                                end
                            end
                        end

                        return nil
                    end

                    return f93(workspace, 0)
                end
                function f54()
                    local v207 = {}
                    local v208 = {}

                    local function f94(p52, p53)
                        if p53 > 6 then
                            return
                        end

                        for index60, value99 in ipairs(p52:GetChildren())do
                            if not v208[value99] and value99:IsA('Model') and value99.Name:lower():find('lost') and value99.Name:lower():find('child') then
                                v208[value99] = true

                                table.insert(v207, value99)
                            end
                            if value99:IsA('Folder') or value99:IsA('Model') then
                                f94(value99, p53 + 1)
                            end
                        end
                    end

                    f94(workspace, 0)

                    return v207
                end
                function f55(p54)
                    local character16 = localPlayer.Character
                    local humanoidRootPart17 = character16 and character16:FindFirstChild('HumanoidRootPart')
                    local v209

                    if not humanoidRootPart17 then
                        f4('No character!')

                        return
                    else
                        local v210 = v32[p54]

                        if not v210 then
                            f4('Invalid index: ' .. tostring(p54))

                            return
                        end

                        v209 = f53(v210)

                        if v209 then
                            local humanoidRootPart18 = v209:FindFirstChild('HumanoidRootPart') or v209:FindFirstChild('Head') or v209:FindFirstChildWhichIsA('BasePart')

                            if humanoidRootPart18 then
                                f14(humanoidRootPart17, CFrame.new(humanoidRootPart18.Position + Vector3.new(0, 4, 0)))
                                f4('Teleported to ' .. v209.Name)
                            else
                                pcall(function()
                                    f14(humanoidRootPart17, CFrame.new(v209:GetPivot().Position + Vector3.new(0, 4, 0)))
                                    f4('Teleported to ' .. v209.Name)
                                end)
                            end

                            return
                        else
                            local v211 = f54()

                            table.sort(v211, function(p55, p56)
                                return p55.Name < p56.Name
                            end)

                            local v212 = v211[p54]

                            if v212 then
                                local basePart4 = v212:FindFirstChildWhichIsA('BasePart')

                                if basePart4 then
                                    f14(humanoidRootPart17, CFrame.new(basePart4.Position + Vector3.new(0, 4, 0)))
                                    f4('TP to ' .. v212.Name .. ' (fallback)')

                                    return
                                end

                                f4('\u{1f4cd} Lost Child #' .. p54 .. ' not found \u{2014} they may not have spawned yet, or try loading the Map first.')

                                return
                            end

                            f4('\u{1f4cd} Lost Child #' .. p54 .. ' not found \u{2014} they may not have spawned yet, or try loading the Map first.')

                            return
                        end
                    end
                end

                v33 = 1

                v110.Teleport:Dropdown({
                    Title = 'Select Lost Child',
                    Desc = 'Choose which lost child to teleport to.',
                    Values = {
                        'Lost Child #1',
                        'Lost Child #2',
                        'Lost Child #3',
                        'Lost Child #4',
                    },
                    Default = 'Lost Child #1',
                    Multi = false,
                    Callback = function(value100)
                        if value100 == 'Lost Child #1' then
                            v33 = 1
                        elseif value100 == 'Lost Child #2' then
                            v33 = 2
                        elseif value100 == 'Lost Child #3' then
                            v33 = 3
                        elseif value100 == 'Lost Child #4' then
                            v33 = 4
                        end
                    end,
                })
                v110.Teleport:Button({
                    Title = '\u{26a1} TP to Lost Child',
                    Desc = 'Teleports you to the selected lost child.',
                    Callback = function()
                        f55(v33)
                    end,
                })

                do
                    v110.Teleport:Divider()
                    v110.Teleport:Section({
                        Title = f2('Teleport to Chest'),
                        Icon = 'package',
                        Opened = false,
                        Desc = '',
                    })
                    v110.Teleport:Paragraph({
                        Title = 'Teleport to Chest',
                        Desc = 'Select a chest from the dropdown then press Teleport to go to it.',
                    })

                    function f15()
                        local v213 = f56()
                        local v214 = {}
                        local v215 = {}

                        v3._chestTPMap = {}

                        for index61, value101 in ipairs(v213)do
                            local name = value101.Name

                            v214[name] = (v214[name] or 0) + 1

                            local v216 = name .. ' ' .. v214[name]

                            table.insert(v215, v216)

                            v3._chestTPMap[v216] = value101
                        end

                        return v215
                    end
                    function f56()
                        local v217 = {}

                        for index62, value102 in ipairs(items:GetChildren())do
                            if value102.Name:lower():find('chest') then
                                table.insert(v217, value102)
                            end
                        end

                        return v217
                    end

                    v34 = nil

                    local v218 = f15()
                    local teleport2 = v110.Teleport

                    function f16(p57)
                        local humanoidRootPart19 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart19 then
                            f4('No character!')

                            return
                        else
                            local count = 0

                            for index63, value103 in ipairs(workspace.Items:GetChildren())do
                                local v219 = value103

                                if v219.Name:lower():find(p57:lower()) then
                                    pcall(function()
                                        remoteEvents.RequestStartDraggingItem:FireServer(v219)
                                        task.wait(0.05)

                                        local cframe4 = CFrame.new(humanoidRootPart19.Position + Vector3.new(math.random(-2, 2), 3, math.random(-2, 2)))

                                        if v219:IsA('Model') then
                                            v219:PivotTo(cframe4)
                                        else
                                            v219.CFrame = cframe4
                                        end

                                        task.wait(0.05)
                                        remoteEvents.StopDraggingItem:FireServer(v219)
                                    end)

                                    count = count + 1
                                end
                            end

                            if count > 0 then
                                f4('Brought ' .. count .. ' x ' .. p57)
                            else
                                f4("No '" .. p57 .. "' found on the map!")
                            end

                            return
                        end
                    end

                    selectChestDropdown = teleport2:Dropdown({
                        Title = 'Select Chest',
                        Desc = "Lists all chests as 'Item Chest 1', 'Item Chest 2', etc. Refreshes automatically when new chests appear.",
                        Values = v218,
                        Value = v218[1] or nil,
                        Multi = false,
                        AllowNone = true,
                        Callback = function(value104)
                            v34 = value104
                        end,
                    })

                    task.spawn(function()
                        while true do
                            task.wait(5)

                            local v220 = f15()

                            pcall(function()
                                selectChestDropdown:SetValues(v220)
                            end)
                        end
                    end)
                    v110.Teleport:Button({
                        Title = '\u{26a1} Teleport to Chest',
                        Desc = 'Teleports you to the selected chest.',
                        Callback = function()
                            local character17 = localPlayer.Character
                            local humanoidRootPart20 = character17 and character17:FindFirstChild('HumanoidRootPart')

                            if not humanoidRootPart20 then
                                f4('No character!')

                                return
                            elseif not v34 then
                                f4('Select a chest first!')

                                return
                            else
                                local chestTPMap = v3._chestTPMap and v3._chestTPMap[v34]

                                if not chestTPMap or not chestTPMap.Parent then
                                    f4('\u{1f4cd} Chest not found \u{2014} try scanning again or load the Map first!')

                                    return
                                else
                                    local primaryPart3 = chestTPMap:IsA('Model') and (chestTPMap.PrimaryPart or chestTPMap:FindFirstChildWhichIsA('BasePart')) or chestTPMap

                                    if primaryPart3 then
                                        f14(humanoidRootPart20, CFrame.new(primaryPart3.Position + Vector3.new(0, 4, 0)))
                                        f4('Teleported to ' .. chestTPMap.Name .. '!')
                                    else
                                        f4('\u{1f4cd} Could not get chest position \u{2014} please load the Map first!')
                                    end

                                    return
                                end
                            end
                        end,
                    })
                end
                do
                    local v221 = {}

                    v221['Bring Everything'] = function()
                        local humanoidRootPart21 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart21 then
                            f4('No character!')

                            return
                        else
                            local count2 = 0

                            for index64, value105 in ipairs(workspace.Items:GetChildren())do
                                local v222 = value105

                                if pcall(function()
                                    remoteEvents.RequestStartDraggingItem:FireServer(v222)
                                    task.wait(0.03)

                                    local cframe5 = CFrame.new(humanoidRootPart21.Position + Vector3.new(math.random(-4, 4), 3, math.random(-4, 4)))

                                    if v222:IsA('Model') then
                                        v222:PivotTo(cframe5)
                                    else
                                        v222.CFrame = cframe5
                                    end

                                    task.wait(0.03)
                                    remoteEvents.StopDraggingItem:FireServer(v222)
                                end) then
                                    count2 = count2 + 1
                                end
                            end

                            f4('Brought ' .. count2 .. ' items to you!')

                            return
                        end
                    end
                    v221['Auto Cook Meat'] = function()
                        local vector10 = Vector3.new(1.87, 4.33, -3.67)

                        for key9, value106 in pairs(workspace.Items:GetChildren())do
                            if value106.Name:lower():find('meat') then
                                local basePart5 = value106:FindFirstChildWhichIsA('BasePart') or value106

                                if basePart5 then
                                    basePart5.CFrame = CFrame.new(vector10 + Vector3.new(math.random(-2, 2), 0.5, math.random(-2, 2)))
                                end
                            end
                        end
                    end
                    v221['Bring Logs'] = function()
                        local humanoidRootPart22 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart22 then
                            return
                        end

                        for key10, value107 in pairs(workspace.Items:GetChildren())do
                            if value107.Name:lower():find('log') and value107:IsA('Model') then
                                local basePart6 = value107:FindFirstChildWhichIsA('BasePart')

                                if basePart6 then
                                    basePart6.CFrame = humanoidRootPart22.CFrame * CFrame.new(math.random(-5, 5), 0, math.random(-5, 5))
                                end
                            end
                        end
                    end
                    v221['Bring Lost Child'] = function()
                        local character18 = localPlayer.Character
                        local humanoidRootPart23 = character18 and character18:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart23 then
                            f4('No character!')

                            return
                        else
                            local characters4 = workspace:FindFirstChild('Characters')

                            if not characters4 then
                                f4('\u{1f4cd} Place not found \u{2014} please load the Map first!')

                                return
                            else
                                local count3 = 0

                                for index65, value108 in ipairs(characters4:GetChildren())do
                                    local v223 = value108
                                    local lower5 = v223.Name:lower()

                                    if v223:IsA('Model') and lower5:find('lost') and lower5:find('child') and v223:FindFirstChild('HumanoidRootPart') then
                                        pcall(function()
                                            v223:PivotTo(humanoidRootPart23.CFrame + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3)))
                                        end)

                                        count3 = count3 + 1
                                    end
                                end

                                if count3 > 0 then
                                    f4('Brought ' .. count3 .. ' Lost Children to you!')
                                else
                                    f4('No Lost Children found in Characters folder!')
                                end

                                return
                            end
                        end
                    end

                    for key11, value109 in pairs({
                        ['Bring Revolver'] = 'revolver',
                        ['Bring Riffle'] = 'rifle',
                        ['Bring Rifle ammo'] = 'rifle ammo',
                        ['Bring Revolver ammo'] = 'revolver ammo',
                        Katana = 'katana',
                        Chainsaw = 'chainsaw',
                        Morningstar = 'morningstar',
                        ['Tactical Shotgun'] = 'tactical shotgun',
                        Kunai = 'kunai',
                        ['Riot Shield'] = 'riot shield',
                        Spear = 'spear',
                        ['Good Axe'] = 'good axe',
                        ['Strong Axe'] = 'strong axe',
                        ['Leather Armor'] = 'leather armor',
                        ['Iron Armor'] = 'iron armor',
                        ['Thorn Armor'] = 'thorn armor',
                        ['Coin Stack'] = 'coin stack',
                        Bandage = 'bandage',
                        Medkit = 'medkit',
                        ['Good Sack'] = 'good sack',
                        ['Giant Sack'] = 'giant sack',
                        ['Car Engine'] = 'car engine',
                        ['Broken Fan'] = 'broken fan',
                        ['Broken Radio'] = 'broken radio',
                        ['Sheet Metal'] = 'sheet metal',
                        Tyre = 'tyre',
                        Coal = 'coal',
                        ['Fuel Canister'] = 'fuel canister',
                        Biofuel = 'biofuel',
                        ['Oil Barrel'] = 'oil barrel',
                        ['Wolf Pelt'] = 'wolf pelt',
                        ['Alpha Wolf Pelt'] = 'alpha wolf pelt',
                        ['Bear Pelt'] = 'bear pelt',
                        ['Cultist Gem'] = 'cultist gem',
                        ['Cultist Prototype'] = 'cultist prototype',
                        ['Cultist Experiment'] = 'cultist experiment',
                        ['Old Flashlight'] = 'old flashlight',
                        ['Strong Flashlight'] = 'strong flashlight',
                        ['Rabbit Foot'] = 'rabbit foot',
                        ['Ice Axe'] = 'ice axe',
                        Ribs = 'ribs',
                        ['Ice Sword'] = 'ice sword',
                        ['Laser Sword'] = 'laser sword',
                        ['Frozen Shuriken'] = 'frozen shuriken',
                        Snowball = 'snowball',
                        ['Ray Gun'] = 'ray gun',
                        ['Laser Cannon'] = 'laser cannon',
                        ['Forest Gem'] = 'forest gem',
                        ['Arctic Fox Pelt'] = 'arctic fox pelt',
                    })do
                        local v224 = value109

                        v221[key11] = function()
                            f16(v224)
                        end
                    end

                    v35 = {
                        ['Bring Logs'] = 'log',
                        Revolver = 'revolver',
                        Rifle = 'rifle',
                        ['Rifle Ammo'] = 'rifle ammo',
                        ['Revolver Ammo'] = 'revolver ammo',
                        Katana = 'katana',
                        Chainsaw = 'chainsaw',
                        Morningstar = 'morningstar',
                        ['Tactical Shotgun'] = 'tactical shotgun',
                        Kunai = 'kunai',
                        ['Riot Shield'] = 'riot shield',
                        Spear = 'spear',
                        ['Good Axe'] = 'good axe',
                        ['Strong Axe'] = 'strong axe',
                        ['Ice Axe'] = 'ice axe',
                        ['Ice Sword'] = 'ice sword',
                        ['Laser Sword'] = 'laser sword',
                        ['Frozen Shuriken'] = 'frozen shuriken',
                        Snowball = 'snowball',
                        ['Ray Gun'] = 'ray gun',
                        ['Laser Cannon'] = 'laser cannon',
                        ['Leather Armor'] = 'leather armor',
                        ['Iron Armor'] = 'iron armor',
                        ['Thorn Armor'] = 'thorn armor',
                        ['Coin Stack'] = 'coin stack',
                        Bandage = 'bandage',
                        Medkit = 'medkit',
                        ['Good Sack'] = 'good sack',
                        ['Giant Sack'] = 'giant sack',
                        ['Rabbit Foot'] = 'rabbit foot',
                        Coal = 'coal',
                        ['Fuel Canister'] = 'fuel canister',
                        Biofuel = 'biofuel',
                        ['Oil Barrel'] = 'oil barrel',
                        Ribs = 'ribs',
                        ['Car Engine'] = 'car engine',
                        ['Broken Fan'] = 'broken fan',
                        ['Broken Radio'] = 'broken radio',
                        ['Sheet Metal'] = 'sheet metal',
                        Tyre = 'tyre',
                        ['Wolf Pelt'] = 'wolf pelt',
                        ['Alpha Wolf Pelt'] = 'alpha wolf pelt',
                        ['Bear Pelt'] = 'bear pelt',
                        ['Arctic Fox Pelt'] = 'arctic fox pelt',
                        ['Cultist Gem'] = 'cultist gem',
                        ['Cultist Prototype'] = 'cultist prototype',
                        ['Cultist Experiment'] = 'cultist experiment',
                        ['Forest Gem'] = 'forest gem',
                        ['Old Flashlight'] = 'old flashlight',
                        ['Strong Flashlight'] = 'strong flashlight',
                    }
                    v36 = {
                        'Bring Logs',
                        'Revolver',
                        'Rifle',
                        'Rifle Ammo',
                        'Revolver Ammo',
                        'Katana',
                        'Chainsaw',
                        'Morningstar',
                        'Tactical Shotgun',
                        'Kunai',
                        'Riot Shield',
                        'Spear',
                        'Good Axe',
                        'Strong Axe',
                        'Ice Axe',
                        'Ice Sword',
                        'Laser Sword',
                        'Frozen Shuriken',
                        'Snowball',
                        'Ray Gun',
                        'Laser Cannon',
                        'Leather Armor',
                        'Iron Armor',
                        'Thorn Armor',
                        'Coin Stack',
                        'Bandage',
                        'Medkit',
                        'Good Sack',
                        'Giant Sack',
                        'Rabbit Foot',
                        'Coal',
                        'Fuel Canister',
                        'Biofuel',
                        'Oil Barrel',
                        'Ribs',
                        'Car Engine',
                        'Broken Fan',
                        'Broken Radio',
                        'Sheet Metal',
                        'Tyre',
                        'Wolf Pelt',
                        'Alpha Wolf Pelt',
                        'Bear Pelt',
                        'Arctic Fox Pelt',
                        'Cultist Gem',
                        'Cultist Prototype',
                        'Cultist Experiment',
                        'Forest Gem',
                        'Old Flashlight',
                        'Strong Flashlight',
                    }
                    v3.autoBringSelectedItems = {}
                    v3.autoBringEnabled = false

                    function f57(p58)
                        local humanoidRootPart24 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart24 then
                            return
                        end

                        for index66, value110 in ipairs(workspace.Items:GetChildren())do
                            local v225 = value110

                            if v225.Name:lower():find(p58:lower()) then
                                pcall(function()
                                    remoteEvents.RequestStartDraggingItem:FireServer(v225)
                                    task.wait(0.05)

                                    local cframe6 = CFrame.new(humanoidRootPart24.Position + Vector3.new(math.random(-2, 2), 3, math.random(-2, 2)))

                                    if v225:IsA('Model') then
                                        v225:PivotTo(cframe6)
                                    else
                                        v225.CFrame = cframe6
                                    end

                                    task.wait(0.05)
                                    remoteEvents.StopDraggingItem:FireServer(v225)
                                end)
                            end
                        end
                    end

                    task.spawn(function()
                        while true do
                            task.wait(1)

                            if v3.autoBringEnabled then
                                for key12, value111 in pairs(v3.autoBringSelectedItems)do
                                    local v226 = v35[key12]

                                    if v226 then
                                        f57(v226)
                                    end
                                end
                            end
                        end
                    end)
                end
                do
                    v110.Bring:Divider()
                    v110.Bring:Section({
                        Title = f2('Quick Actions'),
                        Icon = 'zap',
                        Opened = false,
                        Desc = '',
                    })

                    v37 = {
                        'item chest',
                        'chest',
                        'crate',
                        'barrel_sealed',
                        'loot_box',
                        'lockbox',
                    }

                    function f58(p59)
                        local lower6 = p59.Name:lower()

                        if lower6:match('^item chest') then
                            return true
                        end

                        for index67, value112 in ipairs(v37)do
                            if lower6:find(value112, 1, true) then
                                return true
                            end
                        end

                        return false
                    end
                    function f59(p60)
                        local position9, v227, f95, v228

                        if not p60 then
                            return 0
                        else
                            position9 = p60.Position
                            v227 = 0

                            function f95(p61)
                                if not p61 or not p61.Parent then
                                    return
                                elseif f58(p61) then
                                    return
                                else
                                    local handle2 = p61:FindFirstChild('Handle') or p61:FindFirstChildWhichIsA('BasePart')

                                    if not handle2 then
                                        return
                                    end
                                    if handle2.Locked or handle2.Anchored then
                                        return
                                    end

                                    pcall(function()
                                        remoteEvents.RequestStartDraggingItem:FireServer(p61)

                                        local cframe7 = CFrame.new(position9 + Vector3.new(math.random(-4, 4), 3, math.random(-4, 4)))

                                        if p61:IsA('Model') then
                                            p61:PivotTo(cframe7)
                                        else
                                            handle2.CFrame = cframe7
                                        end

                                        remoteEvents.StopDraggingItem:FireServer(p61)
                                    end)

                                    v227 = v227 + 1

                                    return
                                end
                            end

                            v228 = {}

                            local v229 = workspace

                            local function f96(p62)
                                if not p62 then
                                    return
                                end

                                for index68, value113 in ipairs(p62:GetChildren())do
                                    table.insert(v228, task.spawn(f95, value113))
                                end
                            end

                            f96(v229:FindFirstChild('Items'))
                            f96(workspace:FindFirstChild('DroppedItems'))
                            f96(workspace:FindFirstChild('WorldItems'))
                            f96(workspace:FindFirstChild('Drops'))
                            f96(workspace:FindFirstChild('Loot'))
                            f96(workspace:FindFirstChild('Pickups'))

                            local map7 = workspace:FindFirstChild('Map')

                            if map7 then
                                for index69, value114 in ipairs(map7:GetChildren())do
                                    f96(value114)
                                end
                            end

                            return v227
                        end
                    end

                    v110.Bring:Button({
                        Title = 'Bring Everything',
                        Callback = function()
                            local humanoidRootPart25 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')
                            local position10, v230

                            if not humanoidRootPart25 then
                                f4('No character!')

                                return
                            else
                                position10 = humanoidRootPart25.Position
                                v230 = 0

                                local v231 = workspace
                                local v232 = {}
                                local v233 = workspace
                                local v234 = workspace
                                local v235 = workspace
                                local v236 = workspace

                                for index70, value115 in ipairs({
                                    v231:FindFirstChild('Items'),
                                    v233:FindFirstChild('DroppedItems'),
                                    v234:FindFirstChild('WorldItems'),
                                    v235:FindFirstChild('Drops'),
                                    v236:FindFirstChild('Loot'),
                                })do
                                    if value115 then
                                        for index71, value116 in ipairs(value115:GetChildren())do
                                            local v237 = value116

                                            table.insert(v232, task.spawn(function()
                                                if not v237 or not v237.Parent then
                                                    return
                                                else
                                                    local handle3 = v237:FindFirstChild('Handle') or v237:FindFirstChildWhichIsA('BasePart')

                                                    if handle3 and not handle3.Locked and not handle3.Anchored then
                                                        pcall(function()
                                                            remoteEvents.RequestStartDraggingItem:FireServer(v237)

                                                            local cframe8 = CFrame.new(position10 + Vector3.new(math.random(-4, 4), 3, math.random(-4, 4)))

                                                            if v237:IsA('Model') then
                                                                v237:PivotTo(cframe8)
                                                            else
                                                                handle3.CFrame = cframe8
                                                            end

                                                            remoteEvents.StopDraggingItem:FireServer(v237)
                                                        end)

                                                        v230 = v230 + 1
                                                    end

                                                    return
                                                end
                                            end))
                                        end
                                    end
                                end

                                task.wait(0.2)
                                f4('Bring Everything: ' .. v230 .. ' items brought (including chests)!')

                                return
                            end
                        end,
                    })
                    v110.Bring:Button({
                        Title = 'Bring All (No Chests)',
                        Desc = 'Instantly brings every item from the entire map to you. Skips chests.',
                        Callback = function()
                            local humanoidRootPart26 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                            if not humanoidRootPart26 then
                                f4('No character!')

                                return
                            end

                            f4('Bring All: ' .. f59(humanoidRootPart26) .. ' items brought to you!')
                        end,
                    })
                    v110.Bring:Button({
                        Title = 'Open Chests',
                        Desc = 'Continuously fires proximity prompts on all Item Chests in the map.',
                        Callback = function()
                            task.spawn(function()
                                while true do
                                    local items2 = workspace:FindFirstChild('Items')

                                    if items2 then
                                        for index72, value117 in ipairs(items2:GetChildren())do
                                            if value117:IsA('Model') and value117.Name:match('^Item Chest%d*$') then
                                                value117:FindFirstChildWhichIsA('ProximityPrompt', true)
                                            end
                                        end
                                    end

                                    task.wait(2)
                                end
                            end)
                        end,
                    })
                    v110.Bring:Divider()
                    v110.Bring:Section({
                        Title = f2('Bring Items'),
                        Icon = 'inbox',
                        Opened = false,
                        Desc = '',
                    })

                    local bring = v110.Bring

                    local function f97()
                        local v238 = {
                            'All',
                        }

                        for index73, value118 in ipairs(v36)do
                            v238[#v238 + 1] = value118
                        end

                        return v238
                    end

                    bring:Dropdown({
                        Title = 'Select Items to Bring',
                        Desc = "Choose items. Use 'Bring Selected Now' or enable Auto Bring.",
                        Values = f97(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value119)
                            v3.autoBringSelectedItems = {}

                            if type(value119) == 'table' then
                                local v239 = false

                                for index74, value120 in ipairs(value119)do
                                    if value120 == 'All' then
                                        v239 = true

                                        break
                                    end
                                end

                                if v239 then
                                    for index75, value121 in ipairs(v36)do
                                        v3.autoBringSelectedItems[value121] = true
                                    end
                                else
                                    for index76, value122 in ipairs(value119)do
                                        if type(value122) == 'string' then
                                            v3.autoBringSelectedItems[value122] = true
                                        end
                                    end
                                end
                            end
                        end,
                    })
                end
                do
                    v110.Bring:Button({
                        Title = '\u{26a1} Bring Selected Now',
                        Desc = 'Instantly brings all selected items to you once.',
                        Callback = function()
                            local humanoidRootPart27 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                            if not humanoidRootPart27 then
                                f4('No character!')

                                return
                            else
                                local count4 = 0

                                for key13, value123 in pairs(v3.autoBringSelectedItems)do
                                    local v240 = v35[key13]

                                    if v240 then
                                        for index77, value124 in ipairs(workspace.Items:GetChildren())do
                                            local v241 = value124

                                            if v241.Name:lower():find(v240:lower()) then
                                                pcall(function()
                                                    remoteEvents.RequestStartDraggingItem:FireServer(v241)
                                                    task.wait(0.05)

                                                    local cframe9 = CFrame.new(humanoidRootPart27.Position + Vector3.new(math.random(-2, 2), 3, math.random(-2, 2)))

                                                    if v241:IsA('Model') then
                                                        v241:PivotTo(cframe9)
                                                    else
                                                        v241.CFrame = cframe9
                                                    end

                                                    task.wait(0.05)
                                                    remoteEvents.StopDraggingItem:FireServer(v241)
                                                end)

                                                count4 = count4 + 1
                                            end
                                        end
                                    end
                                end

                                f4('Brought ' .. count4 .. ' item(s) to you!')

                                return
                            end
                        end,
                    })
                    v110.Bring:Toggle({
                        Title = '\u{1f504} Auto Bring Items',
                        Desc = 'Continuously brings all selected items to you every second.',
                        Default = false,
                        Callback = function(value125)
                            v3.autoBringEnabled = value125

                            if value125 then
                                f4('Auto Bring ON \u{2014} bringing selected items every 1s')
                            else
                                f4('Auto Bring OFF')
                            end
                        end,
                    })

                    function f60(p63)
                        local humanoidRootPart28 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')
                        local v242

                        if not humanoidRootPart28 then
                            f4('No character!')

                            return
                        else
                            v242 = 0

                            local function f98(p64)
                                local handle4 = p64:FindFirstChild('Handle') or p64:FindFirstChildWhichIsA('BasePart')

                                if not handle4 or handle4.Locked or handle4.Anchored then
                                    return
                                end

                                pcall(function()
                                    remoteEvents.RequestStartDraggingItem:FireServer(p64)
                                    task.wait(0.04)

                                    local cframe10 = CFrame.new(humanoidRootPart28.Position + Vector3.new(math.random(-3, 3), 3, math.random(-3, 3)))

                                    if p64:IsA('Model') then
                                        p64:PivotTo(cframe10)
                                    else
                                        handle4.CFrame = cframe10
                                    end

                                    task.wait(0.04)
                                    remoteEvents.StopDraggingItem:FireServer(p64)
                                end)

                                v242 = v242 + 1
                            end

                            local v243 = {}

                            for index78, value126 in ipairs(p63)do
                                v243[value126:lower()] = true
                            end

                            local v244 = workspace
                            local v245 = workspace
                            local v246 = workspace
                            local v247 = workspace
                            local v248 = {}

                            for index79, value127 in ipairs({
                                v244:FindFirstChild('Items'),
                                v245:FindFirstChild('DroppedItems'),
                                v246:FindFirstChild('WorldItems'),
                                v247:FindFirstChild('Drops'),
                            })do
                                if value127 then
                                    for index80, value128 in ipairs(value127:GetChildren())do
                                        if v243[value128.Name:lower()] then
                                            table.insert(v248, task.spawn(f98, value128))
                                        end
                                    end
                                end
                            end

                            task.wait(0.25)
                            f4('Brought ' .. v242 .. ' item(s) to you!')

                            return
                        end
                    end

                    v38 = {
                        armor = {},
                        weapon = {},
                        equipment = {},
                        food = {},
                        vegetable = {},
                        mobDrop = {},
                        other = {},
                        containers = {},
                    }

                    v110.Bring:Divider()
                    v110.Bring:Section({
                        Title = f2('Armor'),
                        Icon = 'shield',
                        Opened = false,
                        Desc = '',
                    })

                    v39 = {
                        'Leather Armor',
                        'Iron Armor',
                        'Thorn Armor',
                        'Leather Body',
                        'Iron Body',
                    }

                    local bring2 = v110.Bring

                    local function f99()
                        local v249 = {
                            'All',
                        }

                        for index81, value129 in ipairs(v39)do
                            v249[#v249 + 1] = value129
                        end

                        return v249
                    end

                    bring2:Dropdown({
                        Title = 'Select Armor',
                        Desc = 'Choose armor pieces to bring.',
                        Values = f99(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value130)
                            v38.armor = {}

                            if type(value130) == 'table' then
                                local v250 = false

                                for index82, value131 in ipairs(value130)do
                                    if value131 == 'All' then
                                        v250 = true

                                        break
                                    end
                                end

                                if v250 then
                                    for index83, value132 in ipairs(v39)do
                                        v38.armor[#v38.armor + 1] = value132
                                    end
                                else
                                    for index84, value133 in ipairs(value130)do
                                        v38.armor[#v38.armor + 1] = value133
                                    end
                                end
                            end
                        end,
                    })
                    v110.Bring:Button({
                        Title = '\u{26a1} Bring Armor',
                        Callback = function()
                            if #v38.armor == 0 then
                                f4('Select armor items first!')

                                return
                            end

                            f60(v38.armor)
                        end,
                    })
                    v110.Bring:Divider()
                end
                do
                    v110.Bring:Section({
                        Title = f2('Weapons'),
                        Icon = 'sword',
                        Opened = false,
                        Desc = '',
                    })

                    v40 = {
                        'Katana',
                        'Chainsaw',
                        'Morningstar',
                        'Tactical Shotgun',
                        'Kunai',
                        'Riot Shield',
                        'Spear',
                        'Good Axe',
                        'Strong Axe',
                        'Ice Axe',
                        'Ice Sword',
                        'Laser Sword',
                        'Frozen Shuriken',
                        'Snowball',
                        'Ray Gun',
                        'Laser Cannon',
                        'Revolver',
                        'Rifle',
                        'Old Axe',
                    }

                    local bring3 = v110.Bring

                    local function f100()
                        local v251 = {
                            'All',
                        }

                        for index85, value134 in ipairs(v40)do
                            v251[#v251 + 1] = value134
                        end

                        return v251
                    end

                    bring3:Dropdown({
                        Title = 'Select Weapons',
                        Desc = 'Choose weapons to bring.',
                        Values = f100(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value135)
                            v38.weapon = {}

                            if type(value135) == 'table' then
                                local v252 = false

                                for index86, value136 in ipairs(value135)do
                                    if value136 == 'All' then
                                        v252 = true

                                        break
                                    end
                                end

                                if v252 then
                                    for index87, value137 in ipairs(v40)do
                                        v38.weapon[#v38.weapon + 1] = value137
                                    end
                                else
                                    for index88, value138 in ipairs(value135)do
                                        v38.weapon[#v38.weapon + 1] = value138
                                    end
                                end
                            end
                        end,
                    })
                    v110.Bring:Button({
                        Title = '\u{26a1} Bring Weapons',
                        Callback = function()
                            if #v38.weapon == 0 then
                                f4('Select weapon items first!')

                                return
                            end

                            f60(v38.weapon)
                        end,
                    })
                    v110.Bring:Divider()
                    v110.Bring:Section({
                        Title = f2('Equipment'),
                        Icon = 'backpack',
                        Opened = false,
                        Desc = '',
                    })

                    v41 = {
                        'Rifle Ammo',
                        'Revolver Ammo',
                        'Bandage',
                        'Medkit',
                        'Good Sack',
                        'Giant Sack',
                        'Rabbit Foot',
                        'Old Flashlight',
                        'Strong Flashlight',
                        'Coin Stack',
                    }

                    local bring4 = v110.Bring

                    local function f101()
                        local v253 = {
                            'All',
                        }

                        for index89, value139 in ipairs(v41)do
                            v253[#v253 + 1] = value139
                        end

                        return v253
                    end

                    bring4:Dropdown({
                        Title = 'Select Equipment',
                        Desc = 'Choose equipment / utility items to bring.',
                        Values = f101(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value140)
                            v38.equipment = {}

                            if type(value140) == 'table' then
                                local v254 = false

                                for index90, value141 in ipairs(value140)do
                                    if value141 == 'All' then
                                        v254 = true

                                        break
                                    end
                                end

                                if v254 then
                                    for index91, value142 in ipairs(v41)do
                                        v38.equipment[#v38.equipment + 1] = value142
                                    end
                                else
                                    for index92, value143 in ipairs(value140)do
                                        v38.equipment[#v38.equipment + 1] = value143
                                    end
                                end
                            end
                        end,
                    })
                end
                do
                    v110.Bring:Button({
                        Title = '\u{26a1} Bring Equipment',
                        Callback = function()
                            if #v38.equipment == 0 then
                                f4('Select equipment items first!')

                                return
                            end

                            f60(v38.equipment)
                        end,
                    })
                    v110.Bring:Divider()
                    v110.Bring:Section({
                        Title = f2('Food'),
                        Icon = 'utensils',
                        Opened = false,
                        Desc = '',
                    })

                    v42 = {
                        'Morsel',
                        'Steak',
                        'Ribs',
                        'Cooked Morsel',
                        'Cooked Meat',
                        'Cooked Fish',
                        'Cooked Rabbit Meat',
                        'Cooked Bear Meat',
                        'Cooked Wolf Meat',
                        'Cooked Mammoth Meat',
                        'Meat? Sandwich',
                        'Cake',
                        'Stew',
                        'Hearty Stew',
                    }

                    local bring5 = v110.Bring

                    local function f102()
                        local v255 = {
                            'All',
                        }

                        for index93, value144 in ipairs(v42)do
                            v255[#v255 + 1] = value144
                        end

                        return v255
                    end

                    bring5:Dropdown({
                        Title = 'Select Food',
                        Desc = 'Choose cooked food items to bring.',
                        Values = f102(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value145)
                            v38.food = {}

                            if type(value145) == 'table' then
                                local v256 = false

                                for index94, value146 in ipairs(value145)do
                                    if value146 == 'All' then
                                        v256 = true

                                        break
                                    end
                                end

                                if v256 then
                                    for index95, value147 in ipairs(v42)do
                                        v38.food[#v38.food + 1] = value147
                                    end
                                else
                                    for index96, value148 in ipairs(value145)do
                                        v38.food[#v38.food + 1] = value148
                                    end
                                end
                            end
                        end,
                    })
                    v110.Bring:Button({
                        Title = '\u{26a1} Bring Food',
                        Callback = function()
                            if #v38.food == 0 then
                                f4('Select food items first!')

                                return
                            end

                            f60(v38.food)
                        end,
                    })
                    v110.Bring:Divider()
                    v110.Bring:Section({
                        Title = f2('Vegetables'),
                        Icon = 'leaf',
                        Opened = false,
                        Desc = '',
                    })

                    v43 = {
                        'Carrot',
                        'Apple',
                        'Berry',
                        'Corn',
                        'Pumpkin',
                        'Chili',
                        'Sapling',
                        'Log',
                    }

                    local bring6 = v110.Bring

                    local function f103()
                        local v257 = {
                            'All',
                        }

                        for index97, value149 in ipairs(v43)do
                            v257[#v257 + 1] = value149
                        end

                        return v257
                    end

                    bring6:Dropdown({
                        Title = 'Select Vegetables / Plants',
                        Desc = 'Choose plant / raw food items to bring.',
                        Values = f103(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value150)
                            v38.vegetable = {}

                            if type(value150) == 'table' then
                                local v258 = false

                                for index98, value151 in ipairs(value150)do
                                    if value151 == 'All' then
                                        v258 = true

                                        break
                                    end
                                end

                                if v258 then
                                    for index99, value152 in ipairs(v43)do
                                        v38.vegetable[#v38.vegetable + 1] = value152
                                    end
                                else
                                    for index100, value153 in ipairs(value150)do
                                        v38.vegetable[#v38.vegetable + 1] = value153
                                    end
                                end
                            end
                        end,
                    })
                end
                do
                    v110.Bring:Button({
                        Title = '\u{26a1} Bring Vegetables',
                        Callback = function()
                            if #v38.vegetable == 0 then
                                f4('Select items first!')

                                return
                            end

                            f60(v38.vegetable)
                        end,
                    })
                    v110.Bring:Divider()
                    v110.Bring:Section({
                        Title = f2('Mob Drops'),
                        Icon = 'skull',
                        Opened = false,
                        Desc = '',
                    })

                    v44 = {
                        'Wolf Pelt',
                        'Alpha Wolf Pelt',
                        'Bear Pelt',
                        'Arctic Fox Pelt',
                        'Cultist Gem',
                        'Cultist Prototype',
                        'Cultist Experiment',
                        'Forest Gem',
                        'Bone',
                        'Skull',
                        'Wolf Corpse',
                        'Alpha Wolf Corpse',
                        'Bear Corpse',
                        'Rabbit Foot',
                        'Ribs',
                    }

                    local bring7 = v110.Bring

                    local function f104()
                        local v259 = {
                            'All',
                        }

                        for index101, value154 in ipairs(v44)do
                            v259[#v259 + 1] = value154
                        end

                        return v259
                    end

                    bring7:Dropdown({
                        Title = 'Select Mob Drops',
                        Desc = 'Choose mob drop items to bring.',
                        Values = f104(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value155)
                            v38.mobDrop = {}

                            if type(value155) == 'table' then
                                local v260 = false

                                for index102, value156 in ipairs(value155)do
                                    if value156 == 'All' then
                                        v260 = true

                                        break
                                    end
                                end

                                if v260 then
                                    for index103, value157 in ipairs(v44)do
                                        v38.mobDrop[#v38.mobDrop + 1] = value157
                                    end
                                else
                                    for index104, value158 in ipairs(value155)do
                                        v38.mobDrop[#v38.mobDrop + 1] = value158
                                    end
                                end
                            end
                        end,
                    })
                    v110.Bring:Button({
                        Title = '\u{26a1} Bring Mob Drops',
                        Callback = function()
                            if #v38.mobDrop == 0 then
                                f4('Select mob drop items first!')

                                return
                            end

                            f60(v38.mobDrop)
                        end,
                    })
                    v110.Bring:Divider()
                    v110.Bring:Section({
                        Title = f2('Others'),
                        Icon = 'package',
                        Opened = false,
                        Desc = '',
                    })

                    v45 = {
                        'Coal',
                        'Fuel Canister',
                        'Biofuel',
                        'Oil Barrel',
                        'Car Engine',
                        'Broken Fan',
                        'Broken Radio',
                        'Sheet Metal',
                        'Tyre',
                        'Bolt',
                        'Old Radio',
                        'Broken Microwave',
                        'Washing Machine',
                        'Chair',
                        'Metal Chair',
                        'Old Car Engine',
                    }

                    local bring8 = v110.Bring

                    local function f105()
                        local v261 = {
                            'All',
                        }

                        for index105, value159 in ipairs(v45)do
                            v261[#v261 + 1] = value159
                        end

                        return v261
                    end

                    bring8:Dropdown({
                        Title = 'Select Other Items',
                        Desc = 'Choose fuel / scrap / misc items to bring.',
                        Values = f105(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value160)
                            v38.other = {}

                            if type(value160) == 'table' then
                                local v262 = false

                                for index106, value161 in ipairs(value160)do
                                    if value161 == 'All' then
                                        v262 = true

                                        break
                                    end
                                end

                                if v262 then
                                    for index107, value162 in ipairs(v45)do
                                        v38.other[#v38.other + 1] = value162
                                    end
                                else
                                    for index108, value163 in ipairs(value160)do
                                        v38.other[#v38.other + 1] = value163
                                    end
                                end
                            end
                        end,
                    })
                end

                v110.Bring:Button({
                    Title = '\u{26a1} Bring Others',
                    Callback = function()
                        if #v38.other == 0 then
                            f4('Select items first!')

                            return
                        end

                        f60(v38.other)
                    end,
                })
                v110.Bring:Divider()
                v110.Bring:Section({
                    Title = f2('Containers'),
                    Icon = 'package',
                    Opened = false,
                    Desc = '',
                })
                v110.Bring:Paragraph({
                    Title = 'Bring Chests',
                    Desc = 'Select chest types to bring to you one by one.',
                })
                v110.Bring:Dropdown({
                    Title = 'Select Chests to Bring',
                    Desc = 'Choose which chest types to bring.',
                    Values = {
                        'Item Chest',
                        'Chest',
                        'Cave Chest',
                        'Jungle Chest',
                        'Fairy Chest',
                        'Arctic Chest',
                        'Loot Chest',
                        'Wooden Chest',
                    },
                    Value = {},
                    Multi = true,
                    AllowNone = true,
                    Callback = function(value164)
                        v38.containers = {}

                        if type(value164) == 'table' then
                            for index109, value165 in ipairs(value164)do
                                v38.containers[#v38.containers + 1] = value165
                            end
                        end
                    end,
                })
                v110.Bring:Button({
                    Title = '\u{26a1} Bring Chests Now',
                    Desc = 'Brings selected chest types to you one by one.',
                    Callback = function()
                        if #v38.containers == 0 then
                            f4('Select chest types first!')

                            return
                        end

                        local humanoidRootPart29 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart29 then
                            f4('No character!')

                            return
                        end

                        task.spawn(function()
                            local count5 = 0

                            for index110, value166 in ipairs(v38.containers)do
                                local lower7 = value166:lower()

                                for index111, value167 in ipairs(items:GetChildren())do
                                    local v263 = value167

                                    if v263.Name:lower():find(lower7) then
                                        local handle5 = v263:FindFirstChild('Handle') or v263:FindFirstChildWhichIsA('BasePart')

                                        if handle5 and not handle5.Locked then
                                            pcall(function()
                                                remoteEvents.RequestStartDraggingItem:FireServer(v263)
                                                task.wait(0.1)

                                                local cframe11 = CFrame.new(humanoidRootPart29.Position + Vector3.new(math.random(-3, 3), 3, math.random(-3, 3)))

                                                if v263:IsA('Model') then
                                                    v263:PivotTo(cframe11)
                                                else
                                                    handle5.CFrame = cframe11
                                                end

                                                task.wait(0.1)
                                                remoteEvents.StopDraggingItem:FireServer(v263)
                                            end)

                                            count5 = count5 + 1

                                            task.wait(0.3)
                                        end
                                    end
                                end
                            end

                            f4('Brought ' .. count5 .. ' chest(s) to you!')
                        end)
                    end,
                })

                v3.autoBringContainersEnabled = false

                v110.Bring:Toggle({
                    Title = '\u{1f504} Auto Bring Chests',
                    Desc = 'Continuously brings selected chests to you one by one every cycle.',
                    Default = false,
                    Callback = function(value168)
                        v3.autoBringContainersEnabled = value168

                        f4('Auto Bring Chests: ' .. (value168 and 'ON' or 'OFF'))
                    end,
                })
                task.spawn(function()
                    while true do
                        task.wait(2)

                        if not v3.autoBringContainersEnabled then
                        elseif #(v38.containers or {}) == 0 then
                        else
                            local humanoidRootPart30 = localPlayer.Character and localPlayer.Character:FindFirstChild('HumanoidRootPart')

                            if not humanoidRootPart30 then
                            else
                                for index112, value169 in ipairs(v38.containers)do
                                    local lower8 = value169:lower()

                                    for index113, value170 in ipairs(items:GetChildren())do
                                        local v264 = value170

                                        if v264.Name:lower():find(lower8) then
                                            local handle6 = v264:FindFirstChild('Handle') or v264:FindFirstChildWhichIsA('BasePart')

                                            if handle6 and not handle6.Locked then
                                                pcall(function()
                                                    remoteEvents.RequestStartDraggingItem:FireServer(v264)
                                                    task.wait(0.1)

                                                    local cframe12 = CFrame.new(humanoidRootPart30.Position + Vector3.new(math.random(-3, 3), 3, math.random(-3, 3)))

                                                    if v264:IsA('Model') then
                                                        v264:PivotTo(cframe12)
                                                    else
                                                        handle6.CFrame = cframe12
                                                    end

                                                    task.wait(0.1)
                                                    remoteEvents.StopDraggingItem:FireServer(v264)
                                                end)
                                                task.wait(0.3)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)

                v46 = {
                    Enabled = false,
                    Wolf = false,
                    Bunny = false,
                    Cultist = false,
                    Bear = false,
                    PolarBear = false,
                    ArcticFox = false,
                    Mammoth = false,
                    Rambo = false,
                    Owl = false,
                    Alien = false,
                    AlienElite = false,
                    Show = false,
                    Size = 10,
                }

                function f61(p65)
                    local humanoid5 = p65:FindFirstChildOfClass('Humanoid')

                    if not humanoid5 or humanoid5.MaxHealth <= 0 then
                        return Color3.fromRGB(255, 255, 255)
                    else
                        local v265 = humanoid5.Health / humanoid5.MaxHealth

                        if v265 > 0.6 then
                            return Color3.fromRGB(50, 220, 50)
                        end
                        if v265 > 0.3 then
                            local v266 = (v265 - 0.3) / 0.3
                            local v267 = math.floor(50 + (1 - v266) * 205)
                            local v268 = math.floor(220 - (1 - v266) * 20)

                            return Color3.fromRGB(v267, v268, 20)
                        end

                        return Color3.fromRGB(220, 40, 40)
                    end
                end
                function f62(p66)
                    local humanoidRootPart31 = p66:FindFirstChild('HumanoidRootPart')

                    if not humanoidRootPart31 then
                        return
                    else
                        local lower9 = p66.Name:lower()
                        local wolf = v46.Wolf and (lower9:find('wolf') or lower9:find('alpha'))
                        local v269 = wolf

                        if not wolf then
                            local bunny = v46.Bunny
                            local bunny2 = bunny

                            bunny2 = bunny and lower9:find('bunny')

                            local v270 = bunny2

                            if not bunny2 then
                                local cultist = v46.Cultist and (lower9:find('cultist') or lower9:find('cross'))
                                local v271 = cultist

                                if not cultist then
                                    local bear = v46.Bear
                                    local bear2 = bear

                                    bear2 = bear and lower9:find('bear')

                                    local v272 = bear2

                                    if not bear2 then
                                        local polarBear = v46.PolarBear
                                        local polar = polarBear

                                        polar = polarBear and lower9:find('polar')

                                        local v273 = polar

                                        if not polar then
                                            local arctic = v46.ArcticFox and (lower9:find('arctic') or lower9:find('fox'))
                                            local mammoth = arctic

                                            if not arctic then
                                                local mammoth2 = v46.Mammoth

                                                mammoth = mammoth2 and lower9:find('mammoth') or v46.Rambo and (lower9:find('rambo') or lower9:find('soldier') or lower9:find('ranger')) or v46.Owl and lower9:find('owl') or v46.AlienElite and (lower9:find('alien elite') or lower9:find('alienelite') or lower9:find('elite')) or v46.Alien and lower9:find('alien') or false
                                            end

                                            v273 = mammoth
                                        end

                                        v272 = v273
                                    end

                                    v271 = v272
                                end

                                v270 = v271
                            end

                            v269 = v270
                        end

                        local v274 = v269

                        if not v46.Enabled then
                            humanoidRootPart31.Size = Vector3.new(2, 2, 1)
                            humanoidRootPart31.Transparency = 1

                            return
                        end
                        if v274 then
                            humanoidRootPart31.Size = Vector3.new(v46.Size, v46.Size, v46.Size)
                            humanoidRootPart31.Color = f61(p66)
                            humanoidRootPart31.Material = Enum.Material.Neon
                            humanoidRootPart31.Transparency = v46.Show and 0.35 or 1
                            humanoidRootPart31.CanCollide = false
                        end

                        return
                    end
                end

                task.spawn(function()
                    while true do
                        task.wait(0.5)

                        if v46.Enabled then
                            local characters5 = workspace:FindFirstChild('Characters')

                            if characters5 then
                                for index114, value171 in ipairs(characters5:GetChildren())do
                                    if value171:IsA('Model') and value171:FindFirstChild('HumanoidRootPart') then
                                        pcall(f62, value171)
                                    end
                                end
                            end
                        end
                    end
                end)
                v110.Combat:Divider()
                v110.Combat:Section({
                    Title = f2('Hitbox Settings'),
                    Icon = 'settings-2',
                    Opened = false,
                    Desc = '',
                })
                v110.Combat:Slider({
                    Title = 'Hitbox Size',
                    Value = {
                        Min = 2,
                        Max = 50,
                        Default = 10,
                    },
                    Step = 1,
                    Callback = function(value172)
                        v46.Size = value172
                    end,
                })
                v110.Combat:Toggle({
                    Title = 'Show Hitbox (Visible)',
                    Default = false,
                    Callback = function(value173)
                        v46.Show = value173
                    end,
                })
                v110.Combat:Paragraph({
                    Title = 'Health Colors',
                    Desc = '\u{1f7e2} Green = Full HP (>60%)\n\u{1f7e1} Yellow = Half HP (30\u{2013}60%)\n\u{1f534} Red = Critical (<30%)',
                })
                v110.Combat:Divider()
                v110.Combat:Section({
                    Title = f2('Select Mobs'),
                    Icon = 'crosshair',
                    Opened = false,
                    Desc = '',
                })

                v47 = {
                    ['Wolf / Alpha Wolf'] = 'Wolf',
                    Bunny = 'Bunny',
                    Cultist = 'Cultist',
                    Bear = 'Bear',
                    ['Polar Bear'] = 'PolarBear',
                    ['Arctic Fox'] = 'ArcticFox',
                    Mammoth = 'Mammoth',
                    Rambo = 'Rambo',
                    Owl = 'Owl',
                    Alien = 'Alien',
                    ['Alien Elite'] = 'AlienElite',
                }
                v48 = {}

                v110.Combat:Dropdown({
                    Title = 'Select Mobs for Hitbox',
                    Desc = 'Choose which mobs get an expanded hitbox.',
                    Values = {
                        'Wolf / Alpha Wolf',
                        'Bunny',
                        'Cultist',
                        'Bear',
                        'Polar Bear',
                        'Arctic Fox',
                        'Mammoth',
                        'Rambo',
                        'Owl',
                        'Alien',
                        'Alien Elite',
                    },
                    Value = {},
                    Multi = true,
                    AllowNone = true,
                    Callback = function(value174)
                        v46.Wolf = false
                        v46.Bunny = false
                        v46.Cultist = false
                        v46.Bear = false
                        v46.PolarBear = false
                        v46.ArcticFox = false
                        v46.Mammoth = false
                        v46.Rambo = false
                        v46.Owl = false
                        v46.Alien = false
                        v46.AlienElite = false
                        v48 = {}

                        if type(value174) == 'table' then
                            for index115, value175 in ipairs(value174)do
                                local v275 = v47[value175]

                                if v275 then
                                    v46[v275] = true
                                    v48[v275] = true
                                end
                            end
                        end
                    end,
                })
                v110.Combat:Toggle({
                    Title = 'Enable Hitbox',
                    Default = false,
                    Callback = function(value176)
                        v46.Enabled = value176
                    end,
                })

                do
                    v110.AutoDays:Divider()
                    v110.AutoDays:Section({
                        Title = f2('Day Auto Farm'),
                        Icon = 'sun',
                        Opened = false,
                        Desc = '',
                    })

                    v49 = {
                        active = false,
                        thread = nil,
                    }
                    vector4 = Vector3.new(-37.08, 6.98, -16.33)

                    v110.AutoDays:Toggle({
                        Title = 'Activate Auto Days',
                        Default = false,
                        Callback = function(value177)
                            v49.active = value177

                            if value177 then
                                v49.thread = task.spawn(function()
                                    local vector11 = Vector3.new(0.25, 7.82, -0.65)
                                    local vector12 = Vector3.new(-1.88, -40.59, 3.62)

                                    local function f106()
                                        if not workspace:FindFirstChild('SafePlatform') then
                                            local safePlatform = Instance.new('Part')

                                            safePlatform.Size = Vector3.new(10, 1, 10)
                                            safePlatform.Position = vector12 - Vector3.new(0, 0.5, 0)
                                            safePlatform.Anchored = true
                                            safePlatform.Name = 'SafePlatform'
                                            safePlatform.Parent = workspace
                                        end
                                    end
                                    local function f107(p67)
                                        currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, p67.Position)
                                    end
                                    local function f108(p68)
                                        local humanoidRootPart32 = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart')
                                        local v276 = os.clock()

                                        while os.clock() - v276 < p68 and v49.active do
                                            for i9 = 0, 1500, 50 do
                                                for i10 = 0, 360, 10 do
                                                    if not v49.active then
                                                        return
                                                    else
                                                        local v277 = math.rad(i10)
                                                        local v278 = math.cos(v277)
                                                        local v279 = math.sin(v277)

                                                        humanoidRootPart32.CFrame = CFrame.new(vector11.X + i9 * v278, vector11.Y, vector11.Z + i9 * v279)

                                                        task.wait(0.05)

                                                        if os.clock() - v276 >= p68 then
                                                            return
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    local function f109(p69)
                                        local humanoidRootPart33 = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart')

                                        for i11 = 1, p69 do
                                            if not v49.active then
                                                return
                                            else
                                                local v280 = {}
                                                local carrot = workspaceService:FindFirstChild('Items') and workspaceService.Items:FindFirstChild('Carrot')
                                                local carrotPatch = workspaceService:FindFirstChild('Map') and workspaceService.Map:FindFirstChild('Foliage') and workspaceService.Map.Foliage:FindFirstChild('Carrot Patch')
                                                local berry = workspaceService:FindFirstChild('Items') and workspaceService.Items:FindFirstChild('Berry')

                                                if carrot then
                                                    table.insert(v280, carrot)
                                                end
                                                if carrotPatch then
                                                    table.insert(v280, carrotPatch)
                                                end
                                                if berry then
                                                    table.insert(v280, berry)
                                                end

                                                for index116, value178 in ipairs(v280)do
                                                    if not v49.active then
                                                        return
                                                    else
                                                        local primaryPart4 = value178:IsA('Model') and value178.PrimaryPart or value178

                                                        if primaryPart4 then
                                                            humanoidRootPart33.CFrame = CFrame.new(primaryPart4.Position - (primaryPart4.Position - humanoidRootPart33.Position).Unit * 2 + Vector3.new(0, 2, 0))

                                                            f107(primaryPart4)
                                                            pcall(function()
                                                                virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                                                task.wait(0.1)
                                                                virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                                            end)

                                                            break
                                                        end
                                                    end
                                                end

                                                task.wait(0.2)
                                            end
                                        end
                                    end

                                    f106()
                                    f108(80)

                                    if not v49.active then
                                        return
                                    else
                                        local humanoidRootPart34 = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart')

                                        humanoidRootPart34.CFrame = CFrame.new(vector12)

                                        task.wait(60)

                                        while v49.active do
                                            f109(15)

                                            if not v49.active then
                                                break
                                            end

                                            humanoidRootPart34.CFrame = CFrame.new(vector12)

                                            task.wait(60)
                                        end

                                        return
                                    end
                                end)
                            else
                                v49.active = false

                                local humanoidRootPart35 = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart')

                                if humanoidRootPart35 then
                                    humanoidRootPart35.CFrame = CFrame.new(vector4)
                                end
                            end
                        end,
                    })
                    v110.AutoDays:Divider()
                    v110.AutoDays:Section({
                        Title = f2('Auto Cook Food'),
                        Icon = 'utensils',
                        Opened = false,
                        Desc = '',
                    })

                    v50 = {
                        'Morsel',
                        'Steak',
                        'Ribs',
                        'Raw Meat',
                        'Meat',
                        'Fish',
                        'Raw Fish',
                        'Rabbit Meat',
                        'Bear Meat',
                        'Wolf Meat',
                        'Mammoth Meat',
                    }
                    v51 = {}
                    v3.AutoDaysAutoCookEnabled = false

                    function f63(p70)
                        f41(p70, vector)
                    end

                    local autoDays = v110.AutoDays

                    local function f110()
                        local v281 = {
                            'All',
                        }

                        for index117, value179 in ipairs(v50)do
                            v281[#v281 + 1] = value179
                        end

                        return v281
                    end

                    autoDays:Dropdown({
                        Title = 'Food Items to Cook',
                        Values = f110(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value180)
                            v51 = {}

                            if type(value180) == 'table' then
                                local v282 = false

                                for index118, value181 in ipairs(value180)do
                                    if value181 == 'All' then
                                        v282 = true

                                        break
                                    end
                                end

                                if v282 then
                                    for index119, value182 in ipairs(v50)do
                                        v51[value182] = true
                                    end
                                else
                                    for index120, value183 in ipairs(value180)do
                                        if type(value183) == 'string' then
                                            v51[value183] = true
                                        end
                                    end
                                end
                            end
                        end,
                    })
                end

                v110.AutoDays:Toggle({
                    Title = 'Auto Cook Food',
                    Default = false,
                    Callback = function(value184)
                        v3.AutoDaysAutoCookEnabled = value184
                    end,
                })
                task.spawn(function()
                    while true do
                        if v3.AutoDaysAutoCookEnabled then
                            for index121, value185 in ipairs(items:GetChildren())do
                                if value185.Parent and v51[value185.Name] then
                                    f63(value185)
                                end
                            end
                        end

                        task.wait(1)
                    end
                end)
                v110.Scanner:Divider()
                v110.Scanner:Section({
                    Title = f2('Auto Scanner'),
                    Icon = 'scan',
                    Opened = false,
                })
                v110.Scanner:Paragraph({
                    Title = 'Auto Scanner',
                    Desc = 'Sweeps the entire map using smooth movement so other features (Auto Fuel, Auto Compress, etc.) can detect all items. Adjust speed and scan pattern below.',
                })

                v3.AutoLoadMapActive = false
                v52 = {
                    campfireReturn = Vector3.new(1.87, 4.33, -3.67),
                    toggleRef = nil,
                }
                v53 = {
                    speed = 100,
                    stepRadius = 15,
                    stepAngle = 10,
                }

                function f17()
                    local character19 = localPlayer.Character
                    local humanoidRootPart36 = character19 and character19:FindFirstChild('HumanoidRootPart')
                    local v283, humanoid6, bodyPosition, bodyPosition2

                    if not humanoidRootPart36 then
                        f4('No character!')

                        return
                    else
                        humanoid6 = character19:FindFirstChildOfClass('Humanoid')

                        pcall(function()
                            if humanoid6 then
                                humanoid6.PlatformStand = true
                            end
                        end)

                        bodyPosition = Instance.new('BodyPosition')
                        bodyPosition.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
                        bodyPosition.P = v53.speed * 500
                        bodyPosition.D = 200
                        bodyPosition.Position = humanoidRootPart36.Position
                        bodyPosition.Parent = humanoidRootPart36

                        local v284 = f64()
                        local v285 = #v284

                        f4('Auto Scanner: sweeping ' .. v285 .. ' points...')

                        for index122, value186 in ipairs(v284)do
                            if not v3.AutoLoadMapActive then
                                break
                            else
                                local character20 = localPlayer.Character
                                local humanoidRootPart37 = character20 and character20:FindFirstChild('HumanoidRootPart')

                                if not humanoidRootPart37 or not bodyPosition or not bodyPosition.Parent then
                                    break
                                else
                                    bodyPosition.Position = value186
                                    bodyPosition.P = v53.speed * 500

                                    local v286 = tick()

                                    if v3.AutoLoadMapActive then
                                        if not not humanoidRootPart37 then
                                            v2038 = tick() - v286 >= 1.2
                                        end
                                    end

                                    repeat
                                        task.wait(0.05)

                                        local character21 = localPlayer.Character
                                        local humanoidRootPart38 = character21 and character21:FindFirstChild('HumanoidRootPart')
                                        local v287 = not v3.AutoLoadMapActive

                                        v283 = v287
                                        v283 = v287 or not humanoidRootPart38 or tick() - v286 >= 1.2 or humanoidRootPart38 and (humanoidRootPart38.Position - value186).Magnitude < 20
                                    until v283

                                    if index122 % 8 == 0 or index122 == v285 then
                                        f4(string.format('Scanning... %d/%d', index122, v285))
                                    end
                                end
                            end
                        end

                        pcall(function()
                            if bodyPosition and bodyPosition.Parent then
                                bodyPosition:Destroy()
                            end
                        end)

                        local character22 = localPlayer.Character
                        local humanoidRootPart39 = character22 and character22:FindFirstChild('HumanoidRootPart')

                        humanoid6 = character22 and character22:FindFirstChildOfClass('Humanoid')

                        if humanoidRootPart39 then
                            bodyPosition2 = Instance.new('BodyPosition')
                            bodyPosition2.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
                            bodyPosition2.P = 50000
                            bodyPosition2.D = 200
                            bodyPosition2.Position = v52.campfireReturn + Vector3.new(0, 4, 0)
                            bodyPosition2.Parent = humanoidRootPart39

                            task.wait(2)
                            pcall(function()
                                bodyPosition2:Destroy()
                            end)
                        end

                        pcall(function()
                            if humanoid6 then
                                humanoid6.PlatformStand = false
                            end
                        end)

                        v3.AutoLoadMapActive = false

                        f4('Auto Scanner: Done! Returned to campfire.')
                        pcall(function()
                            v52.toggleRef:Set(false)
                        end)

                        return
                    end
                end
                function f64()
                    local v288 = {}
                    local v289 = {}
                    local stepRadius = v53.stepRadius

                    while stepRadius <= 400 do
                        table.insert(v289, stepRadius)

                        stepRadius = stepRadius + v53.stepRadius
                    end

                    for index123, value187 in ipairs(v289)do
                        local v290 = math.max(4, math.floor(360 / v53.stepAngle))

                        for i12 = 1, v290 do
                            local v291 = (i12 - 1) / v290 * math.pi * 2

                            table.insert(v288, Vector3.new(math.cos(v291) * value187, 30, math.sin(v291) * value187))
                        end
                    end

                    return v288
                end

                v52.toggleRef = v110.Scanner:Toggle({
                    Title = 'Scan Map',
                    Default = false,
                    Callback = function(value188)
                        v3.AutoLoadMapActive = value188

                        if value188 then
                            task.spawn(f17)
                        else
                            f4('Auto Scanner: stopped.')
                        end
                    end,
                })

                v110.Scanner:Slider({
                    Title = 'Scan Speed',
                    Desc = 'How fast the scanner moves between points. Higher = faster sweep.',
                    Value = {
                        Min = 10,
                        Max = 200,
                        Default = 100,
                    },
                    Step = 5,
                    Callback = function(value189)
                        v53.speed = value189
                    end,
                })
                v110.Scanner:Slider({
                    Title = 'Step Radius',
                    Desc = 'Distance between each scan ring (in studs). Smaller = more thorough.',
                    Value = {
                        Min = 5,
                        Max = 50,
                        Default = 15,
                    },
                    Step = 1,
                    Callback = function(value190)
                        v53.stepRadius = value190
                    end,
                })
                v110.Scanner:Slider({
                    Title = 'Step Angle',
                    Desc = 'Angle between scan points on each ring (degrees). Smaller = more points.',
                    Value = {
                        Min = 5,
                        Max = 45,
                        Default = 10,
                    },
                    Step = 1,
                    Callback = function(value191)
                        v53.stepAngle = value191
                    end,
                })
                v110.Combat:Divider()
                v110.Combat:Section({
                    Title = f2('Silent Aim'),
                    Icon = 'crosshair',
                    Opened = false,
                    Desc = '',
                })
                v110.Combat:Paragraph({
                    Title = 'Silent Aim',
                    Desc = 'Auto-aim projectiles + instant reload',
                })

                function f18()
                    local character23 = localPlayer.Character
                    local currentCamera2 = workspace.CurrentCamera

                    if not character23 or not currentCamera2 then
                        return nil
                    elseif not character23:FindFirstChild('HumanoidRootPart') then
                        return nil
                    else
                        local v292 = nil
                        local huge2 = math.huge
                        local characters6 = workspace:FindFirstChild('Characters')

                        if not characters6 then
                            return nil
                        end

                        for index124, value192 in ipairs(characters6:GetChildren())do
                            if value192 ~= character23 and value192:IsA('Model') then
                                local findFirstChild6 = value192:FindFirstChild(v54.hitPart)
                                local humanoidRootPart40 = findFirstChild6

                                humanoidRootPart40 = findFirstChild6 or value192:FindFirstChild('HumanoidRootPart')

                                local humanoid7 = value192:FindFirstChildOfClass('Humanoid')

                                if humanoidRootPart40 and humanoid7 and humanoid7.Health > 0 then
                                    local v293, v294 = currentCamera2:WorldToScreenPoint(humanoidRootPart40.Position)

                                    if v294 then
                                        local magnitude3 = (Vector2.new(v293.X, v293.Y) - currentCamera2.ViewportSize / 2).Magnitude

                                        if magnitude3 < v54.fov / 100 * (currentCamera2.ViewportSize.X * 0.5) and magnitude3 < huge2 then
                                            huge2 = magnitude3
                                            v292 = humanoidRootPart40
                                        end
                                    end
                                end
                            end
                        end

                        return v292
                    end
                end

                v54 = {
                    enabled = false,
                    fov = 60,
                    hitPart = 'HumanoidRootPart',
                }

                v110.Combat:Toggle({
                    Title = 'Silent Aim',
                    Desc = 'Auto-aims all projectiles at nearest target in FOV.',
                    Default = false,
                    Callback = function(value193)
                        v54.enabled = value193

                        f4('Silent Aim: ' .. (value193 and 'ON' or 'OFF'))
                    end,
                })
                v110.Combat:Slider({
                    Title = 'Silent Aim FOV',
                    Desc = 'Field of view radius for target detection (screen %).',
                    Value = {
                        Min = 10,
                        Max = 100,
                        Default = 60,
                    },
                    Step = 5,
                    Callback = function(value194)
                        v54.fov = value194
                    end,
                })
                v110.Combat:Dropdown({
                    Title = 'Silent Aim Hit Part',
                    Desc = 'Which body part projectiles are aimed at.',
                    Values = {
                        'HumanoidRootPart',
                        'Head',
                        'Torso',
                        'UpperTorso',
                    },
                    Default = 'HumanoidRootPart',
                    Multi = false,
                    Callback = function(value195)
                        v54.hitPart = value195
                    end,
                })

                if _G._silentAimHooked == nil then
                    _G._silentAimHooked = true
                    index = nil

                    pcall(function()
                        local v295 = getrawmetatable(game)

                        setreadonly(v295, false)

                        index = v295.__index
                        v295.__index = newcclosure(function(p71, p72)
                            if v54.enabled and typeof(p71) == 'Instance' and p71:IsA('Mouse') and p72 == 'Hit' then
                                local v296 = f18()

                                if v296 then
                                    return CFrame.new(v296.Position)
                                end
                            end
                            if v54.enabled and typeof(p71) == 'Instance' and p71:IsA('Mouse') and p72 == 'UnitRay' then
                                local v297 = f18()

                                if v297 then
                                    local position11 = workspace.CurrentCamera.CFrame.Position

                                    return Ray.new(position11, (v297.Position - position11).Unit * 1000)
                                end

                                return index(p71, p72)
                            end

                            return index(p71, p72)
                        end)

                        setreadonly(v295, true)
                    end)
                end

                v110.Combat:Divider()
                v110.Combat:Section({
                    Title = f2('Revive Players'),
                    Icon = 'heart',
                    Opened = false,
                    Desc = '',
                })
                v110.Combat:Paragraph({
                    Title = 'Revive Players',
                    Desc = 'Auto Revive dead players including yourself from far away',
                })

                v55 = {
                    players = false,
                    self = false,
                }

                v110.Combat:Toggle({
                    Title = 'Auto Revive Players',
                    Desc = 'Automatically revives dead players (requires bandage/MedKit) in your inventory.',
                    Default = false,
                    Callback = function(value196)
                        v55.players = value196

                        f4('Auto Revive Players: ' .. (value196 and 'ON' or 'OFF'))
                    end,
                })
                v110.Combat:Toggle({
                    Title = 'Auto Revive Yourself',
                    Desc = 'Automatically revives yourself when dead (requires Bandage/MedKit on map).',
                    Default = false,
                    Callback = function(value197)
                        v55.self = value197

                        f4('Auto Revive Self: ' .. (value197 and 'ON' or 'OFF'))
                    end,
                })
                task.spawn(function()
                    while true do
                        task.wait(1)

                        if v55.players then
                            local character24 = localPlayer.Character
                            local humanoidRootPart41 = character24 and character24:FindFirstChild('HumanoidRootPart')

                            if humanoidRootPart41 then
                                local v298 = getBandages()[1]

                                if not v298 then
                                    local inventory5 = localPlayer:FindFirstChild('Inventory')

                                    if inventory5 then
                                        for index125, value198 in ipairs(inventory5:GetChildren())do
                                            if value198.Name:lower():find('bandage') then
                                                v298 = value198

                                                break
                                            end
                                        end
                                    end
                                end
                                if v298 then
                                    for index126, value199 in ipairs(players:GetPlayers())do
                                        local v299 = value199

                                        if v299 ~= localPlayer then
                                            local v300 = false
                                            local humanoidRootPart42 = nil

                                            if v299.Character then
                                                local humanoid8 = v299.Character:FindFirstChildOfClass('Humanoid')

                                                humanoidRootPart42 = v299.Character:FindFirstChild('HumanoidRootPart')

                                                if humanoid8 and humanoid8.Health <= 0 then
                                                    v300 = true
                                                end
                                            else
                                                v300 = true
                                            end
                                            if v300 then
                                                if v298.Parent == items then
                                                    pcall(function()
                                                        remoteEvents.RequestStartDraggingItem:FireServer(v298)
                                                        task.wait(0.05)

                                                        local v301 = v298
                                                        local cframe13 = CFrame.new(humanoidRootPart41.Position + Vector3.new(0, 2, 0))

                                                        if v301:IsA('Model') then
                                                            v298:PivotTo(cframe13)
                                                        else
                                                            local basePart7 = v298:FindFirstChildWhichIsA('BasePart')

                                                            if basePart7 then
                                                                basePart7.CFrame = cframe13
                                                            end
                                                        end

                                                        task.wait(0.05)
                                                        remoteEvents.StopDraggingItem:FireServer(v298)
                                                    end)
                                                    task.wait(0.1)
                                                end
                                                if humanoidRootPart42 then
                                                    humanoidRootPart41.CFrame = CFrame.new(humanoidRootPart42.Position + Vector3.new(0, 4, 0))

                                                    task.wait(0.2)
                                                end

                                                for index127, value200 in ipairs({
                                                    'RevivePlayer',
                                                    'RequestRevive',
                                                    'Revive',
                                                    'HealPlayer',
                                                    'ReviveCharacter',
                                                    'RespawnPlayer',
                                                })do
                                                    local findFirstChild7 = remoteEvents:FindFirstChild(value200)

                                                    if findFirstChild7 then
                                                        pcall(function()
                                                            if findFirstChild7:IsA('RemoteEvent') then
                                                                findFirstChild7:FireServer(v299)
                                                            else
                                                                findFirstChild7:InvokeServer(v299)
                                                            end
                                                        end)

                                                        break
                                                    end
                                                end

                                                pcall(function()
                                                    remoteEvents.RequestConsumeItem:InvokeServer(v298)
                                                end)
                                                f4('Attempted revive on ' .. v299.Name .. '!')
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        if v55.self then
                            local character25 = localPlayer.Character
                            local humanoid9 = character25

                            humanoid9 = character25 and character25:FindFirstChildOfClass('Humanoid')

                            if not character25 or humanoid9 and humanoid9.Health <= 0 then
                                local humanoidRootPart43 = character25 and character25:FindFirstChild('HumanoidRootPart')
                                local v302 = getBandages()[1]

                                if v302 and v302.Parent then
                                    if humanoidRootPart43 then
                                        pcall(function()
                                            remoteEvents.RequestStartDraggingItem:FireServer(v302)
                                            task.wait(0.05)

                                            local cframe14 = CFrame.new(humanoidRootPart43.Position + Vector3.new(0, 2, 0))

                                            if v302:IsA('Model') then
                                                v302:PivotTo(cframe14)
                                            else
                                                local basePart8 = v302:FindFirstChildWhichIsA('BasePart')

                                                if basePart8 then
                                                    basePart8.CFrame = cframe14
                                                end
                                            end

                                            task.wait(0.05)
                                            remoteEvents.StopDraggingItem:FireServer(v302)
                                        end)
                                        task.wait(0.1)
                                    end

                                    for index128, value201 in ipairs({
                                        'RevivePlayer',
                                        'RequestRevive',
                                        'Revive',
                                        'RespawnPlayer',
                                    })do
                                        local findFirstChild8 = remoteEvents:FindFirstChild(value201)

                                        if findFirstChild8 then
                                            pcall(function()
                                                if findFirstChild8:IsA('RemoteEvent') then
                                                    findFirstChild8:FireServer(localPlayer)
                                                else
                                                    findFirstChild8:InvokeServer(localPlayer)
                                                end
                                            end)

                                            break
                                        end
                                    end

                                    pcall(function()
                                        remoteEvents.RequestConsumeItem:InvokeServer(v302)
                                    end)
                                    f4('Auto-revived yourself with a bandage!')
                                else
                                    local inventory6 = localPlayer:FindFirstChild('Inventory')

                                    if inventory6 then
                                        for index129, value202 in ipairs(inventory6:GetChildren())do
                                            local v303 = value202

                                            if v303.Name:lower():find('bandage') then
                                                pcall(function()
                                                    remoteEvents.RequestConsumeItem:InvokeServer(v303)
                                                end)
                                                f4('Auto-revived yourself (inventory bandage)!')

                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
                v110.Combat:Divider()
                v110.Combat:Section({
                    Title = f2('Auto Stun'),
                    Icon = 'zap',
                    Opened = false,
                    Desc = '',
                })
                v110.Combat:Paragraph({
                    Title = 'Auto Stun',
                    Desc = 'Automatically equips a flashlight, teleports to the selected entity (Deer, Owl, or Rambo) to stun it, then instantly returns you to your original position.\n\n\u{2192} Select a target below\n\u{2192} Enable the toggle to start\n\u{2192} You will snap back to your position after each stun',
                })

                v56 = {
                    enabled = false,
                    target = 'Deer',
                    cooldown = 2,
                }

                task.spawn(function()
                    while true do
                        task.wait(v56.cooldown)
                    end
                end)
                v110.Combat:Dropdown({
                    Title = 'Stun Target',
                    Description = 'Choose which entity to auto stun (one at a time)',
                    Values = {
                        'Deer',
                        'Owl',
                        'Rambo',
                        'Cat',
                    },
                    Default = 'Deer',
                    Multi = false,
                    Callback = function(value203)
                        v56.target = value203 or 'Deer'

                        f4('Auto Stun target set to: ' .. tostring(v56.target))
                    end,
                })
                v110.Combat:Slider({
                    Title = 'Stun Cooldown (seconds)',
                    Desc = 'How long to wait between each auto stun cycle.',
                    Value = {
                        Min = 1,
                        Max = 10,
                        Default = 2,
                    },
                    Step = 1,
                    Callback = function(value204)
                        v56.cooldown = value204
                    end,
                })
                v110.Combat:Toggle({
                    Title = 'Auto Stun',
                    Default = false,
                    Callback = function(value205)
                        v56.enabled = value205

                        if value205 then
                            f4('Auto Stun ON \u{2014} targeting: ' .. v56.target)
                            v2:Notify({
                                Title = 'Auto Stun',
                                Content = 'Enabled \u{2014} targeting ' .. v56.target .. '. Will teleport back after each stun.',
                                Duration = 4,
                                Icon = 'zap',
                            })
                        else
                            f4('Auto Stun OFF')
                        end
                    end,
                })

                _fogRemoveEnabled = true

                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Remove Fog'),
                    Icon = 'wind',
                    Opened = false,
                    Desc = '',
                })
                v110.Misc:Paragraph({
                    Title = 'Remove Fog',
                    Desc = 'Removes fog by destroying non-Fog children inside workspace.Map.Boundaries.',
                })
                v110.Misc:Toggle({
                    Title = 'Remove Fog',
                    Default = true,
                    Callback = function(value206)
                        _fogRemoveEnabled = value206

                        if value206 then
                            f4('Remove Fog: ON')
                        else
                            f4('Remove Fog: OFF (rejoin or reset to restore fog)')
                        end
                    end,
                })
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Anti Void'),
                    Icon = 'shield',
                    Opened = false,
                    Desc = '',
                })

                v3.antiVoidEnabled = false

                v110.Misc:Toggle({
                    Title = 'Anti Void',
                    Default = false,
                    Callback = function(value207)
                        v3.antiVoidEnabled = value207

                        f4('Anti Void: ' .. (value207 and 'ON' or 'OFF'))
                    end,
                })
                task.spawn(function()
                    while true do
                        task.wait(0.1)

                        if v3.antiVoidEnabled then
                            local character26 = localPlayer.Character
                            local humanoidRootPart44 = character26 and character26:FindFirstChild('HumanoidRootPart')

                            if humanoidRootPart44 and humanoidRootPart44.Position.Y < -100 then
                                pcall(function()
                                    humanoidRootPart44.CFrame = CFrame.new(humanoidRootPart44.Position.X, math.max(humanoidRootPart44.Position.Y + 50, 10), humanoidRootPart44.Position.Z)
                                end)
                            end
                        end
                    end
                end)
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Fly'),
                    Icon = 'plane',
                    Opened = false,
                    Desc = '',
                })
                v110.Misc:Toggle({
                    Title = 'Fly',
                    Default = false,
                    Callback = function(value208)
                        if value208 then
                            startFly()
                        else
                            stopFly()
                        end
                    end,
                })
                v110.Misc:Slider({
                    Title = 'Fly Speed',
                    Value = {
                        Min = 10,
                        Max = 300,
                        Default = 50,
                    },
                    Step = 5,
                    Callback = function(value209)
                        v3.flySpeed = value209
                    end,
                })
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Movement'),
                    Icon = 'footprints',
                    Opened = false,
                    Desc = '',
                })

                v3.speedEnabled = false
                v3.speedValue = 28

                v110.Misc:Toggle({
                    Title = 'Speed Hack',
                    Default = false,
                    Callback = function(value210)
                        v3.speedEnabled = value210

                        local humanoid10 = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):FindFirstChild('Humanoid')

                        if humanoid10 then
                            humanoid10.WalkSpeed = value210 and v3.speedValue or 16
                        end
                    end,
                })
                v110.Misc:Slider({
                    Title = 'Speed Value',
                    Value = {
                        Min = 16,
                        Max = 600,
                        Default = 28,
                    },
                    Step = 1,
                    Callback = function(value211)
                        v3.speedValue = value211

                        if v3.speedEnabled then
                            local humanoid11 = localPlayer.Character and localPlayer.Character:FindFirstChild('Humanoid')

                            if humanoid11 then
                                humanoid11.WalkSpeed = value211
                            end
                        end
                    end,
                })

                v3.jpEnabled = false
                v3.jpValue = 60

                function f65(p73, p74)
                    if not p73 then
                        return
                    end

                    pcall(function()
                        p73.UseJumpPower = true
                    end)
                    pcall(function()
                        p73:SetAttribute('UseJumpPower', true)
                    end)
                    pcall(function()
                        p73.JumpPower = p74
                    end)
                    pcall(function()
                        p73.JumpHeight = p74 / 50 * 7.2
                    end)
                end
                function f66(p75)
                    if not p75 then
                        return
                    end

                    pcall(function()
                        p75.UseJumpPower = false
                    end)
                    pcall(function()
                        p75:SetAttribute('UseJumpPower', false)
                    end)
                    pcall(function()
                        p75.JumpPower = 50
                    end)
                    pcall(function()
                        p75.JumpHeight = 7.2
                    end)
                end

                v110.Misc:Toggle({
                    Title = 'Jump Boost',
                    Default = false,
                    Callback = function(value212)
                        v3.jpEnabled = value212

                        local humanoid12 = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):FindFirstChild('Humanoid')

                        if value212 then
                            f65(humanoid12, v3.jpValue)
                        else
                            f66(humanoid12)
                        end
                    end,
                })
                v110.Misc:Slider({
                    Title = 'Jump Power',
                    Value = {
                        Min = 50,
                        Max = 500,
                        Default = 60,
                    },
                    Step = 1,
                    Callback = function(value213)
                        v3.jpValue = value213

                        if v3.jpEnabled then
                            f65(localPlayer.Character and localPlayer.Character:FindFirstChild('Humanoid'), value213)
                        end
                    end,
                })

                v57 = false

                v110.Misc:Toggle({
                    Title = 'Infinite Jump',
                    Default = false,
                    Callback = function(value214)
                        v57 = value214
                    end,
                })
                userInputService.JumpRequest:Connect(function()
                    if v57 then
                        local character27 = localPlayer.Character

                        if character27 then
                            local humanoid13 = character27:FindFirstChild('Humanoid')

                            if humanoid13 and humanoid13:GetState() ~= Enum.HumanoidStateType.Dead then
                                humanoid13:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    end
                end)

                v3.instantInteractOn = false

                function f19(p76)
                    for index130, value215 in ipairs(workspace:GetDescendants())do
                        local v304 = value215

                        if v304:IsA('ProximityPrompt') then
                            if p76 then
                                pcall(function()
                                    v304.HoldDuration = 0
                                end)
                            else
                                pcall(function()
                                    v304.HoldDuration = v304.HoldDuration
                                end)
                            end
                        end
                    end
                end

                v110.Misc:Toggle({
                    Title = 'Instant Interact',
                    Default = false,
                    Callback = function(value216)
                        v3.instantInteractOn = value216

                        f19(value216)

                        if value216 then
                            _miscConns.promptAdded = workspace.DescendantAdded:Connect(function(descendant)
                                if descendant:IsA('ProximityPrompt') and v3.instantInteractOn then
                                    task.wait()
                                    pcall(function()
                                        descendant.HoldDuration = 0
                                    end)
                                end
                            end)

                            f4('Instant Interact ON \u{2014} all interactions complete instantly')
                        else
                            if _miscConns.promptAdded then
                                _miscConns.promptAdded:Disconnect()

                                _miscConns.promptAdded = nil
                            end

                            f4('Instant Interact OFF')
                        end
                    end,
                })
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Performance Monitor'),
                    Icon = 'activity',
                    Opened = false,
                    Desc = '',
                })
                v110.Misc:Toggle({
                    Title = 'Show FPS',
                    Default = false,
                    Callback = function(value217)
                        showFPS = value217

                        if not value217 then
                            fpsText.Visible = false
                        end
                    end,
                })
                v110.Misc:Toggle({
                    Title = 'Show Ping (ms)',
                    Default = false,
                    Callback = function(value218)
                        showPing = value218

                        if not value218 then
                            msText.Visible = false
                        end
                    end,
                })
                v110.Misc:Button({
                    Title = 'FPS Boost',
                    Callback = function()
                        task.spawn(function()
                            pcall(function()
                                lighting.Brightness = 0
                                lighting.FogEnd = 9000000000
                                lighting.GlobalShadows = false
                                lighting.EnvironmentDiffuseScale = 0
                                lighting.EnvironmentSpecularScale = 0
                                lighting.ClockTime = 14
                                lighting.OutdoorAmbient = Color3.new(0, 0, 0)
                            end)

                            for index131, value219 in ipairs(lighting:GetDescendants())do
                                local v305 = value219

                                if v305:IsA('PostEffect') or v305:IsA('BloomEffect') or v305:IsA('ColorCorrectionEffect') or v305:IsA('SunRaysEffect') or v305:IsA('BlurEffect') then
                                    pcall(function()
                                        v305.Enabled = false
                                    end)
                                end
                            end
                            for index132, value220 in ipairs(workspace:GetDescendants())do
                                local v306 = value220

                                if v306:IsA('ParticleEmitter') or v306:IsA('Trail') then
                                    pcall(function()
                                        v306.Enabled = false
                                    end)
                                elseif v306:IsA('BasePart') then
                                    pcall(function()
                                        v306.CastShadow = false
                                    end)
                                end
                            end

                            f4('FPS Boost Applied')
                        end)
                    end,
                })
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Visual'),
                    Icon = 'eye',
                    Opened = false,
                    Desc = '',
                })

                v58 = false

                v110.Misc:Toggle({
                    Title = 'Fullbright',
                    Default = false,
                    Callback = function(value221)
                        v58 = value221

                        if value221 then
                            task.spawn(function()
                                while v58 do
                                    lighting.Ambient = Color3.new(1, 1, 1)
                                    lighting.Brightness = 10
                                    lighting.OutdoorAmbient = Color3.new(1, 1, 1)
                                    lighting.ClockTime = 12

                                    task.wait(10)
                                end
                            end)
                        else
                            v58 = false
                        end
                    end,
                })

                v59 = false

                v110.Misc:Toggle({
                    Title = 'Noclip',
                    Default = false,
                    Callback = function(value222)
                        local v307 = not value222

                        v59 = value222

                        if v307 and localPlayer.Character then
                            for key14, value223 in pairs(localPlayer.Character:GetDescendants())do
                                if value223:IsA('BasePart') then
                                    value223.CanCollide = true
                                end
                            end
                        end
                    end,
                })
                runService.Heartbeat:Connect(function()
                    if v59 and localPlayer.Character then
                        for key15, value224 in pairs(localPlayer.Character:GetDescendants())do
                            if value224:IsA('BasePart') then
                                value224.CanCollide = false
                            end
                        end
                    end
                end)

                v60 = false
                bodyVelocity = nil
                bodyGyro = nil
                connect = nil
                character = nil
                humanoid = nil

                function f20()
                    character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                    humanoidRootPart = character:WaitForChild('HumanoidRootPart')
                    humanoid = character:WaitForChild('Humanoid')
                end
                function f21()
                    v60 = false
                    v3.flyEnabled = false

                    if connect then
                        connect:Disconnect()

                        connect = nil
                    end
                    if bodyVelocity then
                        bodyVelocity:Destroy()

                        bodyVelocity = nil
                    end
                    if bodyGyro then
                        bodyGyro:Destroy()

                        bodyGyro = nil
                    end
                    if humanoid then
                        humanoid.PlatformStand = false
                    end
                end

                humanoidRootPart = nil

                function startFly()
                    f20()

                    if v60 then
                        return
                    end

                    v60 = true
                    v3.flyEnabled = true

                    local v308 = require(localPlayer.PlayerScripts:WaitForChild('PlayerModule'):WaitForChild('ControlModule'))

                    bodyVelocity = Instance.new('BodyVelocity')
                    bodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
                    bodyVelocity.Velocity = Vector3.zero
                    bodyVelocity.Parent = humanoidRootPart
                    bodyGyro = Instance.new('BodyGyro')
                    bodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
                    bodyGyro.P = 1000
                    bodyGyro.D = 50
                    bodyGyro.Parent = humanoidRootPart
                    humanoid.PlatformStand = true
                    connect = runService.RenderStepped:Connect(function()
                        if not v60 then
                            return
                        else
                            local currentCamera3 = workspace.CurrentCamera
                            local getMoveVector = v308:GetMoveVector()

                            bodyGyro.CFrame = currentCamera3.CFrame

                            local flySpeed = v3.flySpeed or 50

                            bodyVelocity.Velocity = currentCamera3.CFrame.RightVector * getMoveVector.X * flySpeed + currentCamera3.CFrame.LookVector * -getMoveVector.Z * flySpeed

                            return
                        end
                    end)
                end

                v3.flyEnabled = false
                v3.flySpeed = 50
                v3._stopFly = f21
                v3._startFly = startFly

                localPlayer.CharacterAdded:Connect(function()
                    task.wait(0.3)

                    if v60 then
                        f21()
                        startFly()
                    end
                end)
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Universal Scripts'),
                    Icon = 'terminal',
                    Opened = false,
                    Desc = '',
                })
                v110.Misc:Button({
                    Title = 'Infinite Yield',
                    Desc = 'A powerful in-game admin console.',
                    Callback = function()
                        local v309, v310 = pcall(function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
                        end)

                        if v309 then
                            f4('Infinite Yield loaded! Press ; to open the console.')
                        else
                            f4('Failed to load Infinite Yield: ' .. tostring(v310))
                        end
                    end,
                })
                v110.Misc:Button({
                    Title = 'Dex Explorer',
                    Desc = 'Browse the full game instance tree.',
                    Callback = function()
                        local v311, v312 = pcall(function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()
                        end)

                        if v311 then
                            f4('Dex Explorer loaded!')
                        else
                            f4('Failed to load Dex Explorer: ' .. tostring(v312))
                        end
                    end,
                })
                v110.Misc:Button({
                    Title = 'Remote Spy',
                    Desc = 'Monitor all RemoteEvent and RemoteFunction calls.',
                    Callback = function()
                        local v313, v314 = pcall(function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/acentriccreator/ac-remote-spy/main/source.lua'))()
                        end)

                        if v313 then
                            f4('Remote Spy loaded!')
                        else
                            f4('Failed to load Remote Spy: ' .. tostring(v314))
                        end
                    end,
                })
                v110.Misc:Button({
                    Title = 'Keyboard',
                    Desc = 'On-screen keyboard tool for mobile / input.',
                    Callback = function()
                        local v315, v316 = pcall(function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/nicol4s654/nicol4s654/main/keyboard.lua'))()
                        end)

                        if v315 then
                            f4('Keyboard loaded!')
                        else
                            f4('Failed to load Keyboard: ' .. tostring(v316))
                        end
                    end,
                })
                v110.Misc:Button({
                    Title = 'Anim Logger',
                    Desc = 'Log and view character animations.',
                    Callback = function()
                        local v317, v318 = pcall(function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/AnimationLogger/main/Source.lua'))()
                        end)

                        if v317 then
                            f4('Anim Logger loaded!')
                        else
                            f4('Failed to load Anim Logger: ' .. tostring(v318))
                        end
                    end,
                })
                v110.Misc:Button({
                    Title = 'F3X (Building Tools)',
                    Desc = 'In-game building and editing tools.',
                    Callback = function()
                        local v319, v320 = pcall(function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/F3XTeam/RBX-Building-Tools/master/RobloxLoadScript.lua'))()
                        end)

                        if v319 then
                            f4('F3X loaded!')
                        else
                            f4('Failed to load F3X: ' .. tostring(v320))
                        end
                    end,
                })
                v110.Misc:Button({
                    Title = 'Fly V3',
                    Desc = 'Advanced smooth fly script.',
                    Callback = function()
                        local v321, v322 = pcall(function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/EvolvedMeme/FlyV3/main/source.lua'))()
                        end)

                        if v321 then
                            f4('Fly V3 loaded!')
                        else
                            f4('Failed to load Fly V3: ' .. tostring(v322))
                        end
                    end,
                })
                v110.Misc:Button({
                    Title = 'VFX Logger',
                    Desc = 'Log all visual effects and particles in game.',
                    Callback = function()
                        local v323, v324 = pcall(function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/7ap/VFXLogger/main/source.lua'))()
                        end)

                        if v323 then
                            f4('VFX Logger loaded!')
                        else
                            f4('Failed to load VFX Logger: ' .. tostring(v324))
                        end
                    end,
                })
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Tools'),
                    Icon = 'wrench',
                    Opened = false,
                    Desc = '',
                })
                v110.Misc:Button({
                    Title = 'Teleport Tool',
                    Desc = 'Equip from backpack, then click to TP to your mouse position.',
                    Callback = function()
                        local teleportTool = localPlayer.Backpack:FindFirstChild('Teleport Tool') or localPlayer.Character and localPlayer.Character:FindFirstChild('Teleport Tool')

                        if teleportTool then
                            teleportTool:Destroy()
                        end

                        local teleportTool2 = Instance.new('Tool')

                        teleportTool2.Name = 'Teleport Tool'
                        teleportTool2.RequiresHandle = true
                        teleportTool2.ToolTip = 'Click anywhere to teleport there'

                        local handle7 = Instance.new('Part')

                        handle7.Name = 'Handle'
                        handle7.Size = Vector3.new(0.5, 2, 0.5)
                        handle7.BrickColor = BrickColor.new('Bright violet')
                        handle7.Material = Enum.Material.Neon
                        handle7.CanCollide = false
                        handle7.Parent = teleportTool2
                        Instance.new('SpecialMesh', handle7).MeshType = Enum.MeshType.Cylinder

                        local v325 = false

                        teleportTool2.Activated:Connect(function()
                            if v325 then
                                return
                            else
                                v325 = true

                                local character28 = localPlayer.Character
                                local humanoidRootPart45 = character28 and character28:FindFirstChild('HumanoidRootPart')
                                local getMouse = localPlayer:GetMouse()

                                if humanoidRootPart45 and getMouse.Hit then
                                    humanoidRootPart45.CFrame = CFrame.new(getMouse.Hit.Position + Vector3.new(0, 3, 0))

                                    f4('Teleported to ' .. tostring(math.floor(getMouse.Hit.Position.X)) .. ', ' .. tostring(math.floor(getMouse.Hit.Position.Y)) .. ', ' .. tostring(math.floor(getMouse.Hit.Position.Z)))
                                end

                                task.wait(0.3)

                                v325 = false

                                return
                            end
                        end)

                        teleportTool2.Parent = localPlayer.Backpack

                        f4('Teleport Tool in backpack! Equip it, then click to teleport.')
                    end,
                })
                v110.Misc:Button({
                    Title = 'Jerk Tool',
                    Desc = 'Equip from backpack, then click to fling nearby players and mobs.',
                    Callback = function()
                        local jerkTool = localPlayer.Backpack:FindFirstChild('Jerk Tool') or localPlayer.Character and localPlayer.Character:FindFirstChild('Jerk Tool')

                        if jerkTool then
                            jerkTool:Destroy()
                        end

                        local jerkTool2 = Instance.new('Tool')

                        jerkTool2.Name = 'Jerk Tool'
                        jerkTool2.RequiresHandle = true
                        jerkTool2.ToolTip = 'Click to fling nearby players/mobs'

                        local handle8 = Instance.new('Part')

                        handle8.Name = 'Handle'
                        handle8.Size = Vector3.new(0.5, 2, 0.5)
                        handle8.BrickColor = BrickColor.new('Bright red')
                        handle8.Material = Enum.Material.Neon
                        handle8.CanCollide = false
                        handle8.Parent = jerkTool2
                        Instance.new('SpecialMesh', handle8).MeshType = Enum.MeshType.Cylinder

                        jerkTool2.Activated:Connect(function()
                            local character29 = localPlayer.Character
                            local humanoidRootPart46 = character29 and character29:FindFirstChild('HumanoidRootPart')

                            if not humanoidRootPart46 then
                                return
                            else
                                for index133, value225 in ipairs(players:GetPlayers())do
                                    if value225 ~= localPlayer and value225.Character then
                                        local humanoidRootPart47 = value225.Character:FindFirstChild('HumanoidRootPart')

                                        if humanoidRootPart47 and (humanoidRootPart47.Position - humanoidRootPart46.Position).Magnitude <= 20 then
                                            local unit = (humanoidRootPart47.Position - humanoidRootPart46.Position).Unit
                                            local bodyVelocity2 = Instance.new('BodyVelocity')

                                            bodyVelocity2.MaxForce = Vector3.new(100000, 100000, 100000)
                                            bodyVelocity2.Velocity = (unit + Vector3.new(0, 0.5, 0)) * 180
                                            bodyVelocity2.Parent = humanoidRootPart47

                                            debris:AddItem(bodyVelocity2, 0.25)
                                        end
                                    end
                                end

                                local characters7 = workspace:FindFirstChild('Characters')

                                if characters7 then
                                    for index134, value226 in ipairs(characters7:GetChildren())do
                                        if value226:IsA('Model') and value226 ~= character29 then
                                            local humanoidRootPart48 = value226:FindFirstChild('HumanoidRootPart')

                                            if humanoidRootPart48 and (humanoidRootPart48.Position - humanoidRootPart46.Position).Magnitude <= 20 then
                                                local unit2 = (humanoidRootPart48.Position - humanoidRootPart46.Position).Unit
                                                local bodyVelocity3 = Instance.new('BodyVelocity')

                                                bodyVelocity3.MaxForce = Vector3.new(100000, 100000, 100000)
                                                bodyVelocity3.Velocity = (unit2 + Vector3.new(0, 0.5, 0)) * 180
                                                bodyVelocity3.Parent = humanoidRootPart48

                                                debris:AddItem(bodyVelocity3, 0.25)
                                            end
                                        end
                                    end
                                end

                                f4('Jerked nearby entities!')

                                return
                            end
                        end)

                        jerkTool2.Parent = localPlayer.Backpack

                        f4('Jerk Tool in backpack! Equip it, then click to fling nearby players/mobs.')
                    end,
                })
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Anti AFK'),
                    Icon = 'shield-check',
                    Opened = false,
                    Desc = '',
                })

                v3.antiAfkEnabled = false
                v61 = {
                    antiAfk = nil,
                    promptAdded = nil,
                }

                v110.Misc:Toggle({
                    Title = 'Anti AFK',
                    Default = false,
                    Callback = function(value227)
                        v3.antiAfkEnabled = value227

                        if value227 then
                            players.LocalPlayer.Idled:Connect(function()
                                if v3.antiAfkEnabled then
                                    virtualUser:CaptureController()
                                    virtualUser:ClickButton2(Vector2.new())
                                end
                            end)

                            if not v61.antiAfk then
                                v61.antiAfk = task.spawn(function()
                                    while v3.antiAfkEnabled do
                                        task.wait(900)

                                        if v3.antiAfkEnabled then
                                            pcall(function()
                                                virtualUser:CaptureController()
                                                virtualUser:ClickButton2(Vector2.new())
                                            end)
                                        end
                                    end
                                end)
                            end

                            f4('Anti AFK: ON')
                        else
                            f4('Anti AFK: OFF')
                        end
                    end,
                })
                v110.Misc:Divider()
                v110.Misc:Section({
                    Title = f2('Server Hop'),
                    Icon = 'shuffle',
                    Opened = false,
                    Desc = '',
                })
                v110.Misc:Button({
                    Title = 'Server Hop',
                    Callback = function()
                        local placeId = game.PlaceId
                        local v326, v327 = pcall(function()
                            local v328 = game
                            local v329 = {}

                            for index135, value228 in ipairs(httpService:JSONDecode(v328:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100')).data or {})do
                                if value228.playing and value228.maxPlayers and value228.playing < value228.maxPlayers and value228.id ~= game.JobId then
                                    table.insert(v329, value228)
                                end
                            end

                            if #v329 > 0 then
                                local v330 = math.random(1, #v329)

                                f4('Hopping to a new server...')
                                task.wait(1)
                                teleportService:TeleportToPlaceInstance(placeId, v329[v330].id, localPlayer)
                            else
                                f4('No available servers found to hop to.')
                            end
                        end)

                        if not v326 then
                            f4('Server Hop failed: ' .. tostring(v327))
                        end
                    end,
                })

                text = Drawing.new('Text')

                do
                    text2 = Drawing.new('Text')
                    v3._fpsText = text
                    v3._msText = text2

                    for index136, value229 in ipairs({text, text2})do
                        value229.Size = 15
                        value229.Color = Color3.fromRGB(0, 255, 0)
                        value229.Center = false
                        value229.Outline = true
                        value229.OutlineColor = Color3.fromRGB(0, 0, 0)
                        value229.Font = Drawing.Fonts.Plex
                        value229.Visible = false
                    end

                    local function f111()
                        local viewportSize = currentCamera.ViewportSize

                        text.Position = Vector2.new(viewportSize.X - 110, 10)
                        text2.Position = Vector2.new(viewportSize.X - 110, 28)
                    end

                    f111()
                    currentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(f111)

                    v62 = {
                        history = {},
                        size = 30,
                        counter = 0,
                        lastTime = os.clock(),
                        smoothed = 60,
                    }

                    runService.RenderStepped:Connect(function()
                        v62.counter = v62.counter + 1

                        local v331 = os.clock()
                        local v332 = v331 - v62.lastTime

                        if v332 >= 0.25 then
                            local v333 = math.floor(v62.counter / v332)

                            v62.counter = 0
                            v62.lastTime = v331

                            table.insert(v62.history, v333)

                            if #v62.history > v62.size then
                                table.remove(v62.history, 1)
                            end

                            local total = 0

                            for index137, value230 in ipairs(v62.history)do
                                total = total + value230
                            end

                            v62.smoothed = math.floor(total / #v62.history)
                            text.Visible = false
                            text2.Visible = false
                        end
                    end)

                    v63 = {}
                    v3._espConnections = v63
                    v64 = false
                end

                v65 = {
                    Health = {
                        'Bandage',
                    },
                    Fuel = {
                        'Fuel Canister',
                        'Coal',
                        'Sapling',
                        'Log',
                    },
                    Food = {
                        'Carrot',
                        'Apple',
                        'Berry',
                    },
                    Scrappable = {
                        'Alpha Wolf Corpse',
                        'Wolf Corpse',
                        'UFO Junk',
                        'UFO Component',
                        'UFO Scrap',
                    },
                    Other = {
                        'Revolver Ammo',
                        'Lost Child',
                        'Lost Child2',
                        'Lost Child3',
                        'Item Chest',
                        'Rifle Ammo',
                        'Rifle',
                        'Ammo',
                        'Revolver',
                        'Leather Body',
                        'Iron Body',
                    },
                }
                v66 = {
                    Bandage = Color3.fromRGB(220, 50, 50),
                    Log = Color3.fromRGB(139, 69, 19),
                    Coal = Color3.fromRGB(60, 60, 60),
                    ['Fuel Canister'] = Color3.fromRGB(255, 80, 0),
                    Sapling = Color3.fromRGB(50, 200, 50),
                    Carrot = Color3.fromRGB(255, 140, 0),
                    Apple = Color3.fromRGB(200, 30, 30),
                    Berry = Color3.fromRGB(140, 0, 200),
                    ['Alpha Wolf Corpse'] = Color3.fromRGB(180, 180, 180),
                    ['Wolf Corpse'] = Color3.fromRGB(120, 120, 120),
                    ['UFO Junk'] = Color3.fromRGB(0, 255, 150),
                    ['UFO Component'] = Color3.fromRGB(0, 220, 255),
                    ['UFO Scrap'] = Color3.fromRGB(100, 255, 100),
                    ['Revolver Ammo'] = Color3.fromRGB(255, 215, 0),
                    ['Rifle Ammo'] = Color3.fromRGB(200, 200, 0),
                    Ammo = Color3.fromRGB(200, 200, 0),
                    ['Lost Child'] = Color3.fromRGB(0, 200, 255),
                    ['Lost Child2'] = Color3.fromRGB(0, 200, 255),
                    ['Lost Child3'] = Color3.fromRGB(0, 200, 255),
                    ['Item Chest'] = Color3.fromRGB(255, 215, 0),
                    Rifle = Color3.fromRGB(100, 100, 200),
                    Revolver = Color3.fromRGB(100, 100, 200),
                    ['Leather Body'] = Color3.fromRGB(160, 100, 40),
                    ['Iron Body'] = Color3.fromRGB(160, 160, 180),
                }

                function f34(p77)
                    return v66[p77] or Color3.fromRGB(255, 255, 255)
                end
                function f22(p78)
                    if p78:IsA('Model') then
                        local primaryPart5 = p78.PrimaryPart or p78:FindFirstChildWhichIsA('BasePart')

                        return primaryPart5 and primaryPart5.Position
                    elseif p78:IsA('BasePart') then
                        return p78.Position
                    else
                        local basePart9 = p78:FindFirstChildWhichIsA('BasePart')

                        return basePart9 and basePart9.Position
                    end
                end

                v67 = {_tick = 0}

                runService.Heartbeat:Connect(function()
                    v67._tick = v67._tick + 1

                    if v67._tick % 6 ~= 0 then
                        return
                    else
                        local character30 = localPlayer.Character
                        local humanoidRootPart49 = character30 and character30:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart49 then
                            return
                        else
                            local position12 = humanoidRootPart49.Position

                            for key16, value231 in pairs(v67)do
                                if typeof(key16) == 'Instance' then
                                    if not key16.Parent then
                                        v67[key16] = nil
                                    elseif value231 and value231.parent then
                                        local v334 = f22(value231.parent)

                                        if v334 then
                                            value231.distLabel.Text = math.floor((position12 - v334).Magnitude) .. ' studs'
                                        end
                                    end
                                end
                            end

                            return
                        end
                    end
                end)

                function f67(p79, p80)
                    if p79:FindFirstChild('ESP_Label') then
                        return
                    else
                        local primaryPart6 = p79:IsA('Model') and (p79.PrimaryPart or p79:FindFirstChildWhichIsA('BasePart')) or p79

                        if not primaryPart6 then
                            return
                        else
                            local espLabel = Instance.new('BillboardGui')

                            espLabel.Name = 'ESP_Label'
                            espLabel.Adornee = primaryPart6
                            espLabel.Size = UDim2.new(0, 100, 0, 40)
                            espLabel.StudsOffset = Vector3.new(0, 3.5, 0)
                            espLabel.AlwaysOnTop = true
                            espLabel.MaxDistance = 500
                            espLabel.ClipsDescendants = false
                            espLabel.Parent = p79

                            local nameLabel = Instance.new('TextLabel')

                            nameLabel.Name = 'NameLabel'
                            nameLabel.Size = UDim2.new(1, 0, 0.55, 0)
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.Text = p79.Name
                            nameLabel.TextColor3 = f34(p79.Name)
                            nameLabel.TextStrokeTransparency = 0
                            nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                            nameLabel.TextScaled = true
                            nameLabel.Font = Enum.Font.GothamBold
                            nameLabel.Parent = espLabel

                            local distLabel = Instance.new('TextLabel')

                            distLabel.Name = 'DistLabel'
                            distLabel.Size = UDim2.new(1, 0, 0.45, 0)
                            distLabel.Position = UDim2.new(0, 0, 0.55, 0)
                            distLabel.BackgroundTransparency = 1
                            distLabel.Text = '...'
                            distLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                            distLabel.TextStrokeTransparency = 0
                            distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                            distLabel.TextScaled = true
                            distLabel.Font = Enum.Font.Gotham
                            distLabel.Parent = espLabel
                            v67[espLabel] = {
                                parent = p79,
                                distLabel = distLabel,
                            }

                            return
                        end
                    end
                end
                function f23()
                    return workspaceService:FindFirstChild('Characters')
                end
                function f68(p81)
                    if p81:FindFirstChild('MizuHighlight') then
                        return
                    else
                        local vyrionHighlight = Instance.new('Highlight')

                        vyrionHighlight.Name = 'MizuHighlight'
                        vyrionHighlight.FillColor = f34(p81.Name)
                        vyrionHighlight.FillTransparency = v64 and 0.4 or 1
                        vyrionHighlight.OutlineColor = f34(p81.Name)
                        vyrionHighlight.OutlineTransparency = 0
                        vyrionHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        vyrionHighlight.Parent = p81

                        return
                    end
                end

                v68 = {}

                function f24(p82)
                    return p82:GetAttribute('Scrappable')
                end
                function f25(p83)
                    return p83:GetAttribute('BurnFuel')
                end
                function f26(p84)
                    return p84:GetAttribute('RestoreHunger')
                end

                task.spawn(function()
                    while true do
                        task.wait(1)

                        local v335 = f23()

                        for key17, value232 in pairs(v68)do
                            if value232 then
                                local v336 = v65[key17]

                                if v336 then
                                    for index138, value233 in ipairs(items:GetChildren())do
                                        if f5(v336, value233.Name) and not value233:FindFirstChild('MizuHighlight') then
                                            f68(value233)
                                            f67(value233)
                                        end
                                    end

                                    if v335 then
                                        for index139, value234 in ipairs(v335:GetChildren())do
                                            if f5(v336, value234.Name) and not value234:FindFirstChild('MizuHighlight') then
                                                f68(value234)
                                                f67(value234)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)

                function f69(p85)
                    local vyrionHighlight2 = p85:FindFirstChild('MizuHighlight')

                    if vyrionHighlight2 then
                        vyrionHighlight2:Destroy()
                    end

                    local espLabel2 = p85:FindFirstChild('ESP_Label')

                    if espLabel2 then
                        espLabel2:Destroy()
                    end
                end
                function f70(p86, p87, p88)
                    local v337 = v65[p86]
                    local v338 = f23()

                    v68[p86] = p87

                    if p87 then
                        for key18, value235 in pairs(items:GetChildren())do
                            if f5(v337, value235.Name) or p88 and p88(value235) then
                                f68(value235)
                                f67(value235)
                            end
                        end

                        if v338 then
                            for key19, value236 in pairs(v338:GetChildren())do
                                if f5(v337, value236.Name) or p88 and p88(value236) then
                                    f68(value236)
                                    f67(value236)
                                end
                            end
                        end
                        if not v63['esp_' .. p86 .. 'Added'] then
                            local childAdded = items.ChildAdded

                            v63['esp_' .. p86 .. 'Added'] = childAdded:Connect(function(p89)
                                if f5(v337, p89.Name) or p88 and p88(p89) then
                                    task.wait(0.1)
                                    f68(p89)
                                    f67(p89)
                                end
                            end)
                        end
                        if v338 and not v63['esp_' .. p86 .. 'CharAdded'] then
                            local childAdded2 = v338.ChildAdded

                            v63['esp_' .. p86 .. 'CharAdded'] = childAdded2:Connect(function(p90)
                                if f5(v337, p90.Name) or p88 and p88(p90) then
                                    task.wait(0.1)
                                    f68(p90)
                                    f67(p90)
                                end
                            end)
                        end
                    else
                        for key20, value237 in pairs(items:GetChildren())do
                            if f5(v337, value237.Name) or p88 and p88(value237) then
                                f69(value237)
                            end
                        end

                        if v338 then
                            for key21, value238 in pairs(v338:GetChildren())do
                                if f5(v337, value238.Name) or p88 and p88(value238) then
                                    f69(value238)
                                end
                            end
                        end
                        if v63['esp_' .. p86 .. 'Added'] then
                            v63['esp_' .. p86 .. 'Added']:Disconnect()

                            v63['esp_' .. p86 .. 'Added'] = nil
                        end
                        if v63['esp_' .. p86 .. 'CharAdded'] then
                            v63['esp_' .. p86 .. 'CharAdded']:Disconnect()

                            v63['esp_' .. p86 .. 'CharAdded'] = nil
                        end
                    end
                end

                v69 = {
                    enabled = false,
                    connections = {},
                    hpEnabled = false,
                    distEnabled = false,
                }
                color = Color3.fromRGB(255, 80, 80)

                function f71(p91)
                    local character31 = p91.Character

                    if not character31 then
                        return
                    else
                        local vyrionPlayerHighlight = character31:FindFirstChild('MizuPlayerHighlight')

                        if vyrionPlayerHighlight then
                            vyrionPlayerHighlight:Destroy()
                        end

                        local playerESPLabel = character31:FindFirstChild('PlayerESP_Label')

                        if playerESPLabel then
                            playerESPLabel:Destroy()
                        end

                        return
                    end
                end

                v3._removePlayerESP = f71

                function f72(p92)
                    if p92 == localPlayer then
                        return
                    else
                        local character32 = p92.Character

                        if not character32 then
                            return
                        else
                            local humanoidRootPart50 = character32:FindFirstChild('HumanoidRootPart')

                            if not humanoidRootPart50 then
                                return
                            end
                            if not character32:FindFirstChild('MizuPlayerHighlight') then
                                local vyrionPlayerHighlight2 = Instance.new('Highlight')

                                vyrionPlayerHighlight2.Name = 'MizuPlayerHighlight'
                                vyrionPlayerHighlight2.FillColor = color
                                vyrionPlayerHighlight2.FillTransparency = v64 and 0.4 or 1
                                vyrionPlayerHighlight2.OutlineColor = color
                                vyrionPlayerHighlight2.OutlineTransparency = 0
                                vyrionPlayerHighlight2.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                vyrionPlayerHighlight2.Adornee = character32
                                vyrionPlayerHighlight2.Parent = character32
                            else
                                character32:FindFirstChild('MizuPlayerHighlight').FillTransparency = v64 and 0.4 or 1
                            end
                            if not character32:FindFirstChild('PlayerESP_Label') then
                                local playerESPLabel2 = Instance.new('BillboardGui')

                                playerESPLabel2.Name = 'PlayerESP_Label'
                                playerESPLabel2.Adornee = humanoidRootPart50
                                playerESPLabel2.Size = UDim2.new(0, 100, 0, 50)
                                playerESPLabel2.StudsOffset = Vector3.new(0, 3.5, 0)
                                playerESPLabel2.AlwaysOnTop = true
                                playerESPLabel2.MaxDistance = 1000
                                playerESPLabel2.Parent = character32

                                local nameLabel2 = Instance.new('TextLabel')

                                nameLabel2.Name = 'NameLabel'
                                nameLabel2.Size = UDim2.new(1, 0, 0.55, 0)
                                nameLabel2.BackgroundTransparency = 1
                                nameLabel2.Text = p92.Name
                                nameLabel2.TextColor3 = color
                                nameLabel2.TextStrokeTransparency = 0
                                nameLabel2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                nameLabel2.TextScaled = true
                                nameLabel2.Font = Enum.Font.GothamBold
                                nameLabel2.Parent = playerESPLabel2

                                local distLabel2 = Instance.new('TextLabel')

                                distLabel2.Name = 'DistLabel'
                                distLabel2.Size = UDim2.new(1, 0, 0.45, 0)
                                distLabel2.Position = UDim2.new(0, 0, 0.55, 0)
                                distLabel2.BackgroundTransparency = 1
                                distLabel2.Text = '...'
                                distLabel2.TextColor3 = Color3.fromRGB(220, 220, 220)
                                distLabel2.TextStrokeTransparency = 0
                                distLabel2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                distLabel2.TextScaled = true
                                distLabel2.Font = Enum.Font.Gotham
                                distLabel2.Parent = playerESPLabel2
                                v67[playerESPLabel2] = {
                                    parent = humanoidRootPart50,
                                    distLabel = distLabel2,
                                }
                            end

                            return
                        end
                    end
                end
                function f73()
                    for index140, value239 in ipairs(players:GetPlayers())do
                        if value239 ~= localPlayer then
                            if v69.enabled then
                                f72(value239)
                            else
                                f71(value239)
                            end
                        end
                    end
                end

                v3._refreshPlayerESP = f73

                function f35()
                    local playerAdded = players.PlayerAdded

                    v69.connections.charAdded = playerAdded:Connect(function(p93)
                        if not v69.enabled then
                            return
                        end

                        p93.CharacterAdded:Connect(function()
                            task.wait(0.5)
                            f72(p93)
                        end)
                    end)

                    for index141, value240 in ipairs(players:GetPlayers())do
                        local v339 = value240

                        if v339 ~= localPlayer then
                            local characterAdded = v339.CharacterAdded

                            v69.connections['char_' .. v339.Name] = characterAdded:Connect(function()
                                task.wait(0.5)

                                if v69.enabled then
                                    f72(v339)
                                end
                            end)
                        end
                    end
                end
                function f27()
                    for key22, value241 in pairs(v69.connections)do
                        value241:Disconnect()

                        v69.connections[key22] = nil
                    end
                end

                v3._clearPlayerESPListeners = f27

                function f74()
                    for key23, value242 in pairs(items:GetChildren())do
                        local vyrionHighlight3 = value242:FindFirstChild('MizuHighlight')

                        if vyrionHighlight3 then
                            vyrionHighlight3.FillTransparency = v64 and 0.4 or 1
                        end
                    end

                    local v340 = f23()

                    if v340 then
                        for key24, value243 in pairs(v340:GetChildren())do
                            local vyrionHighlight4 = value243:FindFirstChild('MizuHighlight')

                            if vyrionHighlight4 then
                                vyrionHighlight4.FillTransparency = v64 and 0.4 or 1
                            end
                        end
                    end

                    for index142, value244 in ipairs(players:GetPlayers())do
                        if value244 ~= localPlayer and value244.Character then
                            local vyrionPlayerHighlight3 = value244.Character:FindFirstChild('MizuPlayerHighlight')

                            if vyrionPlayerHighlight3 then
                                vyrionPlayerHighlight3.FillTransparency = v64 and 0.4 or 1
                            end
                        end
                    end
                end

                v110.Esp:Divider()
                v110.Esp:Section({
                    Title = f2('Global ESP Settings'),
                    Icon = 'sliders',
                    Opened = false,
                    Desc = '',
                })
                v110.Esp:Toggle({
                    Title = 'Chams (Fill All ESP)',
                    Default = false,
                    Callback = function(value245)
                        v64 = value245

                        f74()
                    end,
                })
                v110.Esp:Divider()
                v110.Esp:Section({
                    Title = f2('Player ESP'),
                    Icon = 'user',
                    Opened = false,
                    Desc = '',
                })
                v110.Esp:Paragraph({
                    Title = 'Player ESP',
                    Desc = 'Options for player visibility, including health',
                })
                v110.Esp:Toggle({
                    Title = 'Player ESP',
                    Desc = 'Shows ESP highlights on all other players.',
                    Default = false,
                    Callback = function(value246)
                        v69.enabled = value246

                        if value246 then
                            f73()
                            f35()
                        else
                            f27()
                            f73()
                        end
                    end,
                })
                v110.Esp:Toggle({
                    Title = 'Player ESP HP Viewer',
                    Desc = 'Displays health bar / HP value above players.',
                    Default = false,
                    Callback = function(value247)
                        v69.hpEnabled = value247

                        if v69.enabled then
                            f73()
                        end

                        f4('Player HP Viewer: ' .. (value247 and 'ON' or 'OFF'))
                    end,
                })
                v110.Esp:Toggle({
                    Title = 'Player ESP Distance Viewer',
                    Desc = 'Displays the distance (in studs) to each player.',
                    Default = false,
                    Callback = function(value248)
                        v69.distEnabled = value248

                        if v69.enabled then
                            f73()
                        end

                        f4('Player Distance Viewer: ' .. (value248 and 'ON' or 'OFF'))
                    end,
                })

                do
                    v110.Esp:Divider()
                    v110.Esp:Section({
                        Title = f2('World Item ESP'),
                        Icon = 'globe',
                        Opened = false,
                        Desc = '',
                    })

                    v70 = {
                        'Fuel',
                        'Food',
                        'Health',
                        'Scrappable',
                        'Other',
                    }
                    v71 = {}

                    local esp = v110.Esp

                    local function f112()
                        local v341 = {
                            'All',
                        }

                        for index143, value249 in ipairs(v70)do
                            v341[#v341 + 1] = value249
                        end

                        return v341
                    end

                    esp:Dropdown({
                        Title = 'Esp Items',
                        Desc = 'Select one or more item categories to show ESP for.',
                        Values = f112(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value250)
                            v71 = {}

                            if type(value250) == 'table' then
                                local v342 = false

                                for index144, value251 in ipairs(value250)do
                                    if value251 == 'All' then
                                        v342 = true

                                        break
                                    end
                                end

                                if v342 then
                                    for index145, value252 in ipairs(v70)do
                                        v71[value252] = true
                                    end
                                else
                                    for index146, value253 in ipairs(value250)do
                                        v71[value253] = true
                                    end
                                end
                            end
                        end,
                    })
                    v110.Esp:Toggle({
                        Title = 'Enable Item Esp',
                        Default = false,
                        Callback = function(value254)
                            for index147, value255 in ipairs(v70)do
                                if v71[value255] then
                                    local v343 = nil

                                    if value255 == 'Fuel' then
                                        v343 = f25
                                    elseif value255 == 'Food' then
                                        v343 = f26
                                    elseif value255 == 'Scrappable' then
                                        v343 = f24
                                    end

                                    f70(value255, value254, v343)
                                elseif value254 == false then
                                    f70(value255, false, nil)
                                end
                            end
                        end,
                    })
                    v110.Esp:Divider()
                    v110.Esp:Section({
                        Title = f2('Chest ESP'),
                        Icon = 'package',
                        Opened = false,
                        Desc = '',
                    })
                    v110.Esp:Paragraph({
                        Title = 'Chest ESP',
                        Desc = 'Select chest types to highlight. Scan first to find available chests.',
                    })

                    v72 = {}
                end
                do
                    v73 = {}

                    local color2 = Color3.fromRGB(255, 215, 0)

                    function f28(p94)
                        if v73[p94] then
                            return
                        else
                            local vyrionChestESP = Instance.new('Highlight')

                            vyrionChestESP.Name = 'MizuChestESP'
                            vyrionChestESP.FillColor = v74
                            vyrionChestESP.FillTransparency = v64 and 0.4 or 1
                            vyrionChestESP.OutlineColor = v74
                            vyrionChestESP.OutlineTransparency = 0
                            vyrionChestESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            vyrionChestESP.Parent = p94
                            v73[p94] = vyrionChestESP

                            f67(p94)

                            return
                        end
                    end

                    v74 = color2

                    function f75()
                        for key25, value256 in pairs(v73) do end

                        local v344 = false

                        v73 = {}

                        for key26, value257 in pairs(v72)do
                            if value257 then
                                v344 = true

                                break
                            end
                        end

                        if not v344 then
                            return
                        end

                        for index148, value258 in ipairs(items:GetChildren())do
                            if value258.Name:lower():find('chest') then
                                local lower10 = value258.Name:lower()

                                for key27, value259 in pairs(v72)do
                                    if value259 and lower10:find(key27:lower()) then
                                        pcall(f28, value258)

                                        break
                                    end
                                end
                            end
                        end
                    end

                    v75 = {
                        'Item Chest',
                        'Chest',
                        'Cave Chest',
                        'Jungle Chest',
                        'Fairy Chest',
                        'Arctic Chest',
                        'Loot Chest',
                        'Wooden Chest',
                    }

                    local esp2 = v110.Esp

                    local function f113()
                        local v345 = {
                            'All',
                        }

                        for index149, value260 in ipairs(v75)do
                            v345[#v345 + 1] = value260
                        end

                        return v345
                    end

                    esp2:Dropdown({
                        Title = 'Select Chest Types (ESP)',
                        Desc = 'Multi-select chest types to show ESP highlights for.',
                        Values = f113(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value261)
                            v72 = {}

                            if type(value261) == 'table' then
                                local v346 = false

                                for index150, value262 in ipairs(value261)do
                                    if value262 == 'All' then
                                        v346 = true

                                        break
                                    end
                                end

                                if v346 then
                                    for index151, value263 in ipairs(v75)do
                                        v72[value263] = true
                                    end
                                else
                                    for index152, value264 in ipairs(value261)do
                                        v72[value264] = true
                                    end
                                end
                            end
                        end,
                    })
                    v110.Esp:Toggle({
                        Title = 'Enable Chest ESP',
                        Desc = 'Shows highlights on all selected chest types.',
                        Default = false,
                        Callback = function(value265)
                            if value265 then
                                f75()

                                if not v63.chestESPAdded then
                                    v63.chestESPAdded = items.ChildAdded:Connect(function(child2)
                                        if child2.Name:lower():find('chest') then
                                            task.wait(0.1)

                                            for key28, value266 in pairs(v72)do
                                                if value266 and child2.Name:lower():find(key28:lower()) then
                                                    pcall(f28, child2)

                                                    break
                                                end
                                            end
                                        end
                                    end)
                                end

                                f4('Chest ESP: ON')
                            else
                                for key29, value267 in pairs(v73) do end

                                v73 = {}

                                if v63.chestESPAdded then
                                    v63.chestESPAdded:Disconnect()

                                    v63.chestESPAdded = nil
                                end

                                f4('Chest ESP: OFF')
                            end
                        end,
                    })

                    v76 = {}
                    v76.settings = {
                        Wolf = false,
                        Bunny = false,
                        Cultist = false,
                        Bear = false,
                        PolarBear = false,
                        ArcticFox = false,
                        Mammoth = false,
                        Deer = false,
                        Rambo = false,
                        Owl = false,
                        Cat = false,
                    }
                end

                v76.colors = {
                    Wolf = Color3.fromRGB(180, 180, 255),
                    Bunny = Color3.fromRGB(255, 220, 180),
                    Cultist = Color3.fromRGB(200, 50, 200),
                    Bear = Color3.fromRGB(139, 90, 43),
                    PolarBear = Color3.fromRGB(220, 240, 255),
                    ArcticFox = Color3.fromRGB(180, 230, 255),
                    Mammoth = Color3.fromRGB(160, 120, 80),
                    Deer = Color3.fromRGB(210, 160, 80),
                    Rambo = Color3.fromRGB(255, 80, 80),
                    Owl = Color3.fromRGB(200, 180, 140),
                    Cat = Color3.fromRGB(255, 180, 220),
                }

                function f76(p95)
                    local lower11 = p95.Name:lower()

                    if lower11:find('wolf') or lower11:find('alpha') then
                        return 'Wolf'
                    end
                    if lower11:find('bunny') or lower11:find('rabbit') then
                        return 'Bunny'
                    end
                    if lower11:find('cultist') or lower11:find('cross') then
                        return 'Cultist'
                    elseif lower11:find('polar') then
                        return 'PolarBear'
                    elseif lower11:find('bear') then
                        return 'Bear'
                    elseif lower11:find('arctic') or lower11:find('fox') then
                        return 'ArcticFox'
                    elseif lower11:find('mammoth') then
                        return 'Mammoth'
                    else
                        if lower11:find('deer') or lower11:find('stag') or lower11:find('doe') then
                            return 'Deer'
                        end
                        if lower11:find('rambo') or lower11:find('soldier') or lower11:find('ranger') then
                            return 'Rambo'
                        elseif lower11:find('owl') then
                            return 'Owl'
                        else
                            if lower11:find('cat') or lower11:find('kitten') or lower11:find('feline') then
                                return 'Cat'
                            end
                            if lower11:find('alien elite') or lower11:find('alienelite') or lower11:find('elite') then
                                return 'AlienElite'
                            end
                            if lower11:find('alien') then
                                return 'Alien'
                            end

                            return nil
                        end
                    end
                end
                function f29(p96)
                    local humanoid14 = p96:FindFirstChildOfClass('Humanoid')

                    if not humanoid14 or humanoid14.MaxHealth <= 0 then
                        return ''
                    else
                        local v347 = math.floor(humanoid14.Health / humanoid14.MaxHealth * 100)

                        return (v347 > 60 and '\u{1f7e2}' or v347 > 30 and '\u{1f7e1}' or '\u{1f534}') .. ' ' .. v347 .. '%'
                    end
                end
                function f77(p97)
                    return v76.colors[p97] or Color3.fromRGB(255, 255, 255)
                end

                v77 = {
                    connections = {},
                    labelRegistry = {_tick = 0},
                    origRefresh = nil,
                }

                runService.Heartbeat:Connect(function()
                    v77.labelRegistry._tick = v77.labelRegistry._tick + 1

                    if v77.labelRegistry._tick % 10 ~= 0 then
                        return
                    else
                        local character33 = localPlayer.Character
                        local humanoidRootPart51 = character33 and character33:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart51 then
                            return
                        else
                            local position13 = humanoidRootPart51.Position

                            for key30, value268 in pairs(v77.labelRegistry)do
                                if typeof(key30) == 'Instance' then
                                    if not key30.Parent or not (value268 and value268.model and value268.model.Parent) then
                                        v77.labelRegistry[key30] = nil
                                    else
                                        local humanoidRootPart52 = value268.model:FindFirstChild('HumanoidRootPart')

                                        if humanoidRootPart52 then
                                            value268.distLabel.Text = math.floor((position13 - humanoidRootPart52.Position).Magnitude) .. ' studs'
                                        end

                                        value268.hpLabel.Text = f29(value268.model)
                                    end
                                end
                            end

                            return
                        end
                    end
                end)

                function f30()
                    if v77.connections.charAdded then
                        v77.connections.charAdded:Disconnect()

                        v77.connections.charAdded = nil
                    end
                end
                function f31(p98, p99)
                    if p98:FindFirstChild('MobESP_Highlight') then
                        return
                    else
                        local mobESPHighlight = Instance.new('Highlight')

                        mobESPHighlight.Name = 'MobESP_Highlight'
                        mobESPHighlight.FillColor = f77(p99)
                        mobESPHighlight.FillTransparency = v64 and 0.4 or 1
                        mobESPHighlight.OutlineColor = f77(p99)
                        mobESPHighlight.OutlineTransparency = 0
                        mobESPHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        mobESPHighlight.Adornee = p98
                        mobESPHighlight.Parent = p98

                        return
                    end
                end
                function f78(p100, p101)
                    if p100:FindFirstChild('MobESP_Label') then
                        return
                    else
                        local humanoidRootPart53 = p100:FindFirstChild('HumanoidRootPart')

                        if not humanoidRootPart53 then
                            return
                        else
                            local textColor3 = f77(p101)
                            local mobESPLabel = Instance.new('BillboardGui')

                            mobESPLabel.Name = 'MobESP_Label'
                            mobESPLabel.Adornee = humanoidRootPart53
                            mobESPLabel.Size = UDim2.new(0, 110, 0, 55)
                            mobESPLabel.StudsOffset = Vector3.new(0, 4, 0)
                            mobESPLabel.AlwaysOnTop = true
                            mobESPLabel.MaxDistance = 500
                            mobESPLabel.Parent = p100

                            local nameLabel3 = Instance.new('TextLabel')

                            nameLabel3.Name = 'NameLabel'
                            nameLabel3.Size = UDim2.new(1, 0, 0.45, 0)
                            nameLabel3.BackgroundTransparency = 1
                            nameLabel3.Text = p100.Name
                            nameLabel3.TextColor3 = textColor3
                            nameLabel3.TextStrokeTransparency = 0
                            nameLabel3.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                            nameLabel3.TextScaled = true
                            nameLabel3.Font = Enum.Font.GothamBold
                            nameLabel3.Parent = mobESPLabel

                            local hpLabel = Instance.new('TextLabel')

                            hpLabel.Name = 'HPLabel'
                            hpLabel.Size = UDim2.new(1, 0, 0.3, 0)
                            hpLabel.Position = UDim2.new(0, 0, 0.45, 0)
                            hpLabel.BackgroundTransparency = 1
                            hpLabel.Text = f29(p100)
                            hpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            hpLabel.TextStrokeTransparency = 0
                            hpLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                            hpLabel.TextScaled = true
                            hpLabel.Font = Enum.Font.Gotham
                            hpLabel.Parent = mobESPLabel

                            local distLabel3 = Instance.new('TextLabel')

                            distLabel3.Name = 'DistLabel'
                            distLabel3.Size = UDim2.new(1, 0, 0.25, 0)
                            distLabel3.Position = UDim2.new(0, 0, 0.75, 0)
                            distLabel3.BackgroundTransparency = 1
                            distLabel3.Text = '...'
                            distLabel3.TextColor3 = Color3.fromRGB(200, 200, 200)
                            distLabel3.TextStrokeTransparency = 0
                            distLabel3.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                            distLabel3.TextScaled = true
                            distLabel3.Font = Enum.Font.Gotham
                            distLabel3.Parent = mobESPLabel
                            v77.labelRegistry[mobESPLabel] = {
                                model = p100,
                                hpLabel = hpLabel,
                                distLabel = distLabel3,
                            }

                            return
                        end
                    end
                end
                function f32(p102)
                    local mobESPHighlight2 = p102:FindFirstChild('MobESP_Highlight')

                    if mobESPHighlight2 then
                        mobESPHighlight2:Destroy()
                    end

                    local mobESPLabel2 = p102:FindFirstChild('MobESP_Label')

                    if mobESPLabel2 then
                        mobESPLabel2:Destroy()
                    end
                end
                function f36()
                    local v348 = f23()

                    if not v348 then
                        return
                    end

                    for index153, value269 in ipairs(v348:GetChildren())do
                        if value269:IsA('Model') and value269:FindFirstChild('HumanoidRootPart') then
                            local v349 = f76(value269)

                            if v349 and v76.settings[v349] then
                                f31(value269, v349)
                                f78(value269, v349)
                            end
                        end
                    end
                end
                function f33()
                    if v77.connections.charAdded then
                        return
                    else
                        local v350 = f23()

                        if not v350 then
                            return
                        else
                            local childAdded3 = v350.ChildAdded

                            v77.connections.charAdded = childAdded3:Connect(function(p103)
                                task.wait(0.2)

                                if p103:IsA('Model') and p103:FindFirstChild('HumanoidRootPart') then
                                    local v351 = f76(p103)

                                    if v351 and v76.settings[v351] then
                                        f31(p103, v351)
                                        f78(p103, v351)
                                    end
                                end
                            end)

                            return
                        end
                    end
                end

                do
                    function f79(p104)
                        local v352 = f23()

                        if not v352 then
                            return
                        end

                        for index154, value270 in ipairs(v352:GetChildren())do
                            if f76(value270) == p104 then
                                f32(value270)
                            end
                        end
                    end
                    function f80(p105, p106)
                        v76.settings[p105] = p106

                        if p106 then
                            f36()
                            f33()
                        else
                            f79(p105)

                            local v353 = false

                            for key31, value271 in pairs(v76.settings)do
                                if value271 then
                                    v353 = true

                                    break
                                end
                            end

                            if not v353 then
                                f30()
                            end
                        end
                    end

                    v77.origRefresh = f74

                    function f74()
                        v77.origRefresh()

                        local v354 = f23()

                        if v354 then
                            for index155, value272 in ipairs(v354:GetChildren())do
                                local mobESPHighlight3 = value272:FindFirstChild('MobESP_Highlight')

                                if mobESPHighlight3 then
                                    mobESPHighlight3.FillTransparency = v64 and 0.4 or 1
                                end
                            end
                        end
                    end

                    v110.Esp:Divider()
                    v110.Esp:Section({
                        Title = f2('Mob ESP'),
                        Icon = 'ghost',
                        Opened = false,
                        Desc = '',
                    })

                    v78 = {
                        'Wolf / Alpha Wolf',
                        'Bunny',
                        'Cultist',
                        'Bear',
                        'Polar Bear',
                        'Arctic Fox',
                        'Mammoth',
                        'Deer',
                        'Rambo',
                        'Owl',
                        'Cat',
                        'Alien',
                        'Alien Elite',
                    }
                    v79 = {
                        ['Wolf / Alpha Wolf'] = 'Wolf',
                        Bunny = 'Bunny',
                        Cultist = 'Cultist',
                        Bear = 'Bear',
                        ['Polar Bear'] = 'PolarBear',
                        ['Arctic Fox'] = 'ArcticFox',
                        Mammoth = 'Mammoth',
                        Deer = 'Deer',
                        Rambo = 'Rambo',
                        Owl = 'Owl',
                        Cat = 'Cat',
                        Alien = 'Alien',
                        ['Alien Elite'] = 'AlienElite',
                    }
                    v80 = {}

                    local esp3 = v110.Esp

                    local function f114()
                        local v355 = {
                            'All',
                        }

                        for index156, value273 in ipairs(v78)do
                            v355[#v355 + 1] = value273
                        end

                        return v355
                    end

                    esp3:Dropdown({
                        Title = 'Esp Entity',
                        Desc = 'Select one or more mob types to show ESP for.',
                        Values = f114(),
                        Value = {},
                        Multi = true,
                        AllowNone = true,
                        Callback = function(value274)
                            v80 = {}

                            if type(value274) == 'table' then
                                local v356 = false

                                for index157, value275 in ipairs(value274)do
                                    if value275 == 'All' then
                                        v356 = true

                                        break
                                    end
                                end

                                if v356 then
                                    for index158, value276 in ipairs(v78)do
                                        local v357 = v79[value276]

                                        if v357 then
                                            v80[v357] = true
                                        end
                                    end
                                else
                                    for index159, value277 in ipairs(value274)do
                                        local v358 = v79[value277]

                                        if v358 then
                                            v80[v358] = true
                                        end
                                    end
                                end
                            end
                        end,
                    })
                end

                v110.Esp:Toggle({
                    Title = 'Enable Entity Esp',
                    Default = false,
                    Callback = function(value278)
                        for index160, value279 in ipairs(v78)do
                            local v359 = v79[value279]

                            if v359 then
                                if v80[v359] then
                                    f80(v359, value278)
                                elseif value278 == false then
                                    f80(v359, false)
                                end
                            end
                        end
                    end,
                })
                tick()
                runService.RenderStepped:Connect(function()
                    v46902 = tick()
                end)

                if not localPlayer:GetAttribute('SynSessionStart') then
                    localPlayer:SetAttribute('SynSessionStart', os.time())
                end

                v110.Stats:Divider()
                v110.Stats:Section({
                    Title = f2('Game Stats'),
                    Icon = 'bar-chart-2',
                    Opened = false,
                })

                v360 = {}
                v3.TrackedDay = v3.TrackedDay or 1
                v360.SunState = v110.Stats:Paragraph({
                    Title = '\u{2600}  Sun Cycle',
                    Desc = '...',
                })
                v360.SunTime = v110.Stats:Paragraph({
                    Title = '\u{23f1}  Phase Timer',
                    Desc = '...',
                })
                v360.DayCounter = v110.Stats:Paragraph({
                    Title = '\u{1f4c5}  Day Count',
                    Desc = '...',
                })
                v360.RealClock = v110.Stats:Paragraph({
                    Title = '\u{1f550}  Real Clock',
                    Desc = '...',
                })

                v110.Stats:Divider()
                v110.Stats:Section({
                    Title = f2('Environment'),
                    Icon = 'cloud',
                    Opened = false,
                })

                v360.Weather = v110.Stats:Paragraph({
                    Title = '\u{1f324}  Weather',
                    Desc = '...',
                })
                v360.Temperature = v110.Stats:Paragraph({
                    Title = '\u{1f321}  Temperature',
                    Desc = '...',
                })
                v360.LightLevel = v110.Stats:Paragraph({
                    Title = '\u{1f4a1}  Light Level',
                    Desc = '...',
                })
                v360.NightsSafe = v110.Stats:Paragraph({
                    Title = '\u{1f319}  Nights Safe',
                    Desc = '...',
                })

                v110.Stats:Divider()
                v110.Stats:Section({
                    Title = f2('Campfire'),
                    Icon = 'flame',
                    Opened = false,
                })

                v360.FireLevel = v110.Stats:Paragraph({
                    Title = '\u{1f525}  Fire Level',
                    Desc = '...',
                })
                v360.FireStatus = v110.Stats:Paragraph({
                    Title = '\u{1fab5}  Fire Status',
                    Desc = '...',
                })

                v110.Stats:Divider()
                v110.Stats:Section({
                    Title = f2('Player'),
                    Icon = 'user',
                    Opened = false,
                })

                v360.Health = v110.Stats:Paragraph({
                    Title = '\u{2764}  Health',
                    Desc = '...',
                })
                v360.Hunger = v110.Stats:Paragraph({
                    Title = '\u{1f356}  Hunger',
                    Desc = '...',
                })
                v360.Armour = v110.Stats:Paragraph({
                    Title = '\u{1f6e1}  Armour',
                    Desc = '...',
                })
                v360.PlayerClass = v110.Stats:Paragraph({
                    Title = '\u{2694}  Class',
                    Desc = '...',
                })
                v360.ClassLevel = v110.Stats:Paragraph({
                    Title = '\u{1f4c8}  Class Level',
                    Desc = '...',
                })
                v360.Talent = v110.Stats:Paragraph({
                    Title = '\u{2728}  Talent',
                    Desc = '...',
                })
                v360.XP = v110.Stats:Paragraph({
                    Title = '\u{2b50}  Experience',
                    Desc = '...',
                })
                v360.Position = v110.Stats:Paragraph({
                    Title = '\u{1f4cd}  Position',
                    Desc = '...',
                })

                v110.Stats:Divider()
                v110.Stats:Section({
                    Title = f2('Session & System'),
                    Icon = 'monitor',
                    Opened = false,
                })

                v360.Ping = v110.Stats:Paragraph({
                    Title = '\u{1f4f6}  Ping',
                    Desc = '...',
                })
                v360.FPS = v110.Stats:Paragraph({
                    Title = '\u{1f5a5}  FPS',
                    Desc = '...',
                })
                v360.Players = v110.Stats:Paragraph({
                    Title = '\u{1f465}  Players',
                    Desc = '...',
                })
                v360.PlayerId = v110.Stats:Paragraph({
                    Title = '\u{1faaa}  Player ID',
                    Desc = '...',
                })
                v360.UpTime = v110.Stats:Paragraph({
                    Title = '\u{23f3}  Session Time',
                    Desc = '...',
                })
                v360.GameVersion = v110.Stats:Paragraph({
                    Title = '\u{1f3ae}  Game Version',
                    Desc = '...',
                })

                localPlayer.CharacterAdded:Connect(function(character34)
                    local humanoid15 = character34:WaitForChild('Humanoid')

                    task.wait(1)

                    if v3.speedEnabled then
                        humanoid15.WalkSpeed = v3.speedValue
                    end
                    if v3.jpEnabled then
                        f65(humanoid15, v3.jpValue)
                    end
                    if v3.flyEnabled then
                        task.wait(0.5)

                        if v3._startFly then
                            v3._startFly()
                        end
                    end
                    if v3._refreshPlayerESP then
                        task.wait(0.5)
                        v3._refreshPlayerESP()
                    end
                end)
                players.LocalPlayer.OnTeleport:Connect(function()
                    pcall(function()
                        local v361 = v3._fpsText

                        if v361 then
                            v361:Remove()
                        end
                    end)
                    pcall(function()
                        local v362 = v3._msText

                        if v362 then
                            v362:Remove()
                        end
                    end)
                    pcall(function()
                        if v3._stopFly then
                            v3._stopFly()
                        end
                    end)

                    local espConnections = v3._espConnections

                    if espConnections then
                        for key32, value280 in pairs(espConnections)do
                            if value280 then
                                value280:Disconnect()
                            end
                        end
                    end
                    if v3._clearPlayerESPListeners then
                        v3._clearPlayerESPListeners()
                    end

                    for index161, value281 in ipairs(players:GetPlayers())do
                        local v363 = value281

                        pcall(function()
                            if v3._removePlayerESP then
                                v3._removePlayerESP(v363)
                            end
                        end)
                    end
                end)

                return
            end
        end
    end
end

task.spawn(f1)
