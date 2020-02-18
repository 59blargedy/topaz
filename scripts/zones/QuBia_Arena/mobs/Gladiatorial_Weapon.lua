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
	[13] = {tpz.mod.SLASHRES,100 and tpz.mod.IMPACTRES,100},
	[14] = {tpz.mod.PIERCERES,100 and tpz.mod.IMPACTRES,100},
	[15] = {tpz.mod.SLASHRES,100 and tpz.mod.PIERCERES,100}	
}

function onMobInitialize(mob)
    mob:addMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 15)
   -- mob:getAnimationSub()
  --  mob:setmod(unpack(resisttable[mob:getAnimationSub()]))

end

function onMobWeaponskill(target,mob,skill)
mob:setAnimationSub(math.random(13,15))
--mob:setmod(tpz.mod.PIERCERES, 0)
--mob:setmod(tpz.mod.SLASHRES,0)
--mob:setmod(tpz.mod.IMPACTRES, 0)
--mob:setmod(unpack(resisttable[mob:getAnimationSub()]))
	

end

function onMobDeath(mob, player, isKiller)
end
