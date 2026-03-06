-- КОНФІГУРАЦІЯ
local config = {
    ["server-1"] = "true",  -- Зміни на "false" і батник навіть не відкриє гру
    ["server-2"] = "true"
}

-- АВТОМАТИЧНИЙ СПАВН (SOLO PLAY)
if config["server-1"] == "true" then
    print("--- АВТОЗАПУСК SOLO ---")
    game:GetService("RunService"):Run()
    local p = game:GetService("Players"):CreateLocalPlayer(0)
    
    -- Рандом скін
    p.CharacterAdded:connect(function(c)
        wait(0.1)
        local col = c:FindFirstChild("Body Colors") or Instance.new("Body Colors", c)
        local pal = {1, 2, 5, 21, 24, 26, 37, 194}
        local function r() return BrickColor.new(pal[math.random(1, #pal)]) end
        col.HeadColor, col.TorsoColor = r(), r()
        col.LeftArmColor, col.RightArmColor = r(), r()
        col.LeftLegColor, col.RightLegColor = r(), r()
    end)
    
    p:LoadCharacter()
    print("Гравця заспавнено автоматично!")
end
