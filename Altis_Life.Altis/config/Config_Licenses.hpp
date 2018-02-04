class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: STRING (Condition)
    *    FORMAT:
    *        STRING (Conditions) - Must return boolean :
    *            String can contain any amount of conditions, aslong as the entire
    *            string returns a boolean. This allows you to check any levels, licenses etc,
    *            in any combination. For example:
    *                "call life_coplevel && license_civ_someLicense"
    *            This will also let you call any other function.
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */  
	class civ_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "pop_nissan_leaf2", ""},
		    { "pop_nissan_leaf3", "" },
		    { "pop_seat_leon_sp", "" },
		    { "pop_ford_focusrs_azul", "" },
		    { "pop_ford_focusrs_rojo", "" },
		    { "pop_seat_leon_azul", "" },
		    { "pop_seat_leon_rojo", "" },
		    { "pop_alfa_romeo_159_azul", "" },
		    { "pop_seat_ibiza_azul", "" },
		    { "pop_seat_ibiza_rojo", "" },
		    { "pop_AudiA1_blanco", "" },
		    { "pop_AudiA1_D2", "" },
		    { "pop_AudiA1_D3", "" },
		    { "pop_AudiA1_D5", "" },
		    { "pop_astra_RS", "" },
		    { "pop_clio_civ", "" },
		    { "pop_clio_civ_noir", "" },
		    { "pop_clio_civ_bleufonce", "" },
		    { "pop_clio_civ_rouge", "" },
		    { "pop_clio_civ_jaune", "" },
		    { "pop_clio_civ_rose", "" },
		    { "pop_clio_civ_grise", "" },
		    { "pop_clio_civ_violet", "" },
		    { "pop_clio_civ_orange", "" },
		    { "POP_207_rojo", "" },
		    { "POP_207_negro", "" },
		    { "POP_207_amarillo", "" },
		    { "POP_207_rose", "" },
		    { "POP_207_gris", "" },
		    { "POP_207_violeta", "" },
		    { "POP_207_naranja", "" },
		    { "pop_golfvi_civ", "" },
		    { "pop_golfvi_bleufonce", "" },
		    { "pop_golfvi_grise", "" },
		    { "pop_golfvi_jaune", "" },
		    { "pop_golfvi_noir", "" },
		    { "pop_golfvi_orange", "" },
		    { "pop_golfvi_rose", "" },
		    { "pop_golfvi_rouge", "" },
		    { "pop_evox_rosa_t", "" },
		    { "pop_evox_noir", "" },
		    { "pop_evox_bleufonce", "" },
		    { "pop_evox_rouge", "" },
		    { "pop_evox_jaune", "" },
		    { "pop_evox_rose", "" },
		    { "pop_evox_grise", "" },
		    { "pop_evox_violet", "" },
		    { "pop_evox_orange", "" },
		    { "pop_308_negro", "" },
		    { "pop_308_azul", "" },
		    { "pop_308_rojo", "" },
		    { "pop_308_amarillo", "" },
		    { "pop_308_violeta", "" },
		    { "pop_308_gris", "" },
		    { "pop_308_naranja", "" },
		    { "pop_308_rosa", "" },
		    { "pop_twingo_p", "" },
		    { "pop_twingo_p_amarillo", "" },
		    { "pop_twingo_p_azul", "" },
		    { "pop_twingo_p_gris", "" },
		    { "pop_twingo_p_naranja", "" },
		    { "pop_twingo_p_negro", "" },
		    { "pop_twingo_p_rojo", "" },
		    { "pop_twingo_p_rosa", "" },
		    { "pop_twingo_p_violeta", "" },
		    { "pop_Alfa_Romeo_negro", "" },
		    { "pop_Alfa_Romeo_azuloscuro", "" },
		    { "pop_Alfa_Romeo_rojo", "" },
		    { "pop_Alfa_Romeo_amarillo", "" },
		    { "pop_Alfa_Romeo_rosa", "" },
		    { "pop_Alfa_Romeo_gris", "" },
		    { "pop_Alfa_Romeo_violetta", "" },
		    { "pop_Alfa_Romeo_Naranga", "" },
		    { "pop_c4_p_negro", "" },
		    { "pop_c4_p_azul", "" },
		    { "pop_c4_p_rojo", "" },
		    { "pop_c4_p_amarillo", "" },
		    { "pop_c4_p_rosa", "" },
		    { "pop_c4_p_gris", "" },
		    { "pop_c4_p_violeta", "" },
		    { "pop_c4_p_naranja", "" },
		    { "pop_c4_picasso_p_azul", "" },
		    { "pop_c4_picasso_p_negro", "" },
		    { "pop_c4_picasso_p_rojo", "" },
		    { "pop_c4_picasso_p_amarillo", "" },
		    { "pop_c4_picasso_p_rosa", "" },
		    { "pop_c4_picasso_p_gris", "" },
		    { "pop_c4_picasso_p_violeta", "" },
		    { "pop_c4_picasso_p_naranja", "" },
		    { "pop_ds3_negro", "" },
		    { "pop_ds3_azul", "" },
		    { "pop_ds3_civ_rojo", "" },
		    { "pop_ds3_amarillo", "" },
		    { "pop_ds3_rosa", "" },
		    { "pop_ds3_gris", "" },
		    { "pop_ds3_violeta", "" },
		    { "pop_ds3_naranja", "" },
		    { "pop_ds4_negro", "" },
		    { "pop_ds4_azul", "" },
		    { "pop_ds4_rojo", "" },
		    { "pop_ds4_amarillo", "" },
		    { "pop_ds4_rosa", "" },
		    { "pop_ds4_gris", "" },
		    { "pop_ds4_violeta", "" },
		    { "pop_ds4_naranja", "" },
		    { "pop_r5_negro", "" },
		    { "pop_r5_azul", "" },
		    { "pop_r5_rojo", "" },
		    { "pop_r5_amarillo", "" },
		    { "pop_r5_rosa", "" },
		    { "pop_r5_gris", "" },
		    { "pop_r5_violeta", "" },
		    { "pop_r5_naranja", "" },
		    { "pop_rs_rojo", "" },
		    { "pop_rs_negro", "" },
		    { "pop_rs_azul", "" },
		    { "pop_rs_amarillo", "" },
			{ "pop_rs_rosa", "" },
		    { "pop_rs_gris", "" },
		    { "pop_rs_violeta", "" },
		    { "pop_rs_naranja", "" },
		    { "POP_smart_rojo", "" },
		    { "POP_smart_civ_negro", "" },
		    { "pop_peugeot508_civ", "" },
		    { "pop_peugeot508_civ_noir", "" },
		    { "pop_peugeot508_civ_bleufonce", "" },
		    { "pop_peugeot508_civ_rouge", "" },
		    { "pop_peugeot508_civ_jaune", "" },
			{ "pop_peugeot508_civ_rose", "" },
		    { "pop_peugeot508_civ_grise", "" },
		    { "pop_peugeot508_civ_violet", "" },
		    { "pop_peugeot508_civ_orange", "" },
			{ "pop_peugeot508_civ_noir_t", "" },
		    { "pop_peugeot508_civ_bleufonce_t", "" },
		    { "pop_peugeot508_civ_rouge_t", "" },
		    { "pop_peugeot508_civ_jaune_t", "" },
		    { "pop_peugeot508_civ_rose_t", "" },
		    { "pop_peugeot508_civ_grise_t", "" },
		    { "pop_peugeot508_civ_violet_t", "" },
		    { "pop_peugeot508_civ_orange_t", "" },
		    { "pop_rs4_civ_t_amarillo", "" },
		    { "pop_rs4_civ_amarillo", "" },
		    { "pop_rs6", "" },
			{ "pop_rs6_amarillo", "" },
		    { "pop_rs6_azul", "" },
		    { "pop_rs6_gris", "" },
			{ "pop_rs6_naranja", "" },
		    { "pop_rs6_negro", "" },
		    { "pop_rs6_rojo", "" },
			{ "pop_rs6_rosa", "" },
		    { "pop_rs6_violeta", "" },
		    { "POP_smart_civ_azul", "" },
			{ "Jonzie_Mini_Cooper_R_spec", "" },
		    { "Jonzie_Mini_Cooper", "" },
		    { "Jonzie_Corolla", "" },
		    { "Jonzie_Datsun_510", "" },
			{ "Jonzie_Ceed", "" },
			{ "IVORY_PRIUS", "" }
          
        };
    };

    class dodge_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "pop_nissan_pathfinder2", "" },
            { "pop_nissan_pathfinder3", "" },
            { "pop_bmw_x52", "" },
			{ "pop_bmw_x53", "" },
            { "pop_hyundai_veloster2", "" },
            { "pop_hyundai_veloster3", "" },
			{ "pop_nissan_patrol_corto", "" },
            { "pop_jeep_grandcherokee2", "" },
            { "pop_jeep_grandcherokee3", "" },
			{ "pop_nissan_qashqai2", "" },
            { "pop_nissan_qashqai3", "" },
            { "pop_toyota_FJCruiser2", "" },
			{ "pop_toyota_FJCruiser3", "" },
            { "pop_volvo2", "" },
            { "pop_lexus_gx4602", "" },
			{ "pop_hyundai_x352", "" },
            { "pop_dacia_negro", "" },
            { "pop_dacia_rojo", "" },
			{ "pop_dacia_naranja", "" },
            { "pop_ranger_rover3", "" },
            { "pop_rover_evo_amarillo", "" },
			{ "pop_hummer_civ_amarillo", "" },
            { "pop_hummer_civ_azulfuerte", "" },
            { "pop_hummer_civ_gris", "" },
			{ "pop_hummer_civ_negro", "" },
            { "pop_hummer_civ_rojo", "" },
            { "pop_hummer_civ_rosa", "" },
			{ "pop_hummer_civ_violeta", "" },
            { "pop_h2_bleufonce", "" },
            { "pop_h2_grise", "" },
			{ "pop_h2_jaune", "" },
            { "pop_h2_orange", "" },
            { "pop_h2_rose", "" },
			{ "pop_h2_rouge", "" },
            { "pop_h2_violet", "" },
            { "pop_Bowler_c", "" },
			{ "pop_Bowler_c_bleufonce", "" },
            { "pop_Bowler_c_grise", "" },
            { "pop_Bowler_c_jaune", "" },
			{ "pop_Bowler_c_noir", "" },
            { "pop_Bowler_c_orange", "" },
            { "pop_Bowler_c_rose", "" },
			{ "pop_Bowler_c_rouge", "" },
            { "pop_Bowler_c_violet", "" },
            { "pop_avalanche_amarillo", "" },
			{ "pop_avalanche_azul", "" },
            { "pop_avalanche_gris", "" },
            { "pop_avalanche_naranja", "" },
			{ "pop_avalanche_negro", "" },
            { "pop_avalanche_rosa", "" },
            { "pop_avalanche_violeta", "" },
			{ "pop_monsteur", "" },
            { "pop_monsteur_amarillo", "" },
            { "pop_monsteur_azul", "" },
			{ "pop_monsteur_gris", "" },
            { "pop_monsteur_naranja", "" },
            { "pop_monsteur_negro", "" },
			{ "pop_monsteur_rojo", "" },
            { "pop_monsteur_rosa", "" },
            { "pop_monsteur_violeta", "" },
			{ "POP_jeep_blinde_azul", "" },
            { "POP_jeep_blinde_azul_mate", "" },
            { "POP_jeep_blinde_blanco", "" },
			{ "POP_jeep_blinde_blanco_mate", "" },
            { "POP_jeep_blinde_violeta", "" },
            { "pop_jeep_blinde_violeta_mate", "" },
			{ "POP_jeep_blinde_rojo", "" },
            { "POP_jeep_blinde_rojo_mate", "" },
            { "POP_Landrover_Defender", "" },
			{ "Quiet_ford_raptor_blanche_f", "" },
            { "Quiet_ford_raptor_bleu_f", "" },
            { "Quiet_ford_raptor_rouge_f", "" },
			{ "Quiet_c65amg_blanche_f", "" },
            { "Quiet_c65amg_noir_f", "" },
            { "pop_raptor_blanco", "" },
            { "pop_raptor_negro", "" },
			{ "pop_raptor_azul", "" },
            { "pop_raptor_rojo", "" },
            { "pop_raptor_amarillo", "" },
			{ "pop_raptor_gris", "" },
            { "pop_raptor_violeta", "" },
            { "pop_raptor_naranja", "" },
			{ "pop_UAZ_Patriot_negro", "" },
            { "pop_Vandura_civ_equipoa", "" },
            { "pop_Volkswagen_Touareg_rojo", "" },
			{ "pop_Volkswagen_Touareg_negro", "" },
            { "pop_Volkswagen_Touareg_azul", "" },
            { "pop_Volkswagen_Touareg_violeta", "" },
			{ "pop_Volkswagen_Touareg_amarillo", "" },
            { "pop_Volkswagen_Touareg_rosa", "" },
            { "pop_Volkswagen_Touareg_gris", "" },
			{ "pop_Volkswagen_Touareg_naranja", "" },
            { "pop_cherokee_negro_azul", "" },
            { "pop_cherokee_negro_azul_mate", "" },
			{ "pop_cherokee_negro_blanco", "" },
            { "pop_cherokee_negro_blano_mate", "" },
            { "pop_cherokee_negro_violeta", "" },
			{ "pop_cherokee_negro_violeta_mate", "" },
            { "pop_cherokee_negro_rojo", "" },
            { "pop_cherokee_negro_rojo_mate", "" },
            { "Quiet_Cadillac_noir_f", "" },
            { "Quiet_Cadillac_rouge_f", "" },
			{ "quiet_sub2015_bleu_f", "" },
            { "quiet_sub2015_noir_f", "" },
            { "quiet_sub2015_rouge_f", "" },
			{ "POP_Qashqai_rojo_oscuro", "" },
            { "pop_smart_supercharge_civ_azul", "" },
            { "pop_smart_supercharge_civ_negro", "" },
			{ "shounka_buggy_noir", "" },
            { "shounka_buggy_bleufonce", "" },
            { "shounka_buggy_rouge", "" },
			{ "shounka_buggy_jaune", "" },
            { "shounka_buggy_rose", "" },
            { "shounka_buggy_grise", "" },
			{ "shounka_buggy_violet", "" },
            { "shounka_buggy_orange", "" },
            { "pop_a3_audiq7_bleu", "" },
			{ "pop_FordTransiSupervan_civ_violeta", "" },
            { "pop_FordTransiSupervan_civ_naranja", "" },
            { "pop_FordTransiSupervan_civ_gris", "" },
			{ "pop_FordTransiSupervan_civ_rosa", "" },
            { "pop_FordTransiSupervan_civ_Amarillo", "" },
            { "pop_FordTransiSupervan_civ_rojo", "" },
			{ "pop_FordTransiSupervan_civ_azul", "" },
            { "pop_FordTransiSupervan_civ_negro", "" },
            { "pop_smart_supercharge_rojo", "" }
        };
    };
	
    class taxi_shop {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "pop_bus_p_noir", "" },
            { "pop_peugeot508_taxi_civ", "" },
            { "tw_vic_taxi_yellow", "" },
			{ "tw_vic_taxi_orange", "" },
			{ "tw_vic_taxi_green", "" }
        };
    };

    class exo_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "pop_chevrolet_camaro_azul", "" },
            { "pop_chevrolet_camaro_rojo", "" },
            { "pop_nissan_skyline2", "" },
			{ "pop_nissan_skyline3", "" },
            { "pop_nissan_silvia2", "" },
            { "pop_nissan_silvia3", "" },
			{ "pop_afla_4C_azul", "" },
            { "pop_370Z_rojo", "" },
            { "ivory_e36", "" },
			{ "ivory_isf", "" },
            { "ivory_elise", "" },
            { "PKE_92_civ_bleufonce", "" },
			{ "PKE_92_civ_jaune", "" },
            { "PKE_92_civ_rose", "" },
            { "PKE_92_civ_grise", "" },
			{ "PKE_92_civ_violet", "" },
            { "PKE_92_civ_orange", "" },
            { "pop_lotus_GTE", "" },
			{ "pop_lotus_GTE_azul", "" },
            { "pop_lotus_GTE_negro", "" },
            { "pop_lotus_GTE_amarillo", "" },
			{ "pop_caymanS_z_noir", "" },
            { "pop_bmwm4_D", "" },
            { "pop_bmwm4_D1", "" },
			{ "pop_bmwm4_D2", "" },
            { "pop_bmwm6_negro", "" },
            { "pop_bmwm6_azul", "" },
			{ "pop_bmwm6_amarillo", "" },
            { "pop_bmwm6_rosa", "" },
            { "pop_bmwm6_gris", "" },
			{ "pop_bmwm6_violet", "" },
            { "pop_bmwm6_naranja", "" },
            { "pop_c63_2015_rose", "" },
			{ "Quiet_1969charger_blanche_f", "" },
            { "Quiet_1969charger_rouge_f", "" },
            { "Quiet_dodge_15_blanche_f", "" },
			{ "Quiet_dodge_15_noir_f", "" },
            { "pop_mercedes_190_p_civ", "" },
            { "pop_mercedes_190_p_amarillo", "" },
			{ "pop_mercedes_190_p_grise", "" },
            { "pop_mercedes_190_p_naranja", "" },
            { "pop_mercedes_190_p_negro", "" },
			{ "pop_mercedes_190_p_rosa", "" },
            { "pop_mercedes_190_p_violeta", "" },
            { "shounka_a3_rs5_civ_noir", "" },
			{ "shounka_a3_rs5_civ_bleufonce", "" },
            { "shounka_a3_rs5_civ_rouge", "" },
            { "shounka_a3_rs5_civ_jaune", "" },
			{ "shounka_a3_rs5_civ_grise", "" },
            { "shounka_a3_rs5_civ_orange", "" },
            { "pop_a3_308_rcz_bleufonce", "" },
			{ "pop_a3_308_rcz_grise", "" },
            { "pop_a3_308_rcz_jaune", "" },
            { "pop_a3_308_rcz_noir", "" },
			{ "pop_a3_308_rcz_orange", "" },
            { "pop_a3_308_rcz_rose", "" },
            { "pop_a3_308_rcz_rouge", "" },
			{ "pop_a3_308_rcz_violet", "" },
            { "pop_subaru08_civ", "" },
            { "pop_subaru08_amarillo", "" },
			{ "pop_subaru08_azul", "" },
            { "pop_subaru08_gris", "" },
            { "pop_subaru08_naranja", "" },
			{ "pop_subaru08_negro", "" },
            { "pop_subaru08_rojo", "" },
            { "pop_subaru08_rosa", "" },
			{ "pop_subaru08_violeta", "" },
            { "pop_clk_noir", "" },
            { "pop_clk_bleufonce", "" },
			{ "pop_clk_rouge", "" },
            { "pop_clk_jaune", "" },
            { "pop_clk_rose", "" },
			{ "pop_clk_grise", "" },
            { "pop_clk_violet", "" },
            { "pop_clk_orange", "" },
            { "pop_toyota_gt86_Blanco", "" },
			{ "pop_toyota_gt86_silver", "" },
            { "pop_toyota_gt86_gris", "" },
            { "pop_toyota_gt86_negro", "" },
			{ "pop_toyota_gt86_rojo", "" },
            { "pop_cayenne_p_negro", "" },
            { "pop_cayenne_p_azul", "" },
			{ "pop_cayenne_p_rojo", "" },
            { "pop_cayenne_p_amarillo", "" },
            { "pop_cayenne_p_rosa", "" },
			{ "pop_cayenne_p_gris", "" },
            { "pop_cayenne_p_violeta", "" },
            { "pop_cayenne_p_naranja", "" },
			{ "pop_dodge15_civ_rosa_t", "" },
            { "pop_gtr_blanco", "" },
            { "pop_gtr_negro", "" },
			{ "pop_gtr_azul_t", "" },
            { "pop_lincoln_azul", "" },
            { "pop_lincoln_amarillo", "" },
			{ "pop_lincoln_gris", "" },
            { "pop_lincoln_violeta", "" },
            { "pop_lincoln_naranja", "" },
			{ "pop_mustang_negro", "" },
            { "pop_mustang_azul", "" },
            { "pop_mustang_rojo", "" },
            { "pop_mustang_amarillo", "" },
            { "pop_mustang_rosa", "" },
			{ "pop_mustang_gris", "" },
            { "pop_mustang_violeta", "" },
            { "pop_mustang_naranja", "" },
			{ "quiet_Ford_shelbyGT500_noir_f", "" },
            { "quiet_Ford_shelbyGT500_rouge_f", "" },
            { "pop_transam_noir", "" },
			{ "pop_transam_bleufonce", "" },
            { "pop_transam_rouge", "" },
            { "pop_transam_jaune", "" },
			{ "pop_transam_rose", "" },
            { "pop_transam_grise", "" },
            { "pop_transam_violet", "" },
			{ "pop_transam_orange", "" },
            { "pop_hotrod_civ", "" },
            { "pop_rs4_civ_blanco", "" },
			{ "pop_rs4_civ_negro", "" },
            { "pop_rs4_civ_amarillo", "" },
            { "pop_rs4_civ_azul", "" },
			{ "Jonzie_30CSL", "" },
            { "ADM_1964_Impala", "" },
            { "ADM_1969_Camaro", "" },
			{ "ADM_1969_Charger", "" },
            { "Jonzie_Datsun_Z432", "" },
            { "ivory_wrx", "" },
            { "ivory_supra", "" },
            { "IVORY_R8SPYDER", "" },
            { "pop_ford_gt402", "" },
			{ "pop_ford_gt403", "" },
            { "pop_amg_GT_rojo", "" },
            { "ivory_f1", "" },
			{ "ivory_veyron", "" },
            { "pop_chevroletc7_naranja", "" },
            { "pop_chevroletc7_amarillo", "" },
			{ "pop_chevroletc7_azul", "" },
            { "pop_regera_naranja", "" },
            { "pop_regera_amarillo", "" },
			{ "pop_regera_azul", "" },
            { "pop_bmw507_d3", "" },
            { "pop_bmw507_d1", "" },
			{ "pop_bmw507_d2", "" },
            { "pop_lambo_miura_d", "" },
            { "pop_bmw8_rojo", "" },
			{ "pop_m300sl1", "" },
            { "pop_m300sl2", "" },
            { "pop_laferrari_D", "" },
			{ "pop_laferrari_amarillo", "" },
            { "pop_furai", "" },
            { "pop_porche918", "" },
			{ "pop_mp1_D", "" },
            { "pop_chevrolet_naranja", "" },
            { "pop_chevrolet_negro", "" },
			{ "pop_chevrolet_azul", "" },
            { "pop_chevrolet_amarillo", "" },
            { "pop_zonda_s1", "" },
			{ "POP_Ferrari_Enzo_rojo", "" },
            { "quiet_Bugatti_blanche_f", "" },
            { "shounka_f430_spider_amarillo", "" },
			{ "shounka_f430_spider", "" },
            { "shounka_f430_spider_azul", "" },
            { "shounka_f430_spider_gris", "" },
			{ "shounka_f430_spider_naranja", "" },
            { "shounka_f430_spider_negro", "" },
            { "shounka_f430_spider_rojo", "" },
			{ "shounka_f430_spider_rosa", "" },
            { "shounka_f430_spider_violeta", "" },
            { "mrshounka_huracan_c_rose", "" },
			{ "pop_porsche911", "" },
            { "pop_porsche911_gris", "" },
            { "pop_porsche911_naranja", "" },
			{ "pop_porsche911_negro", "" },
            { "pop_porsche911_rojo", "" },
            { "pop_porsche911_rosa", "" },
			{ "pop_porsche911_violeta", "" },
            { "pop_porsche911_amariilo", "" },
            { "pop_porsche911_azul", "" },
			{ "POP_veneno_azul", "" },
            { "pop_mp4", "" },
            { "pop_mp4_bleufonce", "" },
			{ "pop_mp4_grise", "" },
            { "pop_mp4_jaune", "" },
            { "pop_mp4_noir", "" },
			{ "pop_mp4_orange", "" },
            { "pop_mp4_rose", "" },
            { "pop_mp4_rouge", "" },
			{ "pop_mp4_violet", "" },
            { "pop_agera_p", "" },
            { "pop_agera_amarillo", "" },
			{ "pop_agera_azul", "" },
            { "pop_agera_negro", "" },
            { "pop_panamera_negro", "" },
			{ "pop_panamera_azul", "" },
            { "pop_panamera_rojo", "" },
            { "pop_panamera_amarillo", "" },
			{ "pop_panamera_rosa", "" },
            { "pop_panamera_gris", "" },
            { "pop_panamera_naranja", "" },
			{ "pop_gt_noir", "" },
            { "pop_gt_bleufonce", "" },
            { "pop_gt_rouge", "" },
			{ "pop_gt_jaune", "" },
            { "pop_gt_rose", "" },
            { "pop_gt_grise", "" },
            { "pop_gt_violet", "" },
			{ "pop_gt_orange", "" },
            { "pop_pagani_c", "" },
            { "pop_pagani_c_noir", "" },
			{ "pop_pagani_c_bleufonce", "" },
            { "pop_pagani_c_rouge", "" },
            { "pop_pagani_c_jaune", "" },
			{ "pop_pagani_c_rose", "" },
            { "pop_pagani_c_grise", "" },
            { "pop_pagani_c_violet", "" },
			{ "pop_pagani_c_orange", "" },
            { "pop_lykan_Hypersport_violeta", "" },
            { "pop_lykan_Hypersport_noir", "" },
			{ "pop_lykan_Hypersport_bleufonce", "" },
            { "pop_lykan_Hypersport_rouge", "" },
            { "pop_lykan_Hypersport_jaune", "" },
			{ "pop_lykan_Hypersport_rose", "" },
            { "pop_lykan_Hypersport_grise", "" },
            { "pop_lykan_Hypersport_orange", "" },
			{ "pop_bmw_1series", "" },
            { "pop_bmw_1series_bleufonce", "" },
            { "pop_bmw_1series_grise", "" },
			{ "pop_bmw_1series_jaune", "" },
            { "pop_bmw_1series_noir", "" },
            { "pop_bmw_1series_orange", "" },
            { "pop_bmw_1series_rose", "" },
            { "pop_bmw_1series_rouge", "" },
			{ "pop_bmw_1series_violet", "" },
            { "tal_maserati_black", "" },
            { "tal_maserati_white", "" },
			{ "tal_maserati_grey", "" },
            { "tal_maserati_orange", "" },
            { "tal_maserati_red", "" },
			{ "tal_maserati_blue", "" },
            { "tal_maserati_green", "" },
            { "tal_maserati_purple", "" },
			{ "tal_maserati_yellow", "" },
            { "tal_maserati_lightblue", "" },
            { "tal_maserati_lime", "" },
			{ "tal_maserati_pink", "" },
            { "Jonzie_Quattroporte", "" },
            { "Quiet_v2_r8plus_blanche_f", "" },
			{ "Quiet_v2_r8plus_noir_f", "" },
            { "Quiet_v2_r8plus_rouge_f", "" },
            { "IVORY_R8", "" },
			{ "ADM_Monte_Carlo", "" },
            { "ivory_gt500", "" },
            { "ivory_lfa", "" },
			{ "ivory_lp560", "" },
            { "ivory_c", "" },
            { "shounka_limo_civ_bleufonce", "" },
            { "shounka_limo_civ_rose", "" },
            { "Jonzie_Viper", "" },
			{ "pop_r8MP_4", "" },
            { "pop_r8MP_5", "" },
            { "pop_r8MP_3", "" },
			{ "pop_mono", "" },
            { "pop_Caterham_2", "" },
            { "pop_Caterham_3", "" },
			{ "pop_GT3", "" },
            { "pop_GT3_blanco", "" },
            { "pop_GT3_azul", "" },
			{ "pop_megane_GT3_2", "" },
            { "pop_lola_1", "" },
            { "pop_lola_2", "" },
			{ "pop_lola_4", "" },
            { "pop_lola_7", "" },
            { "pop_lola_8", "" },
			{ "pop_lola_9", "" }
        };
    };
	
    class kart_shop {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Kart_01_Blu_F", "" },
            { "C_Kart_01_Fuel_F", "" },
            { "C_Kart_01_Red_F", "" },
            { "C_Kart_01_Vrana_F", "" }
        };
    };
	
    class moto_shop {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "pop_quad_1", "" },
            { "shounka_harley_a3", "" },
            { "shounka_harley_a3_noir", "" },
            { "shounka_harley_a3_bleu", "" },
            { "shounka_harley_a3_rouge", "" },
            { "shounka_harley_a3_lolz", "" },
            { "pop_quad_sport", "" },
            { "pop_yamaha_p", "" },
			{ "pop_yamaha_p_bf", "" },
			{ "pop_yamaha_p_g", "" },
			{ "pop_yamaha_p_j", "" },
			{ "pop_yamaha_p_noir", "" },
			{ "pop_yamaha_p_o", "" },
			{ "pop_yamaha_p_rose", "" },
			{ "pop_yamaha_p_r", "" }
        };
    };
	
    class civ_truck {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "pop_dafxf_euro6_rojo_oscuro", "" },
			{ "pop_dafxf_euro6_verde", "" },
			{ "pop_dafxf_euro6_verde_oscuro", "" },
			{ "pop_dafxf_euro6_blanco", "" },
			{ "pop_dafxf_euro6_azul", "" },
			{ "pop_dafxf_euro6_azul_oscuro", "" },
			{ "pop_dafxf_euro6_gris", "" },
			{ "pop_dafxf_euro6_amarillo", "" },
			{ "pop_dafxf_euro6_rosa", "" },
			{ "pop_dafxf_euro6_violeta", "" },
			{ "pop_iveco_f", "" },
			{ "mr_american_classic_truck_v2", "" },
			{ "pop_iveco_bleufonce", "" },
			{ "pop_iveco_rouge", "" },
			{ "pop_iveco_jaune", "" },
			{ "pop_iveco_rose", "" },
			{ "pop_iveco_grise", "" },
			{ "pop_iveco_orange", "" },
			{ "pop_Man_TGX_negro", "" },
			{ "pop_volvo_camion", "" },
			{ "pop_mercedes_vito", "" },
			{ "pop_mercedes_vito1", "" },
			{ "pop_Vandura_civ", "" },
			{ "pop_Vandura_civ_negro", "" },
			{ "pop_Vandura_civ_azul", "" },
			{ "pop_Vandura_civ_rojo", "" },
			{ "pop_Vandura_civ_Amarillo", "" },
			{ "pop_Vandura_civ_rosa", "" },
			{ "pop_Vandura_civ_gris", "" },
			{ "pop_Vandura_civ_violeta", "" },
			{ "pop_Vandura_civ_naranja", "" },
			{ "shounka_a3_spr_civ_noir", "" },
			{ "shounka_a3_spr_civ_bleufonce", "" },
			{ "shounka_a3_spr_civ_rouge", "" },
			{ "shounka_a3_spr_civ_jaune", "" },
			{ "shounka_a3_spr_civ_rose", "" },
			{ "shounka_a3_spr_civ_grise", "" },
			{ "shounka_a3_spr_civ_violet", "" },
			{ "shounka_a3_spr_civ_orange", "" },
			{ "Jonzie_Transit", "" },
			{ "pop_nemo", "" },
			{ "pop_nemo_noir", "" },
			{ "pop_nemo_bleufonce", "" },
			{ "pop_nemo_rouge", "" },
			{ "pop_nemo_jaune", "" },
			{ "pop_nemo_rose", "" },
			{ "pop_nemo_grise", "" },
			{ "pop_nemo_violet", "" },
			{ "pop_nemo_orange", "" },
			{ "ADM_Ford_F100", "" }
        };
    };

    class civ_air {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "gazelle_civil_1", "" },
            { "gazelle_civil_2", "" },
            { "gazelle_civil_3", "" },
            { "ec135_popnews_F", "" },
			{ "ivory_b206", "" },
			{ "ivory_b206_news", "" },
			{ "ec135_civil_rojo", "" },
			{ "ec135_civil_blanco", "" },
			{ "ec135_civil_azul", "" },
			{ "ec135_civil_Negro", "" },
			{ "pop_cessna_1", "" },
			{ "pop_cessna_2", "" },
			{ "pop_cessna_3", "" },
			{ "pop_cessna_4", "" },
			{ "pop_cessna_6", "" }
			
        };
    };
	
    class donator {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "pop_insurgent_v1", "" },
            { "pop_insurgent_vELN", "" },
            { "pop_megane_GT3_gustav", "" },
            { "pop_cherokee_negro_mafia3", "" },
			{ "pop_nissan_silvia", "" },
			{ "pop_nissan_silvia1", "" },
			{ "pop_nissan_silvia4", "" },
			{ "pop_nissan_patrol_corto", "" },
			{ "pop_JaguarP7Civil", "" },
			{ "pop_hyundai_veloster", "" },
			{ "pop_hyundai_veloster1", "" },
            { "pop_ford_gt40", "" },
            { "pop_ford_gt401", "" },
            { "pop_ford_gt404", "" },
			{ "pop_488GT3Civil", "" },
			{ "pop_bmw_x5", "" },
			{ "pop_bmw_x51", "" },
			{ "pop_chevrolet_camaro_blanco", "" },
			{ "pop_chevrolet_camaro_negro", "" },
			{ "pop_chevrolet_camaro_amarillo", "" },
			{ "pop_nissan_leaf", "" },
            { "pop_nissan_leaf1", "" },
            { "pop_nissan_pathfinder", "" },
            { "pop_nissan_pathfinder1", "" },
			{ "pop_nissan_skyline", "" },
			{ "pop_nissan_skyline1", "" },
			{ "pop_seat_leon_negro", "" },
			{ "pop_ford_focusrs_verde", "" },
			{ "pop_ford_focusrs_negro", "" },
			{ "pop_ford_focusrs_blanco", "" },
			{ "pop_seat_ibiza_blanco", "" },
            { "pop_seat_ibiza_negro", "" },
            { "pop_alfa_romeo_159_negro", "" },
            { "pop_alfa_romeo_159_rojo", "" },
			{ "pop_AudiA1_D4", "" },
			{ "pop_AudiA1_D5", "" },
			{ "pop_AudiA1_D1", "" },
			{ "pop_daciaCivil", "" },
			{ "pop_mercedes_vito2", "" },
			{ "pop_mercedes_vito3", "" },
			{ "pop_amg_GT1", "" },
            { "pop_amg_GT_blanco", "" },
            { "PKE_92_civ_noir", "" },
            { "PKE_92_civ_rouge", "" },
			{ "pop_370Z1", "" },
			{ "pop_370Z_blanco", "" },
			{ "pop_afla_4C_rojo", "" },
			{ "pop_afla_4C_negro", "" },
			{ "pop_afla_4C_amarillo", "" },
			{ "pop_afla_4C_naranja", "" },
			{ "pop_lotus_GTE_naranja", "" },
            { "pop_lotus_GTE_rojo", "" },
            { "pop_caymanS_z_blanco", "" },
            { "Quiet_1969charger_bleu_f", "" },
			{ "pop_bmwm6_rosa_t", "" },
			{ "pop_bmwm6_rojo", "" },
			{ "pop_c63_2015_rose_t", "" },
			{ "Quiet_1969charger_noir_f", "" },
			{ "Quiet_dodge_15_rouge_f", "" },
			{ "pop_mercedes_190_p_rojo", "" },
			{ "pop_mercedes_190_p_azul", "" },
            { "shounka_a3_rs5_civ_rose_t", "" },
            { "pop_clk_rose_t", "" },
            { "pop_lincoln_rojo", "" },
			{ "pop_chevroletc7_rojo", "" },
			{ "pop_chevroletc7_negro", "" },
			{ "pop_chevroletc7_blanco", "" },
			{ "pop_regera_negro", "" },
			{ "pop_regera_rojo", "" },
			{ "pop_bmw507_d", "" },
			{ "pop_bmw8", "" },
            { "pop_bmw8_blanco", "" },
            { "pop_m300sl3", "" },
            { "pop_laferrari_negro", "" },
			{ "pop_chevrolet_rojo", "" },
			{ "pop_InsurgentCivil", "" },
			{ "pop_toyota_FJCruiser", "" },
			{ "pop_toyota_FJCruiser1", "" },
			{ "pop_nissan_qashqai", "" },
			{ "pop_nissan_qashqai1", "" },
			{ "pop_jeep_grandcherokee", "" },
            { "pop_jeep_grandcherokee1", "" },
            { "pop_lexus_gx4601", "" },
            { "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4601", "" },
            { "pop_lexus_gx4601", "" },
            { "pop_lexus_gx4601", "" },
            { "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4601", "" },
			{ "pop_lexus_gx4603", "" },
			{ "pop_cherokee_negro_mafia", "" },
			{ "pop_cherokee_negro_mafia2", "" },
			{ "pop_volvo", "" },
			{ "pop_volvo1", "" },
			{ "pop_volvo2", "" },
            { "pop_volvo3", "" },
            { "pop_hyundai_x35", "" },
            { "pop_hyundai_x351", "" },
			{ "pop_hyundai_x352", "" },
			{ "pop_hyundai_x353", "" },
			{ "pop_rover_evo_negro", "" },
			{ "pop_rover_evo_naranja", "" },
			{ "pop_ranger_rover", "" },
			{ "pop_ranger_rover1", "" },
			{ "pop_ranger_rover2", "" },
            { "pop_rover_evo_rojo", "" },
            { "pop_hummer_civ_Naranja", "" },
            { "pop_h2_noir", "" },
			{ "pop_avalanche_rojo", "" },
			{ "Quiet_ford_raptor_noir_f", "" },
			{ "pop_cherokee_negro", "" },
			{ "pop_cherokee_negro_mate", "" },
			{ "Quiet_Cadillac_blanche_f", "" },
			{ "quiet_sub2015_blanche_f", "" },
			{ "mr_american_classic_truck_v3", "" },
            { "pop_iveco_noir", "" },
            { "pop_FordTransiSupervan_don", "" },
            { "pop_dafxf_euro6_rojo", "" },
			{ "pop_dafxf_euro6_negro", "" },
			{ "pop_lola_10", "" },
			{ "pop_lola_3", "" },
			{ "pop_megane_GT3_16", "" },
			{ "pop_megane_GT3_38", "" },
			{ "pop_megane_GT3_36", "" },
			{ "pop_megane_GT3_34", "" },
            { "pop_megane_GT3_24", "" },
            { "pop_megane_GT3_1", "" },
            { "pop_megane_GT3_5", "" },
			{ "pop_megane_GT3_3", "" },
			{ "pop_megane_GT3_4", "" },
			{ "pop_megane_GT3_6", "" },
			{ "pop_megane_GT3_7", "" },
			{ "pop_megane_GT3_8", "" },
			{ "pop_megane_GT3_9", "" },
			{ "pop_megane_GT3_10", "" },
            { "pop_megane_GT3_11", "" },
            { "pop_megane_GT3_12", "" },
            { "pop_megane_GT3_13", "" },
			{ "pop_megane_GT3_14", "" },
			{ "pop_megane_GT3_15", "" },
			{ "pop_megane_GT3_18", "" },
			{ "pop_megane_GT3_19", "" },
			{ "pop_megane_GT3_20", "" },
			{ "pop_megane_GT3_22", "" },
			{ "pop_megane_GT3_23", "" },
            { "pop_megane_GT3_25", "" },
            { "pop_megane_GT3_26", "" },
            { "pop_megane_GT3_27", "" },
			{ "pop_megane_GT3_28", "" },
			{ "pop_megane_GT3_29", "" },
			{ "pop_megane_GT3_30", "" },
			{ "pop_megane_GT3_31", "" },
			{ "pop_megane_GT3_32", "" },
			{ "pop_megane_GT3_33", "" },
			{ "pop_megane_GT3_35", "" },
            { "pop_megane_GT3_37", "" },
            { "pop_GT3_negro", "" },
            { "pop_Caterham_1", "" },
			{ "pop_Caterham_4", "" },
			{ "pop_mono_D1", "" },
			{ "pop_mono_D2", "" },
			{ "pop_mono_D3", "" },
			{ "pop_mono_D4", "" },
			{ "pop_r8MP_2", "" },
			{ "pop_r8MP_6", "" },
            { "pop_r8MP_7", "" },
            { "shounka_limo_civ_noir", "" },
            { "shounka_limo_civ_rouge", "" },
			{ "shounka_limo_civ_jaune", "" },
			{ "Quiet_v2_r8plus_bleu_f", "" },
			{ "POP_Ferrari_Enzo_rojo", "" },
			{ "quiet_Bugatti_chrome_f", "" },
			{ "POP_veneno_blanco", "" },
			{ "POP_veneno_negro", "" },
			{ "POP_veneno_Amarillo", "" },
            { "mrshounka_huracan_c_noir", "" },
            { "mrshounka_huracan_c_bleufonce", "" },
            { "mrshounka_huracan_c_rouge", "" },
			{ "mrshounka_huracan_c_jaune", "" },
			{ "mrshounka_huracan_c_grise", "" },
			{ "mrshounka_huracan_c_violet", "" },
			{ "mrshounka_huracan_c_orange", "" },
			{ "pop_clk_noir_t", "" },
			{ "pop_clk_bleufonce_t", "" },
			{ "pop_clk_rouge_t", "" },
            { "pop_clk_jaune_t", "" },
            { "pop_clk_rose_t", "" },
            { "pop_clk_grise_t", "" },
			{ "pop_clk_violet_t", "" },
			{ "pop_clk_orange_t", "" },
			{ "pop_bmwm6_negro_t", "" },
			{ "pop_bmwm6_azul_t", "" },
			{ "pop_bmwm6_rojo_t", "" },
			{ "pop_bmwm6_amarillo_t", "" },
			{ "pop_bmwm6_gris_t", "" },
            { "pop_bmwm6_violet_t", "" },
            { "pop_bmwm6_naranja_t", "" },
            { "shounka_a3_rs5_civ_noir_t", "" },
			{ "Quiet_Cadillac_chrome_f", "" },
			{ "quiet_sub2015_chrome_f", "" },
			{ "shounka_a3_rs5_civ_bleufonce_t", "" },
			{ "shounka_a3_rs5_civ_rouge_t", "" },
			{ "shounka_a3_rs5_civ_jaune_t", "" },
			{ "shounka_a3_rs5_civ_grise_t", "" },
			{ "shounka_a3_rs5_civ_orange_t", "" },
            { "pop_gtr_blanco_t", "" },
            { "pop_gtr_negro_t", "" },
            { "Quiet_dodge_15_chrome_f", "" },
			{ "Quiet_ford_raptor_chrome_f", "" },
			{ "Quiet_c65amg_chrome_f", "" },
			{ "Quiet_v2_r8plus_chrome_f", "" },
			{ "Quiet_1969charger_chrome_f", "" },
			{ "quiet_Ford_shelbyGT500_chrome_f", "" },
			{ "pop_dodge15_civ_negro_t", "" },
			{ "pop_dodge15_civ_azuloscuro_t", "" },
            { "pop_dodge15_civ_rojo_t", "" },
            { "pop_dodge15_civ_amarillo_t", "" },
            { "pop_dodge15_civ_gris_t", "" },
			{ "pop_dodge15_civ_violeta_t", "" },
			{ "pop_dodge15_civ_naranja_t", "" },
			{ "pop_FordTransiSupervan_civ_violeta", "" },
			{ "pop_FordTransiSupervan_civ_naranja", "" },
			{ "pop_FordTransiSupervan_don", "" },
			{ "pop_FordTransiSupervan_civ_gris", "" },
			{ "pop_FordTransiSupervan_civ_rosa", "" },
            { "pop_FordTransiSupervan_civ_Amarillo", "" },
            { "pop_FordTransiSupervan_civ_rojo", "" },
            { "pop_FordTransiSupervan_civ_azul", "" },
			{ "pop_FordTransiSupervan_civ_negro", "" },
			{ "pop_c63_2015_mat_t", "" },
			{ "pop_c63_2015_noir_t", "" },
			{ "pop_c63_2015_mat_n_t", "" },
			{ "pop_c63_2015_bleufonce_t", "" },
			{ "pop_c63_2015_mat_b_t", "" },
			{ "pop_c63_2015_rouge_t", "" },
            { "pop_c63_2015_jaune_t", "" },
            { "pop_c63_2015_grise_t", "" },
            { "pop_c63_2015_violet_t", "" },
			{ "pop_c63_2015_orange_t", "" },
			{ "pop_c63_2015_mat", "" },
			{ "pop_c63_2015_noir", "" },
			{ "pop_c63_2015_mat_n", "" },
			{ "pop_c63_2015_bleufonce", "" },
			{ "pop_c63_2015_mat_b", "" },
			{ "pop_c63_2015_rouge", "" },
            { "pop_c63_2015_jaune", "" },
            { "pop_c63_2015_grise", "" },
            { "pop_c63_2015_violet", "" },
			{ "pop_c63_2015_orange", "" },
			{ "pop_rs4_civ_t_blanco", "" },
			{ "pop_rs4_civ_t_negro", "" },
			{ "pop_rs4_civ_t_azul", "" },
			{ "pop_rs4_civ_blanco", "" },
			{ "pop_rs4_civ_negro", "" },
			{ "pop_rs4_civ_amarillo", "" },
            { "pop_rs4_civ_azul", "" },
            { "pop_evox_negro_t", "" },
            { "pop_evox_azul_t", "" },
			{ "pop_evox_rojo_t", "" },
			{ "pop_evox_amarillo_t", "" },
			{ "pop_evox_gris_t", "" },
			{ "pop_evox_violeta_t", "" },
			{ "pop_evox_naranja_t", "" },
			{ "pop_mustang_negro", "" },
			{ "pop_mustang_azul", "" },
            { "pop_mustang_rojo", "" },
            { "pop_mustang_amarillo", "" },
            { "pop_mustang_rosa", "" },
			{ "pop_mustang_gris", "" },
			{ "pop_mustang_violeta", "" },
			{ "ADM_Monte_Carlo", "" },
			{ "ivory_gt500", "" },
			{ "ivory_lfa", "" },
			{ "ivory_lp560", "" },
			{ "ivory_c", "" },
			{ "pop_mustang_naranja", "" }
        };
    };

    class civ_ship {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Rubberboat", "1200" },
            { "POP_Lancha_civil", "2500" },
            { "Mattaust_Fisher", "3500" },
            { "POP_Speed_yatch", "150000" }
        };
    };
	
    class med_shop {
        side = "med";
        conditions = "";
        vehicles[] = {
            { "mr_stretcher", "" },
			{ "tw_vic_ems", "" }, 			
			{ "Jonzie_ambulance", "" }
        };
    };

    class med_air {
        side = "med";
        conditions = "";
        vehicles[] = {
            { "ec135_ems_F", "" }
        };
    };

    class cop_car {
        side = "cop";
        conditions = "";
        vehicles[] = {
            { "tw_vic_marked", "" },
			{ "tw_raptor_marked", "" },
			{ "tw_van_marked", "" }
        };
    };

    class cop_air {
        side = "cop";
        conditions = "call life_coplevel >= 3";
        vehicles[] = {
            { "policia_helicopter", "" },
            { "ec135_policia_f", "" },
			{ "ec135_guardiacivil_F", "" }
        };
    };

    class cop_ship {
        side = "cop";
        conditions = "";
        vehicles[] = {
            { "C_Boat_Civil_01_police_F", "" },
            { "pop_predator", "" },
            { "POP_Lancha_policia", "" }, 
            { "B_Boat_Transport_01_F", "" }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    "price" is the price before any multipliers set in Master_Config are applied.
    *
    *    Default Multiplier Values & Calculations:
    *       Civilian [Purchase, Sell]: [1.0, 0.5]
    *       Cop [Purchase, Sell]: [0.5, 0.5]
    *       Medic [Purchase, Sell]: [0.75, 0.5]
    *       ChopShop: Payout = price * 0.25
    *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
    *       Cop Impound: Payout = price * 0.1
    *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
    *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
    *
    *       1: STRING (Condition)
    *    Textures config follows { Texture Name, side, {texture(s)path}, Condition}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    /********************Second Hand Cars Start********************/
    class pop_nissan_leaf2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };



    class pop_nissan_leaf3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_seat_leon_sp {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_ford_focusrs_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_ford_focusrs_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_seat_leon_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_seat_leon_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_alfa_romeo_159_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_seat_ibiza_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_seat_ibiza_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_AudiA1_blanco {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_AudiA1_D2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_AudiA1_D3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_AudiA1_D5 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_astra_RS {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_clio_civ_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_207_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_207_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_207_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_207_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_207_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_207_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_207_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_golfvi_civ {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_golfvi_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_golfvi_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_golfvi_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_golfvi_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_golfvi_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_golfvi_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_golfvi_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_evox_rosa_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_evox_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_evox_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_evox_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_evox_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_evox_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_evox_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_evox_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_evox_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_308_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_308_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_308_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_308_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_308_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_308_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_308_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_308_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3800;
        textures[] = {};
    };

    class pop_twingo_p {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_twingo_p_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_twingo_p_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_twingo_p_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_twingo_p_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_twingo_p_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_twingo_p_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_twingo_p_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_twingo_p_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_Alfa_Romeo_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_Alfa_Romeo_azuloscuro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_Alfa_Romeo_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_Alfa_Romeo_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_Alfa_Romeo_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_Alfa_Romeo_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_Alfa_Romeo_violetta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_Alfa_Romeo_Naranga {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_p_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_p_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_p_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_p_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_p_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_p_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_p_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_p_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_picasso_p_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_picasso_p_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_picasso_p_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_picasso_p_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_picasso_p_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_picasso_p_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_picasso_p_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_c4_picasso_p_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds3_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds3_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds3_civ_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds3_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds3_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds3_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds3_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds3_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds4_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds4_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds4_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds4_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds4_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds4_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds4_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_ds4_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_r5_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_r5_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_r5_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_r5_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_r5_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_r5_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_r5_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_r5_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_rs_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_rs_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_rs_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_rs_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_rs_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_rs_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_rs_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_rs_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_smart_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class POP_smart_civ_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class pop_peugeot508_civ_noir_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_peugeot508_civ_bleufonce_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_peugeot508_civ_rouge_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_peugeot508_civ_jaune_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_peugeot508_civ_rose_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_peugeot508_civ_grise_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_peugeot508_civ_violet_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_peugeot508_civ_orange_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs4_civ_t_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_rs4_civ_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 6000;
        textures[] = {};
    };

    class pop_rs6 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs6_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs6_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs6_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs6_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs6_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs6_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs6_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class pop_rs6_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };

    class POP_smart_civ_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class Jonzie_Mini_Cooper_R_spec {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4500;
        textures[] = {};
    };

    class Jonzie_Mini_Cooper {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4000;
        textures[] = {};
    };

    class Jonzie_Corolla {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class Jonzie_Datsun_510 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class Jonzie_Ceed {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class IVORY_PRIUS {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 4200;
        textures[] = {};
    };

    /********************Second Hand Cars End********************/
    /********************Go-Kart Shop Start********************/
	
    class C_Kart_01_Blu_F {
        vItemSpace = 50;
        conditions = "{!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    class C_Kart_01_Fuel_F {
        vItemSpace = 50;
        conditions = "{!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    class C_Kart_01_Red_F {
        vItemSpace = 50;
        conditions = "{!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    class C_Kart_01_Vrana_F {
        vItemSpace = 50;
        conditions = "{!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    /********************Go-Kart Shop End********************/
    /********************dodge car Shop Start********************/
	
	class pop_nissan_pathfinder2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };

    class pop_nissan_pathfinder3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };

    class pop_bmw_x52 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };

    class pop_bmw_x53 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };

    class pop_hyundai_veloster2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };

    class pop_hyundai_veloster3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };

    class pop_nissan_patrol_corto {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_jeep_grandcherokee2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_jeep_grandcherokee3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_nissan_qashqai2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_nissan_qashqai3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_toyota_FJCruiser2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_toyota_FJCruiser3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_volvo2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_lexus_gx4602 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_hyundai_x352 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_dacia_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_dacia_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_dacia_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_ranger_rover3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_rover_evo_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_hummer_civ_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_hummer_civ_azulfuerte {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_hummer_civ_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_hummer_civ_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_hummer_civ_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_hummer_civ_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_hummer_civ_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_h2_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_h2_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_h2_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_h2_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_h2_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_h2_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_h2_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_Bowler_c {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_Bowler_c_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_Bowler_c_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_Bowler_c_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_Bowler_c_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_Bowler_c_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_Bowler_c_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_Bowler_c_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_Bowler_c_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_avalanche_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_avalanche_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_avalanche_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_avalanche_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_avalanche_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_avalanche_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_avalanche_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_monsteur {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        textures[] = {};
    };

    class pop_monsteur_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        textures[] = {};
    };

    class pop_monsteur_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        textures[] = {};
    };

    class pop_monsteur_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        textures[] = {};
    };

    class pop_monsteur_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        textures[] = {};
    };

    class pop_monsteur_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        textures[] = {};
    };

    class pop_monsteur_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        textures[] = {};
    };

    class pop_monsteur_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 60000;
        textures[] = {};
    };

    class pop_monsteur_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 50000;
        textures[] = {};
    };

    class POP_jeep_blinde_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class POP_jeep_blinde_azul_mate {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class POP_jeep_blinde_blanco {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class POP_jeep_blinde_blanco_mate {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class POP_jeep_blinde_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class pop_jeep_blinde_violeta_mate {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class POP_jeep_blinde_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class POP_jeep_blinde_rojo_mate {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class POP_Landrover_Defender {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };

    class Quiet_ford_raptor_blanche_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class Quiet_ford_raptor_bleu_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class Quiet_ford_raptor_rouge_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class Quiet_c65amg_blanche_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 50000;
        textures[] = {};
    };

    class Quiet_c65amg_noir_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 50000;
        textures[] = {};
    };

    class pop_raptor_blanco {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_raptor_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_raptor_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_raptor_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_raptor_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_raptor_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_raptor_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_raptor_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_UAZ_Patriot_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };

    class pop_Vandura_civ_equipoa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class pop_Volkswagen_Touareg_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_Volkswagen_Touareg_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_Volkswagen_Touareg_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_Volkswagen_Touareg_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_Volkswagen_Touareg_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_Volkswagen_Touareg_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_Volkswagen_Touareg_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_Volkswagen_Touareg_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_cherokee_negro_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_cherokee_negro_azul_mate {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_cherokee_negro_blanco {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_cherokee_negro_blano_mate {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_cherokee_negro_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_cherokee_negro_violeta_mate {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_cherokee_negro_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_cherokee_negro_rojo_mate {
        vItemSpace = 50;
        Quiet_Cadillac_noir_f = 50000;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class Quiet_Cadillac_noir_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class Quiet_Cadillac_rouge_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class quiet_sub2015_bleu_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class quiet_sub2015_noir_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class quiet_sub2015_rouge_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class POP_Qashqai_rojo_oscuro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_smart_supercharge_civ_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_smart_supercharge_civ_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class shounka_buggy_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class shounka_buggy_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class shounka_buggy_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class shounka_buggy_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class shounka_buggy_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class shounka_buggy_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class shounka_buggy_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class shounka_buggy_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_a3_audiq7_bleu {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_FordTransiSupervan_civ_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_FordTransiSupervan_civ_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_FordTransiSupervan_civ_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_FordTransiSupervan_civ_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_FordTransiSupervan_civ_Amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_FordTransiSupervan_civ_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_FordTransiSupervan_civ_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_FordTransiSupervan_civ_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_smart_supercharge_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    /********************dodge car Shop Stop********************/
    /********************Taxi Car Shop Start********************/

    class pop_bus_p_noir {
        vItemSpace = 50;
        conditions = "license_taxi_shop || {!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    class pop_peugeot508_taxi_civ {
        vItemSpace = 50;
        conditions = "license_taxi_shop || {!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    class tw_vic_taxi_yellow {
        vItemSpace = 50;
        conditions = "license_taxi_shop || {!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    class tw_vic_taxi_orange {
        vItemSpace = 50;
        conditions = "license_taxi_shop || {!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    class tw_vic_taxi_green {
        vItemSpace = 50;
        conditions = "license_taxi_shop || {!(playerSide isEqualTo civilian)}";
        price = 1500;
        textures[] = {};
    };

    /********************Taxi Car Shop End********************/
    /********************Civ Truck Shop Start********************/
    class pop_dafxf_euro6_rojo_oscuro {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_verde {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_verde_oscuro {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_blanco {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_azul {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_azul_oscuro {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_gris {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_rosa {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_dafxf_euro6_violeta {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_iveco_f {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class mr_american_classic_truck_v2 {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class pop_iveco_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class pop_iveco_rouge {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class pop_iveco_jaune {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class pop_iveco_rose {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class pop_iveco_grise {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class pop_iveco_orange {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };

    class pop_Man_TGX_negro {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_volvo_camion {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_mercedes_vito {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_mercedes_vito1 {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ_negro {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ_azul {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ_rojo {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ_Amarillo {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ_rosa {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ_gris {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ_violeta {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class pop_Vandura_civ_naranja {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class shounka_a3_spr_civ_noir {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class shounka_a3_spr_civ_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class shounka_a3_spr_civ_rouge {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class shounka_a3_spr_civ_jaune {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class shounka_a3_spr_civ_rose {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class shounka_a3_spr_civ_grise {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class shounka_a3_spr_civ_violet {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class shounka_a3_spr_civ_orange {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };

    class Jonzie_Transit {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo_noir {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo_rouge {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo_jaune {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo_rose {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo_grise {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo_violet {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class pop_nemo_orange {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 15000;
        textures[] = {};
    };

    class ADM_Ford_F100 {
        vItemSpace = 50;
        conditions = "license_civ_truck || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    /********************Civ Truck Shop End********************/
    /********************Civ Air Shop Start********************/
	
    class gazelle_civil_1 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 70000;
        textures[] = {};
    };

    class gazelle_civil_2 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 70000;
        textures[] = {};
    };

    class gazelle_civil_3 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 70000;
        textures[] = {};
    };

    class ec135_popnews_F {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 70000;
        textures[] = {};
    };

    class ivory_b206 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 70000;
        textures[] = {};
    };

    class ivory_b206_news {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 70000;
        textures[] = {};
    };

    class ec135_civil_rojo {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };

    class ec135_civil_blanco {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };

    class ec135_civil_azul {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };

    class ec135_civil_Negro {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };

    class pop_cessna_1 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_cessna_2 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_cessna_3 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_cessna_4 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_cessna_6 {
        vItemSpace = 50;
        conditions = "license_civ_air || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    /********************Civ Air Shop Stop********************/
    /********************Med Shop Start********************/

    class mr_stretcher {
        vItemSpace = 50;
        conditions = "";
        price = 250;
        textures[] = {};
    };

    class tw_vic_ems {
        vItemSpace = 50;
        conditions = "call life_coplevel >= 3";
        price = 500;
        textures[] = {};
    };

    class Jonzie_ambulance {
        vItemSpace = 50;
        conditions = "";
        price = 1000;
        textures[] = {};
    };

    /********************Med Shop Stop********************/
    /********************Med Air Shop Start********************/
	
    class ec135_ems_F {
        vItemSpace = 50;
        conditions = "license_med_air";
        price = 250;
        textures[] = {};
    };

    /********************Med Air Shop Stop********************/
    /********************Cop Shop Start********************/

    class tw_vic_marked {
        vItemSpace = 50;
        conditions = "call life_coplevel >= 1";
        price = 500;
        textures[] = {};
    };

    class tw_raptor_marked {
        vItemSpace = 50;
        conditions = "call life_coplevel >= 3";
        price = 1450;
        textures[] = {};
    };

    class tw_van_marked {
        vItemSpace = 50;
        conditions = "call life_coplevel >= 5";
        price = 8000;
        textures[] = {};
    };

    /********************Cop Shop Stop********************/
    /********************Cop air Shop Start********************/
	
    class policia_helicopter {
        vItemSpace = 50;
        conditions = "license_cop_air || {!(playerSide isEqualTo west)}";
        price = 7500;
        textures[] = {};
    };

    class ec135_policia_f {
        vItemSpace = 50;
        conditions = "license_cop_air || {!(playerSide isEqualTo west)}";
        price = 7500;
        textures[] = {};
    };

    class ec135_guardiacivil_F {
        vItemSpace = 50;
        conditions = "license_cop_air || {!(playerSide isEqualTo west)}";
        price = 7500;
        textures[] = {};
    };

    /********************Cop air Shop Stop********************/
    /********************Cop boat Shop Start********************/
	
    class C_Boat_Civil_01_police_F {
        vItemSpace = 50;
        conditions = "license_cop_ship || call life_coplevel >= 3";
        price = 2000;
        textures[] = {};
    };

    class pop_predator {
        vItemSpace = 50;
        conditions = "license_cop_ship || call life_coplevel >= 3";
        price = 2000;
        textures[] = {};
    };

    class POP_Lancha_policia {
        vItemSpace = 50;
        conditions = "license_cop_ship || call life_coplevel >= 3";
        price = 2000;
        textures[] = {};
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 50;
        conditions = "license_cop_ship || call life_coplevel >= 3";
        price = 3000;
        textures[] = {};
    };

    /********************Cop boat Shop Stop********************/
	/********************Exo Shop Start********************/
	
    class pop_chevrolet_camaro_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 75500;
        textures[] = {};
    };

    class pop_chevrolet_camaro_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 75500;
        textures[] = {};
    };

    class pop_nissan_skyline2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35500;
        textures[] = {};
    };

    class pop_nissan_skyline3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35500;
        textures[] = {};
    };

    class pop_nissan_silvia2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_nissan_silvia3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_afla_4C_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_370Z_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class ivory_e36 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 18000;
        textures[] = {};
    };

    class ivory_isf {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class ivory_elise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class PKE_92_civ_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class PKE_92_civ_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class PKE_92_civ_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class PKE_92_civ_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class PKE_92_civ_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class PKE_92_civ_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_lotus_GTE {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_lotus_GTE_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_lotus_GTE_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_lotus_GTE_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_caymanS_z_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm4_D {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm4_D1 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm4_D2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm6_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm6_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm6_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm6_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm6_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm6_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_bmwm6_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class pop_c63_2015_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };

    class Quiet_1969charger_blanche_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class Quiet_1969charger_rouge_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class Quiet_dodge_15_blanche_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class Quiet_dodge_15_noir_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_mercedes_190_p_civ {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };

    class pop_mercedes_190_p_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };

    class pop_mercedes_190_p_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };

    class pop_mercedes_190_p_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };

    class pop_mercedes_190_p_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };

    class pop_mercedes_190_p_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };

    class pop_mercedes_190_p_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };

    class shounka_a3_rs5_civ_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class shounka_a3_rs5_civ_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class shounka_a3_rs5_civ_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class shounka_a3_rs5_civ_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class shounka_a3_rs5_civ_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class shounka_a3_rs5_civ_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };

    class pop_a3_308_rcz_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_a3_308_rcz_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_a3_308_rcz_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_a3_308_rcz_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_a3_308_rcz_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_a3_308_rcz_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_a3_308_rcz_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_a3_308_rcz_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };

    class pop_subaru08_civ {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_subaru08_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_subaru08_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_subaru08_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_subaru08_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_subaru08_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_subaru08_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_subaru08_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_subaru08_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };

    class pop_clk_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_clk_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_clk_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_clk_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_clk_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_clk_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_clk_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_clk_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_toyota_gt86_Blanco {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };

    class pop_toyota_gt86_silver {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };

    class pop_toyota_gt86_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };

    class pop_toyota_gt86_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };

    class pop_toyota_gt86_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };

    class pop_cayenne_p_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_cayenne_p_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_cayenne_p_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_cayenne_p_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_cayenne_p_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_cayenne_p_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_cayenne_p_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_cayenne_p_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };

    class pop_dodge15_civ_rosa_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };

    class pop_gtr_blanco {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_gtr_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_gtr_azul_t {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };

    class pop_lincoln_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_lincoln_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_lincoln_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_lincoln_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_lincoln_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_mustang_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = pop_mustang_negro;
        textures[] = {};
    };

    class pop_mustang_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 24500;
        textures[] = {};
    };

    class pop_mustang_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = pop_mustang_rojo;
        textures[] = {};
    };

    class pop_mustang_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 24500;
        textures[] = {};
    };

    class pop_mustang_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = pop_mustang_rosa;
        textures[] = {};
    };

    class pop_mustang_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 24500;
        textures[] = {};
    };

    class pop_mustang_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = pop_mustang_violeta;
        textures[] = {};
    };

    class pop_mustang_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 24500;
        textures[] = {};
    };

    class quiet_Ford_shelbyGT500_noir_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 24500;
        textures[] = {};
    };

    class quiet_Ford_shelbyGT500_rouge_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 24500;
        textures[] = {};
    };

    class pop_transam_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_transam_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_transam_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_transam_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_transam_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_transam_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_transam_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_transam_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_hotrod_civ {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_rs4_civ_blanco {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = pop_rs4_civ_blanco;
        textures[] = {};
    };

    class pop_rs4_civ_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class pop_rs4_civ_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = pop_rs4_civ_amarillo;
        textures[] = {};
    };

    class pop_rs4_civ_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };

    class Jonzie_30CSL {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 39500;
        textures[] = {};
    };

    class ADM_1964_Impala {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 39500;
        textures[] = {};
    };

    class ADM_1969_Camaro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 39500;
        textures[] = {};
    };

    class ADM_1969_Charger {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 39500;
        textures[] = {};
    };

    class Jonzie_Datsun_Z432 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 28500;
        textures[] = {};
    };

    class ivory_wrx {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };

    class ivory_supra {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class IVORY_R8SPYDER {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 50000;
        textures[] = {};
    };

    class pop_ford_gt402 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_ford_gt403 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_amg_GT_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class ivory_f1 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class ivory_veyron {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_chevroletc7_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_chevroletc7_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_chevroletc7_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_regera_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_regera_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_regera_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_bmw507_d3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_bmw507_d1 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_bmw507_d2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_lambo_miura_d {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_bmw8_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_m300sl1 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_m300sl2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_laferrari_D {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_laferrari_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_furai {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_porche918 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp1_D {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_chevrolet_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_chevrolet_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_chevrolet_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_chevrolet_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_zonda_s1 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class POP_Ferrari_Enzo_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = POP_Ferrari_Enzo_rojo;
        textures[] = {};
    };

    class quiet_Bugatti_blanche_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class shounka_f430_spider_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class mrshounka_huracan_c_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_porsche911 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_porsche911_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_porsche911_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_porsche911_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_porsche911_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_porsche911_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_porsche911_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_porsche911_amariilo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_porsche911_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class POP_veneno_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_mp4_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };

    class pop_agera_p {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_agera_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_agera_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_agera_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_panamera_negro {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_panamera_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_panamera_rojo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_panamera_amarillo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_panamera_rosa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_panamera_gris {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_panamera_naranja {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_gt_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_gt_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_gt_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_gt_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_gt_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_gt_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_gt_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_gt_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_pagani_c_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_lykan_Hypersport_violeta {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_lykan_Hypersport_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_lykan_Hypersport_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_lykan_Hypersport_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_lykan_Hypersport_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_lykan_Hypersport_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_lykan_Hypersport_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_lykan_Hypersport_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 120000;
        textures[] = {};
    };

    class pop_bmw_1series {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_bmw_1series_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_bmw_1series_grise {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_bmw_1series_jaune {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_bmw_1series_noir {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_bmw_1series_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_bmw_1series_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_bmw_1series_rouge {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class pop_bmw_1series_violet {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_black {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_white {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_grey {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_orange {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_red {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_blue {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_green {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_purple {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_yellow {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_lightblue {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_lime {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class tal_maserati_pink {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };

    class Jonzie_Quattroporte {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };

    class Quiet_v2_r8plus_blanche_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };

    class Quiet_v2_r8plus_noir_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };

    class Quiet_v2_r8plus_rouge_f {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };

    class IVORY_R8 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 65000;
        textures[] = {};
    };

    class ADM_Monte_Carlo {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };

    class ivory_gt500 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };

    class ivory_lfa {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        textures[] = {};
    };

    class ivory_lp560 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        textures[] = {};
    };

    class ivory_c {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };

    class shounka_limo_civ_bleufonce {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };

    class shounka_limo_civ_rose {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };

    class Jonzie_Viper {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_r8MP_4 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_r8MP_5 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_r8MP_3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_mono {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_Caterham_2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_Caterham_3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_GT3 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_GT3_blanco {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_GT3_azul {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_megane_GT3_2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_lola_1 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_lola_2 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_lola_4 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_lola_7 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

    class pop_lola_8 {
        vItemSpace = 50;
        conditions = "license_civ_car || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };

	/********************Exo Shop Stop********************/
	/********************Moto Shop Start********************/	

    class pop_quad_1 {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 500;
        textures[] = {};
    };

    class shounka_harley_a3 {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3000;
        textures[] = {};
    };

    class shounka_harley_a3_noir {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3000;
        textures[] = {};
    };

    class shounka_harley_a3_bleu {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3000;
        textures[] = {};
    };

    class shounka_harley_a3_rouge {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3000;
        textures[] = {};
    };

    class shounka_harley_a3_lolz {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3000;
        textures[] = {};
    };

    class pop_quad_sport {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };

    class pop_yamaha_p {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 2200;
        textures[] = {};
    };

    class pop_yamaha_p_bf {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3260;
        textures[] = {};
    };

    class pop_yamaha_p_g {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3260;
        textures[] = {};
    };

    class pop_yamaha_p_j {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3260;
        textures[] = {};
    };

    class pop_yamaha_p_noir {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3260;
        textures[] = {};
    };

    class pop_yamaha_p_o {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3260;
        textures[] = {};
    };

    class pop_yamaha_p_rose {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3260;
        textures[] = {};
    };

    class pop_yamaha_p_r {
        vItemSpace = 50;
        conditions = "license_moto_shop || {!(playerSide isEqualTo civilian)}";
        price = 3260;
        textures[] = {};
    };

	/********************Moto Shop Stop********************/
	/********************Donator Shop Start********************/	
    class pop_megane_GT3_gustav {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 90000;
        textures[] = {};
    };
};

    class pop_cherokee_negro_mafia3 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_nissan_silvia {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_nissan_silvia1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_nissan_silvia4 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_nissan_patrol_corto {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_JaguarP7Civil {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        textures[] = {};
    };
};

    class pop_hyundai_veloster {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };
};

    class pop_hyundai_veloster1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };
};

    class pop_ford_gt40 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        textures[] = {};
    };
};

    class pop_ford_gt401 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        textures[] = {};
    };
};

    class pop_ford_gt404 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        textures[] = {};
    };
};

    class pop_488GT3Civil {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_bmw_x5 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };
};

    class pop_bmw_x51 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };
};

    class pop_chevrolet_camaro_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 75500;
        textures[] = {};
    };
};

    class pop_chevrolet_camaro_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 75500;
        textures[] = {};
    };
};

    class pop_chevrolet_camaro_amarillo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 75500;
        textures[] = {};
    };
};

    class pop_nissan_leaf {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };
};

    class pop_nissan_leaf1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 3500;
        textures[] = {};
    };
};

    class pop_nissan_pathfinder {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };
};

    class pop_nissan_pathfinder1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 55000;
        textures[] = {};
    };
};

    class pop_nissan_skyline {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35500;
        textures[] = {};
    };
};

    class pop_nissan_skyline1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35500;
        textures[] = {};
    };
};

    class pop_seat_leon_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_ford_focusrs_verde {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_ford_focusrs_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_ford_focusrs_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_seat_ibiza_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_seat_ibiza_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_alfa_romeo_159_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_alfa_romeo_159_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_AudiA1_D4 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_AudiA1_D5 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_AudiA1_D1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 5500;
        textures[] = {};
    };
};

    class pop_daciaCivil {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_mercedes_vito2 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };
};

    class pop_mercedes_vito3 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 18500;
        textures[] = {};
    };
};

    class pop_amg_GT1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_amg_GT_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class PKE_92_civ_noir {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class PKE_92_civ_rouge {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_370Z1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_370Z_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_afla_4C_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_afla_4C_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_afla_4C_amarillo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_afla_4C_naranja {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_lotus_GTE_naranja {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_lotus_GTE_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_caymanS_z_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class Quiet_1969charger_bleu_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class pop_bmwm6_rosa_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_bmwm6_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_c63_2015_rose_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class Quiet_1969charger_noir_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class Quiet_dodge_15_rouge_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class pop_mercedes_190_p_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };
};

    class pop_mercedes_190_p_azul {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 16000;
        textures[] = {};
    };
};

    class shounka_a3_rs5_civ_rose_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class pop_clk_rose_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_lincoln_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 19500;
        textures[] = {};
    };
};

    class pop_chevroletc7_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_chevroletc7_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_chevroletc7_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_regera_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_regera_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_bmw507_d {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_bmw8 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_bmw8_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_m300sl3 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_laferrari_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_chevrolet_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_InsurgentCivil {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_toyota_FJCruiser {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_toyota_FJCruiser1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_nissan_qashqai {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_nissan_qashqai1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_jeep_grandcherokee {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_jeep_grandcherokee1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4601 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_lexus_gx4603 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_cherokee_negro_mafia {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_cherokee_negro_mafia2 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_volvo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_volvo1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_volvo2 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_volvo3 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_hyundai_x35 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_hyundai_x351 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_hyundai_x352 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_hyundai_x353 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_rover_evo_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_rover_evo_naranja {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_ranger_rover {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_ranger_rover1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_ranger_rover2 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_rover_evo_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 45000;
        textures[] = {};
    };
};

    class pop_hummer_civ_Naranja {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };
};

    class pop_h2_noir {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };
};

    class pop_avalanche_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class Quiet_ford_raptor_noir_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };
};

    class pop_cherokee_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_cherokee_negro_mate {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class Quiet_Cadillac_blanche_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };
};

    class quiet_sub2015_blanche_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };
};

    class mr_american_classic_truck_v3 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_iveco_noir {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_don {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_dafxf_euro6_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_dafxf_euro6_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_lola_10 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_lola_3 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_16 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_38 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_36 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_34 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_24 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_5 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_3 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_4 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_6 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_7 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_8 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_9 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_10 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_11 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_12 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_13 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_14 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_15 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_18 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_19 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_20 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_22 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_23 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_25 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_26 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_27 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_28 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_29 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_30 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_31 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_32 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_33 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_35 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_megane_GT3_37 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_GT3_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_Caterham_1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_Caterham_4 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_mono_D1 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_mono_D2 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_mono_D3 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_mono_D4 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_r8MP_2 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_r8MP_6 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class pop_r8MP_7 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 110000;
        textures[] = {};
    };
};

    class shounka_limo_civ_noir {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };
};

    class shounka_limo_civ_rouge {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };
};

    class shounka_limo_civ_jaune {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {};
    };
};

    class Quiet_v2_r8plus_bleu_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };
};

    class POP_Ferrari_Enzo_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class quiet_Bugatti_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class POP_veneno_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class POP_veneno_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class POP_veneno_Amarillo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class mrshounka_huracan_c_noir {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class mrshounka_huracan_c_bleufonce {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class mrshounka_huracan_c_rouge {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class mrshounka_huracan_c_jaune {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class mrshounka_huracan_c_grise {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class mrshounka_huracan_c_violet {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class mrshounka_huracan_c_orange {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 150000;
        textures[] = {};
    };
};

    class pop_clk_noir_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_clk_bleufonce_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_clk_rouge_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_clk_jaune_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_clk_rose_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_clk_grise_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_clk_violet_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_clk_orange_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class pop_bmwm6_negro_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_bmwm6_azul_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_bmwm6_rojo_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_bmwm6_amarillo_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_bmwm6_gris_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_bmwm6_violet_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class pop_bmwm6_naranja_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 40000;
        textures[] = {};
    };
};

    class shounka_a3_rs5_civ_noir_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class Quiet_Cadillac_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };
};

    class quiet_sub2015_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29500;
        textures[] = {};
    };
};

    class shounka_a3_rs5_civ_bleufonce_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class shounka_a3_rs5_civ_rouge_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class shounka_a3_rs5_civ_jaune_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class shounka_a3_rs5_civ_grise_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class shounka_a3_rs5_civ_orange_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class pop_gtr_blanco_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class pop_gtr_negro_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class Quiet_dodge_15_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 25000;
        textures[] = {};
    };
};

    class Quiet_ford_raptor_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {};
    };
};

    class Quiet_c65amg_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 50000;
        textures[] = {};
    };
};

    class Quiet_v2_r8plus_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };
};

    class Quiet_1969charger_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 35000;
        textures[] = {};
    };
};

    class quiet_Ford_shelbyGT500_chrome_f {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24500;
        textures[] = {};
    };
};

    class pop_dodge15_civ_negro_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_dodge15_civ_azuloscuro_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_dodge15_civ_rojo_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_dodge15_civ_amarillo_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_dodge15_civ_gris_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_dodge15_civ_violeta_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    };
};

    class pop_dodge15_civ_naranja_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 22500;
        textures[] = {};
    }; 
};
	
	class pop_FordTransiSupervan_civ_violeta {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_civ_naranja {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_don {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_civ_gris {
        vItemSpace = 50;
        vFuelSpace = 20000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_civ_rosa {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_civ_Amarillo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_civ_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_civ_azul {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_civ_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};

    class pop_c63_2015_mat_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_noir_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_mat_n_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_bleufonce_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_mat_b_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_rouge_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_jaune_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_grise_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_violet_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_orange_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 32500;
        textures[] = {};
    };
};

    class pop_c63_2015_mat {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_noir {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_mat_n {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_bleufonce {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_mat_b {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_rouge {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_jaune {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_grise {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_violet {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_c63_2015_orange {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class pop_rs4_civ_t_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };
};

    class pop_rs4_civ_t_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };
};

    class pop_rs4_civ_t_azul {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 10000;
        textures[] = {};
    };
};

    class pop_rs4_civ_blanco {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 6000;
        textures[] = {};
    };
};

    class pop_rs4_civ_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 6000;
        textures[] = {};
    };
};

    class pop_rs4_civ_amarillo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 6000;
        textures[] = {};
    };
};

    class pop_rs4_civ_azul {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 6000;
        textures[] = {};
    };
};

    class pop_evox_negro_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };
};

    class pop_evox_azul_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };
};

    class pop_evox_rojo_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };
};

    class pop_evox_amarillo_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };
};

    class pop_evox_gris_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };
};

    class pop_evox_violeta_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };
};

    class pop_evox_naranja_t {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 12000;
        textures[] = {};
    };
};

    class pop_mustang_negro {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24000;
        textures[] = {};
    };
};

    class pop_mustang_azul {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24000;
        textures[] = {};
    };
};

    class pop_mustang_rojo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24000;
        textures[] = {};
    };
};

    class pop_mustang_amarillo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24000;
        textures[] = {};
    };
};

    class pop_mustang_rosa {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24000;
        textures[] = {};
    };
};

    class pop_mustang_gris {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24000;
        textures[] = {};
    };
};

    class pop_mustang_violeta {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24000;
        textures[] = {};
    };
};

    class ADM_Monte_Carlo {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };
};

    class ivory_gt500 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 29000;
        textures[] = {};
    };
};

    class ivory_lfa {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        textures[] = {};
    };
};

    class ivory_lp560 {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 125000;
        textures[] = {};
    };
};

    class ivory_c {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 75000;
        textures[] = {};
    };
};

    class pop_mustang_naranja {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 24000;
        textures[] = {};
    };
};

    class pop_FordTransiSupervan_civ_naranja {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "call life_donorlevel >= 1 || {!(playerSide isEqualTo civilian)}";
        price = 20000;
        textures[] = {};
    };
};
