#include "script_macros.hpp"
/*
    File: functions.sqf
    Author: Bryan "Tonic" Boardwine

    Description: They are functions.
*/

publicVariable "TON_fnc_terrainSort";

TON_fnc_index =
compileFinal "
    params [
        ['_item','',['']],
        ['_stack',[],[[]]]
    ];
    _stack findIf {_item in _x};
";

TON_fnc_player_query =
compileFinal "
    params [
        ['_ret',objNull,[objNull]]
    ];
    if (isNull _ret) exitWith {};

    [life_atmbank,life_cash,owner player,player,profileNameSteam,getPlayerUID player,playerSide] remoteExecCall ['life_fnc_adminInfo',_ret];
";
publicVariable "TON_fnc_player_query";
publicVariable "TON_fnc_index";

TON_fnc_isNumber =
compileFinal "
    params [
        ['_string','',['']]
    ];
    if (_string isEqualTo '') exitWith {false};
    private _array = _string splitString '';
    private _return = true;
    {
        if !(_x in ['0','1','2','3','4','5','6','7','8','9']) exitWith {
            _return = false;
        };
    } forEach _array;
    _return;
";

publicVariable "TON_fnc_isNumber";

TON_fnc_clientGangKick =
compileFinal "
    params [
        ['_unit',objNull,[objNull]],
        ['_group',grpNull,[grpNull]]
    ];
    if (isNull _unit || isNull _group) exitWith {};
    if (player isEqualTo _unit && (group player) isEqualTo _group) then {
        life_my_gang = objNull;
        [player] joinSilent (createGroup civilian);
        hint localize 'STR_GNOTF_KickOutGang';
    };
";

publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
    params [
        ['_vehicle',objNull,[objNull]],
        ['_unit',objNull,[objNull]],
        ['_giver',objNull,[objNull]]
    ];
    if (isNull _vehicle || isNull _unit || isNull _giver) exitWith {};
    if (player isEqualTo _unit && !(_vehicle in life_vehicles)) then {
        private _name = getText(configFile >> 'CfgVehicles' >> (typeOf _vehicle) >> 'displayName');
        hint format [localize 'STR_NOTF_gaveKeysFrom',_giver,_name];
        life_vehicles pushBack _vehicle;
        [getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ['TON_fnc_keyManagement',2];
    };
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
    params [
        ['_unit',objNull,[objNull]],
        ['_group',grpNull,[grpNull]]
    ];
    if (isNull _unit || isNull _group) exitWith {};
    if (player isEqualTo _unit && (group player) isEqualTo _group) then {
        player setRank 'COLONEL';
        _group selectLeader _unit;
        hint localize 'STR_GNOTF_GaveTransfer';
    };
";

publicVariable "TON_fnc_clientGangLeader";

TON_fnc_clientGangLeft =
compileFinal "
    params [
        ['_unit',objNull,[objNull]],
        ['_group',grpNull,[grpNull]]
    ];
    if (isNull _unit || isNull _group) exitWith {};
    if (player isEqualTo _unit && (group player) isEqualTo _group) then {
        life_my_gang = objNull;
        [player] joinSilent (createGroup civilian);
        hint localize 'STR_GNOTF_LeaveGang';
    };
";

publicVariable "TON_fnc_clientGangLeft";

//Cell Phone Messaging
/*
    -fnc_cell_textmsg
    -fnc_cell_textcop
    -fnc_cell_textadmin
    -fnc_cell_adminmsg
    -fnc_cell_adminmsgall
*/

//To EMS
TON_fnc_cell_emsrequest =
compileFinal "
    ctrlShow[3022,false];
    private _msg = ctrlText 3003;
    private _length = count (toArray(_msg));
    if (_length > 400) exitWith {hint localize 'STR_CELLMSG_LIMITEXCEEDED';ctrlShow[3022,true];};
    private _to = 'EMS Units';
    if (_msg isEqualTo '') exitWith {hint localize 'STR_CELLMSG_EnterMSG';ctrlShow[3022,true];};

    [_msg,name player,5,mapGridPosition player,player] remoteExecCall ['TON_fnc_clientMessage',independent];
    call life_fnc_cellphone;
    hint format [localize 'STR_CELLMSG_ToEMS',_to,_msg];
    ctrlShow[3022,true];
";
//To One Person
TON_fnc_cell_textmsg =
compileFinal "
    ctrlShow[3015,false];
    private _msg = ctrlText 3003;

    private _length = count (toArray(_msg));
    if (_length > 400) exitWith {hint localize 'STR_CELLMSG_LIMITEXCEEDED';ctrlShow[3015,true];};
    if (lbCurSel 3004 isEqualTo -1) exitWith {hint localize 'STR_CELLMSG_SelectPerson'; ctrlShow[3015,true];};

    private _to = call compile format ['%1',(lbData[3004,(lbCurSel 3004)])];
    if (isNull _to || isNil '_to') exitWith {ctrlShow[3015,true];};
    if (_msg isEqualTo '') exitWith {hint localize 'STR_CELLMSG_EnterMSG';ctrlShow[3015,true];};

    [_msg,name player,0] remoteExecCall ['TON_fnc_clientMessage',_to];
    call life_fnc_cellphone;
    hint format [localize 'STR_CELLMSG_ToPerson',name _to,_msg];
    ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
    ctrlShow[3016,false];
    private _msg = ctrlText 3003;
    private _to = 'The Police';

    if (_msg isEqualTo '') exitWith {hint localize 'STR_CELLMSG_EnterMSG';ctrlShow[3016,true];};
    private _length = count (toArray(_msg));
    if (_length > 400) exitWith {hint localize 'STR_CELLMSG_LIMITEXCEEDED';ctrlShow[3016,true];};

    [_msg,name player,1,mapGridPosition player,player] remoteExecCall ['TON_fnc_clientMessage',-2];
    call life_fnc_cellphone;
    hint format [localize 'STR_CELLMSG_ToPerson',_to,_msg];
    ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
    ctrlShow[3017,false];
    private _msg = ctrlText 3003;
    private _to = 'The Admins';

    if (_msg isEqualTo '') exitWith {hint localize 'STR_CELLMSG_EnterMSG';ctrlShow[3017,true];};
    private _length = count (toArray(_msg));
    if (_length > 400) exitWith {hint localize 'STR_CELLMSG_LIMITEXCEEDED';ctrlShow[3017,true];};

    [_msg,name player,2,mapGridPosition player,player] remoteExecCall ['TON_fnc_clientMessage',-2];
    call life_fnc_cellphone;
    hint format [localize 'STR_CELLMSG_ToPerson',_to,_msg];
    ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
    if (isServer) exitWith {};
    if ((call life_adminlevel) < 1) exitWith {hint localize 'STR_CELLMSG_NoAdmin';};
    ctrlShow[3020,false];
    private _msg = ctrlText 3003;
    private _to = call compile format ['%1',(lbData[3004,(lbCurSel 3004)])];
    if (isNull _to || isNil '_to') exitWith {ctrlShow[3020,true];};
    if (_msg isEqualTo '') exitWith {hint localize 'STR_CELLMSG_EnterMSG';ctrlShow[3020,true];};

    [_msg,name player,3] remoteExecCall ['TON_fnc_clientMessage',_to];
    call life_fnc_cellphone;
    hint format [localize 'STR_CELLMSG_AdminToPerson',name _to,_msg];
    ctrlShow[3020,true];
";

TON_fnc_cell_adminmsgall =
compileFinal "
    if (isServer) exitWith {};
    if ((call life_adminlevel) < 1) exitWith {hint localize 'STR_CELLMSG_NoAdmin';};
    ctrlShow[3021,false];
    private _msg = ctrlText 3003;
    if (_msg isEqualTo '') exitWith {hint localize 'STR_CELLMSG_EnterMSG';ctrlShow[3021,true];};

    [_msg,name player,4] remoteExecCall ['TON_fnc_clientMessage',-2];
    call life_fnc_cellphone;
    hint format [localize 'STR_CELLMSG_AdminToAll',_msg];
    ctrlShow[3021,true];
";

publicVariable "TON_fnc_cell_textmsg";
publicVariable "TON_fnc_cell_textcop";
publicVariable "TON_fnc_cell_textadmin";
publicVariable "TON_fnc_cell_adminmsg";
publicVariable "TON_fnc_cell_adminmsgall";
publicVariable "TON_fnc_cell_emsrequest";
//Client Message
/*
    0 = private message
    1 = police message
    2 = message to admin
    3 = message from admin
    4 = admin message to all
*/
TON_fnc_clientMessage =
compileFinal "
    if (isServer) exitWith {};
    params [
        ['_msg','',['']],
        ['_from','',['']],
        ['_type',-1,[0]]
    ];
    if (_msg isEqualTo '' || _from isEqualTo '') exitWith {};
    switch (_type) do {
        case 0 : {
            hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>New Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];

            ['TextMessage',[format ['You Received A New Private Message From %1',_from]]] call bis_fnc_showNotification;
            systemChat format ['>>>MESSAGE FROM %1: %2',_from,_msg];
        };

        case 1 : {
            if (side player != west) exitWith {};
            params [
                '',
                '',
                '',
                ['_loc',locationNull,[locationNull]]
            ];
            if (isNull _loc) then {_loc = 'Unknown';};
            hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>New Dispatch<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Officers<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3"",_from,_loc,_msg];

            ['PoliceDispatch',[format ['A New Police Report From: %1',_from]]] call bis_fnc_showNotification;
            systemChat format ['--- 911 DISPATCH FROM %1: %2',_from,_msg];
        };

        case 2 : {
            if ((call life_adminlevel) < 1) exitWith {};
            params [
                '',
                '',
                '',
                ['_loc',locationNull,[locationNull]]
            ];
            if (isNull _loc) then {_loc = 'Unknown';};
            hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3"",_from,_loc,_msg];

            ['AdminDispatch',[format ['%1 Has Requested An Admin!',_from]]] call bis_fnc_showNotification;
            systemChat format ['!!! ADMIN REQUEST FROM %1: %2',_from,_msg];
        };

        case 3 : {
            hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>An Admin<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];

            ['AdminMessage',['You Have Received A Message From An Admin!']] call bis_fnc_showNotification;
            systemChat format ['!!! ADMIN MESSAGE: %1',_msg];
            if ((call life_adminlevel) > 0) then {systemChat format ['Sent by admin: %1', _from];};
        };

        case 4 : {
            hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Players<br/><t color='#33CC33'>From: <t color='#ffffff'>The Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];

            ['AdminMessage',['You Have Received A Message From An Admin!']] call bis_fnc_showNotification;
            systemChat format ['!!!ADMIN MESSAGE: %1',_msg];
            if ((call life_adminlevel) > 0) then {systemChat format ['Sent by admin: %1', _from];};
        };

        case 5: {
            if (side player != independent) exitWith {};
            params [
                '',
                '',
                '',
                ['_loc',locationNull,[locationNull]]
            ];
            if (isNull _loc) then {_loc = 'Unknown';};
            hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>EMS Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3"",_from,_loc,_msg];

            ['TextMessage',[format ['EMS Request from %1',_from]]] call bis_fnc_showNotification;
            systemChat format ['!!! EMS REQUEST: %1',_msg];
        };
    };
";
publicVariable "TON_fnc_clientMessage";
