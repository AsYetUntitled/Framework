/*
    File: fn_numberText.sqf

    Description:
    Convert a number into string (avoiding scientific notation) with comma formatting

    Parameter(s):
    _this: NUMBER

    Returns:
    STRING
*/
params [["_number",0,[0]]]; 

private _numberText = _number toFixed 6;
private _num = (count _numberText);

if (_numberText select [(_num-7),7] isEqualTo ".000000") then {
	_numberText = _numberText select[0,(_num-7)];
	_num = (count _numberText);
};

if (_number > 1) then {
	for "_index" from (_num - 3) to 1 step -3 do { 
		_numberText = (_numberText select [0, _index]) + "," + (_numberText select [_index]); 
		_num = _num + 1; 
	};
};

_numberText;
