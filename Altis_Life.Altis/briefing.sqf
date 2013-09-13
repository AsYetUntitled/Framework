waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["sealteamsloth","Seal Team Sloth"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["policerules","Police Procedures/Rules"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegal Activity"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Controls"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/

// Server Section
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life Version 1.B",
				"
				Removed: Search ability of cars since full feature not yet implemented (to solve desync).<br/><br/>
				Removed: No longer require a gang license to view/create a gang.<br/><br/>
				Added: Server-side Cleanup for impounded cars every hour.<br/><br/>
				Changed: Merged Cop/Civ Sessions into one session to prevent exploits.<br/><br/>
				Added: Service Station for Helicopters.<br/><br/>
				Added: New action for healing with FAKs without a weapon (ITS IN RED).<br/><br/>
				Added: Doctor named Alan to fully heal you, for a price.<br/><br/>
				Changed: Price for turtles increased to $15,000 per turtle.<br/><br/>
				Changed: Helicopter prices increased.<br/><br/>
				Changed: Civilians can now be busted out of jail via chopper.<br/><br/>
				Changed: Price adjustments to the general store.<br/><br/>
				Fixed: Bug in arresting system giving multiple timers.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life Version 1.Ba",
				"
					Added: Wearing backpacks now increase carrying weight items.<br/>
					Changed: Adjusted prices at general store.<br/>
					Added: Diving Gear at cop shop.<br/>
					Changed: More of the backend to reduce desync.<br/>
					Added: The ability to use processed heroin.<br/>
					Added: Toolkits can now be used to repair cars.<br/>
					Added: Civilian Service Truck to refuel/repair other vehicles.<br/>
					Changed: Reduced Cop starting bank money to same as civilian to prevent exploits.<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Stratis Life Version 1.Bc",
				"
					Changed: Vehicles should no longer spawn with grenades/items.<br/><br/>
					Added: Wanted system is now implemented.<br/><br/>
					Added: Cop Diving suit changed.<br/><br/>
					Added: Bank robbers can now be identified when they are search or killed within 5 minutes of robbing the bank. The money is returned to the bank when they are identified<br/><br/>
					Added: Cop Siren functionality now implemented.<br/><br/>
					Changed: Attempts made to fix helicopters blowing up after unimpounding them (cannot reproduce so won't know if it actually works).<br/><br/>
					Fixed: Players that are stunned should no longer sync into the ground on surfaces not on ground level.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Stratis Life Version 1.Bd",
				"
					Fixed: Adjustments to jailing system to fix people escapping jail through suiciding.<br/>
					Added: Simple Bail System implemented, you can now pay your bail to get out of jail. (WIP)<br/>
					Changed: Hit an run wanted condition changed.<br/>
					Changed: Adjustments to take_money action to try and prevent dupes.<br/>
					Fixed: Sometimes picking up oil or heroin wouldn't actually give you the item.<br/>
					Changed: Ifrit prices changed at terror car shop to $250,000<br/>
					Changed: Server-side Cleanup Scripts have been adjusted to reduce lag.<br/>
					Changed: Impounded vehicles will be deleted every 30 minutes to reduce desync.<br/>
					Added: Items dropped and weapons/items on the ground are deleted every 30 minutes to reduce desync.<br/>
					Changed: Mission is now branded with STS Logo with Mission Version in bottom right screen. (Did I really say branded like its some type of cattle?)<br/>
					Changed: Increased income for impounding vehicles.<br/>
					Changed: Fast Time Module adjusted, clients sync to the server every 30 minutes. May reduce FPS lock.<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Stratis Life Version 1.Be",
				"
					Fixed: Cops didn't receive bounty from killing/arresting a wanted criminal.<br/>
					Changed: Money system is different, you can no longer 'drop' money, instead you select the nearest person near you (like the key chain).<br/>
					Changed: Shifted Bank withdraw/desposit buttons around and made the buttons bigger because the w in withdraw was cut off from smaller resolutions. (seriously, its 2013 get a 1920x1080 monitor).<br/>
					Fixed: When buying a backpack, then buying another backpack type your weight level didn't adjust.<br/>
					Added: Civilian clothes to the General store.<br/>
					Added: Another General store at Old Outpost.<br/>
					Added: Market near Gun Store<br/>
					Changed: Disabled TPW Houselights for a test in performance.<br/>
					Fixed: Extreme off-sync in the time system from a change.<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Stratis Life Version 1.Bf",
				"
					Fixed: Cops couldn't restrain/arrest civilians that were excessively killing (engine bug oversight).<br/>
					Changed: Wanted list should no longer display people not connected.<br/>
					Added: Delivery jobs are now added as a task so you can keep track of which delivery job you are doing by pressing J.<br/>
					Changed: Delivery Job completion, failed and accepted notifications changed to be nicer?<br/>
					Fixed: Cops should no longer be added to the wanted list for killing someone.<br/>
					Added: New wanted level for killing people with explosives, classified as a 213 (Use of illegal explosives).<br/>
					Removed: Black Market at Girna<br/>
					Changed: Moved Market at Kamino to Girna.<br/>
					Added: Doctor to Girna.<br/>
					Changed: Moved ATM at Radio towers to Girna.<br/>
					Added: Boat shop at Kamino.<br/>
					Changed: Slightly moved North East turtle poaching.<br/>
					Changed: Bergen backpack price changed to $8,000.<br/>
					Changed: Kitbag backpack in general store changed to $5,000<br/>
					Changed: Cop Backpacks prices balanced.<br/>
					Changed: When a cop picks up an illegal item it is moved to 'Evidence' and a reward is given.<br/>
					Changed: Removed three types of civilian clothes from the general store due to them being the exact same.<br/>
					Changed: Default bail price increased to $3,500.<br/>
					Changed: Cop sirens can longer be turned on unless you are the driver.<br/>
					Changed: Additional checks added in to prevent Siren spamming.<br/>
					Changed: Chucked old Bank robbing system and completely revamped it.<br/>
					Changed: Chucked old system for vehicle coloring and replaced with new and improved to reduce desync.<br/>
					Changed: Converted the item inventory usage over to the same way as money to prevent duping.<br/>
					Added: Speedboat with minigun to cop boat shop.<br/>
					Added: New cop license called (Coast Guard) required to get Speedboat from Cop boat shop.<br/>
					Added: Civilians can now drop a fishing net in the water while in a boat to catch fish from the boat.<br/>
					Added: When searching a civilian, illegal items will be removed and a bounty will be collected and they are arrested automatically.<br/>
					Added: Cops can now ticket players, if a cop is abusing the ticket system please report to admin.<br/>
					Fixed: Cops could impound buildings (lol).<br/>
					Changed: Cops can now see weapons hidden in uniforms/vests of players while searching them.<br/>
					Changed: MXM reduced to $30,000 due to it no longer being 7.62mm<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Stratis Life Version 1.Bg",
				"
					Removed: ATV color options Blue,White,Red,Black and woodland due to missing texture files from newest game update.<br/>
					Changed: Adjustments to the jailing system (can't remember what).<br/>
					Changed: Adjustments to the bank robbing system.<br/>
					Fixed: Classname for 7.62mm magazines was changed in arma 3 update 0.58<br/>
					Changed: Price of speedboat increased to $100,000<br/>
					Changed: Price of Ifrit changed to $200,000<br/>
					Added: SDAR to Cop Shop.<br/>
					Changed: Adjustments to Arresting / Restraining.<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Stratis Life Version 1.Bh",
				"
					Added: Fish Market to Agia Marina and Girna, specifically for fish.<br/>
					Added: Girna Sheriff Department, exclusively for Admins. Sorry ;)<br/>
					Added: Girna as a hub. It now have about everything Agia has, including a gas station!<br/>
					Added: Taxi stands to various parts of the map, sends a message to everyone. Don't abuse this!<br/>
					Added: Items: Turtle Soup @ Wong's, Cannabis, Marijuana, Coffee, and Donuts.<br/>
					Added: Police checkpoint at old outpost intersection.<br/>
					Added: Police Checkpoint 2.<br/>
					Added: An extra car spawn point in Agia Marina and the cop base.<br/>
					Added: Some announcements at places that seem relavent.<br/>
					Added: Temporary free refuel and repair at the gas stations.<br/>
					Moved: Bank to Air Station Mike, and made it a government complex.<br/>
					Moved: Everything around in Agia Marina, besides a couple shops.<br/>
					Moved: Oil field and oil processing.<br/>
					Moved: Gang Area 3.<br/>
					Changed: Terror base to Rebel Base (Echo Base), replacing terrorists for rebels.<br/>
					Changed: License shop name to DMV.<br/>
					Changed: Map markers to use more relavant icons.<br/>
					Changed: Bank robbery system.<br/>
					Changed: Bank robbery now takes 3 minutes, but robber will now be able to move within 20m of safe.<br/>
					Changed: Bank robbery success amount capped at 5,000,000, if the bank has that much.<br/>
					Changed: Economy, pretty much all prices changed, not final.<br/>
					Fixed: Escaping from jail glitch (hopefully, reminder: exploiters get banned.)<br/><br/>
					
					Added: Cop helicopter shop to Girna<br/>
					Added: Impound lot at the cop HQ for cops.<br/>
					Added: Bergen Sage Backpack for the cops.<br/>
					Added: Thanks to the generosity of the Girna Sheriffs Department, the Stratis Police now have a new and improved High Security Prison. Hopefully the police won't let prisoners escape so easily now.<br/>
					Removed: a few lights at the police checkpoints 1 and 3.<br/>
					Fixed: Kamino Car Shop should work properly.<br/>
					
					
					
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Stratis Life Version: 1.Bi",
				"No fixes were implemented, the only thing new is a save system, yes you are reading this correctly... Your stuff is saved even when the server restarts.<br/>
				Now here are some cons of the new system, it does not track what gang you were in nor does it track the vehicles you owned so once you relog those are lost.<br/>
				This system is expected to be tweaked to fit the play style accordingly so also expect the prices of things to change a lot and be reduced to a more realistic economy.<br/>"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Stratis Life Version: 2",
				"Updated classnames and command changes for beta.<br/>
				Added: New Intro<br/>
				Added: Remove button to inventory so you can get rid of unwanted items.<br/>
				Added: Civilian Truck License and Shop (Beta trucks!)<br/>
				Added: Messaging System [Cell Phone] Message your friends, call for police, etc.<br/>
				Added: Second helicopter spawn at airport<br/>
				Added: Donator shop, see forums for more details.<br/>
				Added: Unarmed kill notification. If you kill someone who is unarmed it will tell everyone, and you have to comp them.<br/>
				Added: Basic items to the market, like map.<br/>
				Added: Taxi colored, brightly, offroad to the vehicle shop. Listed as 'Taxi' under color. To be better implemented next update.<br/>
				Changed: Bank Robbery system, again. <br/>
					- Time to rob increased to 5 mins<br/>
					- Time after success increased to 20 mins<br/>
					- Robbable money capped at 500k<br/>
					- A new system is planned for the next update.<br/>
				Changed: New model for money: Silver Briefcase<br/>
				Changed: New model for water: Plastic water bottle<br/>
				Changed: New model for coffee: RedGull can<br/>
				Changed: Put a $10k price back on for creating gangs, cash sink.<br/>
				Changed: Lowered the price of Delivery missions by $1/m<br/>
				Changed: Lowered tax for transfering money<br/>
				Fixed: Unimpounding helicopters should no longer blow up<br/>
				Fixed: Vehicle spawns, nvm thought these were fixed. Just stop spamming the buy button noobs.<br/>
				Fixed: The ability to spam some buttons resulting in unintended things.<br/>
				Fixed: Doctor saying he wants $50 but actually charges $500. He should now take the $50.<br/>
				Fixed: Repairing a vehicle with a toolkit will now refuel the vehicle until we add gas cans next update.<br/>
				Fixed: No longer able to give money if you just robbed the bank...silly criminals.<br/>
				Fixed: Vehicles spawning with items in their inventory<br/>
				Removed: Players starting with glasses. Gives the shop some more use.<br/>
				Bug: Because of a change in beta, some NPC's are sporting new shades.<br/><br/>


				Cop Stuff:<br/>
				Added: Cop whitelist to some slots. Apply for cop on forums.<br/>
				Added: Radar, press L to get the speed of a vehicle.<br/>
				Added: Whitelisted cop shops.<br/>
				Added: Ability to 'Search' a vehicle to see the owner(s). Reactivated feature.<br/>
				Added: Food vendor to cp2<br/>
				Changed: Checkpoint 2 and 3 upgraded.<br/>
				Changed: Non-whitelisted cop slots do not get automatic rifles or Hunters.<br/>
				Changed: Whitelisted officers get more diverse selection of items.<br/>
				Changed: Ka-60 replaced with Ghosthawk, only purchasable by high ranking officers.<br/>
				Changed: Arrest System. You now have to escort prisoners to the jail. System may have some bugs, please report.<br/>
					-May be an issue where you have to enter the driver seat, then exit to be able to put them in the vehicle.<br/>
				Fixed: Cap to tickets, should no longer be able to give $900 billion tickets.<br/><br/>



				Rebel Stuff:<br/>
				Added: Three secret [unmarked] rebel bases.<br/>
				Added: Border to souther tip of Stratis. High Rebel Activity!<br/>
				Added: A recruiter that shall remain uncamped, so you can get basic gear.<br/>
				Secret Base 1: Added exclusive weapon: EBR<br/>
				Secret Base 2: Added exclusive vehicle: Armed Speedboat<br/>
				Secret Base 3: Added exclusive vehicle: Ifrit<br/>
				Echo Base: Exclusive weapon: Explosives<br/>
				New bases can be captured by gangs/groups and 'camped', enticing war to take them over and get the exclusive benefits.<br/><br/>

				Government Stuff:<br/>
				Due to increased rebel activity and rule breakers, the Sheriff's Department has been disbanded. The Sheriffs were sent to a training facility off the island and sent back to Stratis as Federal Agents with new tools to help protect those on Stratis.<br/>
				Goverment agents can be identified by their black clothes and black vehicles. Agents are also Admins.<br/><br/><br/>
				
				Hotfix 1:<br/>
				Fixed: Whitelist for cops?<br/>
				Fixed: No longer spawn with a truck license.<br/>
				Fixed: Turned off global.<br/>
				Removed: Debug announcement after an unarmed person is killed.<br/>
				Added: This changelog.<br/>
				Fixed: Do cars still spawn with inventory?<br/>
				Fixed: Cell phone said Message instead of Message Police/Message Admins.<br/>
				Fixed: Whitelisted high ranking cops can buy a hunter too.<br/>
				Fixed: Properly increased bank robbery to 5mins, instead of forgetting and keeping it at 3mins.<br/>
				Fixed: Bank? I hate the damn bank. If it breaks, go do something else.<br/>
				Fixed: vehicle color jip issue.<br/>
				Fixed: Some network lag/desync issues<br/>
				Added: Tonic has implemented nametags over peoples heads. Press Y and go to Settings to turn tags on. Tags can be seen in a ~10m radius and only people who your character can see.<br/>
				Fixed: COP SIRENS LOUDER!<br/>
				Fixed: Pilots license charging more than they say!<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.0.1",
				"
				Fixed: Players sending everyone money/items across the map.<br/>
				Fixed: Some players couldn't be restrained / escorted.<br/>
				Changed: Server-side code that you don't need to know about but this is a place holder.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.1",
				"
					Changed: Entire saving system is being converted over to a database backend.<br/>
					Changed: White listing functionality is being changed over to the database backend.<br/>
					Added: Sync Data button to the player menu so players can forcibly sync their information to the server, this can only be used once every 5 minutes.<br/>
					Added: Player information is synced automatically to the server every 15 minutes.<br/>
					Changed: Civilians can not 'abort' or 'respawn' while they are restrained, being escorted or transported by a police officer.<br/>
					Changed: Civilians being transported/escorted no longer become automatically unrestrained.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.1.1",
				"
					Changed: Adjustments to the saving system<br/>
					Fixed: Cops could 'Escort' buildings and cars.<br/>
					Changed: Wanted menu functionality was changed to help reduce network usage.<br/>
					Fixed: Side channel would be turned off when a player dies.<br/>
					Added: FPS Monitor on the HUD.<br/>
					Fixed: Cops could 'Escort' the AI.<br/>
					Removed: Some server-side stuff that is no longer in use.<br/>
					Fixed: Donator shop is now fixed and ready for use.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.1.2",
				"
					Changed: Overhauled jail system.<br/>
					Changed: More adjustments to the wanted system after previous overhaul.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.1.3",
				"
					Fixed: Cops couldn't arrest civilians<br/>
					Fixed: Civilians wouldn't become unwanted when killed.<br/>
					Fixed: Cops wouldn't receive any type of a bounty for killing / arresting wanted civilians.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.1.3.1",
				"
					Added: Cop SDAR is a stun rifle.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.2",
				"
					Fixed: Offroads wouldn't color them selves properly.<br/>
					Changed: Cleanups in Escorting and Transporting to correct issues.<br/>
					Changed: Cleanups in bank robbery to fix some issues.<br/>
					Changed: When stunned the current magazine is emptied from the gun.<br/>
					Changed: Civilian helicopters are actual civilian helicopters that only support 3 seats (excluding the pilot).<br/>
					Changed: Prices adjusted for civilian helicopters and Rebel helicopters.<br/>
					Fixed: When in jail and respawn / die you didn't go back to jail.<br/>
					Fixed: Couldn't pay bail.<br/>
					Added: Admins can now unwant / pardon wanted criminals. Admins can only do this to prevent abuse.<br/>
					Added: When paying a ticket equal to or greater then your bounty (if wanted) it is removed.<br/>
					Added: Ability to hold a chemlight in your hand.<br/>
					Changed: Smoothed out the stunned animation set.<br/>
					Changed: Action order of restrain set to top most selection.<br/>
					Changed: General Store and other stores have been adjusted to include new stuff.<br/>
					Changed: Weather patterns were changed adding a bit of wind and clouds.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.2.1",
				"
					Changed: When in jail you must first wait 3 minutes before paying your bail.<br/>
					Changed: Removed more bank errors.<br/>
					Fixed: Cops could escort buildings again.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.2.2",
				"
					Added: Civilian clothing store called 'Bruce's Outback Outfits', you can visually see what you are picking. Be warned do not have any guns inside your uniform/clothes when being / previewing.<br/>
					Fixed: Some money exploits between the save system.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.2.3",
				"
					Added: Server-side vehicle cleanup system (WIP).<br/>
					Fixed: The bank can now be robbed.<br/>
					Fixed: Any errors known to me that were caused by the stable build update.<br/>
					Added: New system to try and help client FPS, may help?<br/>
					Fixed: Some server-side scripts for database management.<br/>
					Added: When purchasing gear if you don't have enough room it will tell you and not take your money away.<br/>
					Added: Cops can now see other cops on the map.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Stratis Life v2.2.4",
				"
					Changed: Server-side vehicle cleanup adjusted to help reduce FPS loss.<br/>
					Fixed: More undefined error messages for cops.<br/>
					Fixed: When restrained/transported you can not longer use V to glitch out.<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Definitions", 
				"
				1. In the rules, town/city is refered to as Agia Marina and Girna.<br/>
				2. Important buildings are Bank, Markets, DMV, General Stores, etc.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Exploits", 
				"
				These are considered exploits, and you will not be kicked, but banned. This is your only warning.<br/><br/>

				1. Getting out of jail without paying bail or escaping via helicopter. If you have to do a series of key combinations to glitch out of jail just right, you will be banned.<br/>
				2. Killing yourself to get out of roleplay. Getting out of being tazed, restrained, arrested, jail, etc. If the log shows you got arrested, then you died, you will be banned. Do not pay bail and kill yourself for an easy ride home. Walk you lazy turd.<br/>
				3. Duping items and/or money. If someone sends you an unobtainable amount of money right at the start of the game, report to an admin IMMEDIATELY and transfer said money to an admin. Do this ASAP or an admin could ban you if they see that much on you without question.<br/>
				4. Using clearly hacked items. If a hacker comes in and spawns unobtainable items, you could be banned for using said items. Report the items to the admins immediately and stay away from them.<br/>
				5. Abusing bugs or game mechanics for gain. Is there a replicating gun somewhere? Report it and leave it alone. If an admin catches you abusing the glitch, ban.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Bannable Offenses", 
				"
				There is no warning, no kick, just a ban for partaking in these activities. Consider this your one and only warning.<br/><br/>
				1. Hacking<br/>
				2. Cheating<br/>
				3. Exploiting (See exploits below)<br/>
				4. Being kicked up to 3 times.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Cop Interaction", 
				"
				Items on this list may result in your removal from the server and/or ban. Based on the admins discretion.<br/><br/>
				1. Civilians can be arrested for looking in cops backpacks/vehicles. Constantly doing this will result in your removal from the server.<br/>
				2. Civilians can be arrested for following cops in game in order to give away their position. Civs who constantly follow cops for this reason will be removed from the server.<br/>
				3. Civilians or Rebels who take up arms to kill cops in town or elsewhere for no RP reason will be considered RDMing. See RDMing section.<br/>
				4. Following and or harassing cops for long periods of time will be considered griefing and/or spamming, and will result in your removal from the server.<br/>
				5. Actively blocking cops from doing their duties can lead to your arrest. Constantly doing this will result in your removal from the server.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Boats", 
				"
				Items on this list may result in your removal from the server and/or ban. Based on the admins discretion.<br/><br/>
				1. Constantly pushing boats without permission. Consistently.<br/>
				2. Pushing a boat with the intention of hurting or killing someone. This is not RP, it is just a flaw in the mechanics.<br/>
				3. Purposefully running over swimmers/divers.<br/>
				4. Stealing a cop speedboat in order to shoot into the town/airport. Also counts as RDMing.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviation", 
				"
				Items on this list may result in your removal from the server and/or ban. Based on the admins discretion.<br/><br/>
				1. Purposefully ramming a helicopter into anything. Other helicopters, vehicles, buildings.<br/>
				2. Flying below 500m over the city constantly. Once is illegal, more than that you risk crashing into the city, thus against server rules.<br/>
				3. Stealing helicopters without proper warning and significant time for the driver to lock the vehicle. If they land and run away without locking, fine, if they just get out and you get in before they get a chance to lock it, no no.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Vehicles", 
				"
				Items on this list may result in your removal from the server and/or ban. Based on the admins discretion.<br/><br/>
				1. Purposefully running people over. There are accidents, and then there is going out of your way to run someone over.<br/>
				2. Purposefully throwing yourself in front of vehicles in order to die/get hurt.<br/>
				3. Ramming into other vehicles in order to cause an explosion. (Including helicopters!)<br/>
				4. Constantly trying to enter vehicles that do not belong to you in order to grief the vehicle owner, and not trying to RP.<br/>
				5. Stealing a vehicle just to crash it or drive it into the water.<br/>
				6. Purchasing multiple vehicles for the purpose of doing any of the above.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Communication Rules", 
				"
				Items on this list may result in your removal from the server and/or ban. Based on the admins discretion.<br/><br/>
				1. Global Chat is to only be used for emergencies and warnings.<br/>
				2. Excessive use of global will result in your removal.<br/>
				3. Spamming any chat channel will result in your removal.<br/>
				4. Teamspeak channels are split up into areas for a reason. Cops must be in the cop channels at all times.<br/>
				5. Civilians cannot be in any cop channels on teamspeak in order to gather information on their location or movements. Civs caught doing this will be removed the channel. Repeat offenders can be kicked or banned from both the game and teamspeak.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatching", 
				"
				Items on this list may result in your removal from the server and/or ban. Based on the admins discretion.<br/><br/>
				1. Killing anyone without a roleplay cause.<br/>
				2. Declaring a rebellion is not a cause to kill anyone, even cops.<br/>
				3. Cops and civilians/rebels can only commence in a shootout if there are reasons relating to a crime.<br/>
				4. If you aren't part of the crime, and don't want to die, run away. You will not be considered RDM'd if you think it's a good idea to stand in a bank with armed robbers while a robbery is in progress. Get the hell out, or accept your death.<br/>
				5. Killing someone in an attempt to protect yourself or anothers, is not RDMing.<br/>
				6. Murdering someone because they don't give you $10 or something, would probably be considered RDMing. Injure them maybe, don't kill them, unless your life is in danger.<br/><br/>
				These are all on a case by case basis, and shall be judged by admins.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"New Life Rule", 
				"
				Items on this list may result in your removal from the server and/or ban. Based on the admins discretion.<br/><br/>
				1. If you are killed by a cop or an enemy gang member/rebel you get unwanted.<br/>
				2. If you are killed by anyone else you are still wanted.<br/>
				3. If you die, you cannot seek revenge.<br/>
				4. If you are RDM'd, it is not a new life.<br/>
				5. If at any point you hit respawn, it is not a new life.<br/>
				6. If you are being chased, or anything that results in your ACCIDENTAL death because of a cop/gang/rebel, that is a new life.<br/>
				7. If you purposefully kill yourself to get out of a situation, it is not a new life.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Don't Be A Dick!", 
				"
				1. If an admin has to tell you that you are being a dick, you are doing dickish things.<br/>
				2. Causing others grief.<br/>
				3. Disrupting Roleplay.<br/>
				4. The list goes on.<br/>
				5. Just don't be a dick okay?<br/>
				6. It is up to an admin to decide if you are a dick or not.<br/><br/>
				"
		]
	];
	
	
	
// Seal Team Sloth Section

	player createDiaryRecord ["sealteamsloth",
		[
			"Teamspeak",
				"
				Seam Team Sloth Teamspeak can be found at:<br/><br/>
				ts3.sealteamsloth.com:8027<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Website/Forums",
				"
				http://sealteamsloth.com<br/>
				This is also where ban appeals will be made.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Wiki",
				"
				http://sealteamsloth.wikia.com/<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Donations",
				"
				Donations keep the server running, anything and everything helps.<br/>
				Donate securely with PayPal<br/><br/>
				donate@sealteamsloth.com<br/><br/>
				"
		]
	];
		
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Contracting",
				"
				1. High ranking members of the police force may hire or contract an individual or group of individuals to help with police operations or serve as a guard at important locations (i.e. Bank Guard)<br/>
				2. Contracts last until the ranking officer wants to end the contract.<br/>
				3. Contracts persist through contractor death, unless the contract is cancelled before death of a contractor.<br/>
				4. The officer may authorize the use of illegal weapons or vehicles for contractor use, which will remain in effect up until the contract is ended and the contractor has died.<br/>
				5. The ranking officer must negotiate a contract price and pay out at least half before, and half after the contract. Hiring a contractor, who follows the law, without paying will result in a demotion for the hiring officer.<br/>
				6. Any contractor who breaks the law during the contract, will be immediately terminated from the contract and shall be arrested, unless Lethal Force is needed.<br/>
				7. Depending on the situation, any contractor who breaks the rules/laws during a contract will be subject to a removal from the server by a kick or ban.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Counter-Resistance",
				"
				1. Any person who rebels or commits a rebellious act is considered a wanted criminal.<br/>
				2. Anyone found wearing rebel clothing, or driving rebel vehicles are considered rebels.<br/>
				3. Lethal force may be used against rebels if they pose an immediate threat.<br/>
				4. RDMing rules apply to both cops and rebels in this situation.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Bank Robbery",
				"
				1. If the bank is getting robbed, all available officers must move in to stop it.<br/>
				2. Patrolling officers should immediately run to the bank to assist, petty crimes can be dropped during a bank robbery.<br/>
				3. Due to current game mechanics, lethal force on bank robbers may be used if no other alternative is available. Every option to taze and arrest the person should be made first.<br/>
				4. The police should evacuate the civilians from the building during a robbery.<br/>
				5. Any civilian who actively makes an attempt to block the police from entering the building may be tazed and arrested, or killed if necessary.<br/>
				6. Once the bank robbery is over and the area is secure, all cops should leave the area and resume patrols within 5 minutes.<br/>
				7. Supervisory officers may hire individuals or contract a group of people to work as security guards for the bank.<br/>
				8. See Contracting section for more information.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Avaition",
				"
				1. No helicopter can land within city limits without authorization from the highest ranking officer online. (Exception being what is listed below.)<br/>
				2. The helipad on the docks is a legal area for helicopters to park at.<br/>
				3. The helipad can be closed off for a short amount of time during a police operation, but it cannot remain closed for a long period of time.<br/>
				4. Helicopters are allowed to land in the field/hills north of the radio tower.<br/>
				5. Helicopters cannot fly below 500m over the city without authorization.<br/>
				6. Helicopters, Civilian and Cop, cannot hover over the city. Cops may only hover over the city if there is an active police operation going on.<br/><br/>
				7. Helicopters may not land on roads.<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Illegal Areas", 
				"
				1. Illegal areas are marked for civilian sake, not for cops.<br/>
				2. Gang areas are not considered illegal. Thus a cop may enter without a raid, but may not restrain or stop anyone inside without probable cause/illegal activity. (Talking to the gang NPC is NOT probable cause/illegal activity.)<br/>
				3. Do not enter an illegal area unless it is part of a raid. see Raiding/Camping.<br/>
				4. If you chase someone into an illegal area, call for backup.<br/>
				5. Under no circumstances is an officer allowed to camp any illegal area.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrolling", 
				"
				1. A cop may patrol the island's roads and towns searching for abandoned vehicles and criminal activity.<br/>
				2. Patrols can be done on foot inside of a town, or in a vehicle when outside.<br/>
				3. Patrols do not include illegal areas. See Raiding/Camping.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
				Cops are encouraged to setup checkpoints in strategic areas to help combat illegal activity and promote safety on the road.<br/><br/>
				1. A checkpoint must consist of 3 or more officers, utilizing 2 or more vehicles. An ATV does not count as one of the required vehicles, but may still be used.<br/>
				2. A checkpoint can not be setup within 300m of an illegal area. Basically, you cannot set one up on top of an illegal area.<br/>
				3. Checkpoints may only be setup on roads, but it does not have to be on a crossroad.<br/>
				4. Checkpoints do not have to be marked on the map.<br/><br/>


				Proper Checkpoint Procedure:<br/>
				1. Have the driver stop the vehicle at a safe distance and turn off the engine.<br/>
				2. Ask the driver and any passengers if they have any weapons. (If they say yes, do not immediately restrain them when they get out, tell them to lower their weapons and given them a reasonable amount of time to do so.)<br/>
				3. Ask the driver and any passengers to exit the vehicle.<br/>
				4. Ask them where they are headed.<br/>
				5. Ask if they will submit to a search.<br/>
				6. If they allow a search, you may restrain them and search them.<br/>
				7. If they do not submit to a search, you must let them go, unless there is probable cause.<br/>
				8. After the search is done, you may allow them to re-enter their vehicle and drive away.<br/>
				9. In case anything illegal is found, the person may be ticketed or arrested depending on the crime.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Vehicle", 
				"
				1. Vehicles in the parking lot, or are reasonably parked elsewhere should be left alone.<br/>
				2. Vehicles that look abandoned, broken, with no driver, can be impounded.<br/>
				3. Boats should be parked reasonably on shore.<br/>
				4. Any vehicle that hasn't moved in a significant amount of time may be impounded.<br/>
				5. Impounding is an essential job for a cop, it helps keep the server clean and less laggy.<br/>
				6. Police speedboats may be used to assist in emergencies in town. However, they may not remain in the bay after the situation has ended. Use of Force applies, do not randomly shoot up buildings, confirm targets.<br/>
				7. Police speedboats may be used to assist in the disabling of illegal vehicles, the mini-gun should be used to disable the vehicle, not to blow it up.<br/><br/>
				
				Illegal vehicles are known to be owned by rebels, and in such cases use of force is authorized to try and disable the vehicle so officers may move in to make an arrest.<br/><br/>

				Illegal Vehicles:<br/>
				1. Ifrit<br/>
				2. Ka-60 (Rebel Model)<br/>
				3. Littlebird (Rebel Model)<br/>
				4. If a civilian is in control of the following police vehicles without authorization:<br/>
				5. Speedboat<br/>
				6. Hunter<br/>
				7. Police Offroad<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Agia Marina Protocol", 
				"
				1. Officers may patrol Agia Marina.<br/>
				2. Officers may stop by the car shop to make sure there are no cars that need to be impounded.<br/>
				3. Officers may enter the town to deal with emergency situations.<br/>
				4. Officers may not stand around or loiter in town.<br/>
				5. Any officer found standing around without proper cause will be removed from the server.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arresting and Ticketing",
				"
				Arresting should be done to criminals who are considered a danger to themselves or others.<br/><br/>

				1. You may not arrest someone if you have given them a ticket and they paid it.<br/>
				2. You must tell the suspect why they are being arrested before you arrest them.<br/>
				3. If a civilian is wanted, you may arrest them. Do not kill them, unless the situation falls under the 'Use of Lethal Force' section.<br/><br/>


				Ticketing a civilian is considered a warning for the civilian. If they break a law, but do not pose a threat to anyone, you may ticket a civilian.<br/><br/>

				1. Tickets must be a reasonable price.<br/>
				2. Ticket prices should be based off of the crimes committed.<br/>
				3. Refusal to pay a legit ticket is grounds for arrest.<br/>
				4. Giving a civilian and illegitimate ticket, such as $100k for speeding, etc., is not allowed and will result in your removal from the police department.<br/><br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Illegal Weapons with or without Permit", 
				"
				A cop is NEVER allowed to supply civilians with weapons. This will get you banned from the server and removed from being a cop.<br/><br/>

				Legal Weapons for Civilians to carry with a permit:<br/>
				1. P07<br/>
				2. Rook<br/>
				3. SDAR<br/><br/>

				Any other weapon (Including Silenced P07 [Considered a Police Weapon]) is illegal.<br/><br/>

				1. Civilians are not allowed to have a weapon out within the town limits.<br/>
				2. Civilians may have a gun out when they are not in the town. However they should submit to a license search only when confronted by an officer and should have the gun lowered (Press Ctrl Twice).<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Use of Non-Lethal Force",
				"
				At this time the Taser (Silenced P07) is the only form of Non-Lethal Force.<br/><br/>

				1. Taser should be used to incapacitate non complying civilians in order to restrain them.<br/>
				2. Do not discharge your Taser unless you intend to incapacitate a civilian, randomly discharging your weapon will result in your suspension.<br/>
				3. Only use your Taser in compliance with the laws and the rules, do NOT enforce your will on others.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Raiding/Camping",
				"
				Raiding is defined as a squad of police officers invading an area of high criminal activity in order to stop the criminals in illegal acts.<br/><br/>

				1. In order to raid an area, the cops must have at least 4 officers involved, one of which must be a supervisor.<br/>
				2. At the start of a raid, an officer must announce on global that they are raiding the area and for all civilians present to comply.<br/>
				3. All civilians in a raid area may be restrained and searched. If nothing illegal is found, you must let them go.<br/>
				4. If illegals are found during a search, you may proceed to arrest them.<br/>
				5. Lethal force is only authorized if the situation falls under 'Use of Lethal Force'.<br/>
				6. After the area is secure, the officers must leave the area.<br/>
				7. An area cannot be raided again for 20 minutes after a previous raid.<br/>
				8. If the raid is a failure (All officers die), the 20 minute timer still applies to those officers.<br/>
				9. Backup may be called in, but it may not consist of fallen officers (New Life).<br/><br/>

				Camping is defined as the prolong stay of an officer in an area.<br/><br/>

				1. Checkpoints are not considered camping. See Checkpoint section for a definition of proper checkpoint procedures.<br/>
				2. See Bank Robbery and Agia Marina Protocol sections for more info on camping in the main town.<br/>
				3. Camping of illegal areas is staying longer than needed after a raid, or if officers do not conduct a raid but continue to watch and take action against civilians entering the area.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Chain of Command",
				"
				The highest ranking officer on duty is in charge of the police force outside of admins currently online. The high ranking officer is expected to follow the rules and guidelines of his/her rank, and must report to the admin in case any action need be taken.<br/><br/>

				Police Chain of Command:<br/>
				1. Captain<br/>
				2. Lieutenant<br/>
				3. Senior Sergeant<br/>
				4. Sergeant<br/>
				5. Corporal<br/>
				6. Officer<br/>
				7. Cadet<br/><br/>

				Cops in game who are not enrolled/accepted into the SPD are the lowest tier and have no say in police operations.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Use of Lethal Force",
				"
				1. Use of Lethal force is only permitted for the protection of your life, another officers life, or a civilians life, if and only if non-lethal force would not be effective.<br/>
				2. Discharging of a weapon when not under threat or not during training exercises is not allowed. Officers caught in violation of this rule will be removed from the server and suspended from the SPD.<br/>
				3. Failure to follow proper weapons discipline and procedure will get you removed from the server and suspended from the SPD.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Teamspeak Rule",
				"
				1. All cops must be on Teamspeak 3 in a designated cop channel. Failure to be on Teamspeak during an admin check will result in your immediate dismissal from the server.<br/>
				2. Please join Teamspeak BEFORE you spawn in as a cop, heck, join Teamspeak before you even join the server.<br/><br/>
				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebel Rules",
				"
				A rebel is one who rises in armed resistance against a government. In this case it would be the police. However, due to the small amount of police compared to the possible amount of rebels, do not attack the police without a reason, please be civil and use common sense, and don't take the word rebel literally, but instead how it will make this server fun for all.<br/><br/>
				1. A rebel must first form a gang, and then declare intentions.<br/>
				2. Resistance does not excuse RDMing (See RDMing in General Rules)<br/>
				3. Resistance should be role-played in more ways than constantly robbing the bank.<br/>
				4. Resistance must be coordinated.<br/>
				5. A PROPER reason must be behind each and every attack.<br/>
				6. The use of explosives is permitted by rebels, however may not bomb important buildings (See Definitions section of the general rules)<br/>
				7. Do not randomly place explosives on the road without the intention of using it against the police in a coordinated attack. RDMing will apply.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Gang Rules",
				"
				1. Being in a gang is not illegal. Only when illegal crimes are committed.<br/>
				2. Being in a gang area is not illegal. Only when partaking in illegal activities.<br/>
				3. Gangs may hold and control gang areas. Other gangs may attack a controlling gang to compete for control of a gang area.<br/>
				4. To declare war on another gang, the leader must announce it in global and all gang members of both gangs must be notified. For a more long term gang war, a declaration should be made on the forums.<br/>
				5. Gangs may not kill unarmed civilians, unless said civilian is part of a rival gang and in your gangs controlled area.<br/>
				6. Gangs may not kill civilians, unless they are under threat. Killing unarmed civilians because they do not comply is considered RDM, but you can injure/damage.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Vehicles",
				"
				A civilian in control of the following prohibited vehicles is subject to the consequences defined in the unauthorized control of a prohibited vehicle law.<br/><br/>

				1. Ifrit<br/>
				2. Ka-60 (Anything but the white civilian model)<br/>
				3. Littlebird (Anything but the white civilian models)<br/>
				4. Speedboat<br/>
				5. Hunter<br/>
				6. Police Offroad<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Weapons",
				"
				A civilian in possession of the following is subject to the consequences as defined in the illegal possession of a firearm law.<br/><br/>

				1. MX Series<br/>
				2. Katiba Series<br/>
				3. TRG Series<br/>
				4. EBR<br/>
				5. Silenced P07 (Taser)<br/>
				6. Any explosives<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Items",
				"
				The following items are illegal to posses:<br/><br/>
				1. Turtle<br/>
				2. Heroin<br/>
				3. Marijuana<br/><br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				"
		]
	];