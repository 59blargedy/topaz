---------------------------------------------------
-- Whispers of Ire
-- drains random 2-5 status effects. absorbed by shadows
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)

	   return 0
end

function onMobWeaponSkill(target, mob, skill)


 
local number = math.random (2,5)

local t = {}

while table.getn(t) < number do
	local randomnum =  GetMathRandomExclude(136,142,t)--136 through 142 are the absorb stat effects
  	table.insert(t,randomnum)
 
end
	for i, v in ipairs(t) do
  		target:MobDrainAttribute(mob, target, v, 10, 3, 70)--need to set last three somehow
	end
	skill:setMsg(tpz.msg.basic.MULT_ATTR_DRAINED)
	
end

function GetMathRandomExclude(lowerbound,upperbound,exclude)
    local x = math.random(lowerbound, upperbound)
    for _,v in pairs(exclude) do
      if v == x then
        return GetMathRandomExclude(lowerbound,upperbound,exclude)
      end
    end
            return x
  end


