#include "..\..\script_macros.hpp"
/*
    File: fn_s_onSliderChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when the slider is changed for any field and updates the view distance for it.
*/
params [
    ["_mode",-1,[0]],
    ["_value",-1,[0]]
];
if (_mode isEqualTo -1 || _value isEqualTo -1) exitWith {};

switch _mode do {
    case 0:
    {
        life_settings_viewDistanceFoot = round(_value);
        ctrlSetText[2902,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceFoot",round(_value)];
    };

    case 1:
    {
        life_settings_viewDistanceCar = round(_value);
        ctrlSetText[2912,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceCar",round(_value)];
    };

    case 2:
    {
        life_settings_viewDistanceAir = round(_value);
        ctrlSetText[2922,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceAir",round(_value)];
    };

    case 3: {
        private _index = lbCurSel 20302;
        private _classname = lbData[20302,_index];
        if (_index isEqualTo -1) exitWith {hint localize "STR_Select_Vehicle_Pump"};

        if (!isNil "_classname" || _classname isEqualTo "") then {

            private _vehicleFuelList = uiNamespace getVariable ["fuel_list",[]];
            (_vehicleFuelList select _index) params ["_car"];
            private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
            private _fuel = fuel _car;
            private _fuelTank = _vehicleInfo select 12;
            if (_car isKindOf "B_Truck_01_box_F" || _car isKindOf "B_Truck_01_transport_F") then {
                _fueltank = 450;
            };
            _value = (parseNumber(_value toFixed 2));
            ctrlSetText [20324,format ["Fuel : %1 liters",_value - (floor(_fuel * _fueltank))]];
            ctrlSetText [20323,format ["Total : $%1",round ((uiNamespace getVariable ["fuel_cost",0]) * (_value -(floor(_fuel * _fueltank)))) ]];
        } else {
            hint localize "STR_Select_Vehicle_Pump";
        };
    };

    case 4: {
        player setDir (360 - _value);
    };
};
