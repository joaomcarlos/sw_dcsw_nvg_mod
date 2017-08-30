mount_vfs_model_path(LockOn_Options.script_path.."../Shape")

mount_vfs_texture_archives("Bazar/Textures/AvionicsCommon")
mount_vfs_texture_archives(LockOn_Options.script_path.."../Textures/MIG-15BIS-CPT-TEXTURES")

dofile(LockOn_Options.script_path		.."config.lua")
dofile(LockOn_Options.script_path		.."devices.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")
dofile(LockOn_Options.script_path		.."materials.lua")

MainPanel = {"Mig15::ccMig15MainPanel", 
			LockOn_Options.script_path.."mainpanel_init.lua",
			{{"FM_Proxy", devices.FM_PROXY},
			 {"electric_interface", devices.ELEC_INTERFACE},
			 {"hydro_interface", devices.HYDROSYS_INTERFACE},
			 {"gear_interface", devices.GEAR_INTERFACE},
			 {"navlight_interface", devices.NAVLIGHT_SYSTEM},
			 {"engine_interface", devices.ENGINE_INTERFACE},
			 {"fuel_interface", devices.FUELSYS_INTERFACE},
			 {"control_interface", devices.CONTROL_INTERFACE},
			 {"variometer", devices.VARIOMETER},
			 {"clock", devices.CLOCK},
			 {"air_interface", devices.AIR_INTERFACE},
			 {"oxygen_interface", devices.OXYGEN_INTERFACE},
			 {"baro_alt", devices.BAR_ALTIMETER},
			 {"radar_alt", devices.RADAR_ALTIMETER},
			 {"fireExting_interface", devices.FIRE_EXTING_INTERFACE},
			 {"airspeed", devices.AIRSPEED},
			 {"mach", devices.MACH},
			 {"agk47", devices.AGK47B},
			 {"dgmk3", devices.REMOTE_COMPASS},
			 {"light_interface", devices.LIGHT_SYSTEM},
			 {"weapon_sys", devices.WEAPON_SYSTEM},
			 {"ASP_3N",devices.ASP_3N},
			 {"signalflare_interface", devices.SIGNAL_FLARE_DISPENSER},
			 {"cpt_mechanics", devices.CPT_MECH},
			 {"radio_compass", devices.ARC_5},
			 {"radio", devices.RSI_6K},
			 {"marker", devices.MRP_48P},
			 {"hearing_sens", devices.HEARING_SENS}
			},
}

creators   = {}
-- Indicators
indicators = {}

function add_devs(tab_of_devs_and_indicators)
    local devs = tab_of_devs_and_indicators[1]
    for i,o in pairs(devs) do
        creators[i]  = o
    end
end

