// PUSH SCRIPT BY FEINT
// VERSION 1.0
// © 2013 ALL RIGHTS RESERVED
// TO MODIFY OR COPY FROM THIS FILE - CONTACT JON HILLENBRAND THROUGH HIS WEBSITE - WWW.JONHILLENBRAND.COM

private ["_caller","_thingToPush","_dir","_speed","_vel","_thingToPushType","_nameOfThingToPush","_textString","_targetDistance","_dist","_relativePosModel","_minSetBoxLimits","_maxSetBoxLimits","_minX","_minY","_minZ","_maxX","_maxY","_maxZ","_xRPM","_yRPM","_zRPM","_thingToPushLimits","_posCaller","_headPos","_headDir"];
_caller = player;
_thingToPush = cursorTarget;
_posCaller = visiblePosition _caller;
_dir = getDir _caller;
if(!local _thingToPush) exitWith {};

// _distanceFromTarget = _caller distance _thingToPush;
_thingToPushType = typeOf _thingToPush;
_nameOfThingToPush = (getText (configFile >> "cfgVehicles" >> (_thingToPushType) >> "displayname"));
// _weightOfThing = (getText (configFile >> "cfgVehicles" >> (_thingToPushType)  >> "weight"));

if (!(isNull _thingToPush) and ((_thingToPush isKindOf "AllVehicles") or (_thingToPush isKindOf "Thing") or (_thingToPush isKindOf "Object") ))
then
{
         
         _targetDistance = _caller distance _thingToPush;
         
         // ***************************** RELATIVE MODEL POSITION CODE****************************************
         
         _thingToPushLimits = boundingBox _thingToPush;
         
         _dist = 2;
         
         _posCaller = [(_posCaller select 0) + _dist*sin _dir, (_posCaller select 1) + _dist*cos _dir, _posCaller select 2];
         
         _relativePosModel = _thingToPush worldToModel _posCaller;
         
         
         // hint format ["Position of _mineHead = %1\nSpawn distance from _mineHead = %2\nPlayer direction = %3\nModel offset = %4\nNearest Ship = %5\nShip Distance = %6\nBounding Box = %7",_pos,_dist,_dir,_relativePosModel,_nearestVehicle,_vehicleDistance,_boxLimits];
         
         // boundingBox returns the following [[minX, minY, minZ], [maxX, maxY, maxZ]]
         
         // boundingBoxReal returns the following [[minX, minZ, minY], [maxX, maxZ, maxY]]
         
         _minSetBoxLimits = _thingToPushLimits select 0;
         _maxSetBoxLimits = _thingToPushLimits select 1;
         _minX = _minSetBoxLimits select 0;
         _minY = _minSetBoxLimits select 1;
         _minZ = _minSetBoxLimits select 2;
         _maxX = _maxSetBoxLimits select 0;
         _maxY = _maxSetBoxLimits select 1;
         _maxZ = _maxSetBoxLimits select 2;
         
         
         // RELATIVE OFFSET POSITION OF _mineHead FROM NEAREST VEHICLE IN MODEL SPACE
         _xRPM = _relativePosModel select 0;
         _yRPM = _relativePosModel select 1;
         _zRPM = _relativePosModel select 2;
         
         
         // hint format ["minX: %1 \nminY: %2 \nminZ: %3 \nmaxX: %4 \nmaxY: %5\nmaxZ: %6 \n_mineHead: %7 , %8 , %9 \n_mineHead: %10",_minX,_minY,_minZ,_maxX,_maxY,_maxZ,_xRPM,_yRPM,_zRPM,_relativePosModel];
         
         if (((_xRPM > _minX) and (_xRPM < _maxX) and (_yRPM > _minY) and (_yRPM < _maxY) and (_zRPM > _minZ) and (_zRPM < _maxZ)) or (_targetDistance <= 3.5)) then
         
         {
                  
                  //_textString = format ["Pushing %1",_nameOfThingToPush];
                  //6000 cutText [_textString,"PLAIN DOWN",0];
                  
                  
                  _headPos=screenToWorld [0.5,0.5];
                  
                  _headDir=[
                           (_headPos select 0)-(getPos _caller select 0),
                           (_headPos select 1)-(getPos _caller select 1),
                           (_headPos select 2)-(getPos _caller select 2)
                  ];
                  
                  _dir = (_headDir select 0) atan2 (_headDir select 1);
                  
                  //_headAngle = (_headDir select 2) atan2 (_headDir select 2);
                  //if(_headAngle < 0) then {_headAngle = _headAngle + 360};
                  
                  // _thingToPush setDir _dir;
                  
                  _speed = 6;
                  
                  _vel = velocity _thingToPush;
                  
                  
                  _thingToPush setVelocity
                  [
                           (_vel select 0)+((sin _dir)*_speed),
                           (_vel select 1)+((cos _dir)*_speed),
                           1
                  ];
                  
                  // IF OBJECT IS A KIND OF BOAT, THEN SLOW IT DOWN OR IT WILL FLOAT AWAY FOREVER
                  
                  if (_thingToPush isKindOf "Ship") then
                  {
                           //hint "vehicle is kind of ship...slowing down";
                           sleep 1;
                           _thingToPush setVelocity [0,0,0];
                  };
                  
         } else
         {
               //   _textString = format ["Approach closer to %1, distance is %2",_nameOfThingToPush,_targetDistance];
                  // hint format ["weight: %1",_weightOfThing];
                 // 6000 cutText [_textString,"PLAIN DOWN",0];
         };
         
         
         // *****************************RELATIVE MODEL POSITION CODE END************************************
         
}
else
{
       //  _textString = format ["Can not push that %1",_nameOfThingToPush];
         // hint format ["weight: %1",_weightOfThing];
        // 6000 cutText [_textString,"PLAIN DOWN",0];
};