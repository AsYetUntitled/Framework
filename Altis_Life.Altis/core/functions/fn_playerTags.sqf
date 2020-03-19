#include "..\..\script_macros.hpp"
/*
    File: fn_playerTags.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Adds the tags above other players heads when close and have visible range.
*/
#define iconID 78000
#define scale 0.8

if (visibleMap || {!alive player} || {dialog}) exitWith {
    500 cutText["","PLAIN"];
};

private _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if (isNull _ui) then {
    500 cutRsc["Life_HUD_nameTags","PLAIN"];
    _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

private _units = nearestObjects[(visiblePosition player),["CAManBase","Land_Pallet_MilBoxes_F","Land_Sink_F"],50];
_units = _units - [player];

private _masks = LIFE_SETTINGS(getArray,"clothing_masks");

private _index = -1;
{
    private "_text";
    _idc = _ui displayCtrl (iconID + _forEachIndex);
    if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && alive _x && {!isNil {_x getVariable "realname"}}) then {
        _pos = switch (typeOf _x) do {
            case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
            case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
            default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
        };
        _sPos = worldToScreen _pos;
        _distance = _pos distance player;
        if (!((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks)) then {
            if (count _sPos > 1 && {_distance < 15}) then {
                _text = switch (true) do {
                    case (_x in (units group player) && playerSide isEqualTo civilian): {format ["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
                    case (side _x isEqualTo west && {!isNil {_x getVariable "rank"}}): {format ["<img image='%1' size='1'></img> %2",switch ((_x getVariable "rank")) do {
                        case 2: {"\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"};
                        case 3: {"\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa"};
                        case 4: {"\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa"};
                        case 5: {"\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa"};
                        case 6: {"\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa"};
                        case 7: {"\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
                        case 8: {"\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"};
                        default {"\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"};
                        },_x getVariable ["realname",name _x]]};
                    case (side _x isEqualTo independent): {format ["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x getVariable ["realname",name _x]]};
                    default {
                        if (!isNil {(group _x) getVariable "gang_name"}) then {
                            format ["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
                        } else {
                            if (alive _x) then {
                                _x getVariable ["realname",name _x];
                            } else {
                                if (!isPlayer _x) then {
                                    _x getVariable ["realname","ERROR"];
                                };
                            };
                        };
                    };
                };

                _idc ctrlSetStructuredText parseText _text;
                _idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
                _idc ctrlSetScale scale;
                _idc ctrlSetFade 0;
                _idc ctrlCommit 0;
                _idc ctrlShow true;
            } else {
                _idc ctrlShow false;
            };
        } else {
            _idc ctrlShow false;
        };
    } else {
        _idc ctrlShow false;
    };
    _index = _forEachIndex;
} forEach _units;
(_ui displayCtrl (iconID + _index + 1)) ctrlSetStructuredText parseText "";