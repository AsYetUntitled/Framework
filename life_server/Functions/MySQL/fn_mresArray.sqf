/*
    File: fn_mresArray.sqf
    Author: Bryan "Tonic" Boardwine";

    Description:
    Acts as a mres (MySQL Real Escape) for arrays so they
    can be properly inserted into the database without causing
    any problems. The return method is 'hacky' but it's effective.
*/
private ["_array"];
_array = [_this,0,[],[[]]] call BIS_fnc_param;
_array = str _array;
_array = toArray(_array);

for "_i" from 0 to (count _array)-1 do
{
    _sel = _array select _i;
    if (!(_i isEqualTo 0) && !(_i isEqualTo ((count _array)-1))) then
    {
        if (_sel isEqualTo 34) then
        {
            _array set[_i,96];
        };
    };
};

str(toString(_array));
