// Creating a camera.
Life_Preview_3D_Vehicle_cam = "camera" camCreate ([[5000, 5000, 0]] call life_fnc_SearchPosEmpty);
Life_Preview_3D_Vehicle_cam cameraEffect ["Internal", "BACK"];
Life_Preview_3D_Vehicle_cam camSetFocus [-1, -1];
showCinemaBorder false;
Life_Preview_3D_Vehicle_cam camCommit 0;
camUseNVG (sunOrMoon == 0);

Life_Preview_3D_Vehicle_object = objNull;

// Thread execution performing a continuous rotation of the camra around the view object.
0 spawn
{
	// Until we left the visualization.
	while {!isNull Life_Preview_3D_Vehicle_cam} do
	{
		private ["_objet", "_distance_cam", "_azimut_cam"];

		// Waiting for a view object.
		waitUntil {!isNull Life_Preview_3D_Vehicle_object};

		_objet = Life_Preview_3D_Vehicle_object;

		_distance_cam = 2.25 * (
				[boundingBoxReal _objet select 0 select 0, boundingBoxReal _objet select 0 select 2]
			distance
				[boundingBoxReal _objet select 1 select 0, boundingBoxReal _objet select 1 select 2]
		);
		_azimut_cam = 0;

		Life_Preview_3D_Vehicle_cam camSetTarget _objet;
		Life_Preview_3D_Vehicle_cam camSetPos (_objet modelToWorld [_distance_cam * sin _azimut_cam, _distance_cam * cos _azimut_cam, _distance_cam * 0.33]);
		Life_Preview_3D_Vehicle_cam camCommit 0;

		// Rotation around the object.
		while {Life_Preview_3D_Vehicle_object == _objet} do
		{
			_azimut_cam = _azimut_cam + 3.25;

			Life_Preview_3D_Vehicle_cam camSetPos (_objet modelToWorld [_distance_cam * sin _azimut_cam, _distance_cam * cos _azimut_cam, _distance_cam * 0.33]);
			Life_Preview_3D_Vehicle_cam camCommit 0.05;

			sleep 0.05;
		};
	};
};
