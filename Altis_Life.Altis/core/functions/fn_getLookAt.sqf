/*
	Author : NiiRoZz

	Description : Check if the model looking at are the p3d defined before call script
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
