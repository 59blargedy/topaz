-----------------------------------
-- Ability: Tomahawk
-- Expends a throwing tomahawk to inflict a special defense down effect on an enemy. 
-- Obtained: Warrior Level 75
-- Recast Time: 0:03:00
-- Duration: 0:00:30 (+0:00:15 for each merit, cap is 0:01:30)
-- Effect: reduces physical and magical mob resistances by 25% of the resistance value
-- Range: _____ yalms
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local id = player:getEquipID(tpz.slot.AMMO)
    if (id == 18258) then
        return 0,0
    else
        return tpz.msg.basic.UNABLE_TO_USE_JA,0
    end
end

function onUseAbility(player,target,ability)
    local typeEffect = --need to mob:setmobMod resistance -25% of existing resistance here
    local duration = 15 + player:getMerit(tpz.merit.TOMAHAWK) -- This will return 30 sec at one investment because merit power is 15.

    --if (target:addStatusEffect(typeEffect,20,0,duration) == false) then
        --ability:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    --end

    target:updateClaim(player)
    player:removeAmmo()
    return typeEffect
end
