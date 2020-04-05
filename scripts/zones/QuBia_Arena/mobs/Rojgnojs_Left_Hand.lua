-----------------------------------
-- Area: QuBia_Arena
--  Mob: Rojgnoj's Left Hand
-- Mission 9-2 SANDO
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
local ID = require("scripts/zones/QuBia_Arena/IDs")

function allHeirMobsDead(mob)
    local battlefield = mob:getBattlefield()
    local inst = battlefield:getArea()
    local instOffset = ID.mob.HEIR_TO_THE_LIGHT_OFFSET + (14 * (inst-1))
    for i = instOffset + 3, instOffset + 13 do
        if not GetMobByID(i):isDead() then
            return false
        end
    end
    return true
end

function onMobInitialize(mob)
    mob:addMod(tpz.mod.SLEEPRES,50)
end

function onMobSpawn(mob)
    local battlefield = mob:getBattlefield()
    if allHeirMobsDead(mob) then
       battlefield:setLocalVar("phaseChange", 0)
    end
end

function onMobDeath(mob, player, isKiller)
end
