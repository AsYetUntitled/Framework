switch (playerSide) do
{
	case west:
	{
		//Restrain Action
		life_actions = [player addAction["Restrain",life_fnc_restrainAction,cursorTarget,9999999,false,false,"",' 
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 ']];
		//Ticket Action
		life_actions = life_actions + [player addAction["Give Ticket",life_fnc_ticketAction,"",0,false,false,"",'
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && (cursorTarget getVariable "restrained") ']]; 
		//Escort
		life_actions = life_actions + [player addAction["Escort",life_fnc_escortAction,[cursorTarget],0,false,false,"",'
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && (cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escorting") ']]; 
		life_actions = life_actions + [player addAction["Put in Vehicle",life_fnc_putInCar,"",0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Car" && ((((position player) nearEntities [["Man"],5]) select 0) getVariable "Escorting")' ]];
		life_actions = life_actions + [player addAction["Put in Vehicle",life_fnc_putInCar,_unit,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Air"' ]];
		life_actions = life_actions + [player addAction["Put in Vehicle",life_fnc_putInCar,_unit,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Ship"' ]];
		life_actions = life_actions + [player addAction["Stop Escorting",life_fnc_stopEscorting,_unit,0,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && (cursorTarget getVariable "Escorting")']];
		//Impound Car
		life_actions = life_actions +
		[player addAction["Impound Vehicle",life_fnc_impoundAction,"",0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Car"' ]];
		//Impound Air
		life_actions = life_actions +
		[player addAction["Impound Vehicle",life_fnc_impoundAction,"",0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Air"' ]];
		//Impound Boat
		life_actions = life_actions +
		[player addAction["Impound Vehicle",life_fnc_impoundAction,"",0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Ship"' ]];
		//Unrest Action
		life_actions = life_actions + [player addAction["Unrestrain",life_fnc_unrestrain,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && (cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escorting") ']];
		//Send to jail
		life_actions = life_actions + [player addAction["Send to Jail",life_fnc_arrestAction,"",0,false,false,"",'
		!isNull cursorTarget && isPlayer cursorTarget && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained") && alive cursorTarget && (player distance cursorTarget < 3.5) && ((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR  (player distance (getMarkerPos "cop_spawn_5") < 30)) && !(cursorTarget getVariable "Escorting") ']];
		//Release Action
		
		//Search Action
		life_actions = life_actions + [player addAction["Search",life_fnc_searchAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && !(cursorTarget getVariable "Escorting") ']];
		//Pull out of car
		life_actions = life_actions + [player addAction["Pull out of vehicle",life_fnc_pulloutAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 4 && (count crew cursorTarget) > 0 && speed cursorTarget < 2 && cursorTarget isKindOF "Car"']];
		life_actions = life_actions + [player addAction["Pull out of vehicle",life_fnc_pulloutAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 4 && (count crew cursorTarget) > 0 && speed cursorTarget < 2 && cursorTarget isKindOf "Ship"']];
		life_actions = life_actions + [player addAction["Pull out of vehicle",life_fnc_pulloutAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 4 && (count crew cursorTarget) > 0 && speed cursorTarget < 2 && cursorTarget isKindOf "Air"']];
		//Search Vehicle
		
		life_actions = life_actions + [player addAction["Search Vehicle",life_fnc_searchVehAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && cursorTarget isKindOf "Car"']];
		life_actions = life_actions + [player addAction["Search Vehicle",life_fnc_searchVehAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && cursorTarget isKindOf "Air"']];
		life_actions = life_actions + [player addAction["Search Vehicle",life_fnc_searchVehAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && cursorTarget isKindOf "Ship" ']];
		
		life_actions = life_actions + [player addAction["Search Trunk",life_fnc_vehInvSearch,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Car"']];
		life_actions = life_actions + [player addAction["Search Trunk",life_fnc_vehInvSearch,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 10 && speed cursorTarget < 2 && cursorTarget isKindOf "Air"']];
		life_actions = life_actions + [player addAction["Search Trunk",life_fnc_vehInvSearch,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Ship" ']];
		
		//Pickup Deployed Spike strip
		life_actions = life_actions + [player addAction["Pack up Spike Strip",life_fnc_packupSpikes,"",0,false,false,"",
		' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
		life_actions = life_actions + [player addAction["Pickup Spike Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "spikeStrip" && (player distance cursorTarget) < 3 ']];
		//Lights?
		life_actions = life_actions + [player addAction["Siren Lights ON",{[[vehicle player,0.22],"life_fnc_copLights",true,false] spawn life_fnc_MP; vehicle player setVariable["lights",true,true];},"",0,false,false,"",' vehicle player != player && (typeOf vehicle player) == "C_Offroad_01_F" && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && !(vehicle player getVariable "lights") && sunOrMoon < 1']];
		life_actions = life_actions + [player addAction["Siren Lights OFF",{vehicle player setVariable["lights",false,true];},"",0,false,false,"", ' vehicle player != player && (typeOf vehicle player) == "C_Offroad_01_F" && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && (vehicle player getVariable "lights") ']];
		
	};
	
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Catch fish
		life_actions = [player addAction["Catch Fish",life_fnc_catchFish,"",0,false,false,"",'
		(surfaceIsWater (getPos player)) && count(nearestObjects[getPos player, ["Fish_Base_F"], 3]) > 0 ']];
		//Gather Heroin
		life_actions = life_actions + [player addAction["Gather Heroin",life_fnc_gatherHeroin,"",0,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "heroin_1") < 150) && (vehicle player == player) && (life_carryWeight + (["heroinu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		//Pick Apples, fields 1 and 2
		life_actions = life_actions + [player addAction["Pick Apples",life_fnc_gatherApples,"",0,false,false,"",'
		!life_action_in_use && ((player distance (getMarkerPos "apple_1") < 50) OR (player distance (getMarkerPos "apple_2") < 50)) && (vehicle player == player) ']];
		life_actions = life_actions + [player addAction["Pick Peaches",life_fnc_gatherPeaches,"",0,false,false,"",'
		!life_action_in_use && ((player distance (getMarkerPos "peaches_1") < 50) OR (player distance (getMarkerPos "peaches_2") < 50)) && (vehicle player == player) ']];
		life_actions = life_actions + [player addAction["Pick Peaches",life_fnc_gatherPeaches,"",0,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "peaches_3") < 50) && (vehicle player == player) ']];
		//Pick Apples, fields 3 and 4
		life_actions = life_actions + [player addAction["Pick Apples",life_fnc_gatherApples,"",0,false,false,"",'
		!life_action_in_use && ((player distance (getMarkerPos "apple_3") < 50) OR (player distance (getMarkerPos "apple_4") < 50)) && (vehicle player == player) ']];
		//Collect Oil
		life_actions = life_actions + [player addAction["Collect Oil",life_fnc_gatherOil,"",0,false,false,"",'
		!life_action_in_use && ((player distance (getMarkerPos "oil_field_1") < 40) OR (player distance (getMarkerPos "oil_field_2") < 20)) && (vehicle player == player) && (life_carryWeight + (["oilu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		//Grab turtle
		life_actions = life_actions + [player addAction["Grab Turtle",life_fnc_catchTurtle,"",0,false,false,"",'
		!isNull cursorTarget && (typeOf cursorTarget) == "Turtle_F" && ((player distance (getMarkerPos "turtle_1") < 200) OR (player distance (getMarkerPos "turtle_2") < 200) OR (player distance (getMarkerPos "turtle_3") < 200)) && !alive cursorTarget && (life_carryWeight + (["turtle"] call life_fnc_itemWeight)) <= life_maxWeight']];
		//Gather Cannabis
		life_actions = life_actions + [player addAction["Gather Cannabis",life_fnc_gatherCannabis,"",0,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "weed_1") < 60) && (vehicle player == player) && (life_carryWeight + (["cannabis"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		life_actions = life_actions + [player addAction["Gather Cocaine",life_fnc_gatherCocaine,"",0,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "cocaine_1") < 150) && (vehicle player == player) && (life_carryWeight + (["cocaine"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		//Suicide alahsnackbar
		life_actions = life_actions + [player addAction["Activate Suicide Vest",life_fnc_suicideBomb,"",0,false,false,"",' vest player == "V_HarnessOGL_brn" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
	};
};

life_actions = life_actions + [player addAction["Repair Vehicle ($500)",life_fnc_pumpRepair,"",999,false,false,"",
' vehicle player != player && (typeOf cursorTarget == "Land_fs_feed_F") && (vehicle player) distance cursorTarget < 6 ']];
life_actions = life_actions + [player addAction["Place Spike Strip",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = ObjNull;};},"",999,false,false,"",'!isNull life_spikestrip']];
//Use Chemlights in hand
life_actions = life_actions + [player addAction["Chemlight (RED) in Hand",life_fnc_chemlightUse,"red",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_red" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (YELLOW) in Hand",life_fnc_chemlightUse,"yellow",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_yellow" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (GREEN) in Hand",life_fnc_chemlightUse,"green",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_green" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (BLUE) in Hand",life_fnc_chemlightUse,"blue",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_blue" in (magazines player) && vehicle player == player ']];
//Drop Chemlight
life_actions = life_actions + [player addAction["Drop Chemlight",{if(isNil "life_chemlight") exitWith {};if(isNull life_chemlight) exitWith {};detach life_chemlight; life_chemlight = nil;},"",-1,false,false,"",'!isNil "life_chemlight" && !isNull life_chemlight && vehicle player == player ']];
//Custom Heal
life_actions = life_actions + [player addAction["<t color='#FF0000'>Heal Self</t>",life_fnc_heal,"",99,false,false,"",' vehicle player == player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
//Custom Repair
life_actions = life_actions + [player addAction["<t color='#FF0000'>Repair Vehicle</t>",life_fnc_repairTruck,"",99,false,false,"", ' vehicle player == player && !isNull cursorTarget && ((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) && (damage cursorTarget) > 0.01 && ("ToolKit" in (backpackitems player)) && (player distance cursorTarget < 4.5) ']];
//Service Truck Stuff
life_actions = life_actions + [player addAction["<t color='#0000FF'>Service Nearest Car</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "C_Offroad_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions = life_actions +
[player addAction["Push",life_fnc_pushVehicle,"",0,false,false,"",
'!isNull cursorTarget && player distance cursorTarget < 4.5 && cursorTarget isKindOf "Ship"']];
//Pickup Water
life_actions = life_actions + 
[player addAction["Pickup Water",life_fnc_pickupItem,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_BottlePlastic_V1_F" && ((cursorTarget getVariable "item") select 0) == "water" && (player distance cursorTarget) < 3 && (life_carryWeight + (["water"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Coffee
life_actions = life_actions + 
[player addAction["Pickup Coffee",life_fnc_pickupItem,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Can_V3_F" && ((cursorTarget getVariable "item") select 0) == "coffee" && (player distance cursorTarget) < 3 && (life_carryWeight + (["coffee"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Money
life_actions = life_actions +
[player addAction["Pickup Money",life_fnc_pickupMoney,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Money_F" && ((cursorTarget getVariable "item") select 0) == "money" && (player distance cursorTarget) < 3 ']];

//Pickup Unprocessed Oil
life_actions = life_actions +
[player addAction["Pickup Unprocessed Oil",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "oilu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["oilu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Processed Oil
life_actions = life_actions +
[player addAction["Pickup Processed Oil",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "oilp" && (player distance cursorTarget) < 3 && (life_carryWeight + (["oilp"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Unprocessed Heroin
life_actions = life_actions +
[player addAction["Pickup Unprocessed Heroin",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "heroinu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["heroinu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Processed Heroin
life_actions = life_actions +
[player addAction["Pickup Processed Heroin",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "heroinp" && (player distance cursorTarget) < 3 && (life_carryWeight + (["heroinp"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Cannabis
life_actions = life_actions +
[player addAction["Pickup Cannabis",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cannabis" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cannabis"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Marijjuana
life_actions = life_actions +
[player addAction["Pickup Marijuana",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "marijuana" && (player distance cursorTarget) < 3 && (life_carryWeight + (["marijuana"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Apple
life_actions = life_actions +
[player addAction["Pickup Apple",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "apple" && (player distance cursorTarget) < 3 && (life_carryWeight + (["apple"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Rabbit MEat
life_actions = life_actions +
[player addAction["Pickup Rabbit Meat",life_fnc_pickupItem,"rabbit",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "rabbit" && (player distance cursorTarget) < 3 && (life_carryWeight + (["rabbit"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup salema
life_actions = life_actions +
[player addAction["Pickup Salema Meat",life_fnc_pickupItem,"salema",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "salema" && (player distance cursorTarget) < 3 && (life_carryWeight + (["salema"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup ornate
life_actions = life_actions +
[player addAction["Pickup Ornate Meat",life_fnc_pickupItem,"ornate",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "ornate" && (player distance cursorTarget) < 3 && (life_carryWeight + (["ornate"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup mackerel
life_actions = life_actions +
[player addAction["Pickup Mackerel Meat",life_fnc_pickupItem,"mackerel",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "mackerel" && (player distance cursorTarget) < 3 && (life_carryWeight + (["mackerel"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup tuna
life_actions = life_actions +
[player addAction["Pickup Tuna Meat",life_fnc_pickupItem,"tuna",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "tuna" && (player distance cursorTarget) < 3 && (life_carryWeight + (["tuna"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup mullet
life_actions = life_actions +
[player addAction["Pickup Mullet Meat",life_fnc_pickupItem,"mullet",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "mullet" && (player distance cursorTarget) < 3 && (life_carryWeight + (["mullet"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup catshark
life_actions = life_actions +
[player addAction["Pickup Catshark Meat",life_fnc_pickupItem,"catshark",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "catshark" && (player distance cursorTarget) < 3 && (life_carryWeight + (["catshark"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup turtle
life_actions = life_actions +
[player addAction["Pickup Turtle Meat",life_fnc_pickupItem,"turtle",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "turtle" && (player distance cursorTarget) < 3 && (life_carryWeight + (["turtle"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup turtle soup
life_actions = life_actions +
[player addAction["Pickup Turtle Soup",life_fnc_pickupItem,"turtlesoup",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "turtlesoup" && (player distance cursorTarget) < 3 && (life_carryWeight + (["turtlesoup"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup donut
life_actions = life_actions +
[player addAction["Pickup Donut",life_fnc_pickupItem,"donuts",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "donuts" && (player distance cursorTarget) < 3 && (life_carryWeight + (["donuts"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Fishing Pole
life_actions = life_actions +
[player addAction["Pickup Fishing Pole",life_fnc_pickupItem,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "fishing" && (player distance cursorTarget) < 3 && (life_carryWeight + (["fishing"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Fuel Can
life_actions = life_actions +
[player addAction["Pickup Fuel Can",life_fnc_pickupItem,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget == "Land_CanisterFuel_F") && !isNil {(cursorTarget getVariable "item")} && (player distance cursorTarget) < 3 ']];
//Pickup Pickaxe
life_actions = life_actions +
[player addAction["Pickup Pickaxe",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "pickaxe" && (player distance cursorTarget) < 3 && (life_carryWeight + (["pickaxe"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup copper Ore
life_actions = life_actions +
[player addAction["Pickup Copper Ore",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "copperore" && (player distance cursorTarget) < 3 && (life_carryWeight + (["copperore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Iron Ore
life_actions = life_actions +
[player addAction["Pickup Iron Ore",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "ironore" && (player distance cursorTarget) < 3 && (life_carryWeight + (["ironore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Rock
life_actions = life_actions +
[player addAction["Pickup Rock(s)",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "rock" && (player distance cursorTarget) < 3 && (life_carryWeight + (["rock"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Cement
life_actions = life_actions +
[player addAction["Pickup Cement",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cement" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cement"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Refined Iron
life_actions = life_actions +
[player addAction["Pickup Refined Iron",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "iron_r" && (player distance cursorTarget) < 3 && (life_carryWeight + (["iron_r"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Refined copper
life_actions = life_actions +
[player addAction["Pickup Refined Copper",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "copper_r" && (player distance cursorTarget) < 3 && (life_carryWeight + (["copper_r"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Salt
life_actions = life_actions +
[player addAction["Pickup Salt",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "salt" && (player distance cursorTarget) < 3 && (life_carryWeight + (["salt"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Sand",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "sand" && (player distance cursorTarget) < 3 && (life_carryWeight + (["sand"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Glass",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "glass" && (player distance cursorTarget) < 3 && (life_carryWeight + (["glass"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Lockpick",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "lockpick" && (player distance cursorTarget) < 3 && (life_carryWeight + (["lockpick"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Peach",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "peach" && (player distance cursorTarget) < 3 && (life_carryWeight + (["peach"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Redgull",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Can_V3_F" && ((cursorTarget getVariable "item") select 0) == "redgull" && (player distance cursorTarget) < 3 && (life_carryWeight + (["redgull"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Tactical Bacon",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_TacticalBacon_F" && ((cursorTarget getVariable "item") select 0) == "tbacon" && (player distance cursorTarget) < 3 && (life_carryWeight + (["tbacon"] call life_fnc_itemWeight)) <= life_maxWeight ']];

life_actions = life_actions +
[player addAction["Pickup Diamond Uncut",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "diamond" && (player distance cursorTarget) < 3 && (life_carryWeight + (["diamond"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Diamond Cut",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "diamondc" && (player distance cursorTarget) < 3 && (life_carryWeight + (["diamondc"] call life_fnc_itemWeight)) <= life_maxWeight ']];
[player addAction["Pickup Unprocessed Cocaine",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cocaine" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cocaine"] call life_fnc_itemWeight)) <= life_maxWeight ']];
[player addAction["Pickup Processed Cocaine",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cocainep" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cocainep"] call life_fnc_itemWeight)) <= life_maxWeight ']];