//Virtual Shops
class VirtualShops {
    class market {
        name = "STR_Shops_Market";
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "storagesmall", "storagebig" };
    };

    class rebel {
        name = "STR_Shops_Rebel";
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge" };
    };

    class gang {
        name = "STR_Shops_Gang";
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge" };
    };

    class wongs {
        name = "STR_Shops_Wongs";
        items[] = { "turtle_soup", "turtle_raw" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        items[] = { "coffee", "donuts" };
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        items[] = { "cocaine_processed", "heroin_processed", "marijuana" };
    };

    class oil {
        name = "STR_Shops_Oil";
        items[] = { "oil_processed", "pickaxe", "fuelFull" };
    };

    class fishmarket {
        name = "STR_Shops_FishMarket";
        items[] = { "salema_raw", "salema", "ornate_raw", "ornate", "mackerel", "mackerel", "tuna_raw", "tuna", "mullet_raw", "mullet", "catshark_raw", "catshark" };
    };

    class glass {
        name = "STR_Shops_Glass";
        items[] = { "glass" };
    };

    class iron  {
        name = "STR_Shops_Minerals";
        items[] = { "iron_refined", "copper_refined" };
    };

    class diamond {
        name = "STR_Shops_Diamond";
        items[] = { "diamond_uncut", "diamond_cut" };
    };

    class salt {
        name = "STR_Shops_Salt";
        items[] = { "salt_refined" };
    };

    class cop {
        name = "STR_Shops_Cop";
        items[] = { "donuts", "coffee", "spikeStrip", "waterBottle", "rabbit", "apple", "redgull", "fuelFull", "defusekit" };
    };

    class cement {
        name = "STR_Shops_Cement";
        items[] = { "cement" };
    };

    class gold {
        name = "STR_Shops_Gold";
        items[] = { "goldbar" };
    };
};

