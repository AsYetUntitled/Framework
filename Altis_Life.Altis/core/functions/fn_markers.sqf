/*
    File: fn_markers.sqf
    Author: Fresqo
    Description: sorts markers like house raids and something else i cant remember right now
    Usage (RETURNS):
    
        ARRAY
        0 - NUMBER (for switch if required)
        1 - ARRAY (info to use for marker)
        
        SECOND ARRAY RETURNS
        0 - OBJECT/PLAYER (object to be marked etc) DO NOT USE PLAYER UNLESS MODIFYING DUE TO ADMIN MARKER REMOVALS ETC
        1 - NUMBER (time in seconds marker up)
        2 - STRING (marker type)
        3 - STRING (txt to display)
        4 - STRING (Color)
            
        TODO
        - marker style and size etc
*/

params [
    ["_switch",0,[0]],
    ["_arr",[],[[]]]
];

_arr params [
    ["_obj",objNull,[objNull]],
    ["_time",60,[60]],
    ["_type","Mil_dot",["Mil_dot"]],
    ["_txt","ROBBERY IN PROGRESS",["ROBBERY IN PROGRESS"]],
    ["_color","ColorRed",["ColorRed"]]
];

if (isNull _obj) exitWith {};
private _pos = getPos _obj;

private _marker = createMarkerLocal [format["%1_marker",_obj],_pos];
_marker setMarkerColorLocal _color;
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal format["%1",_txt];

sleep _time;

deleteMarkerLocal _marker;
