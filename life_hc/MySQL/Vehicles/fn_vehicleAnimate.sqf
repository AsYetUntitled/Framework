/*
    File: fn_vehicleAnimate.sqf
    Author: DomT602

    This file is for Nanou's HeadlessClient.

    Description:
    Animates various aspects of the vehicle - moved to server.
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_animate","",["",[]]],
    ["_preset",false,[false]]
];
if (isNull _vehicle) exitWith {};

if !(_preset) then {
    {
        _x params ["_selection","_value"];
        _vehicle animate [_selection,_value];
    } forEach _animate;
} else {
    switch _animate do {
        case "civ_littlebird": {
            _vehicle animate ["addDoors",1];
            _vehicle animate ["addBenches",0];
            _vehicle animate ["addTread",0];
            _vehicle animate ["AddCivilian_hide",1];
            {
                _vehicle lockCargo [_x,true];
            } forEach [2, 3, 4, 5];
        };

        case "service_truck": {
            _vehicle animate ["HideServices", 0];
            _vehicle animate ["HideDoor3", 1];
        };

        case "med_offroad": {
            _vehicle animate ["HidePolice", 0];
            _vehicle setVariable ["lights",false,true];
        };

        case "cop_offroad": {
            _vehicle animate ["HidePolice", 0];
            _vehicle animate ["HideBumper1", 0];
            _vehicle setVariable ["lights",false,true];
        };
    };
};
