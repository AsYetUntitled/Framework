/*
	@file Version: 1a
	@file name: vars.sqf
	@file Author: TAW_Tonic
	@file edit: 5/3/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/

//Calculate starting player base and times it by 1000 dollars to give initial bank funding.
life_federal_funds = (count playableUnits) * 750;

life_animals_spawned = false;
life_animals_array = [];

//Selling Prices
life_sell_salema = 45;//20
life_sell_ornate = 40;//15
life_sell_mackerel = 175;//45
life_sell_tuna = 700; //150
life_sell_mullet = 250; //15
life_sell_catShark = 300;//100
life_sell_rabbit = 65;//50
life_sell_apple = 50;//20
life_sell_oil = 3200;//200
life_sell_heroin = 2650;//560
life_sell_marijuana = 2350;//450
life_sell_turtle = 2000;//2000
life_sell_fishing = 3;//3
life_sell_water = 5;//5
life_sell_coffee = 5;//2
life_sell_turtlesoup = 1000;//50
life_sell_donuts = 60;//10

//Buying Prices (Random each game but always higher then selling prices)
life_buy_apple = 65;
life_buy_rabbit = 75;
life_buy_salema = 55;
life_buy_ornate = 50;
life_buy_mackerel = 200;
life_buy_tuna = 900;
life_buy_mullet = 300;
life_buy_catshark = 350;
life_buy_fishing = 8;
life_buy_water = 10;
life_buy_turtle = 4000;
life_buy_heroin = 2500;
life_buy_marijuana = 1750;
life_buy_coffee = 10;
life_buy_turtlesoup = 2500;
life_buy_donuts = 120;

sell_array = [
["apple",life_sell_apple],
["heroinu",1850],
["heroinp",life_sell_heroin],
["salema",life_sell_Salema],
["ornate",life_sell_ornate],
["mackerel",life_sell_mackerel],
["tuna",life_sell_tuna],
["mullet",life_sell_mullet],
["catshark",life_sell_catshark],
["rabbit",life_sell_rabbit],
["oilp",life_sell_oil],
["turtle",life_sell_turtle],
["water",life_sell_water],
["coffee",life_sell_coffee],
["turtlesoup",life_sell_turtlesoup],
["donuts",life_sell_donuts],
["marijuana",life_sell_marijuana],
["tbacon",25],
["lockpick",75],
["pickaxe",750],
["redgull",200],
["peach",55],
["cocaine",3000],
["cocainep",5000],
["diamond",750],
["diamondc",2000],
["iron_r",3200],
["copper_r",1500],
["salt_r",1650],
["glass",1450],
["fuelF",500],
["spikeStrip",1200],
["cement",1950]
];

buy_array = [
["apple",life_buy_apple],
["rabbit",life_buy_rabbit],
["salema",life_buy_salema],
["ornate",life_buy_ornate],
["mackerel",life_buy_mackerel],
["tuna",life_buy_tuna],
["mullet",life_buy_mullet],
["catshark",life_buy_catshark],
["water",life_buy_water],
["turtle",life_buy_turtle],
["turtlesoup",life_buy_turtlesoup],
["donuts",life_buy_donuts],
["coffee",life_buy_coffee],
["tbacon",75],
["lockpick",150],
["pickaxe",1200],
["redgull",1500],
["fuelF",850],
["peach",68],
["spikeStrip",2500]
];

publicVariable "sell_array";
publicVariable "buy_array";

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["Binocular",50],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];

publicVariable "life_weapon_shop_array";

life_garage_prices =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",12000],
	["I_Truck_02_covered_F",14500],
	["B_Truck_01_transport_F",25650],
	["B_Truck_01_box_F", 35000],
	["O_MRAP_02_F",45000],
	["B_Heli_Light_01_F",45000],
	["O_Heli_Light_02_unarmed_F",65000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",7500]
];

publicVariable "life_garage_prices";

life_garage_sell =
[
	["B_QuadBike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",125000],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",65000],
	["B_Heli_Light_01_F",57000],
	["O_Heli_Light_02_unarmed_F",72500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",10000]
];

publicVariable "life_garage_sell";