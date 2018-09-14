/*
    File: fn_corpse.sqf
    Author: DomT602

    Description:
    Manipulates the server_corpses variable
*/
params [
    ["_uid","",[""]],
    ["_corpse",objNull,[objNull]]
];

if !(isNull _corpse) then {
    server_corpses pushBack [_uid,_corpse]
} else {
    private _index = server_corpses findIf {(_x select 0) isEqualTo _uid};
    if !(_index isEqualTo -1) then {
        server_corpses deleteAt _index
    };
};