/*
	File: fn_vehicleShopEnd3DPreview.sqf
	Author: NiiRoZz

	Description:
	Called when a player end the vehicle shop and destroy cam and vehicle
*/
if (!isNull life_preview_3D_vehicle_object) then {detach life_preview_3D_vehicle_object; deleteVehicle life_preview_3D_vehicle_object;};
life_preview_3D_vehicle_object = objNull;

life_preview_3D_vehicle_cam cameraEffect ["Terminate", "BACK"];
camDestroy life_preview_3D_vehicle_cam;
deletevehicle life_preview_light;
life_preview_light = objNull;
life_preview_3D_vehicle_cam = objNull;
life_pos_exist = false;
life_pos_attach = [];