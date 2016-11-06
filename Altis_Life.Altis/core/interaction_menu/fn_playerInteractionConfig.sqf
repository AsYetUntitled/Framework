[
[
	"Hint Me",
	"icon (ico_cannabis.paa) etc",
	[1,1,1,1],
    west,
	{
        (alive player)
	},
    "hint 'Hello!!!'"
],

[
	"Hint Me2",
	"",
	[1,1,1,1],
    west,
	{
        (alive player) &&
        {(1+1) < 2}
	},
    "hint 'Hello2!!!'"
],

[
	"Hint Me3",
	"",
	[1,1,1,1],
    civilian,
	{
        (alive player)
	},
    "hint 'Hello3!!!'"
]
];
