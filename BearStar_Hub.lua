
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Criar a Janela da Interface
local Window = Rayfield:CreateWindow({
	Name = "Bear* Hub",
	LoadingTitle = "Welcome!",
	LoadingSubtitle = "by CookieKondo",
	ConfigurationSaving = {
		Enabled = false
	},
	KeySystem = false,
})

-- Função para acionar eventos em ReplicatedStorage.Events
local function triggerReplicatedEvent(eventName, label)
	local replicatedStorage = game:GetService("ReplicatedStorage")
	local eventsFolder = replicatedStorage:FindFirstChild("Events")
	if eventsFolder and eventsFolder:FindFirstChild(eventName) then
		eventsFolder[eventName]:FireServer()
		Rayfield:Notify({
			Title = "Sucesso",
			Content = label .. " ativado!",
			Duration = 4,
		})
	else
		Rayfield:Notify({
			Title = "Erro",
			Content = "Evento '" .. eventName .. "' não encontrado.",
			Duration = 4,
		})
	end
end

-- Função para resgatar códigos (corrigida para Redeem_Code)
local function redeemAllCodes()
	local codes = {
		"SKEGGHUNT",
		"LUCKYME",
		"PIDAY",
		"EATING",
		"ROBMAXXING",
		"WHIP",
		"NONONO",
		"3RDYEAR",
		"CIRCUSARRIVAL",
		"4JULY",
		"TRILOGY3"
	}

	local replicatedStorage = game:GetService("ReplicatedStorage")
	local functionsFolder = replicatedStorage:FindFirstChild("Functions")

	if functionsFolder and functionsFolder:FindFirstChild("Redeem_Code") then
		for _, code in ipairs(codes) do
			functionsFolder.Redeem_Code:InvokeServer(code)
		end
		Rayfield:Notify({
			Title = "Sucesso",
			Content = "Todos os códigos foram resgatados!",
			Duration = 4,
		})
	else
		Rayfield:Notify({
			Title = "Erro",
			Content = "Função 'Redeem_Code' não encontrada.",
			Duration = 4,
		})
	end
end

----------------------------------------------------------------
-- Aba: Main
----------------------------------------------------------------
local Tab_Main = Window:CreateTab("Main", 4483362458)
local Section_Bear = Tab_Main:CreateSection("Bear")

Tab_Main:CreateButton({
	Name = "Bear 2x",
	Callback = function()
		triggerReplicatedEvent("Toggle_x2Bear", "Bear 2x")
	end,
})

----------------------------------------------------------------
-- Aba: ALTs
----------------------------------------------------------------
local Tab_ALTs = Window:CreateTab("ALTs", 4483362458)
local Section_Plus = Tab_ALTs:CreateSection("Plushies")

Tab_ALTs:CreateButton({
	Name = "Unlock Bob Plush",
	Callback = function()
		triggerReplicatedEvent("unlockBobPlush", "Bob Plush")
	end,
})

Tab_ALTs:CreateButton({
	Name = "Unlock David",
	Callback = function()
		triggerReplicatedEvent("unlockDavid", "David")
	end,
})

----------------------------------------------------------------
-- Aba: Escape
----------------------------------------------------------------
local Tab_Escape = Window:CreateTab("Escape", 4483362458)
local Section_Escape = Tab_Escape:CreateSection("Escape from Map")

Tab_Escape:CreateButton({
	Name = "Escape",
	Callback = function()
		triggerReplicatedEvent("EscapeActivate", "Escape")
	end,
})

----------------------------------------------------------------
-- Aba: Codes
----------------------------------------------------------------
local Tab_Codes = Window:CreateTab("Codes", 4483362458)
local Section_Codes = Tab_Codes:CreateSection("Redeem All")

Tab_Codes:CreateButton({
	Name = "Redeem All Codes",
	Callback = function()
		redeemAllCodes()
	end,
})