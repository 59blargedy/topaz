---------------------------------------------
-- Substitute
--
-- Used by Gladiatorial Weapons in BCNM 30 Die by the Sword
-- Type: Special
-- Utsusemi/Blink absorb: N/A
-- Range: MobParty
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:setMod(tpz.mod.PIERCERES,0)
    mob:setMod(tpz.mod.SLASHRES,0)
    mob:setMod(tpz.mod.IMPACTRES,0)
    mob:setMod(tpz.mod.H2HRES,0)
   	skill:setMsg(tpz.msg.basic.NONE) 

end
