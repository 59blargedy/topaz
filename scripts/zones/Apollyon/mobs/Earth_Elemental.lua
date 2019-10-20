-----------------------------------
-- Area: Apollyon SW
--  Mob: Earth Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+2):updateEnmity(target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+10):updateEnmity(target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+18):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if tpz.limbus.elementalsDead() then
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[4]):setStatus(tpz.status.NORMAL)
        end
    end
end
