/*
    File: fix_headgear.sqf
    Author: pettka
    Modified by Tonic for Altis Life.

    Description:
    Randomizes a headgear form _headgear array and puts it to civilian's headgear slot upon startup of mission.
    _rnd1 is used to have some civilians without any headgear
    _rnd2 is used to determine particular headgear from array


    Parameter(s):
    None

    Returns:
    Nothing
*/
private["_headgear","_headCount","_clothes"];
_headgear = ["H_Cap_tan", "H_Cap_blk", "H_Cap_blk_CMMG", "H_Cap_brn_SPECOPS",  "H_Cap_tan_specops_US", "H_Cap_khaki_specops_UK", "H_Cap_red", "H_Cap_grn",
             "H_Cap_blu", "H_Cap_grn_BI", "H_Cap_blk_Raven", "H_Cap_blk_ION", "H_Bandanna_khk", "H_Bandanna_sgg", "H_Bandanna_cbr", "H_Bandanna_gry", "H_Bandanna_camo", "H_Bandanna_mcamo",
             "H_Bandanna_surfer", "H_Beret_blk", "H_Beret_red", "H_Beret_grn", "H_TurbanO_blk", "H_StrawHat",
             "H_StrawHat_dark", "H_Hat_blue", "H_Hat_brown", "H_Hat_camo", "H_Hat_grey", "H_Hat_checker", "H_Hat_tan"];

_headCount = count _headgear;

_clothes = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_HunterBody_grn"];

if (isServer) then
{
    BIS_randomSeed1 = [];
    BIS_randomSeed2 = [];
    _rnd1 = floor random 3;

    //Hotfix patch, We don't want players getting a 'random' hat, just our NPC's
    _this setVariable["BIS_randomSeed1",3,TRUE];
    _rnd2 = floor random _headCount;
    _this setVariable ["BIS_randomSeed2", _rnd2, TRUE];

    //Random clothing for our NPC's to add a bit of spice.
    if (local _this && !isPlayer _this) then
    {
        _this addUniform (selectRandom _clothes);
    };
};

waitUntil {!(isNil {_this getVariable "BIS_randomSeed1"})};
waitUntil {!(isNil {_this getVariable "BIS_randomSeed2"})};
_randomSeed1 = _this getVariable "BIS_randomSeed1";
_randomSeed2 = _this getVariable "BIS_randomSeed2";

if (_randomSeed1 < 2) then {
    _this addHeadgear (_headgear select _randomSeed2); //HEY BIS, THIS IS CARRYING A GLOBAL EFFECT, Y U DO THAT?
};