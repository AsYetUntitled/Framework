/*
	Monitor ESC Menu,
	this file is temporary and will be rolled into a FSM later on.
*/
while {true} do
{
	waitUntil {!isNull (findDisplay 49)};
	((findDisplay 49) displayCtrl 2407) ctrlEnable false;
	((findDisplay 49) displayCtrl 122) ctrlEnable false;
	((findDisplay 49) displayCtrl 122) ctrlShow false;
	if(playerSide == civilian) then
	{
		if(!isNil {player getVariable "restrained"} && !isNil {player getVariable "Escorting"} && !isNil {player getVariable "transporting"}) then
		{
			if((player getVariable "restrained") || (player getVariable "Escorting") || (player getVariable "transporting") || (life_is_arrested) || life_istazed) then
			{
				[] spawn 
				{
					((findDisplay 49) displayCtrl 1010) ctrlEnable false;
					waitUntil {!alive player OR isNull (findDisplay 49) OR !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting") && !(life_is_arrested) && !(life_istazed)};
					((findDisplay 49) displayCtrl 1010) ctrlEnable true;
				};
			};

			if((player getVariable "restrained") || (player getVariable "Escorting") || (player getVariable "transporting") || (life_is_arrested) || life_istazed) then
			{
				[] spawn
				{
					((findDisplay 49) displayCtrl 104) ctrlEnable false;
					waitUntil {!alive player OR isNull (findDisplay 49) OR !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting") && !(life_is_arrested) && !(life_istazed)};
					((findDisplay 49) displayCtrl 104) ctrlEnable true;
				};
			};
		};
	};
	waitUntil {isNull (findDisplay 49)};
};