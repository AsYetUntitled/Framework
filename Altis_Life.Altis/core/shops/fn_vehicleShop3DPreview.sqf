private ["_classe_a_visualiser", "_objet", "_position_attache"];

if (isNil "Life_Preview_3D_Vehicle_cam") then
{
	[] call life_fnc_vehicleShopInit3DPreview;
};

_classe_a_visualiser = _this select 0;

// Ignore non instantiable objects.
if (_classe_a_visualiser != "" && {isClass (configFile >> "CfgVehicles" >> _classe_a_visualiser) && {getNumber (configFile >> "CfgVehicles" >> _classe_a_visualiser >> "scope") > 0}}) then
{
	// Skip if object view is the same as prcdemment.
	if (isNull Life_Preview_3D_Vehicle_object || {_classe_a_visualiser != typeOf Life_Preview_3D_Vehicle_object}) then
	{
		if (!isNull Life_Preview_3D_Vehicle_object) then {detach Life_Preview_3D_Vehicle_object; deleteVehicle Life_Preview_3D_Vehicle_object;};
		// Cr�er et placer l'objet dans le ciel
		if (!life_pos_exist) then {
			life_pos_attach = [[5000, 5000, 0]] call life_fnc_SearchPosEmpty;
			life_pos_exist = true;
		};
		_objet = _classe_a_visualiser createVehicleLocal life_pos_attach;
		_objet attachTo [life_attachment_point, life_pos_attach];

		Life_Preview_3D_Vehicle_object = _objet;
	};
};
