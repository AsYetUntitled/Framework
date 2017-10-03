/*
  File: fn_pushObject.sqf
  Author: FEINT
  Version : 1.0

  Descrition :
  © 2013 ALL RIGHTS RESERVED
  TO MODIFY OR COPY FROM THIS FILE - CONTACT JON HILLENBRAND THROUGH HIS WEBSITE - WWW.JONHILLENBRAND.COM

  Cleaned by NiiRoZz for Altis Life
*/
private _caller = player;
private _thingToPush = cursorObject;
private _posCaller = visiblePosition _caller;
private _dir = getDir _caller;
if (!local _thingToPush) exitWith {};

// _distanceFromTarget = _caller distance _thingToPush;
private _thingToPushType = typeOf _thingToPush;
private _nameOfThingToPush = (getText (configFile >> "cfgVehicles" >> (_thingToPushType) >> "displayname"));
// _weightOfThing = (getText (configFile >> "cfgVehicles" >> (_thingToPushType)  >> "weight"));

if (!(isNull _thingToPush) && ((_thingToPush isKindOf "AllVehicles") || (_thingToPush isKindOf "Thing") || (_thingToPush isKindOf "Object") )) then {
  private _targetDistance = _caller distance _thingToPush;
  // ***************************** RELATIVE MODEL POSITION CODE****************************************
  private _thingToPushLimits = boundingBox _thingToPush;
  private _dist = 2;
  private _posCaller = [(_posCaller select 0) + _dist*sin _dir, (_posCaller select 1) + _dist*cos _dir, _posCaller select 2];
  private _relativePosModel = _thingToPush worldToModel _posCaller;

  // boundingBox returns the following [[minX, minY, minZ], [maxX, maxY, maxZ]]
  // boundingBoxReal returns the following [[minX, minZ, minY], [maxX, maxZ, maxY]]
  private _minSetBoxLimits = _thingToPushLimits select 0;
  private _maxSetBoxLimits = _thingToPushLimits select 1;
  private _minX = _minSetBoxLimits select 0;
  private _minY = _minSetBoxLimits select 1;
  private _minZ = _minSetBoxLimits select 2;
  private _maxX = _maxSetBoxLimits select 0;
  private _maxY = _maxSetBoxLimits select 1;
  private _maxZ = _maxSetBoxLimits select 2;

  // RELATIVE OFFSET POSITION OF _mineHead FROM NEAREST VEHICLE IN MODEL SPACE
  private _xRPM = _relativePosModel select 0;
  private _yRPM = _relativePosModel select 1;
  private _zRPM = _relativePosModel select 2;

  if (((_xRPM > _minX) && (_xRPM < _maxX) && (_yRPM > _minY) && (_yRPM < _maxY) && (_zRPM > _minZ) && (_zRPM < _maxZ)) || (_targetDistance <= 3.5)) then {

    _headPos=screenToWorld [0.5,0.5];
    _headDir=[(_headPos select 0)-(getPos _caller select 0), (_headPos select 1)-(getPos _caller select 1), (_headPos select 2)-(getPos _caller select 2)];
    _dir = (_headDir select 0) atan2 (_headDir select 1);

    _speed = 6;
    _vel = velocity _thingToPush;

    _thingToPush setVelocity [(_vel select 0)+((sin _dir)*_speed), (_vel select 1)+((cos _dir)*_speed),1];
    if (_thingToPush isKindOf "Ship") then {
      sleep 1;
      _thingToPush setVelocity [0,0,0];
    };
  };
};
