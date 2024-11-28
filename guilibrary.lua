local CollectionService = game:GetService("CollectionService")
local tweenService = game:GetService("TweenService");
local starterGui = game:GetService("StarterGui");
local coreGui = game:GetService("CoreGui");
local UserInputService = game:GetService("UserInputService");

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
	}
}

local function loadQiex()
	local studio = false
	local ScreenGui

	local function scale(x, y)
		return UDim2.new(x * guilibrary["Scale"]["Factor"], 0, y *guilibrary["Scale"]["Factor"], 0);
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
		return instance({instance = "UIStroke",Parent = Properties.parent, Color = Properties.color})
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
		TextColor3 = Color3.fromRGB(227, 227, 227);
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
		MainFrame:Destroy()
	end


	function guilibrary.CreateCategory(options)
		local Catergory = instance{
			instance = "TextButton";
			Parent = CatergoryContainer;
			BackgroundTransparency = 0;
			BackgroundColor3 = Color3.fromRGB(44, 44, 44);
			Size = udim2(1, 0.13);
			BorderSizePixel = 0;
			Position = udim2(0, 0.010);
			Text = "";
		}
		local CategoryTitle = instance{
			instance = "TextLabel";
			Name = "CategoryTitle";
			BackgroundTransparency = 1;
			Font = Enum.Font.Arial;
			TextColor3 = Color3.fromRGB(227, 227, 227);
			Text = options["Name"];
			Parent = Catergory;
			Size = udim2(1,1);
			TextSize = 15;
		}
		CatergoryContainer.ChildAdded:Connect(function(child)
			if child and child.Position then
				child.Position+=udim2(0,0.13)
			end
		end)
		return {
			CreateWindow = function(optionstable)
				local window = instance{
					instance = "Frame";
					Parent = MainFrame,
					BackgroundTransparency = 0.010,
					BackgroundColor3 = Color3.fromRGB(31, 31, 31),
					Size = scale(1,0.95),
					Position = udim2(0.20, 0.100)
				}
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
					Text = "     ".. optionstable.Name,
					TextSize = 14;
					TextColor3 = Color3.fromRGB(215, 215, 215),
					Font = Enum.Font.Arial;
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = udim2(1,1),
					TextXAlignment = Enum.TextXAlignment.Left
				}
				local WindowButtonContainer = instance{
					instance = "Frame",
					Parent = window,
					Size = scale(1, 0.30),
					Position = udim2(0,0.050),
					BackgroundTransparency = 1
				}

				WindowButtonContainer.ChildAdded:Connect(function(child)
					if child and child.Position then
						child.Position+=udim2(0,0.13)
					end
				end)

				dragUI(window)

				return {
					CreateButton = function(buttonsoptions)
						local button = instance{
							instance = "TextButton",
							BackgroundTransparency = 0;
							BackgroundColor3 = window.BackgroundColor3,
							Text = "",
							Size = udim2(1,0.45),
							Parent = WindowButtonContainer,
							BorderSizePixel = 0,
							Position = udim2(0, 0.20)
						}
						local ButtonTitle = instance{
							instance = "TextLabel",
							BackgroundTransparency = 1,
							Parent = button,
							Size = udim2(1,1),
							TextXAlignment = Enum.TextXAlignment.Left,
							Font = Enum.Font.Arial,
							TextColor3 = Color3.fromRGB(227, 228, 230),
							TextSize = 13,
							Text ="   " ..  buttonsoptions.Name or "Label"
						}
                        if buttonsoptions.Function then
                            button.InputBegan:Connect(function(input, gpe)
                                if gpe then return end;
                                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                     buttonsoptions.Function()
                                end
                            end)
                        end
					end
				}
			end,

			OnClick = function(func)
				Catergory.InputBegan:Connect(function(input, gpe)
					if gpe then return end;
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						func()
					end
				end)
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
