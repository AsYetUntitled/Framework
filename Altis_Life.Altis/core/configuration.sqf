/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 64; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 64; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Food Variables *******
*****************************
*/
life_eat_Salema = 40;
life_eat_Ornate = 20;
life_eat_Mackerel = 20;
life_eat_Tuna = 100;
life_eat_Mullet = 30;
life_eat_CatShark = 60;
life_eat_Rabbit = 20;
life_eat_Apple = 5;
life_eat_turtlesoup = 62;
life_eat_donuts = 30;

/*
*****************************
********** Licenses *********
*****************************
*/

//Cop Licenses
license_cop_air = false; //Cop Air License
license_cop_swat = false; //Swat License
license_cop_cg = false; //Coast guard License

//Civ Licenses
license_civ_driver = false; //Driver License
license_civ_air = false; //Air License
license_civ_heroin = false; //heroin Processing License
license_civ_marijuana = false; //Marijuana Processing License
license_civ_medmarijuana = false; //Medical Marijuana
license_civ_gang = false; //Gang License
license_civ_boat = false; //Boat License
license_civ_oil = false; //Oil Processing License
license_civ_dive = false; //Diving License
license_civ_truck = false; //Truck License
license_civ_gun = false; //Gun License
license_civ_rebel = false; //Rebel License

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
life_paycheck_period = 5; //Five minutes
life_cash = 0;
life_impound_car = 200;
life_impound_boat = 250;
life_impound_air = 850;
life_istazed = false;
life_my_gang = ObjNull;

//Items
life_inv_oilu = 0;
life_inv_oilp = 0;
life_inv_cannabis = 0;
life_inv_marijuana = 0;
life_inv_heroinu = 0;
life_inv_heroinp = 0;
life_inv_apple = 0;
life_inv_rabbit = 0;
life_inv_salema = 0;
life_inv_ornate = 0;
life_inv_mackerel = 0;
life_inv_tuna = 0;
life_inv_mullet = 0;
life_inv_catshark = 0;
life_inv_turtle = 0;
life_inv_fishingpoles = 0;
life_inv_water = 0;
life_inv_turtlesoup = 0;
life_inv_donuts = 0;
life_inv_coffee = 0;
life_inv_fuelF = 0;
life_inv_fuelE = 0;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 7000; //Starting Bank Money
		life_paycheck = 3000; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 3000; //Starting Bank Money
		life_paycheck = 1000; //Paycheck Amount
	};
};

/*
	Master Array of items?
*/
life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE"
];

//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_medmarijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"]
];

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1500],["heroinp",3500],["marijuana",2000],["turtle",3000]];