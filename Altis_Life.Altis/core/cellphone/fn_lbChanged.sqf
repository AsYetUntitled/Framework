/*
    Author: GetSomePanda / Panda
    Helped: BoGuu
    SteamID: 76561198145366418
    File Name: fn_lbChanged.sqf
    Information: When new player is selected on the messages list.
*/
private["_message","_data","_nameOnPList","_text", "_delButton","_replyButton","_time","_timeArray","_year","_month","_day","_hour","_minutes"];
disableSerialization;
_text = ((findDisplay 98111) displayCtrl 98113);
_data = lbData[98112,lbCurSel (98112)];
_delButton = ((findDisplay 98111) displayCtrl 98114);
_replyButton = ((findDisplay 98111) displayCtrl 98115);
if(_data == "You have no messages.") then 
{
    _text ctrlSetText "You have no messages.";
} 
else
{
    _data = call compile _data;

    _nameOnPList = _data select 0;
    _message = _data select 1;
    
    _time = _data select 2;
    _timeArray = _time select 1;
    _year = _timeArray select 0;
    _month = _timeArray select 1;
    _day = _timeArray select 2;
    _hour = _timeArray select 3;
    _minutes = _timeArray select 4;
    
    _minutes = toArray(str _minutes);
    if (count _minutes isEqualTo 1) then 
    {
        _minutes = [48,(_minutes select 0)];
        _minutes = toString(_minutes);
    } 
    else 
    {
        _minutes = toString(_minutes);
    };

    _text ctrlSetText format ["""%1"" - %2 \n \nMessage received at %6:%7 on %3/%4/%5 . ", _message, _nameOnPList, _day, _month, _year, _hour, _minutes];
    
    if(getNumber(missionConfigFile >> "CellPhone_Settings" >> "allow_msg_delete") == 1) then
    {
        _delButton ctrlShow true;
    };
    _replyButton ctrlShow true;
};

