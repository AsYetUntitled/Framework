private ["_object","_score"];
_object = [_this,0,objnull,[objnull]] call bis_fnc_param;
_score = [_this,1,0,[0]] call bis_fnc_param;

_object addscore _score;
_score