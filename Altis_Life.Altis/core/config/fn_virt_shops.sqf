/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["heroinp","marijuana"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe"]]};
	case "fishmarket": {["Agia Marina Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
};