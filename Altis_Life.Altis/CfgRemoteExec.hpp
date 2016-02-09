#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;

        /* Client only functions */
        F(life_fnc_jail,CLIENT)
        F(life_fnc_moveIn,CLIENT)
        F(life_fnc_restrain,CLIENT)
        F(life_fnc_robPerson,CLIENT)
        F(life_fnc_searchClient,CLIENT)
        F(TON_fnc_player_query,CLIENT)
        F(life_fnc_knockedOut,CLIENT)
        F(life_fnc_robReceive,CLIENT)
        F(life_fnc_tazeSound,CLIENT)
        F(life_fnc_copSiren,CLIENT)
        F(life_fnc_medicSiren,CLIENT)
        F(life_fnc_giveDiff,CLIENT)
        F(life_fnc_gangInvite,CLIENT)
        F(TON_fnc_clientGangKick,CLIENT)
        F(TON_fnc_clientGangLeader,CLIENT)
        F(TON_fnc_clientGangLeft,CLIENT)
        F(life_fnc_lightHouse,CLIENT)
        F(life_fnc_medicRequest,CLIENT)
        F(life_fnc_revived,CLIENT)
        F(life_fnc_receiveItem,CLIENT)
        F(life_fnc_receiveMoney,CLIENT)
        F(TON_fnc_clientGetKey,CLIENT)
        F(life_fnc_soundDevice,CLIENT)
        F(life_fnc_wireTransfer,CLIENT)
        F(life_fnc_pickupMoney,CLIENT)
        F(life_fnc_pickupItem,CLIENT)
        F(life_fnc_gangCreated,CLIENT)
        F(life_fnc_gangDisbanded,CLIENT)
        F(life_fnc_jailMe,CLIENT)
        F(SOCK_fnc_dataQuery,CLIENT)
        F(SOCK_fnc_insertPlayerInfo,CLIENT)
        F(SOCK_fnc_requestReceived,CLIENT)
        F(life_fnc_adminid,CLIENT)
        F(life_fnc_impoundMenu,CLIENT)
        F(life_fnc_garageRefund,CLIENT)
        F(life_fnc_addVehicle2Chain,CLIENT)
        F(life_fnc_vehicleAnimate,CLIENT)
        F(life_fnc_spikeStripEffect,CLIENT)
        F(life_fnc_bountyReceive,CLIENT)
        F(life_fnc_wantedList,CLIENT)
        F(life_fnc_removeLicenses,CLIENT)
        F(life_fnc_admininfo,CLIENT)
        F(TON_fnc_clientMessage,CLIENT)
        F(life_fnc_licenseCheck,CLIENT)
        F(life_fnc_licensesRead,CLIENT)
        F(life_fnc_copSearch,CLIENT)
        F(life_fnc_copLights,CLIENT)
        F(life_fnc_ticketPrompt,CLIENT)
        F(life_fnc_ticketPaid,CLIENT)
        F(life_fnc_freezePlayer,CLIENT)

        /* Server only functions */
        F(bis_fnc_execvm,SERVER)
        F(life_fnc_wantedBounty,SERVER)
        F(TON_fnc_getID,SERVER)
        F(life_fnc_jailSys,SERVER)
        F(life_fnc_wantedRemove,SERVER)
        F(life_fnc_wantedAdd,SERVER)
        F(TON_fnc_insertGang,SERVER)
        F(TON_fnc_removeGang,SERVER)
        F(TON_fnc_updateGang,SERVER)
        F(TON_fnc_updateHouseTrunk,SERVER)
        F(TON_fnc_sellHouse,SERVER)
        F(TON_fnc_managesc,SERVER)
        F(TON_fnc_spikeStrip,SERVER)
        F(life_fnc_wantedCrimes,SERVER)
        F(life_fnc_wantedFetch,SERVER)
        F(life_fnc_wantedProfUpdate,SERVER)
        F(DB_fnc_queryRequest,SERVER)
        F(DB_fnc_insertRequest,SERVER)
        F(DB_fnc_updatePartial,SERVER)
        F(DB_fnc_updateRequest,SERVER)
        F(TON_fnc_chopShopSell,SERVER)
        F(TON_fnc_setObjVar,SERVER)
        F(TON_fnc_keyManagement,SERVER)
        F(TON_fnc_vehicleDelete,SERVER)
        F(TON_fnc_spawnVehicle,SERVER)
        F(TON_fnc_getVehicles,SERVER)
        F(TON_fnc_vehicleStore,SERVER)
        F(SPY_fnc_observe,SERVER)
        F(TON_fnc_pickupAction,SERVER)
        F(TON_fnc_cleanupRequest,SERVER)
        F(TON_fnc_updateHouseContainers,SERVER)
        F(SPY_fnc_cookieJar,SERVER)
        F(TON_fnc_vehicleCreate,SERVER)
        F(TON_fnc_addHouse,SERVER)
        F(TON_fnc_addContainer,SERVER)
        F(TON_fnc_sellHouseContainer,SERVER)
        F(TON_fnc_deleteDBContainer,SERVER)

        /* Functions for everyone */
        F(life_fnc_broadcast,ANYONE)
        F(life_fnc_animSync,ANYONE)
        F(life_fnc_demoChargeTimer,ANYONE)
        F(life_fnc_corpse,ANYONE)
        F(life_fnc_colorVehicle,ANYONE)
        F(life_fnc_lockVehicle,ANYONE)
        F(life_fnc_flashbang,ANYONE)
        F(life_fnc_jumpFnc,ANYONE)
        F(SPY_fnc_notifyAdmins,ANYONE)
        F(life_fnc_setFuel,ANYONE)
        F(life_fnc_pulloutVeh,ANYONE)
        F(life_fnc_pushFunction,ANYONE)
        F(life_fnc_simDisable,ANYONE)

    };

    class Commands {
        mode = 1;
        jip = 0;

        F(setFuel,ANYONE)
        F(addWeapon,ANYONE)
        F(addMagazine,ANYONE)
        F(addPrimaryWeaponItem,ANYONE)
        F(addHandgunItem,ANYONE)
    };
};
