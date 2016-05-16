/**
 * Bibliothèque de fonctions permettant la visualisation 3D d'objets
 * 
 * Copyright (C) 2014 Team ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 
 /*
    File: fn_vehicleShop3DPreview.sqf
    Modified By: NiiRoZz

    Description:
    Called when a new selection is made in the list box and
    displays the new vehicle selected.
*/
 
 
private ["_classView","_object","_id"];

if (isNil "life_preview_3D_vehicle_cam") then
{
    [] call life_fnc_vehicleShopInit3DPreview;
};

_classView = _this select 0;

// Ignore non instantiable objects.
if (_classView != "" && {isClass (configFile >> "CfgVehicles" >> _classView) && {getNumber (configFile >> "CfgVehicles" >> _classView >> "scope") > 0}}) then
{
    // Skip if object view is the same as previous.
    if (isNull life_preview_3D_vehicle_object || {_classView != typeOf life_preview_3D_vehicle_object}) then
    {
        if (!isNull life_preview_3D_vehicle_object) then {detach life_preview_3D_vehicle_object; deleteVehicle life_preview_3D_vehicle_object;};
        // Create and place the object in the sky
        if (!life_pos_exist) then {
            life_pos_attach = [[5000, 5000, 0]] call life_fnc_searchPosEmpty;
            life_pos_exist = true;
            life_preview_light = "#lightpoint" createVehicle life_pos_attach;
            life_preview_light setLightBrightness 0.5;
            life_preview_light setLightColor [1,1,1];
            life_preview_light setLightAmbient [1,1,1];
        };
        _object = _classView createVehicle life_pos_attach;
        _id = player getVariable["life_clientID",-1];
        [_object] remoteExecCall ["life_fnc_hideObj",-_id];
        [life_preview_light] remoteExecCall ["life_fnc_hideObj",-_id];
        [_object] call life_fnc_clearVehicleAmmo;
        _object attachTo [life_attachment_point, life_pos_attach];

        life_preview_3D_vehicle_object = _object;
    };
};
