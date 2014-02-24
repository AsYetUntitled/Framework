/*
	Author: Karel Moricky
	Modified by Tonic for function white-listing.

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
private ["_validFunctions","_params","_functionName","_target","_isPersistent","_isCall","_varName","_varValue","_function"];

_varName = _this select 0;
_varValue = _this select 1;

_mode = 	[_varValue,0,[0]] call bis_fnc_param;
_params = 	[_varValue,1,[]] call bis_fnc_param;
_functionName =	[_varValue,2,"",[""]] call bis_fnc_param;
_target =	[_varValue,3,true,[ObjNull,true,0,[],sideUnknown,GrpNull,""]] call bis_fnc_param;
_isPersistent =	[_varValue,4,false,[false]] call bis_fnc_param;
_isCall =	[_varValue,5,false,[false]] call bis_fnc_param;

//Only approve internal functions to be passed through our framework so prep our array of allowed functions.
_validFunctions =
["life_fnc_restrain","TON_fnc_query","TON_fnc_update","TON_fnc_add","life_fnc_broadcast","life_fnc_wantedAdd"
,"life_fnc_wantedRemove","life_fnc_wantedBounty","life_fnc_moveIn","life_fnc_pushFunction","life_fnc_pulloutVeh"
,"life_fnc_searchClient","life_fnc_copSearch","life_fnc_copSiren","life_fnc_ticketPrompt","life_fnc_receiveMoney"
,"clientGetKey","life_fnc_receiveItem","life_fnc_wantedPardon","life_fnc_wantedMenu","life_fnc_wantedList","clientWireTransfer"
,"clientGangKick","clientGangLeader","clientMessage","life_fnc_impoundMenu","TON_fnc_managesc","life_fnc_sessionReceive"
,"life_fnc_fedSuccess","TON_fnc_spikeStrip","TON_fnc_robReserve","TON_fnc_vehicleStore","TON_fnc_getVehicles"
,"TON_fnc_vehicleCreate","TON_fnc_getID","life_fnc_adminid","fnc_player_query","life_fnc_refuelGlobal"
];

/*
	Not fully finished for the 'pre' version
if(!(_functionName in _validFunctions)) exitWith {
	diag_log format["UNKNOWN FUNCTION: %1 passed PARAMS: %2 TARET: %3",_functionName,_params,_target];
	diag_log format["%1",str(missionNamespace getVariable _functionName)];
	false
};
*/

if (ismultiplayer && _mode == 0) then {
	if (isserver) then {
		if (typename _target == typename []) then {

			//--- Multi execution
			{
				[_varName,[_mode,_params,_functionName,_x,_isPersistent,_isCall]] call life_fnc_MPexec;
			} foreach _target;
		} else {

			//--- Single execution
			private ["_ownerID","_serverID"];
			_serverID = owner (missionnamespace getvariable ["bis_functions_mainscope",objnull]); //--- Server ID is not always 0

			//--- Server process
			switch (typename _target) do {
				case (typename objnull): {
					_ownerID = owner _target;
				};
				case (typename true): {
					_ownerID = [_serverID,-1] select _target;
				};
				case (typename 0): {
					_ownerID = _target;
				};
				case (typename grpnull);
				case (typename sideUnknown): {
					_ownerID = -1;
				};
				case (typeName ""): {
					_ownerID = -1;
				};
			};
			life_fnc_MP_packet = [1,_params,_functionName,_target,_isPersistent,_isCall];

			//--- Send to clients
			if (_ownerID < 0) then {
				//--- Everyone
				publicvariable "life_fnc_MP_packet";
			} else {
				if (_ownerID != _serverID) then {
					//--- Client
					_ownerID publicvariableclient "life_fnc_MP_packet";
				};
			};

			//--- Server execution (for all or server only)
			if (_ownerID < 0 || _ownerID == _serverID) then {
				["life_fnc_MP_packet",life_fnc_MP_packet] spawn life_fnc_MPexec;
			};

			//--- Persistent call (for all or clients)
			if (_isPersistent) then {
				if (typename _target != typename 0) then {
					private ["_logic","_queue"];
					_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
					_queue = _logic getvariable ["BIS_fnc_MP_queue",[]];
					_queue set [
						count _queue,
						+life_fnc_MP_packet
					];
					_logic setvariable ["BIS_fnc_MP_queue",_queue,true];
				} else {
					["Persistent execution is not allowed when target is %1. Use %2 or %3 instead.",typename 0,typename objnull,typename false] call bis_fnc_error;
				};
			};
		};
	};

} else {
	//--- Client
	private ["_canExecute"];
	_canExecute = switch (typename _target) do {
		case (typename grpnull): {player in units _target};
		case (typename sideUnknown): {playerside == _target;};
		case (typeName ""): {if(!isNull player) then {getPlayerUID player == _target;} else {false}};
		default {true};
	};

	if (_canExecute) then {
		_function = missionnamespace getvariable _functionName;
		if (!isnil "_function") then {
			if (_isCall) then {
				_params call _function;
			} else {
				_params spawn _function;
			};
			true
		} else {
			["Function '%1' does not exist",_functionName] call bis_fnc_error;
			false
		};
	};
};