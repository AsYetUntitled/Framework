/*
    File: fn_3dPreviewInit.sqf
    Author: BoGuu & KLM

    Description:
    Called to initialize the 3d preview.
*/

if !(params [["_display", displayNull, [displayNull]]]) exitWith {};

life_3dPreview_position = [0, 0, 10000];
// create camera
life_3dPreview_camera = "camera" camCreate life_3dPreview_position;
life_3dPreview_camera cameraEffect ["Internal", "BACK"];
life_3dPreview_camera camSetFocus [-1, -1];
showCinemaBorder false;
life_3dPreview_camera camCommit 0;
// create light
life_3dPreview_light = "#lightpoint" createVehicleLocal life_3dPreview_position;
life_3dPreview_light setLightBrightness 0.5;
life_3dPreview_light setLightColor [1, 1, 1];
life_3dPreview_light setLightAmbient [1, 1, 1];
// set initial values for global vars
life_3dPreview_camera_mag = 0;
life_3dPreview_camera_zoom = 0;
life_3dPreview_camera_target = [];
life_3dPreview_object = objNull;
life_3dPreview_dragging = false;
// event handlers
life_3dPreview_evh_down = _display displayAddEventHandler ["MouseButtonDown", {life_3dPreview_dragging = true}];
life_3dPreview_evh_up = _display displayAddEventHandler ["MouseButtonUp", {life_3dPreview_dragging = false}];


life_3dPreview_evh_move = _display displayAddEventHandler ["MouseMoving", {
    params ["", "_dx", "_dy"];
    if (life_3dPreview_dragging) then {
        private _dir = vectorDir life_3dPreview_object;
        private _newdir = [(_dir select 0) * cos _dx - (_dir select 1) * sin _dx, (_dir select 0) * sin _dx + (_dir select 1) * cos _dx, 0];
        life_3dPreview_object setVectorDir vectorNormalized _newdir;
    };
}];

life_3dPreview_evh_zoom = _display displayAddEventHandler ["MouseZChanged", {
    params ["", "_scroll"];
    private _max = life_3dPreview_camera_mag;
    private _object = life_3dPreview_object;
    private _bodyDiagonal = [boundingBoxReal _object select 0 select 0, boundingBoxReal _object select 0 select 2] distance [boundingBoxReal _object select 1 select 0, boundingBoxReal _object select 1 select 2];
    private _min = _bodyDiagonal + 1;
    private _step = (_max - _min) / 10;
    private _oldPos = getPos life_3dPreview_camera;
    life_3dPreview_camera_zoom = _min max (life_3dPreview_camera_zoom - (_step * (abs (_scroll) / _scroll)));
    life_3dPreview_camera_zoom = _max min life_3dPreview_camera_zoom;
    if (life_3dPreview_camera_zoom >= _max || {life_3dPreview_camera_zoom <= _min}) exitWith {};
    private _newPos = life_3dPreview_camera_target vectorAdd ((vectorNormalized ((getPos life_3dPreview_camera) vectorDiff life_3dPreview_camera_target)) vectorMultiply life_3dPreview_camera_zoom);
    life_3dPreview_camera camSetPos _newPos;
    life_3dPreview_camera camCommit 0.15;
}];