function add_inds(tab_of_devs_and_indicators)
    local inds = tab_of_devs_and_indicators[2]
    
    for i=1,#inds do
        indicators[#indicators + 1] = inds[i]
    end
end


creators[devices.HELMET_DEVICE]	= {"avNightVisionGoggles"}
creators[devices.ASP_3N]	= {"Mig15::avASP_3N",LockOn_Options.script_path.."Gunsight_ASP_3N/device/ASP_3N_param.lua"}


if LockOn_Options.flight.easy_radar then                                            						   
creators[devices.ARCADE] =          {"Mig15::avArcadeRadar_Mig15",
									LockOn_Options.script_path.."ARCADE/arcade.lua",
									{{"weapon_system",devices.WEAPON_SYSTEM},
									 {"ASP_3N"		 ,devices.ASP_3N}},
									}							   
end

creators[devices.FM_PROXY] = {"Mig15::avFMProxy_Mig15",
								"",
								{}	}

creators[devices.ELEC_INTERFACE] = {"Mig15::avElectricInterface_Mig15",
									LockOn_Options.script_path.."Devices_specs/ElectricSystem.lua",
									{},
									LockOn_Options.script_path.."Devices_commands/Elec_commands.lua"
								   }

creators[devices.CONTROL_INTERFACE] = {"Mig15::avControlSystemInterface_Mig15",
									LockOn_Options.script_path.."Devices_specs/ControlSystem.lua",
									{},
									LockOn_Options.script_path.."Devices_commands/Control_commands.lua"
}

creators[devices.STANDBY_COMPASS] = { 
	"avMechCompass",
	LockOn_Options.script_path .. "Devices_specs/StandbyCompass.lua",
	{}
}	
								   
creators[devices.WEAPON_SYSTEM] = {"Mig15::avWeaponsControl_Mig15",
									LockOn_Options.script_path.."Devices_specs/weapon_system.lua",
									{{"ElecInterface",devices.ELEC_INTERFACE},
									{"HydroInterface",devices.HYDROSYS_INTERFACE}},
									LockOn_Options.script_path.."Devices_commands/weap_commands.lua"
								}

creators[devices.CLOCK]	= {
	"Mig15::avClock_Mig15",
	"",
	{},
	LockOn_Options.script_path.."Devices_commands/clock_commands.lua"}

creators[devices.AIR_INTERFACE] = { 
	"Mig15::avAirInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/AirSys.lua",
	{}
}	
	
creators[devices.OXYGEN_INTERFACE]	= {
	"Mig15::avOxygenInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/OxygenSystem.lua",
	{{"HEARING_SENS", devices.HEARING_SENS}}
}

creators[devices.FUELSYS_INTERFACE] = { 
	"Mig15::avFuelInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/FuelSys.lua",
	{},
	LockOn_Options.script_path.."Devices_commands/fuel_system_commands.lua"
}	

creators[devices.ENGINE_INTERFACE] = { 
	"Mig15::avEngineInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/PowerPlant.lua",
	{}
}	

creators[devices.HYDROSYS_INTERFACE] = {
	"Mig15::avHydroInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/HydroSystem.lua",
	{},
	LockOn_Options.script_path.."Devices_commands/hydraulic_system_commands.lua"
}

creators[devices.GEAR_INTERFACE] = {
	"Mig15::avGearInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/GearSystem.lua",
	{},
	LockOn_Options.script_path.."Devices_commands/Gear_commands.lua"
}

creators[devices.NAVLIGHT_SYSTEM] = { 
	"Mig15::avNavLightsInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/NavLightSystem.lua",
	{}
}

creators[devices.CPT_MECH] = { 
	"Mig15::avCockpitMechanics_Mig15",
	LockOn_Options.script_path.."Devices_specs/CockpitMechanics.lua",
	{}
}

creators[devices.RADAR_ALTIMETER] = {
	"Mig15::avPRV_46",
	LockOn_Options.script_path.."Devices_specs/Instruments/RAlt_PRV_46.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE}},
	LockOn_Options.script_path.."Devices_commands/PRV_46_commands.lua"
}

creators[devices.FIRE_EXTING_INTERFACE] = { 
	"Mig15::avFireExtinguisherInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/FireExtingSystem.lua",
	{}
}

creators[devices.FM_PROXY] = { 
	"Mig15::avFMProxy_Mig15",
	"",
	{}
}

creators[devices.BAR_ALTIMETER] = { 
	"Mig15::avVD_15",
	LockOn_Options.script_path.."Devices_specs/Instruments/Bar_Alt_VD15.lua",
	{{"FM_Proxy",devices.FM_PROXY}},
}

creators[devices.VARIOMETER]	= {
	"avSimpleVariometer",
	LockOn_Options.script_path.."Devices_specs/Instruments/Variometer_VAR75.lua",
	{{"FM_Proxy",devices.FM_PROXY}},
}

creators[devices.REMOTE_COMPASS] = { 
	"Mig15::avDGMK_3",
	LockOn_Options.script_path.."Devices_specs/Instruments/DGMK3.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE}}
}

creators[devices.LIGHT_SYSTEM] = { 
	"Mig15::avLightInterface_Mig15",
	LockOn_Options.script_path.."Devices_specs/LightSystem.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE}},
	LockOn_Options.script_path.."Devices_commands/light_commands.lua"
}

creators[devices.AIRSPEED]	= {
	"Mig15::avKUS_1200",
	LockOn_Options.script_path .. "Devices_specs/ASind_KUS1200.lua",
	{{"FM_Proxy",devices.FM_PROXY}}
}

creators[devices.MACH]	= {
	"Mig15::avMachIndicator_Mig15",
	LockOn_Options.script_path .. "Devices_specs/MachIndicator.lua",
	{{"FM_Proxy",devices.FM_PROXY}}
}

creators[devices.AGK47B] = {
	"Mig15::avAGK_47B",
	LockOn_Options.script_path.."Devices_specs/Instruments/AGK_47B.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	{"FM_Proxy",devices.FM_PROXY}}
}

creators[devices.SIGNAL_FLARE_DISPENSER] = {
	"Mig15::avSignalFlareDispenser_Mig15",
	LockOn_Options.script_path.."Devices_specs/SignalFlareDispenser.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE}}
}

creators[devices.ARC_5]	= {
	"Mig15::avARC_5",
	LockOn_Options.script_path.."Devices_specs/ARC_5.lua",
	{}
}

creators[devices.MRP_48P]	= {
	"Mig15::avMRP_48P",
	LockOn_Options.script_path.."Devices_specs/MRP_48P.lua",
	{}
}

creators[devices.RSI_6K]	= {"Mig15::avRSI_6K",
											LockOn_Options.script_path.."Devices_specs/RSI_6K.lua",
											{{"Intercom", devices.INTERCOM},
											{"ARC", devices.ARC_5}}
											}

creators[devices.INTERCOM] = {
	"avIntercomWWII", 
	LockOn_Options.script_path.."Devices_specs/Intercom.lua",
	{{"VHF_Radio",	devices.RSI_6K}}
}

creators[devices.MACROS]	= {"Mig15::avAutostartDevice_Mig15",
								LockOn_Options.common_script_path.."Macro_handler.lua",
								{}	}

creators[devices.AIHelper]	= {"Mig15::avAIHelper_Mig15",
								LockOn_Options.script_path.."AIHelper/AIHelperDev.lua",
								{{"gear_interface", devices.GEAR_INTERFACE}}	}

creators[devices.HEARING_SENS] = {
	"avBasicHearingSensitivityInterface", 
	LockOn_Options.script_path.."Devices_specs/HearingSensitivity.lua",
	{{"OXYGEN",	devices.OXYGEN_INTERFACE}}
}

indicators = {}

indicators[#indicators + 1] = {
	"ccBaseASP_3",  
	LockOn_Options.script_path.."Gunsight_ASP_3N/Indicator/ASP_3N_init.lua",
	devices.ASP_3N,
	{{"PNT-HUD-CENTER","PNT-HUD-DOWN","PNT-HUD-RIGHT"},
	{rz_l = ASP_3N_mirror_adjusting,sh = -1,sw = -1}}
}

indicators[#indicators + 1] = {	"Mig15::ccControlsIndicator_Mig15",
								LockOn_Options.script_path.."ControlsIndicator/ControlsIndicator.lua",
								{{"FM_Proxy", devices.FM_PROXY}}	}

indicators[#indicators + 1] = {	"ccGunCamera",
								LockOn_Options.script_path.."GunCamera/init.lua",
								{{}}}

indicators[#indicators + 1] = {"ccAIHelperBase",	LockOn_Options.script_path.."AIHelper/AIHelper.lua",	devices.AIHelper}

if LockOn_Options.flight.easy_radar then                                            
	indicators[#indicators + 1] = {"Mig15::ccArcadeRadar_Mig15"   ,LockOn_Options.script_path.."ARCADE/arcade_indicator.lua", devices.ARCADE}
end		

kneeboard_implementation 		= "Mig15::ccKneeboardExtension"
disable_kneeboard_render_target = false
---------------------------------------------
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
---------------------------------------------
dofile(LockOn_Options.common_script_path.."PADLOCK/PADLOCK_declare.lua")
---------------------------------------------		   
