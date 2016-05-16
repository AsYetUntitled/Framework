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
    File: fn_vehicleShopEnd3DPreview.sqf
    Modified By: NiiRoZz

    Description:
    Called when a player end the vehicle shop and destroy cam and vehicle
*/

if (!isNull life_preview_3D_vehicle_object) then {detach life_preview_3D_vehicle_object; deleteVehicle life_preview_3D_vehicle_object;};
life_preview_3D_vehicle_object = objNull;

life_preview_3D_vehicle_cam cameraEffect ["Terminate", "BACK"];
camDestroy life_preview_3D_vehicle_cam;
deleteVehicle life_preview_light;
life_preview_light = objNull;
life_preview_3D_vehicle_cam = objNull;
life_pos_exist = false;
life_pos_attach = [];