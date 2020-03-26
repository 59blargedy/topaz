-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Chaos Wyvern
-- KSNM: Eye of the Storm
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
end


function onMobEngaged(mob, target)
    mob:useMobAbility(815)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.REGAIN, 100)
end

function onMobDeath(mob, player, isKiller)
end
