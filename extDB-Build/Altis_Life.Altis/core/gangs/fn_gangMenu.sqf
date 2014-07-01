/*
	File: fn_gangMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks whether it needs to open the gang management menu or the choice menu.
*/
if(!isNull life_my_gang) then
{
	createDialog "Life_My_Gang_Diag";
}
	else
{
	createDialog "Life_Gang_Prompt";
};