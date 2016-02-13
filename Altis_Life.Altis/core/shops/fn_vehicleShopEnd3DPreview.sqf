if (!isNull Life_Preview_3D_Vehicle_object) then {detach Life_Preview_3D_Vehicle_object; deleteVehicle Life_Preview_3D_Vehicle_object;};
Life_Preview_3D_Vehicle_object = objNull;

Life_Preview_3D_Vehicle_cam cameraEffect ["Terminate", "BACK"];
camDestroy Life_Preview_3D_Vehicle_cam;
Life_Preview_3D_Vehicle_cam = objNull;
life_pos_exist = false;
