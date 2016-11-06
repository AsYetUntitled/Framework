[

[
    "STR_vInAct_Registration",
    "",
    [1,1,1,1],
    west,
    {
        !isNull cursorTarget &&
        {((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Ship") || (cursorTarget isKindOf "Air"))} &&
        {isNull objectParent player}
	},
    "[life_vInact_curTarget] spawn life_fnc_searchVehAction;"
]

[
	"STR_vInAct_Registration",
	"",
	[1,1,1,1],
    west,
	{
        !isNull cursorTarget &&
        {((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Ship") || (cursorTarget isKindOf "Air"))} &&
        {isNull objectParent player}
	},
    "[life_vInact_curTarget] spawn life_fnc_searchVehAction;"
]

];  
