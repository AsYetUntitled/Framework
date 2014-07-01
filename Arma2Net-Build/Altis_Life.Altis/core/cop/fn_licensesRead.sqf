/*
	File: fn_licensesRead.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Outprints the licenses.
*/
private["_licenses","_civ"];
_civ = [_this,0,"",[""]] call BIS_fnc_param;
_licenses = [_this,1,"No Licenses</br>",[""]] call BIS_fnc_param;

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>Licenses:</t></t><br/>%2",_civ,_licenses];