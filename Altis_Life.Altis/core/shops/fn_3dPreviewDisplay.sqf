/*
    File: fn_3dPreviewDisplay.sqf
    Author: KLM

    Description:
    Called to change the object in the 3d preview.
*/

if !(params [["_className", "", [""]]]) exitWith {};

if (isNil "life_3dPreview_camera" || {isNull life_3dPreview_camera}) exitWith {};

private _isInCfg = (isClass (configFile >> "CfgVehicles" >> _className));
if (_isInCfg) then {
    if (isNull life_3dPreview_object || {!(_className isEqualTo typeOf life_3dPreview_object)}) then {
        if (!isNull life_3dPreview_object) then {deleteVehicle life_3dPreview_object;};
        private _object = _className createVehicleLocal [0, 0, 0];
        if (isNull _object) exitWith {diag_log format ["3dPreview - problem creating object: %1", _className]};
        life_3dPreview_object = _object;
        life_3dPreview_object enableSimulation false;
        life_3dPreview_object setPos life_3dPreview_position;
        life_3dPreview_object setVectorUp [0, 0, 1];
        private _bodyDiagonal = [boundingBoxReal _object select 0 select 0, boundingBoxReal _object select 0 select 2] distance [boundingBoxReal _object select 1 select 0, boundingBoxReal _object select 1 select 2];
        private _distance = _bodyDiagonal * 2;
        life_3dPreview_camera_target = getPos _object;
        life_3dPreview_camera camSetTarget life_3dPreview_camera_target;
        life_3dPreview_camera camSetPos (_object modelToWorld [0, _distance, _distance * 0.3]);
        life_3dPreview_camera setVectorUp [0, 0, 1];
        life_3dPreview_camera camCommit 0;
        life_3dPreview_camera_mag = vectorMagnitude (life_3dPreview_object worldToModel (getPos life_3dpreview_camera));
        life_3dPreview_camera_zoom = life_3dPreview_camera_mag;
    };
};
