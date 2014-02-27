private["_strTwo","_array","_strOne"];
_array = _this select 0;
_strTwo = "";

//http://forums.bistudio.com/showthread.php?134321-Best-way-to-check-if-a-parameter-is-a-variable-or-an-array&p=2149309&viewfull=1#post2149309
if (typeName _array == "ARRAY") then
{
	for "_i" from 0 to (count _array) -1 do
	{
		if (_i == ((count _array) -1)) then
		{
			_strOne = format ["%1", _array select _i];
			_strTwo = _strTwo + _strOne;
		}else 
		{
			_strOne = format ["%1`", _array select _i];
			_strTwo = _strTwo + _strOne;
		};
	};
} else {
	_strTwo = _array;
};

_strTwo