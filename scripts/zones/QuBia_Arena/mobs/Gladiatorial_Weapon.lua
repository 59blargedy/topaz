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
    [0]  = 
    {mods = 
    {{tpz.mod.SLASHRES, 0}, 
    {tpz.mod.H2HRES, 0}, 
    {tpz.mod.IMPACTRES, 0},
    {tpz.mod.PIERCERES, 0}}
    }  ,
	[13] = 
    {mods = {{tpz.mod.SLASHRES, 1000},  {tpz.mod.H2HRES, 1000}, {tpz.mod.IMPACTRES, 1000}}
    },
	[14] = 
    {mods ={{tpz.mod.PIERCERES, 1000}, {tpz.mod.H2HRES,1000}, {tpz.mod.IMPACTRES,1000}}
    },
	[15] = 
    {mods ={{tpz.mod.SLASHRES, 1000}, {tpz.mod.PIERCERES,1000}} 
    }
}
 
function onMobInitialize(mob)
    
    mob:addMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 15)

end

function onMobSpawn(mob)
local mobsub = mob:AnimationSub()
    local resists = resisttable[mobsub]
    
    for i =1, #resists.mods, 2  do
        mob:setMod(resists.mods[i],resists.mods[i + 1])
    end
end

function onMobFight(mob)
	--why this no worky? 
  	local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")

    if twohourTime == 0 then
        mob:setLocalVar("twohourTime",math.random(100,160))
    end
    print (twohourTime)

    if battletime >= twohourTime then
        mob:useMobAbility(307) --try setting this to something random to see if it's just substitute being messed up
       
        mob:setLocalVar("twohourTime",battletime + math.random(200,260))
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
    
    for  i =1, #removeresists.mods, 2  do -- remove old resists
        mob:setMod(resists.mods[i],resists.mods[i + 1])

    end
    
    for i =1, #resists.mods, 2  do
        mob:setMod(resists.mods[i],resists.mods[i + 1])
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
