Spyglass
================
<b>Spyglass an anticheat system for [Altis Life RPG] (https://github.com/ArmaLife/Altis)</b>.</br></br>
<b>Any modification</b> to the Altis Life RPG mission files will require changes to Config_Spyglass.

<b>Notes</b>
If Spyglass is kicking on join, make sure that all functions that you have changed in Altis Life have been whitelisted. 
Check Client RPT to find notes on why you are being kicked. 

Example:
 4:50:48 "Variable: reb_1_4 is not allowed TYPE: OBJECT NS: MN"
 4:50:48 "Variable: ggs_shop is not allowed TYPE: OBJECT NS: MN"
 4:50:48 "Variable: reb_helicopter_1 is not allowed TYPE: OBJECT NS: MN"
 // Variable: VARIABLENAME is not allowed TYPE: (STRING, CODE, OBJECT, DISPLAY, SCALAR, BOOL)
 
If you encounter errors regarding variables, whitelist them via Config_Spyglass under allowedVariables

allowedVariables[] = { { "reb_1_4", "OBJECT" }, { "ggs_shop", "OBJECT" },{ "reb_helicopter_1", "OBJECT" }};
 
If ARMA 3 has updated, it may be possable they have included new files into the game. If this is the case,
Launch Arma 3 and goto the editor, (you do not need to load your mission)
Press escape and put into init:
http://hastebin.com/povasuvizo.coffee
Paste the results into a notepad. 
Open Mission fn_initSpy.sqf and find 
_patchList =
Edit the result that you got from your notepad to include at the start ["life_server",
Paste in your results and follow the existing structure.
This should fix any issues. Any other problems, refer to (https://gitter.im/ArmaLife/Altis/Support) for help
