-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Radiant Wyvern
-- KSNM: Eye of the Storm
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------
function onMobFight(mob, target)
    mob:useMobAbility(815)
end

function onMobDeath(mob, player, isKiller)
end
