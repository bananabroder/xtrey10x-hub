if game.PlaceId == 4042427666 then
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/SlimLegoHacks/Scripts/main/Gui')))() -- It's obfuscated, I won't let you see my ugly coding skills. =)
local ulib = library.new("Xtrey10x Hub - FottBall Fusion", 5013109572)
    
local page = ulib:addPage("Main", 5012544693)
    
local section1 = page:addSection("Main")


local player = game.Players.LocalPlayer
local rs = game:GetService("RunService")

function magBall(ball)
   if ball and player.Character then
       firetouchinterest(player.Character["Left Arm"], ball, 0)
       firetouchinterest(player.Character["Right Arm"], ball, 0)
       task.wait()
       firetouchinterest(player.Character["Left Arm"], ball, 1)
       firetouchinterest(player.Character["Right Arm"], ball, 1)
   end
end
section1:addTextbox("Make Sure to DIsable Your Mags If your a Qb", nil, function()end)
section1:addToggle("Mags", nil, function(bool)
    shared.Mags = bool
    rs.Stepped:Connect(function()
    if shared.Mags and not game:GetService("ReplicatedStorage").Values.HomeQB.Value:match(player.Name) and not game:GetService("ReplicatedStorage").Values.AwayQB.Value:match(player.Name) then
       for i,v in pairs(workspace:GetChildren()) do
           if v.Name == "Football" and v:IsA("BasePart") then
               wait()
               local mag = (player.Character.Torso.Position - v.Position).Magnitude
               magBall(v)
               print('Magz On! :)')
           end
        end
    else
        wait()
        print('Magz Off :(')
    end
    if shared.Mags and game:GetService("ReplicatedStorage").Values.HomeQB.Value:match(player.Name) or game:GetService("ReplicatedStorage").Values.AwayQB.Value:match(player.Name) then
        print('Magz Auto-Disabled as QB')
    end
end)
end)
end

