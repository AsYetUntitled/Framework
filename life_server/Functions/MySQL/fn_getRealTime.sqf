/*
    Author: GetSomePanda / Panda
    Helped: BoGuu
    SteamID: 76561198145366418
    File Name: fn_getRealTime.sqf
    Information: Get the real time.
*/
realTime = "extDB2" callExtension "9:LOCAL_TIME";
(owner _this) publicVariableClient "realTime";