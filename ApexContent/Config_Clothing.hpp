/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        4: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*   DLC Clothing Items added by [TIG] Alex
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, { "", "", -1 } },
            { "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, { "", "", -1 } },
            { "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, { "", "", -1 } },
            { "U_C_Poloshirt_blue", "Poloshirt Blue", 250, { "", "", -1 } },
            { "U_C_Poor_2", "Rag tagged clothes", 250, { "", "", -1 } },
            { "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, { "", "", -1 } },
            { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, { "", "", -1 } },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
            { "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
            { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
            { "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
            { "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, { "", "", -1 } },
            { "U_C_Man_casual_1_F", "Casual Wears", 5000, { "", "", -1 } },
            { "U_C_Man_casual_2_F", "Casual Wears", 5000, { "", "", -1 } }, //Apex DLC
            { "U_C_Man_casual_3_F", "Casual Wears", 5000, { "", "", -1 } }, //Apex DLC
            { "U_C_Man_casual_4_F", "Casual Wears", 5000, { "", "", -1 } }, //Apex DLC
            { "U_C_Man_casual_5_F", "Casual Wears", 5000, { "", "", -1 } }, //Apex DLC
            { "U_C_Man_casual_6_F", "Casual Wears", 5000, { "", "", -1 } }, //Apex DLC
            { "U_C_man_sport_1_F", "Casual Wears", 5000, { "", "", -1 } }, //Apex DLC
            { "U_C_man_sport_2_F", "Casual Wears", 5000, { "", "", -1 } }, //Apex DLC
            { "U_C_man_sport_3_F", "Casual Wears", 5000, { "", "", -1 } } //Apex DLC
			
			
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_CrewHelmetHeli_B", "Hazmat Breather", 3750, { "", "", -1 } },
            { "H_Bandanna_blu", "Blue Bandanna", 60, { "", "", -1 } },
            { "H_Bandanna_surfer", "Surfer Bandanna", 65, { "", "", -1 } },
            { "H_Bandanna_gry", "Grey Bandanna", 75, { "", "", -1 } },
            { "H_Bandanna_cbr", "", 80, { "", "", -1 } },
            { "H_Bandanna_surfer_grn", "", 65, { "", "", -1 } },
            { "H_Bandanna_khk", "Khaki Bandanna", 70, { "", "", -1 } },
            { "H_Bandanna_sgg", "Sage Bandanna", 80, { "", "", -1 } },
            { "H_StrawHat", "Straw Fedora", 115, { "", "", -1 } },
            { "H_BandMask_blk", "Hat & Bandanna", 150, { "", "", -1 } },
            { "H_Booniehat_tan", "", 215, { "", "", -1 } },
            { "H_Booniehat_oli", "", 215, { "", "", -1 } },
            { "H_Booniehat_grn", "", 215, { "", "", -1 } },
            { "H_Booniehat_dirty", "", 215, { "", "", -1 } },
            { "H_Booniehat_khk_hs", "", 215, { "", "", -1 } },
            { "H_H_MilCap_gry", "", 75, { "", "", -1 } },
            { "H_MilCap_blue", "", 75, { "", "", -1 } },
            { "H_Hat_blue", "", 140, { "", "", -1 } },
            { "H_Hat_brown", "", 140, { "", "", -1 } },
            { "H_Hat_checker", "", 170, { "", "", -1 } },
            { "H_Hat_grey", "", 140, { "", "", -1 } },
            { "H_Hat_tan", "", 130, { "", "", -1 } },
            { "H_Cap_blu", "", 75, { "", "", -1 } },
            { "H_Cap_blk", "", 75, { "", "", -1 } },
            { "H_Cap_blk_CMMG", "", 75, { "", "", -1 } },
            { "H_Cap_grn", "", 75, { "", "", -1 } },
            { "H_Cap_grn_BI", "", 75, { "", "", -1 } },
            { "H_Cap_blk_ION", "", 75, { "", "", -1 } },
            { "H_Cap_usblack", "", 75, { "", "", -1 } },
            { "H_Cap_surfer", "", 75, { "", "", -1 } },
            { "H_Cap_oli", "", 75, { "", "", -1 } },
            { "H_Cap_red", "", 75, { "", "", -1 } },
            { "H_Cap_tan", "", 75, { "", "", -1 } },
            { "H_Helmet_Skate", "", 300, { "", "", -1 } },
            { "H_Watchcap_sgg", "", 425, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Shades_Green", "", 20, { "", "", -1 } },
            { "G_Shades_Red", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Greenblack", "", 25, { "", "", -1 } },
            { "G_Sport_Red", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Lady_Mirror", "", 150, { "", "", -1 } },
            { "G_Lady_Dark", "", 150, { "", "", -1 } },
            { "G_Lady_Blue", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 500, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_blk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 2000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 2500, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3500, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 3500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 3500, { "", "", -1 } },
            { "B_FieldPack_blk", "", 5000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 5000, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 5000, { "", "", -1 } },
            { "B_Bergen_sgg", "", 6500, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 6500, { "", "", -1 } },
            { "B_Bergen_rgr", "", 6500, { "", "", -1 } },
            { "B_Bergen_blk", "", 6500, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oli", "", 7500, { "", "", -1 } },
            { "B_Carryall_khk", "", 7500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 7500, { "", "", -1 } }
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_Rangemaster", "Cop Uniform", 25, { "", "", -1 } },
            { "U_B_CombatUniform_mcam_tshirt", "", 350, { "life_coplevel", "SCALAR", 1 } },
            { "U_B_CombatUniform_mcam_worn", "", 550, { "life_coplevel", "SCALAR", 2 } },
            { "U_B_survival_uniform", "", 1250, { "life_coplevel", "SCALAR", 1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Cap_police", "", 25, { "", "", -1 } },
            { "H_Beret_blk_POLICE", "", 50, { "life_coplevel", "SCALAR", 2 } },
            { "H_HelmetB_plain_mcamo", "", 75, { "life_coplevel", "SCALAR", 1 } },
            { "H_MilCap_mcamo", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Booniehat_mcamo", "", 120, { "life_coplevel", "SCALAR", 1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Balaclava_TI_G_blk_F", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "G_Balaclava_TI_blk_F", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "G_Shades_Black", "", 25, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 20, { "", "", -1 } },
            { "G_Sport_Checkered", "", 20, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
            { "G_Squares", "", 10, { "", "", -1 } },
            { "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Combat", "", 55, { "", "", -1 } },
            { "G_B_Diving", "", 55, { "", "", -1 } },
            { "G_Balaclava_blk", "", 55, { "", "", -1 } },
            { "G_Balaclava_combat", "", 55, { "", "", -1 } },
            { "G_Balaclava_lowprofile", "", 55, { "", "", -1 } },
            { "G_Balaclava_oli", "", 55, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 55, { "", "", -1 } },
            { "G_Bandanna_beast", "", 55, { "", "", -1 } },
            { "G_Bandanna_blk", "", 55, { "", "", -1 } },
            { "G_Bandanna_khk", "", 55, { "", "", -1 } },
            { "G_Bandanna_oli", "", 55, { "", "", -1 } },
            { "G_Bandanna_shades", "", 55, { "", "", -1 } },
            { "G_Bandanna_sport", "", 55, { "", "", -1 } },
            { "G_Bandanna_tan", "", 55, { "", "", -1 } },
            { "G_Shades_Green", "", 55, { "", "", -1 } },
            { "G_Shades_Red", "", 55, { "", "", -1 } },
            { "G_Spectacles", "", 55, { "", "", -1 } },
            { "G_Spectacles_Tinted", "", 55, { "", "", -1 } },
            { "G_Sport_Greenblack", "", 55, { "", "", -1 } },
            { "G_Sport_Red", "", 55, { "", "", -1 } },
            { "G_Squares_Tinted", "", 55, { "", "", -1 } },
            { "G_Tactical_Black", "", 55, { "", "", -1 } },
            { "G_Tactical_Clear", "", 55, { "", "", -1 } },
            { "Balaclava_Black", "", 55, { "", "", -1 } },
            { "Balaclava_GRY", "", 55, { "", "", -1 } },
            { "Balaclava_OD", "", 55, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 400, { "", "", -1 } },
            { "V_TacVestIR_blk", "Raven Vest", 750, { "", "", -1 } },
            { "V_TacVest_blk_POLICE", "Police Tactical Vest", 750, { "", "", -1 } },
            { "V_TacVest_gen_F", "Gendarmerine Vest", 750, { "", "", -1 } },
            { "V_TacVest_blk", "Black Tactical Vest", 750, { "life_coplevel", "SCALAR", 1 } },
            { "V_PlateCarrier1_blk", "Black Carrier Rig Lite", 1250, { "life_coplevel", "SCALAR", 1 } },
            { "V_PlateCarrier1_rgr", "Green Carrier Rig Lite", 1250, { "life_coplevel", "SCALAR", 1 } },
            { "V_PlateCarrier2_blk", "Black Carrier Rig", 1250, { "life_coplevel", "SCALAR", 1 } },
            { "V_PlateCarrier2_rgr", "Green Carrier Rig", 1250, { "life_coplevel", "SCALAR", 1 } },
            { "V_PlateCarrier3_rgr", "Green Rig", 1250, { "life_coplevel", "SCALAR", 1 } },
            { "V_PlateCarrierSpec_blk", "Black Plate Carrier (Explosives)", 2000, { "life_coplevel", "SCALAR", 1 } },
            { "V_PlateCarrierGL_blk", "Black Carrier GL", 5000, { "life_coplevel", "SCALAR", 1 } },
            { "V_RebreatherB", "Rebreather", 2000, { "life_coplevel", "SCALAR", 1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_OutdoorPack_blk", "Outdoor Pack Black", 400, { "", "", -1 } },
            { "B_AssaultPack_blk", "Assault Pack Black", 750, { "", "", -1 } },
            { "B_FieldPack_blk", "Field Pack Black", 1000, { "", "", -1 } },
            { "B_Bergen_blk", "Bergen Black", 2250, { "", "", -1 } },
            { "B_Carryall_oucamo", "Carryall Blue Camo", 3725, { "", "", -1 } },
            { "B_ViperLightHarness_blk_F", "Viper Light Harness", 3000, { "", "", -1 } },
            { "B_ViperHarness_blk_F", "Viper Harness", 3500, { "", "", -1 } },
            { "B_Parachute", "Parachute", 1500, { "", "", -1 } },
            { "B_UAV_01_backpack_F", "", 37500, { "life_coplevel", "SCALAR", 1 } }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        license = "dive";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_B_Wetsuit", "", 2000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Diving", "", 500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_RebreatherB", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        license = "gun";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 4900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 1900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        license = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_Rangemaster", "EMS Uniform", 50, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Cap_blu", "", 10, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Blue", "", 10, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_FieldPack_oli", "EMS Backpack", 3000, { "", "", -1 } }
        };
    };

    class reb {
        title = "STR_Shops_C_Rebel";
        license = "rebel";
        side = "civ";
        uniforms[] = {
             { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_I_C_Soldier_Bandit_5_F", "Slumdog Soldier", 100, { "", "", -1 } },
            { "U_I_C_Soldier_Bandit_3_F", "Slumdog Mercenary", 100, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 8750, { "", "", -1 } },
            { "U_O_Wetsuit", "", 8750, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 4500, {"", "", -1} },
            { "U_I_G_Story_Protagonist_F", "", 8750, { "", "", -1 } },
            { "U_I_G_resistanceLeader_F", "", 7750, { "", "", -1 } },
            { "U_O_PilotCoveralls", "", 12805, { "", "", -1 } },
            { "U_I_HeliPilotCoveralls", "", 8750, { "", "", -1 } },
            { "U_I_pilotCoveralls", "", 8750, { "", "", -1 } },
            { "U_IG_leader", "Guerilla Leader", 17670, { "", "", -1 } },
            { "U_O_T_Officer_F", "Officer Fatigues", 12500, { "", "", -1 } },
            { "U_I_CombatUniform", "", 8750, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 15500, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 11500, { "", "", -1 } },
            { "U_B_survival_uniform", "", 15000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 10500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 8500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 8500, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "Syndikat Uniform", 10000, { "", "", -1 } },
            { "U_B_CTRG_Soldier_F", "Stealth Uniform (Tropic)", 25000, { "", "", -1 } },
            { "U_O_FullGhillie_ard", "", 25000, { "", "", -1 } },
            { "U_O_FullGhillie_lsh", "", 25000, { "", "", -1 } },
            { "U_O_FullGhillie_sard", "", 25000, { "", "", -1 } },
            { "U_I_FullGhillie_ard", "", 25000, { "", "", -1 } },
            { "U_I_FullGhillie_lsh", "", 25000, { "", "", -1 } },
            { "U_I_FullGhillie_sard", "", 25000, { "", "", -1 } },
            { "U_B_T_FullGhillie_tna_F", "", 25000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 25000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 12500, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 12500, { "", "", -1 } },
            { "U_O_T_Sniper_F", "", 12500, { "", "", -1 } },
            { "U_B_T_Sniper_F", "", 12500, { "", "", -1 } }
        };
            
        headgear[] = {
            { "NONE", "Remove Headgear", 0, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_gen_F", "", 400, { "", "", -1 } },
            { "H_MilCap_tna_F", "", 400, { "", "", -1 } },
            { "H_Beret_gen_F", "", 2000, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 250, { "", "", -1 } },
            { "H_Bandanna_camo", "", 250, { "", "", -1 } },
            { "H_Booniehat_mcamo", "Booniehat (MTP)", 500, { "", "", -1 } },
            { "H_Booniehat_indp", " Booniehat (Khaki)", 500, { "", "", -1 } },
            { "H_Booniehat_tna_F", "Booniehat (Tropic)", 500, { "", "", -1 } },
            { "H_Hat_camo", "", 500, { "", "", -1 } },
            { "H_HelmetO_ocamo", "", 1000, { "", "", -1 } },
            { "H_HelmetO_ghex_F", "", 1000, { "", "", -1 } },
            { "H_HelmetB_light", "", 1000, { "", "", -1 } },
            { "H_HelmetB_light_desert", "", 1000, { "", "", -1 } },
            { "H_HelmetB_light_grass", "", 1000, { "", "", -1 } },
            { "H_HelmetB_light_sand", "", 1000, { "", "", -1 } },
            { "H_HelmetB_light_snakeskin", "", 1000, { "", "", -1 } },
            { "H_HelmetB_Light_tna_F", "", 1000, { "", "", -1 } },
            { "H_HelmetB_Enh_tna_F", "", 1000, { "", "", -1 } },
            { "H_HelmetB_paint", "", 1000, { "", "", -1 } },
            { "H_HelmetB_plain_mcamo", "", 1000, { "", "", -1 } },
            { "H_HelmetB_tna_F", "", 1000, { "", "", -1 } },
            { "H_HelmetIA_net", "", 1000, { "", "", -1 } },
            { "H_HelmetSpecO_ocamo", "", 1000, { "", "", -1 } },
            { "H_Shemag_tan", "", 400, { "", "", -1 } },
            { "H_Shemag_olive_hs", "", 400, { "", "", -1 } },
            { "H_ShemagOpen_tan", "", 425, { "", "", -1 } },
            { "H_Shemag_olive", "", 425, { "", "", -1 } },
            { "H_HelmetCrew_O_ghex_F", "", 500, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 500, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_blk", "", 150, { "", "", -1 } },
            { "G_Balaclava_combat", "", 150, { "", "", -1 } },
            { "G_Balaclava_lowprofile", "", 150, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_beast", "", 150, { "", "", -1 } },
            { "G_Bandanna_blk", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 3250, { "", "", -1 } },
            { "V_BandollierB_cbr", "", 2250, { "", "", -1 } },
            { "V_HarnessO_brn", "", 3250, { "", "", -1 } },
            { "V_BandollierB_khk", "", 3250, { "", "", -1 } },
            { "V_BandollierB_oli", "", 3250, { "", "", -1 } },
            { "V_BandollierB_rgr", "", 3250, { "", "", -1 } },
            { "V_Chestrig_khk", "", 10000, { "", "", -1 } },
            { "V_Chestrig_oli", "", 10000, { "", "", -1 } },
            { "V_HarnessO_brn", "", 3250, { "", "", -1 } },
            { "V_HarnessO_gry", "", 3250, { "", "", -1 } },
            { "V_HarnessOGL_brn", "", 3250, { "", "", -1 } },
            { "V_HarnessOGL_gry", "", 3250, { "", "", -1 } },
            { "V_HarnessOSpec_brn", "", 3250, { "", "", -1 } },
            { "V_HarnessOSpec_gry", "", 3250, { "", "", -1 } },
            { "V_I_G_resistanceleader_F", "", 8750, { "", "", -1 } },
            { "V_PlateCarrier_Kerry", "", 13750, { "", "", -1 } },
            { "V_PlateCarrierL_CTRG", "", 8750, { "", "", -1 } },
            { "V_RebreatherIA", "", 3250, { "", "", -1 } },
            { "V_RebreatherIR", "", 3250, { "", "", -1 } },
            { "V_TacVest_brn", "", 3250, { "", "", -1 } },
            { "V_TacVest_camo", "", 3250, { "", "", -1 } },
            { "V_TacVest_khk", "", 3250, { "", "", -1 } },
            { "V_TacVest_oli", "", 3250, { "", "", -1 } },
            { "V_HarnessO_ghex_F", "", 3250, { "", "", -1 } },
            { "V_HarnessOGL_ghex_F", "", 3250, { "", "", -1 } },
            { "V_BandollierB_ghex_F", "", 3250, { "", "", -1 } },
            { "V_TacChestrig_cbr_F", "", 3250, { "", "", -1 } },
            { "V_TacChestrig_grn_F", "", 3250, { "", "", -1 } },
            { "V_TacChestrig_oli_F", "", 3250, { "", "", -1 } },
            { "V_TacVestCamo_khk", "", 3250, { "", "", -1 } }

			
        };
        backpacks[] = {
           { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 1000, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 1000, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 1000, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 1000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 1000, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 1000, { "", "", -1 } },
            { "B_AssaultPack_tna_F", "", 1000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 1250, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 1750, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 1750, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 1750, { "", "", -1 } },
            { "B_Bergen_sgg", "", 3250, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 3250, { "", "", -1 } },
            { "B_Bergen_rgr", "", 3250, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 2500, { "", "", -1 } },
            { "B_FieldPack_ghex_F", "", 2500, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 3250, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 3250, { "", "", -1 } },
            { "B_Carryall_oli", "", 3250, { "", "", -1 } },
            { "B_Carryall_khk", "", 3250, { "", "", -1 } },
            { "B_Carryall_cbr", "", 3250, { "", "", -1 } },
            { "B_Carryall_cbr", "", 3250, { "", "", -1 } },
            { "B_Carryall_ghex_F", "", 3250, { "", "", -1 } },
            { "B_Bergen_dgtl_F", "", 7500, { "", "", -1 } },
            { "B_Bergen_hex_F", "", 7500, { "", "", -1 } },
            { "B_Bergen_mcamo_F", "", 7500, { "", "", -1 } },
            { "B_Bergen_tna_F", "", 7500, { "", "", -1 } },
            { "B_ViperHarness_ghex_F", "", 2500, { "", "", -1 } },
            { "B_ViperHarness_hex_F", "", 2500, { "", "", -1 } },
            { "B_ViperHarness_oli_F", "", 2500, { "", "", -1 } },
            { "B_ViperLightHarness_ghex_F", "", 2500, { "", "", -1 } },
            { "B_ViperLightHarness_hex_F", "", 2500, { "", "", -1 } },
            { "B_ViperLightHarness_khk_F", "", 2500, { "", "", -1 } },
            { "B_ViperLightHarness_khk_F", "", 2500, { "", "", -1 } },
            { "B_ViperLightHarness_oli_F", "", 2500, { "", "", -1 } }
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_Driver_1_black", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_blue", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_red", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_orange", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_green", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_white", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_yellow", "", 1500, { "", "", -1 } },
            { "U_C_Driver_2", "", 3500, { "", "", -1 } },
            { "U_C_Driver_1", "", 3600, { "", "", -1 } },
            { "U_C_Driver_3", "", 3700, { "", "", -1 } },
            { "U_C_Driver_4", "", 3700, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_RacingHelmet_1_black_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_red_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_white_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_blue_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_yellow_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_green_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_2_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_3_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_4_F", "", 2500, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };
};
