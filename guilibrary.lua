local CollectionService = game:GetService("CollectionService")
local tweenService = game:GetService("TweenService");
local starterGui = game:GetService("StarterGui");
local coreGui = game:GetService("CoreGui");
local UserInputService = game:GetService("UserInputService");


if _G.loaded then
	   _G.shutdown()
end

local guilibrary = {
	Scale = {
		Factor = 1
	},
	title = "Qiex",
	titleSize = 25;
	Corners = {
		Scaled = 0.040
	},
	StudioScreenGui = starterGui:FindFirstChild("ScreenGui") or script.Parent,
	Colors = {
		WindowColor = Color3.fromRGB(142, 214, 255)
	},
	VERSION = "DATE: 11/28/2024, TIME: 5:00PM, PATCH NUMBER_1.1",
	UISTROKES = true,
	UISHADOWS = true,
	THEMECOLORS = {
		 BUTTON_COLOR = Color3.fromRGB(255, 105, 105),
		 TEXT_COLOR = Color3.fromRGB(196, 196, 196),
		 STROKES_COLOR = Color3.fromRGB(248, 109, 109)
	}
}

local function loadQiex()
	_G.loaded = true
	local studio = false
	local ScreenGui

	local function scale(x, y)
		return UDim2.new(x * guilibrary["Scale"]["Factor"], 0, y * guilibrary["Scale"]["Factor"], 0);
	end
	local function udim2(x, y)
		return UDim2.new(x, 0, y, 0);
	end

	local function instance(Properties)
		local inst = Instance.new(Properties.instance)
		for index, key in pairs(Properties) do
			if index and key and index~="instance" then
				inst[index] = key;
			end
		end
		return inst;
	end

	local function AddUICorner(Properties)
		return instance({instance = "UICorner",Parent = Properties.parent, CornerRadius = UDim.new(Properties.scale)})
	end
	local function AddUIStroke(Properties)
		if guilibrary.UISTROKES then
			 return instance({instance = "UIStroke",Parent = Properties.parent, Color = guilibrary["THEMECOLORS"]["STROKES_COLOR"]})
		end
	end

	local function randomString()
		math.randomseed(os.time())
		local randomNumber = math.random(1, 100)
		local stringTable = {}
		for i=0, randomNumber do
			stringTable = {"scriptver: 1.1"}
		end
		return table.concat(stringTable)
	end

	if not studio then
		ScreenGui = instance({
			instance = "ScreenGui",
			ZIndexBehavior = Enum.ZIndexBehavior.Global,
			Name = randomString();
			Parent = coreGui
		})
		_G.screenGui = ScreenGui
	else
		ScreenGui = script.Parent
	end

	local MainFrame = instance({
		instance = "Frame";
		Name = "MainFrame";
		Parent = ScreenGui;
		Size = scale(0.11, 0.455);
		BackgroundTransparency = 0.01;
		BackgroundColor3 = Color3.fromRGB(31, 31, 31);
	})

	local function guiShadow(parent_frame)
		  if guilibrary.UISHADOWS then
			local DropShadowHolder = Instance.new("Frame")
			local DropShadow = Instance.new("ImageLabel")
		
		
			DropShadowHolder.Name = "DropShadowHolder"
			DropShadowHolder.Parent = parent_frame
			DropShadowHolder.BackgroundTransparency = 1.000
			DropShadowHolder.BorderSizePixel = 0
			DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
			DropShadowHolder.ZIndex = 0
		
			DropShadow.Name = "DropShadow"
			DropShadow.Parent = DropShadowHolder
			DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow.BackgroundTransparency = 1.000
			DropShadow.BorderSizePixel = 0
			DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow.Size = UDim2.new(1, 47, 1, 47)
			DropShadow.ZIndex = 0
			DropShadow.Image = "rbxassetid://6015897843"
			DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow.ImageTransparency = 0.500
			DropShadow.ScaleType = Enum.ScaleType.Slice
			DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
		  end
	end


	guiShadow(MainFrame)
	AddUICorner({parent = MainFrame, scale = guilibrary["Corners"]["Scaled"]})


	local CatergoryContainer = instance({
		instance = "Frame";
		Name = "Container";
		Parent = MainFrame;
		Size = udim2(1, 0.9);
		Position = udim2(0, 0.102);
		BackgroundTransparency = 1;
	})

	local TopBar = instance({
		instance = "Frame",
		Parent = MainFrame;
		Size = udim2(1, 0.1);
		Position = udim2(0,0.015);
		BackgroundColor3 = Color3.fromRGB(35, 35, 35);
	})

	AddUICorner({parent = TopBar, scale = guilibrary["Corners"]["Scaled"]})

	local title = instance{
		instance = "TextLabel";
		Name = "Title";
		BackgroundTransparency = 1;
		Font = Enum.Font.Gotham;
		TextColor3 = guilibrary["THEMECOLORS"]["TEXT_COLOR"];
		Text = guilibrary["title"];
		Parent = TopBar;
		Size = udim2(1,1);
		TextSize = guilibrary["titleSize"];
	}


	AddUIStroke({parent = MainFrame, color = Color3.fromRGB(146, 206, 255)})


	local function dragUI(Object: Instance) -- not made by me
		local frame = Object
		local dragToggle = nil
		local dragSpeed = 0.25
		local dragStart = nil
		local startPos = nil
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end
		frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				dragToggle = true
				dragStart = input.Position
				startPos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
	end

	_G.shutdown = function()
		_G.screenGui:Destroy()
	end




	function guilibrary.CreateCategory(options)
		local CATEGORY_CONFIG = {
			 ENALED = true
		}
		local Catergory = instance{
			instance = "TextButton";
			Parent = CatergoryContainer;
			BackgroundTransparency = 0;
			BackgroundColor3 = guilibrary["THEMECOLORS"]["BUTTON_COLOR"],
			Size = udim2(1, 0.13);
			BorderSizePixel = 0;
			Position = udim2(0, 0.010);
			Text = "";
			Name = options["Name"]
		}
		local CategoryTitle = instance{
			instance = "TextLabel";
			Name = "CategoryTitle";
			BackgroundTransparency = 1;
			Font = Enum.Font.Arial;
			TextColor3 = guilibrary["THEMECOLORS"]["TEXT_COLOR"];
			Text = "   " .. options["Name"];
			Parent = Catergory;
			Size = udim2(1,1);
			TextSize = 15;
			TextXAlignment = Enum.TextXAlignment.Left
		}
		CatergoryContainer.ChildAdded:Connect(function(child)
			if child and child.Position then
				 child.Position+=udim2(0,0.13)
				 print(child.Name)
			end
		end)

		Catergory.InputBegan:Connect(function(input, gpe)
			if gpe then return end;
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				 if CATEGORY_CONFIG.ENABLED then
					tweenService:Create(Catergory, TweenInfo.new(1), {BackgroundColor3 = MainFrame.BackgroundColor3}):Play()
					tweenService:Create(CategoryTitle, TweenInfo.new(1), {TextColor3 = guilibrary["THEMECOLORS"]["TEXT_COLOR"]}):Play()
					 CATEGORY_CONFIG.ENABLED = false
				 else
					 tweenService:Create(Catergory, TweenInfo.new(1), {BackgroundColor3 = guilibrary["THEMECOLORS"]["BUTTON_COLOR"]}):Play()
					 tweenService:Create(CategoryTitle, TweenInfo.new(1), {TextColor3 = Color3.fromRGB()}):Play()
					 CATEGORY_CONFIG.ENABLED = true
				 end
			end
		end)
		
		return {
			CreateWindow = function(optionstable)
				local WINDOW_CONFIG = {
					VISIBLE = false
				}
				local window = instance{
					instance = "Frame";
					Parent = ScreenGui,
					BackgroundTransparency = 0.010,
					BackgroundColor3 = Color3.fromRGB(31, 31, 31),
					Size = scale(0.11, 0.455);
					Position = udim2(0.20, 0.100)
				}

				guiShadow(window)
				AddUICorner({parent = window, scale = guilibrary["Corners"]["Scaled"]})
				AddUIStroke({parent = window, color = guilibrary["Colors"]["WindowColor"]})
				local WindowTitle = instance{
					instance = "Frame",
					Parent = window,
					BackgroundColor3 = Color3.fromRGB(41, 41, 41),
					Size = udim2(1, 0.12),
					Position = udim2(0,0.010),
					BorderSizePixel = 0,
					BackgroundTransparency = 1;
				}
				local WindowTitleText = instance{
					instance = "TextLabel",
					Parent = WindowTitle,
					Text = " " .. optionstable.Name,
					TextSize = 20,
					TextColor3 = guilibrary["THEMECOLORS"]["TEXT_COLOR"],
					Font = Enum.Font.Arial;
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = udim2(0, 0.12),
					TextScaled = true,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = udim2(0.5, 0.5)

				}
				local WindowButtonContainer = instance{
					instance = "Frame",
					Parent = window,
					Size = udim2(1, 0.1),
					Position = udim2(0,0.1),
					BackgroundTransparency = 1,

				}

				dragUI(window)

				Catergory.InputBegan:Connect(function(input)
					    if input.UserInputType==Enum.UserInputType.MouseButton1 then
						        if WINDOW_CONFIG.VISIBLE then
									 window.Visible = false
									 WINDOW_CONFIG.VISIBLE = false
								else
									window.Visible = true
									 WINDOW_CONFIG.VISIBLE = true
								end
						end
				end)
				ScreenGui.ChildAdded:Connect(function(child)
					if child and child.Position then
						  child.Position += udim2(0.12)
					end
			     end)

				return {
					CreateButton = function(buttonsoptions)
						local BUTTON_CONFIG = {
							 ENABLED = true
						}
						local button = instance{
							instance = "TextButton",
							BackgroundTransparency = 0;
							BackgroundColor3 =  window.BackgroundColor3,
							Text = "",
							Parent = WindowButtonContainer,
							BorderSizePixel = 0,
							Position = udim2(0, 0),
							Name = buttonsoptions["Name"],
							Size = udim2(1,1)
						}
						local ButtonTitle = instance{
							instance = "TextLabel",
							BackgroundTransparency = 1,
							Parent = button,
							Size = udim2(1,1),
							TextXAlignment = Enum.TextXAlignment.Left,
							Font = Enum.Font.Arial,
							TextColor3 = guilibrary["THEMECOLORS"]["TEXT_COLOR"],
							TextSize = 13,
							Text = "   " ..  buttonsoptions.Name or "Label"
						}
						button.InputBegan:Connect(function(input, gpe)
							if gpe then return end;
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								 if BUTTON_CONFIG.ENABLED then
									 tweenService:Create(button, TweenInfo.new(1), {BackgroundColor3 = guilibrary["THEMECOLORS"]["BUTTON_COLOR"]}):Play()
									 tweenService:Create(ButtonTitle, TweenInfo.new(1), {TextColor3 = Color3.fromRGB()}):Play()
									 BUTTON_CONFIG.ENABLED = false
								 else
									tweenService:Create(button, TweenInfo.new(1), {BackgroundColor3 = window.BackgroundColor3}):Play()
									tweenService:Create(ButtonTitle, TweenInfo.new(1), {TextColor3 = guilibrary["THEMECOLORS"]["TEXT_COLOR"]}):Play()
									BUTTON_CONFIG.ENABLED = true
								 end
							end
						end)
                        if buttonsoptions.Function then
                            button.InputBegan:Connect(function(input, gpe)
                                if gpe then return end;
                                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                      if BUTTON_CONFIG.ENABLED then
										   buttonsoptions.Function(BUTTON_CONFIG.ENABLED)
									  end
                                end
                            end)
							WindowButtonContainer.ChildAdded:Connect(function(child)
								if child and child.Position then
									 child.Position+=udim2(0,1)
									 print(child.Name)
								end
							end)
                        end
					end
				}
			end
		}
	end
	if _G.reload then
		 _G.reload()
	end
	dragUI(MainFrame)
	return guilibrary
end

return loadQiex()
