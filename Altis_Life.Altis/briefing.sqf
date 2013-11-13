waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["sealteamsloth","Seal Team Sloth"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["policerules","Police Procedures/Rules"];
player createDiarySubject ["safezones","Safe Zones (No Killing)"];
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
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.5",
				"
					Added: Garage functionality, you are now able to store vehicles (so long as you buy a permanent vehicle)<br/>
					Added: More boat shops near the center of the map.<br/>
					Added: More civilian littlebird skin selection.<br/>
					Added: Market to Pyrgos<br/>
					Added: General store to Athira<br/>
					Added: ATM to donator shops and Rebel outposts.<br/>
					Added: Rebel Vehicle Shops and Rebel outposts.<br/>
					Changed: Moved the gun store near Kavala a bit farther away<br/>
					Changed: Adjusted Bruce's Outback Outfits in Kavala so he isn't in a wall.<br/>
					Changed: Realigned the DMV guy in Kavala.<br/>
					Changed: Moved the cocaine field a bit farther north west.<br/>
					Changed: Some other stuff was moved around but I can't remember what.<br/>
					Changed: When cops searches vehicles with drugs they are awarded money from it.<br/>
					Changed: Adjusted the DP Mission structure to try and prevent spamming to exploit the system<br/>
					Changed: When using a item you cannot open the player menu to stop exploits and macros.<br/>
					Changed: Adjusted the donator shop to work in tiers.<br/>
					<br/>
					Notes:<br/>
					The new vehicle storing functionality is a open-beta test. If everything works out fine in the future permanent vehicles will cost more money and getting them from the garage will also cost money. There is no limit of vehicles you can have stored in your garage
					but if you are buying a vehicle just as a 'burner' vehicle then just use the Buy option, only use 'Buy Permanent' from vehicle shops if you truly want it to be stored in the database.<br/><br/>
					If you want to store your permenant vehicle (i.e you are getting off and don't want it to be destroyed or stolen) then you can take it to a garage and store it in your garage. Non-permanent vehicles cannot be stored in garages.
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.4",
				"
					Changed: Repositioned the progress bar calculating the safezone, in short everyone should see it.<br/>
					Changed: The jail timer will now tell you when you are allowed to post bail.<br/>
					Fixed: Bail price was $any (nil).<br/>
					Fixed: Paychecks would say you earned $any but you actually earned something.<br/>
					Added: Donator Shops / Areas<br/>
					Added: Two gun stores have been added back.<br/>
					Changed: PDW at rebel shop swapped for TRG, PDW moved to Gun Store.<br/>
					Added: Heroin is back!<br/>
					Added: Few extra Rebel outposts to prevent camping and douchebags.<br/>
					Added: Ability to repair vehicle at gas pumps for a price, just look at the gas pump and you'll get the action.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.3",
				"
					Fixed: Couldn't pick peaches from the peach field near Athira.<br/>
					Fixed: Cocaine wouldn't show when searching a player / vehicle.<br/>
					Fixed: Using the helicopter service station rapidly would send money into a negative factor.<br/>
					Fixed: When dying during a delivery mission you couldn't get a new mission.<br/>
					Fixed: Cop shops in Athira could get killed.<br/>
					Fixed: Zamak wouldn't texture properly.<br/>
					Fixed: Diamond Training / Processing license should now cost $35,000 as listed.<br/>
					Fixed: Items would disappear from trunk when you take more then you can carry.<br/>
					Fixed: Bounty system should now work again.<br/>
					Removed: Ability to store money in vehicles due to abuse of the system and ARMA's net code.<br/>
					Changed: Moved Truck shop near Pygros to a new location to get rid of spawning issues.<br/>
					Added: Oil Training / Processing license to Oil Trader.<br/>
					Added: Cop whitelist functionality introduced again.<br/>
					Added: Only one person can access the trunk at a time to avoid duping.<br/>
					Added: Reintroduced Server-side cleanup that will run every 45 minutes cleaning up abandon cars, cars with broken wheels or engines along with items dropped.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.2",
				"
					Fixed: Cop Shop NPC's could be killed.<br/>
					Fixed: Drug dealer in NW part of map didn't work<br/>
					Fixed: Extreme FPS loss near Salt and Sand mine (Should improve overall server/client performance anywhere too).<br/>
					Fixed: Clothing Store System could be exploited for free uniforms and duped backpacks on ground.<br/>
					Fixed: DP 8 should work now.<br/>
					Fixed: Marijuana processing now works<br/>
					Fixed: Peaches field near Athira should work again<br/>
					Fixed: Bail system is now working again.<br/>
					Fixed: Truck shop near Kavala should now have an action.<br/>
					Fixed: Cops should be able to see other cops via markers again.<br/>
					Added: Truck shop near Pyrgos.<br/>
					Changed: Diamond mine marker slightly moved so you can mine easier without climbing a giant rock.<br/>
					Removed: Medkits removed from general store because CIV's can't actually use them.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.6",
				"
					Added: Permanent cars cost more money.<br/>
					Added: Cops can now tase civilians off of quad bikes.<br/>
					Added: There is now a price for getting your vehicle out of the garage<br/>
					Added: Ability to sell your vehicle in the garage for some money.<br/>
					Added: Spike strips for the cops.<br/>
					Added: Respawn timer increased to 35 seconds by default (System to be expanded later).<br/>
					Added: Surprises<br/>
					Added: Dead vehicle cleanup also checks and marks cars as dead in the database.<br/>
					Added: Limited civilian gear persistency (Uniform,backpack,glasses,hats,gps,nvgs,binocs,misc items).<br/>
					Added: Cop Item Shop for food/spikestrips<br/>
					Changed: Changed initial login authorization method to be more efficient and less prone to errors.<br/>
					Changed: Cop levels of uniforms were changed as per requested.<br/>
					Fixed: Cop boat shop spawned vehicles at grid 0000000.<br/>
					Fixed: Cop didn't receive bounties.<br/>
					Fixed: Fish market guy was floating.<br/>
					Fixed: Vehicle cleanup now marks removed vehicles as not-active if they are permanent.<br/>
					Fixed: Permanent vehicles that blew up 90% of the time didn't die in the database making them spawnable after restart.<br/>
					Fixed: Arrested state for civilians in the database now updates, don't go disconnecting when you are in jail... You won't like it..<br/>
					Fixed: Settings menu didn't refresh when turning Side chat on/off.<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Altis Life v3.0.7",
				"
					Added: Two sets of textures for the Mohawk<br/>
					Added: Federal reserve (The replacement for a bank). Cops can earn money by guarding it.<br/>
					Changed: Weight adjustments to some vehicle trunks to balance them out.<br/>
					Fixed: Fuel cans weren't able to be bought.<br/>
					Removed: Suicide vest, caused more problems then it was worth.<br/>
				"
		]
	];

	player createDiaryRecord["changelog",
		[
			"Altis Life v3.0.8",
				"
					Added: New spawn point for cops near Sofia called Highway Patrol Station<br/>
					Added: Rock mining which turns into cement. Will be used for houses later on.<br/>
					Added: Donators (tiers) get bigger paychecks. 1 = +750 2 = +1500 3 = +2000<br/>
					Added: ATM to Pyrgos Cop Shop.<br/>
					Added: Cop Item Shop to all cop HQ's.<br/>
					Changed: Moved Heroin processing off the main road.<br/>
					Changed: Increased the time before the federal reserve can be robbed to 30 minutes after a successful robbery.<br/>
					Changed: Increased the time before the federal reserve can be robbed to 10 minutes after a failed robbery.<br/>
					Fixed: When the federal reserve was robbed it would take it from the cash in your hand making people go negative.<br/>
					Fixed: When searching a person / vehicle that has unprocessed cocaine/heroin gave reward of $0<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Altis Life v3.0.9",
				"
					Added: Brought back the radar scanning.<br/>
					Added: Cops can now buy SUV's<br/>
					Added: Black market smugglers have smuggled in M2 Offroads for Rebels.<br/>
					Added: Altis Government has supplied law enforcement with HMG Hunters (Sergeants only).<br/>
					Changed: Adjusted a good portion of the economy for better payouts on distance and time.<br/>
					Changed: The rebels have been hit hard and have had to raise prices for their training program.<br/>
					Changed: Due to an acute rotor blade shortage the prices of large helicopters have been increased.
					Fixed: Players can no longer be god.<br/>
					Fixed: Exploits in the repair script.<br/>
					Fixed: The HUD would sometimes disappear.<br/>
					Fixed: Oil guy has came back from vacation.<br/>
					Fixed: The marijuana processor guy has finally figured out that he was in a wall.<br/>
					Fixed: The government has finally shipped the right clothing for sergeants.<br/>
					Fixed: Disconnecting as a civilian on death doesn't let you keep your clothes, I wouldn't go doing this as you won't be getting a map.<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Definitions", 
				"
				1. In the rules, town/city is referred to as Agia Marina and Girna.<br/>
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
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					Safe zones mean no killing / crimes, if you are committing a crime or killing within a safe zone you will be kicked or banned from the server.<br/>
					<br/>
					List of Safe Zones:<br/>
					Gun Stores<br/>
					Any Vehicle Shop<br/>
					Rebel Outposts - This means no crimes, cops are allowed to raid these with 4 members present of the cop force.<br/>
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