//Virtual Items
class VirtualItems {
    //Misc
    VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 2, 750, 350, false, -1, "icons\ico_pickaxe.paa")
    VITEMMACRO(fuelEmpty, "STR_Item_FuelE", "fuelEmpty", 2, -1, -1, false, -1, "icons\ico_fuelempty.paa")
    VITEMMACRO(fuelFull, "STR_Item_FuelF", "fuelFull", 5, 850, 500, false, -1, "icons\ico_fuel.paa")
    VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 2500, 1200, false, -1, "icons\ico_spikestrip.paa")
    VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 150, 75, false, -1, "icons\ico_lockpick.paa")
    VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldBar", 12, -1, 95000, false, -1, "")
    VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 35000, -1, true, -1, "icons\ico_blastingCharge.paa")
    VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 7500, -1, true, -1, "icons\ico_boltcutters.paa")
    VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "icons\ico_defusekit.paa")
    VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 75000, -1, false, -1, "icons\ico_storageSmall.paa")
    VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 150000, -1, false, -1, "icons\ico_storageBig.paa")

    //Mined Items
    VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oilUnprocessed", 7, -1, -1, false, -1, "")
    VITEMMACRO(oil_processed, "STR_Item_OilP", "oilProcessed", 6, -1, 3200, false, -1, "")
    VITEMMACRO(copper_unrefined, "STR_Item_CopperOre", "copperUnrefined", 4, -1, -1, false, -1, "")
    VITEMMACRO(copper_refined, "STR_Item_CopperIngot", "copperRefined", 3, -1, 1500, false, -1, "")
    VITEMMACRO(iron_unrefined, "STR_Item_IronOre", "ironUnrefined", 5, -1, -1, false, -1, "")
    VITEMMACRO(iron_refined, "STR_Item_IronIngot", "ironRefined", 3, -1, 3200, false, -1, "")
    VITEMMACRO(salt_unrefined, "STR_Item_Salt", "saltUnrefined", 3, -1, -1, false, -1, "")
    VITEMMACRO(salt_refined, "STR_Item_SaltR", "saltRefined", 1, -1, 1450, false, -1, "")
    VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "")
    VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 1450, false, -1, "")
    VITEMMACRO(diamond_uncut, "STR_Item_DiamondU", "diamondUncut", 4, -1, 750, false, -1, "")
    VITEMMACRO(diamond_cut, "STR_Item_DiamondC", "diamondCut", 2, -1, 2000, false, -1, "")
    VITEMMACRO(rock, "STR_Item_Rock", "rock", 6, -1, -1, false, -1, "")
    VITEMMACRO(cement, "STR_Item_CementBag", "cement", 5, -1, 1950, false, -1, "")

    //Drugs
    VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroinUnprocessed", 6, -1, -1, true, -1, "")
    VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroinProcessed", 4, 3500, 2560, true, -1, "")
    VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 4, -1, -1, true, -1, "")
    VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 3, 2800, 2350, true, -1, "icons\ico_marijuana.paa")
    VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaineUnprocessed", 6, -1, 3000, true, -1, "")
    VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaineProcessed", 4, -1, 5000, true, -1, "")

    //Drink
    VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 1500, 200, false, 100, "icons\ico_redgull.paa")
    VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "icons\ico_coffee.paa")
    VITEMMACRO(waterBottle, "STR_Item_WaterBottle", "waterBottle", 1, 10, 5, false, 100, "icons\ico_waterBottle.paa")

    //Food
    VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, 65, 50, false, 10, "icons\ico_apple.paa")
    VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, 68, 55, false, 10, "icons\ico_peach.paa")
    VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "icons\ico_tbacon.paa")
    VITEMMACRO(donuts, "STR_Item_Donuts", "donuts", 1, 120, 60, false, 30, "icons\ico_donuts.paa")
    VITEMMACRO(rabbit_raw, "STR_Item_RabbitRaw", "rabbitRaw", 2, -1, 65, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(rabbit, "STR_Item_Rabbit", "rabbit", 1, 150, 115, false, 20, "icons\ico_cookedMeat.paa")
    VITEMMACRO(salema_raw, "STR_Item_SalemaRaw", "salemaRaw", 2, -1, 45, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(salema, "STR_Item_Salema", "salema", 1, 75, 55, false, 30, "icons\ico_cookedMeat.paa")
    VITEMMACRO(ornate_raw, "STR_Item_OrnateRaw", "ornateRaw", 2, -1, 40, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(ornate, "STR_Item_Ornate", "ornate", 1, 175, 150, false, 25, "icons\ico_cookedMeat.paa")
    VITEMMACRO(mackerel_raw, "STR_Item_MackerelRaw", "mackerelRaw", 4, -1, 175, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(mackerel, "STR_Item_Mackerel", "mackerel", 2, 250, 200, false, 30, "icons\ico_cookedMeat.paa")
    VITEMMACRO(tuna_raw, "STR_Item_TunaRaw", "tunaRaw", 6, -1, 700, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(tuna, "STR_Item_Tuna", "tuna", 3, 1250, 1000, false, 100, "icons\ico_cookedMeat.paa")
    VITEMMACRO(mullet_raw, "STR_Item_MulletRaw", "mulletRaw", 4, -1, 250, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(mullet, "STR_Item_Mullet", "mullet", 2, 600, 400, false, 80, "icons\ico_cookedMeat.paa")
    VITEMMACRO(catshark_raw, "STR_Item_CatSharkRaw", "catsharkRaw", 6, -1, 300, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(catshark, "STR_Item_CatShark", "catshark", 3, 750, 500, false, 100, "icons\ico_cookedMeat.paa")
    VITEMMACRO(turtle_raw, "STR_Item_TurtleRaw", "turtleRaw", 6, 4000, 3000, true, -1, "icons\ico_meat.paa")
    VITEMMACRO(turtle_soup, "STR_Item_TurtleSoup", "turtleSoup", 2, 2500, 1000, false, 100, "icons\ico_cookedMeat.paa")
    VITEMMACRO(hen_raw, "STR_Item_HenRaw", "henRaw", 1, -1, 35, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(hen, "STR_Item_Hen", "hen", 1, 115, 85, false, 65, "icons\ico_cookedMeat.paa")
    VITEMMACRO(rooster_raw, "STR_Item_RoosterRaw", "roosterRaw", 1, -1, 35, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(rooster, "STR_Item_Rooster", "rooster", 115, 85, false, 45, "icons\ico_cookedMeat.paa")
    VITEMMACRO(sheep_raw, "STR_Item_SheepRaw", "sheepRaw", 2, -1, 50, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(sheep, "STR_Item_Sheep", "sheep", 2, 155, 115, false, 100, "icons\ico_cookedMeat.paa")
    VITEMMACRO(goat_raw, "STR_Item_GoatRaw", "goatRaw", 2, -1, 75, false, -1, "icons\ico_meat.paa")
    VITEMMACRO(goat, "STR_Item_Goat", "goat", 2, 175, 135, false, 100, "icons\ico_cookedMeat.paa")
};
