-- sick qwerShyv.lua
-- super slow combo
-- will boost you to bronze5
-- auto surrender
-- run it down mid
-- exclusive no jungle clear

local shyvE = {delay = .250, speed = 1800, width = 70, range = 950}

local sickMenu = Menu("qwerShyv", "qwerShyv")
      sickMenu:Key("combo", "Just do it", string.byte(" "))
      
OnProcessSpellComplete(function(unit,spell)
  if sickMenu.combo:Value() == true and unit == myHero and spell.name:lower():find("attack") and GetObjectType(spell.target) == Obj_AI_Hero then
    if CanUseSpell(myHero,0) == READY then
      CastSpell(0)
      DelayAction(function()
        AttackUnit(spell.target)
     end, 0.05)
    end
  end
end)

OnTick(function(myHero)
  if sickMenu.combo:Value() then
    local target = GetCurrentTarget()
    local myHitBox = GetHitBox(myHero)
    if GetDistance(target) < 1000+myHitBox then
      if CanUseSpell(myHero,1) == READY then
        if (ValidTarget(target,400+myHitBox) and GetMoveSpeed(target) < GetMoveSpeed(myHero)*(0.25+0.05*GetCastLevel(myHero,0))) or (ValidTarget(target,162.5+myHitBox)) then
      	  CastSpell(1)
        end
      end
      if CanUseSpell(myHero,2 == READY and ValidTarget(target,600) then
      	local ePred = GetPrediction(target,shyvE)
      	if ePred.hitChance >= 0.4 then
      	  -- im the witch doctor
      		
      	end
      end
    end
  end
end)
