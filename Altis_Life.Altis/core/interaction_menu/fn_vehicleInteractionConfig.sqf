[
[
	"Hint Car",
	"",
	[1,1,1,1],
    west,
	{
        (alive player)
	},
    "hint 'Hello!!!'"
],

[
	"Hint Car2",
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
	"Hint Car3",
	"",
	[1,1,1,1],
    civilian,
	{
        (alive player)
	},
    "hint 'Hello3!!!'"
]
];
