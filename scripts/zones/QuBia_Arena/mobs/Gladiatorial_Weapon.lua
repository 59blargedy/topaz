-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Gladiatorial Weapon
-- BCNM: Die by the Sword
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")

-----------------------------------
  


local resisttable= 
{
    [0]  = {tpz.mod.SLASHRES,  tpz.mod.H2HRES, tpz.mod.IMPACTRES, tpz.mod.PIERCERES},
	[13] = {tpz.mod.SLASHRES,  tpz.mod.H2HRES, tpz.mod.IMPACTRES},
	[14] = {tpz.mod.PIERCERES, tpz.mod.H2HRES, tpz.mod.IMPACTRES},
	[15] = {tpz.mod.SLASHRES,  tpz.mod.PIERCERES}, 
}

 
function onMobInitialize(mob)
    
    mob:addMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 15)

end

function onMobSpawn(mob)
local mobsub = mob:AnimationSub()
    local resists = resisttable[mobsub]
    
    for _, v in pairs(resists) do
        mob:setMod(v, 1000)
    end
	
end

function onMobFight(mob)
	--why this no worky? 
  	local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")

    if twohourTime == 0 then
        mob:setLocalVar("twohourTime",math.random(2,6))
    end

    if battletime >= twohourTime then
        mob:useMobAbility(307) --try setting this to something random to see if it's just substitute being messed up
       
        mob:setLocalVar("twohourTime",battletime + math.random(4,8))
    end
end

function changeForm(mob)
    --set variable for removing resists
	 local removeresists = resisttable[0]
	 --assign new animation sub
    local newform = math.random(13,15)
    while newform == mob:AnimationSub() do
        newform = math.random(13, 15)
    end
    local resists = resisttable[newform]
    
    for _, v in pairs(removeresists) do -- remove old resists
        mob:setMod(v, 0)
    end
    
    for _, v in pairs(resists) do -- set new resists
        mob:setMod(v, 1000)
    end
    mob:AnimationSub(newform) -- set animation
	
end

function onMobWeaponSkill(target,mob,skill)
	mob:timer(5000,function(mob)
		if mob:isAlive() then
			changeForm(mob)
		end
	end)
end


function onMobDeath(mob, player, isKiller)
end
