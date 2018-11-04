/*
    File: fn_welcomeNotification.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called upon first spawn selection and welcomes our player.
*/
disableSerialization;
[
        "",
        0,
        0.2,
        10,
        0,
        0,
        8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayCtrl 2400;
_textSpoiler = _display displayCtrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'>AsYetUntitled</t><br /><br />";
_message = _message + "AsYetUntitled, formerly Altis Life RPG and ARMARPGLIFE is a roleplay framework for ArmA III originally made by TAW_Tonic.<br /><br />";
_message = _message + "Useful links for server owners:<br /><br />";
_message = _message + "<a color='#00DFFF'>•</a> Github: <a href='https://github.com/AsYetUntitled/Framework' color='#56BDD6'> https://github.com/AsYetUntitled/Framework</a><br />";
_message = _message + "<a color='#00DFFF'>•</a> Wiki: <a href='https://github.com/AsYetUntitled/Framework/wiki' color='#56BDD6'> https://github.com/AsYetUntitled/Framework/wiki</a><br />";
_message = _message + "<a color='#00DFFF'>•</a> Releases (Stable Builds): <a href='https://github.com/AsYetUntitled/Framework/releases' color='#56BDD6'> https://github.com/AsYetUntitled/Framework/releases</a><br />";
_message = _message + "<a color='#00DFFF'>•</a> Discord: <a href='https://discord.gg/ajGUDSH' color='#56BDD6'> https://discord.gg/ajGUDSH</a><br /><br />";
_message = _message + "Thanks for joining and enjoy your stay, <a color='#B000FF'>YourServerName</a> Staff Team.<br />";
_message = _message + "You can edit the text displayed in this box by modifying Altis_Life.Altis/core/fn_welcomeNotification.sqf";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlCommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
