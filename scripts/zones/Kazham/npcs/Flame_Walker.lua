-----------------------------------
-- Area: Kazham
--  NPC: Flame Walker
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Kazham/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(117);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

