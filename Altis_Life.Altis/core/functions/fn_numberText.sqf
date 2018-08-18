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
 
private _numberText = _number toFixed 0; 
private _num = (count _numberText); 

for "_index" from (_num - 3) to 1 step -3 do { 
     _numberText = (_numberText select [0, _index]) + "," + (_numberText select [_index]); 
     _num = _num + 1; 
}; 

_numberText;
