if (isServer) then {
	BIS_randomSeed1 = [];
	BIS_randomSeed2 = [];
	_this setVariable ["BIS_randomSeed1", 3, TRUE];
	_rnd2 = floor random _headCount;
	_this setVariable ["BIS_randomSeed2", 0, TRUE];
};