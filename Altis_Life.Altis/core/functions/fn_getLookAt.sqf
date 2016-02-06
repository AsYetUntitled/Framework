/*
	File : fn_getLookAt.sqf
	Author: NiiRoZz
	Description:
	Check if object are in function lineIntersectsWith

	Parameter(s):
	0: OBJECT - Object.p3d

	Returns:
	OBJECT - Return the object

	Example
	//--- Find if unit look at crate
	_CrateModelNames = M_CONFIG(getArray,"CfgInteractionModels","Crate","models");
	_crate = _CrateModelNames call life_fnc_getLookAt;
*/

private["_modelNames","_foundObject","_objects","_object","_objectClassName"];
_modelNames = _this;
_foundObject = objNull;
_objects = lineIntersectsWith [eyePos player, ATLtoASL (player modelToWorld [0, 5, 0]), player, objNull, true];
{
	_object = _x;
	_objectClassName = str(_object);
	{
		if ((_objectClassName find _x) != -1) exitWith
		{
			_foundObject = _object;
		};
	}
	forEach _modelNames;
	if (!isNull _foundObject) exitWith {};
}
forEach _objects;
_foundObject
