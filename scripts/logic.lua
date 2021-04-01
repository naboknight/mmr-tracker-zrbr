function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count == amount
  end
end

function has_explosives()
  local bombs = Tracker:ProviderCountForCode("bombs")
  if bombs > 0 then
    return bombs
  elseif has("blastmask") then
    return 1
  elseif has("bombchu") then
    return 1, AccessibilityLevel.SequenceBreak
  elseif (has("powderkeg") and has("goron")) then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function can_break_rocks()
  if has("goronmask")
  then
    return 1
  else
    return has_explosives()
  end
end

function can_break_snowballs()
  if (has("bow") and has("firearrows"))
  then
    return 1
  else
    return can_break_rocks()
  end
end

function can_deal_damage()
  if has("sword1")
  or has("sticks")
  or has("bow")
  or has("fairysword")
  or has("goronmask")
  or has("zoramask")
  or has("fiercedeity")
  then
    return 1
  elseif (has("dekumask") and has("magic")) then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return has_explosives(), AccessibilityLevel.SequenceBreak
  end
end

function has_projectile()
   if has("hookshot")
   or has("bow")
   or has("zoramask")
   or (has("dekumask") and has("magic"))
  then
    return 1
  else
    return 0
  end
end

function can_see_with_lens()
   if has("lens") 
  and has("magic") then
    return 1
  else
    return 1, AccessibilityLevel.SequenceBreak
  end
end

function can_grow_magic_plant()
  if (has("bottlesanity_no")  and has("beans") and has("bottle"))
  or (has("bottlesanity_no") and has("deku") and has("storm"))
  or (has("bottlesanity_no") and has("deku") and has("water"))
  or (has("bottlesanity_yes") and has("beans") and has("hotspringwater"))
  or (has("beans") and has("storm") and has(ocarina))
  then
    return 1
  else
    return 0
  end
end

function can_bottle_hotspringwater()
  if (has("bottlesanity_no") and has("bottle") and has("goron"))
  then
	return can_see_with_lens()
  elseif (has("bottlesanity_yes") and has("hotspringwater"))
  then
	return 1
  else
	return 0
  end
end

function can_LA()
   if has("magic")
  and has("bow")
  and has("lightarrows")
  then
    return 1
  else
    return 0
  end
end

function has_fire()
   if has("magic")
  and has("bow")
  and has("firearrows")
  then
    return 1
  else
    return 0
  end
end

function can_IA()
   if has("magic")
  and has("bow")
  and has("icearrows")
  then
    return 1
  else
    return 0
  end
end

function tracker_on_accessibility_updated()
    local swampmap1 = Tracker:FindObjectForCode("@Clock Town Tingle Maps/Map: Swamp")
    local swampmap2 = Tracker:FindObjectForCode("@Swamp Tingle Maps/Map: Swamp")
	
    local mountainmap1 = Tracker:FindObjectForCode("@Swamp Tingle Maps/Map: Mountain")
    local mountainmap2 = Tracker:FindObjectForCode("@Mountain Tingle Maps/Map: Mountain")
	
    local oceanmap1 = Tracker:FindObjectForCode("@Milk Road Tingle Maps/Map: Ocean")
    local oceanmap2 = Tracker:FindObjectForCode("@Ocean Tingle Maps/Map: Ocean")
	
    local canyonmap1 = Tracker:FindObjectForCode("@Ocean Tingle Maps/Map: Canyon")
    local canyonmap2 = Tracker:FindObjectForCode("@Ikana Canyon Tingle Maps/Map: Canyon")
	
    local ranchmap1 = Tracker:FindObjectForCode("@Mountain Tingle Maps/Map: Ranch")
    local ranchmap2 = Tracker:FindObjectForCode("@Milk Road Tingle Maps/Map: Ranch")
	
    local townmap1 = Tracker:FindObjectForCode("@Clock Town Tingle Maps/Map: Clock Town")
    local townmap2 = Tracker:FindObjectForCode("@Ikana Canyon Tingle Maps/Map: Clock Town")
	
    local woodfall_oath = Tracker:FindObjectForCode("@Woodfall Temple/Oath to Order")
    local snowhead_oath = Tracker:FindObjectForCode("@Snowhead Temple/Oath to Order")
    local greatbay_oath = Tracker:FindObjectForCode("@Great Bay Temple/Oath to Order")
    local stonetower_oath = Tracker:FindObjectForCode("@Stone Tower Temple/Oath to Order")
	
    if swampmap1 and swampmap2 then
        if (swampmap1.AvailableChestCount == 0) or (swampmap2.AvailableChestCount == 0) then
            swampmap1.AvailableChestCount = 0
            swampmap2.AvailableChestCount = 0
        end
    end
	
	if mountainmap1 and mountainmap2 then
        if (mountainmap1.AvailableChestCount == 0) or (mountainmap2.AvailableChestCount == 0) then
            mountainmap1.AvailableChestCount = 0
            mountainmap2.AvailableChestCount = 0
        end
    end
	
    if oceanmap1 and oceanmap2 then
        if (oceanmap1.AvailableChestCount == 0) or (oceanmap2.AvailableChestCount == 0) then
            oceanmap1.AvailableChestCount = 0
            oceanmap2.AvailableChestCount = 0
        end
    end
	
    if canyonmap1 and canyonmap2 then
        if (canyonmap1.AvailableChestCount == 0) or (canyonmap2.AvailableChestCount == 0) then
            canyonmap1.AvailableChestCount = 0
            canyonmap2.AvailableChestCount = 0
        end
    end
	
    if ranchmap1 and ranchmap2 then
        if (ranchmap1.AvailableChestCount == 0) or (ranchmap2.AvailableChestCount == 0) then
            ranchmap1.AvailableChestCount = 0
            ranchmap2.AvailableChestCount = 0
        end
    end
	
    if townmap1 and townmap2 then
        if (townmap1.AvailableChestCount == 0) or (townmap2.AvailableChestCount == 0) then
            townmap1.AvailableChestCount = 0
            townmap2.AvailableChestCount = 0
        end
    end
	
    if woodfall_oath and snowhead_oath and greatbay_oath and stonetower_oath then
        if (woodfall_oath.AvailableChestCount == 0)
		or (snowhead_oath.AvailableChestCount == 0)
		or (greatbay_oath.AvailableChestCount == 0)
		or (stonetower_oath.AvailableChestCount == 0) then
            woodfall_oath.AvailableChestCount = 0
            snowhead_oath.AvailableChestCount = 0
            greatbay_oath.AvailableChestCount = 0
            stonetower_oath.AvailableChestCount = 0
        end
    end
	
end