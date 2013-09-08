/*
	@file Version: 1a
	@file name: vars.sqf
	@file Author: TAW_Tonic
	@file edit: 5/3/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/

//Calulate starting player base and times it by 1000 dollars to give initial bank funding.
serv_bank_funds = (count playableUnits) * 100;

//Selling Prices
life_sell_salema = 45;//20
life_sell_ornate = 40;//15
life_sell_mackerel = 175;//45
life_sell_tuna = 700; //150
life_sell_mullet = 250; //15
life_sell_catShark = 300;//100
life_sell_rabbit = 40;//50
life_sell_apple = 70;//20
life_sell_oil = 1100;//200
life_sell_heroin = 1600;//560
life_sell_marijuana = 600;//450
life_sell_turtle = 2000;//2000
life_sell_fishing = 3;//3
life_sell_water = 5;//5
life_sell_coffee = 5;//2
life_sell_turtlesoup = 1000;//50
life_sell_donuts = 60;//10

//Buying Prices (Random each game but always higher then selling prices)
life_buy_apple = 90;
life_buy_rabbit = 160;
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
["marijuana",life_sell_marijuana]
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
["heroinp",life_buy_heroin],
["turtle",life_buy_turtle],
["turtlesoup",life_buy_turtlesoup],
["donuts",life_buy_donuts],
["coffee",life_buy_coffee],
["marijuana",life_buy_marijuana]
];

publicVariable "sell_array";
publicVariable "buy_array";