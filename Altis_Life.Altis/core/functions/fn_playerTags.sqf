/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
onEachFrame
{
    private["_vis","_pos","_near"];
    _near = getPos player nearEntities ["Man",10];
    {
        if(player distance _x < 10 && isPlayer _x && _x != player) then
        {
            _vis = lineIntersects [eyePos player, eyePos _x,player, _x];
            if(!_vis) then
            {
                _pos = visiblePosition _x;
                _pos set[2,(getPosATL _x select 2) + 2.2];
                drawIcon3D ["",[1,1,1,1],_pos,0,0,0,name _x,0,0.04];
            };
        };
    } foreach _near;
};