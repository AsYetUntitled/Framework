/*
	File: fn_sellTurtle.sqf
	
	Description:
	Sells the turtles! Save the turtles!
	This was a super lazy thing to do but I just want to push it...
*/
if(life_inv_turtle == 0) exitWith {
	titleText["You don't have any turtles to sell.","PLAIN"];
};

_price = round(life_inv_turtle * 3000);
if([false,"turtle",life_inv_turtle] call life_fnc_handleInv) then {
	life_cash = life_cash + _price;
	titleText[format["You sold %1 turtle(s) for $%2",round(_price / 3000),[_price] call life_fnc_numberText],"PLAIN"];
};