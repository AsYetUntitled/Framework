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
private _num = (_numberText find ".");

if (_number > 1) then {
	_numberText = _numberText select [0,_num]
} else {
	private _end = (count _numberText);
	private _decRound = false;
	
	for "_i" from (_end - 1) to _num step -1 do {
		if !_decRound then {
			if ((_numberText select [_i,1]) in ["0","."]) then {
				_numberText = _numberText select [0,_i];
			} else {
				_decRound = true;
			};
		};
	};
};

if (_number > 1) then {
	for "_index" from (_num - 3) to 1 step -3 do { 
		_numberText = (_numberText select [0, _index]) + "," + (_numberText select [_index]); 
		_num = _num + 1; 
	};
};

_numberText;
