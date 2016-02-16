/*
	File: fn_vehicleShopEnd3DPreview.sqf
	Author: NiiRoZz

	Description:
	Called when a player end the vehicle shop and destroy cam and vehicle
*/
if (!isNull Life_Preview_3D_Vehicle_object) then {detach Life_Preview_3D_Vehicle_object; deleteVehicle Life_Preview_3D_Vehicle_object;};
Life_Preview_3D_Vehicle_object = objNull;

Life_Preview_3D_Vehicle_cam cameraEffect ["Terminate", "BACK"];
camDestroy Life_Preview_3D_Vehicle_cam;
deletevehicle life_preview_light;
life_preview_light = objNull;
Life_Preview_3D_Vehicle_cam = objNull;
life_pos_exist = false;
life_pos_attach = [];
