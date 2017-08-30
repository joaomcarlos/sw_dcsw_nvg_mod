mount_vfs_texture_archives("Bazar/Textures/AvionicsCommon")

dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")
dofile(LockOn_Options.script_path.."materials.lua")

layoutGeometry = {}

MainPanel = {"ccMainPanel",LockOn_Options.script_path.."mainpanel_init.lua"}

creators    = {}
creators[devices.ELECTRIC] 	 	    = {"avM2000CElectricalSystem"}
creators[devices.HELMET_DEVICE]	= {"avNightVisionGoggles"}
creators[devices.FLIGHTINST]	    = {"FlightInstruments::avFlightInst", LockOn_Options.script_path.."Scripts/FINST_init.lua"}
creators[devices.INSTPANEL]		    = {"FlightInstruments::avInstPanel"}
creators[devices.NAVINST]		    = {"Panels::avNavInst"}
creators[devices.VTH_VTB]		    = {"Panels::avVTH_VTB"}
creators[devices.PCA_PPA]		    = {"Panels::avPCA_PPA"}
creators[devices.PCN_NAV]		    = {"Panels::avPCN_NAV", LockOn_Options.script_path.."Scripts/UNI.lua"}
creators[devices.ENGPANEL]		    = {"Panels::avEngStart",nil,
								      {{"PWRPNL",devices.PWRPNL},
								       {"ENGINE", devices.ENGINE},
								       {"MISCPANELS", devices.MISCPANELS},
								       {"INSTPANEL", devices.INSTPANEL},
								       {"VTH_VTB", devices.VTH_VTB},
								       {"SUBSYSTEMS", devices.SUBSYSTEMS},
								       {"AFCS", devices.AFCS},
								       {"SYSLIGHTS", devices.SYSLIGHTS},
								       {"TACAN", devices.TACAN},
								       {"VORILS", devices.VORILS},
								       {"UVHF", devices.UVHF},
								       {"UHF", devices.UHF},
								       {"RWR", devices.RWR}}}
creators[devices.PWRPNL]		    = {"Panels::avPWRPNL",LockOn_Options.script_path.."Scripts/PWR_SPLY.lua",
                                      {{"ELECTRIC",devices.ELECTRIC}}}
creators[devices.SYSLIGHTS]		    = {"Panels::avLights"}
creators[devices.AFCS]			    = {"Panels::avAFCS"}
creators[devices.ENGINE]		    = {"SubSystems::ssEngine", LockOn_Options.script_path.."Scripts/SNECMA_M53P2.lua"}
creators[devices.SUBSYSTEMS]	    = {"SubSystems::ssHydraulics"}
creators[devices.RADAR_RDI]		    = {"Sensors::CSF_RDI",LockOn_Options.script_path.."Scripts/RDI.lua",
							          {{"ELECTRIC",devices.ELECTRIC}}}
creators[devices.RADAR]			    = {"Sensors::avRADAR", nil,{{"M2KC_RDI",devices.RADAR_RDI}}}
creators[devices.EW_RWR]		    = {"Sensors::ECM_RWR",LockOn_Options.script_path.."Scripts/RWR.lua",
								      {{"ELECTRIC",devices.ELECTRIC}}}
creators[devices.RWR]			    = {"Sensors::avECM_RWR", LockOn_Options.script_path.."Scripts/SPIRALE.lua",{{"M2KC_RWR",devices.EW_RWR}}}
creators[devices.MAGIC]			    = {"Weapons::wsMagicII", LockOn_Options.script_path.."Scripts/GUNS_init.lua"}
creators[devices.UVHF]		 	    = {"Comms::avM2KCRadio_UVHF",LockOn_Options.script_path.."Scripts/Radio/M2KC_UVHF_Radio.lua",
								      {{"ELECTRIC",devices.ELECTRIC}}}
creators[devices.UHF] 		 	    = {"Comms::avM2KCRadio_UHF",LockOn_Options.script_path.."Scripts/Radio/M2KC_UHF_Radio.lua",
								      {{"ELECTRIC",devices.ELECTRIC}}}
creators[devices.INTERCOM]   	    = {"Comms::avM2KCIntercom",LockOn_Options    .script_path.."Scripts/Radio/M2KC_Intercom.lua",
								    {{"UVHFRadio", devices.UVHF},
								      {"UHFRadio", devices.UHF},
								      {"TACAN", devices.TACAN},
								      {"VORILS", devices.VORILS},
								      {"ELECTRIC",devices.ELECTRIC}}}
creators[devices.MISCPANELS]	    = {"Panels::avMISC_PNL"}
creators[devices.TACAN]		 	    = {"Comms::avM2KC_TACAN",nil,
                                      {{"ELECTRIC",devices.ELECTRIC}}}
creators[devices.VORILS] 		    = {"Comms::avM2KC_VORILS",nil,
                                      {{"ELECTRIC",devices.ELECTRIC}}}
creators[devices.ECS] 		        = {"Panels::avECS"}
creators[devices.FBW] 		        = {"Panels::avFBW_PNL"}
creators[devices.DDM]			    = {"Sensors::avDDM", LockOn_Options.script_path.."Scripts/DDM.lua",{{"ELECTRIC",devices.ELECTRIC}}}
creators[devices.DDM_IND]		    = {"Sensors::avD2M", nil, {{"M2KC_DDM",devices.DDM}}}
creators[devices.WEAPONS_CONTROL] 	= {"Panels::avWEAPONS_CONTROL"}

-- Indicators
indicators = {}
indicators[#indicators + 1] = { "VTH::HUD_Indicator", LockOn_Options.script_path.."VTH/HUD_init.lua", nil, {{"PNT_HUD_CENTER","PNT_HUD_DOWN","PNT_HUD_RIGHT"}, {rz_l = 4.7} }, {{"gun_sight", devices.MAGIC}} }
indicators[#indicators + 1] = { "VTB::VTB_Indicator", LockOn_Options.script_path.."VTB/VTB_init.lua", nil, { {"PNT_VTB_CENTER","PNT_VTB_DOWN","PNT_VTB_RIGHT"}, }, {{"rdi_radar", devices.RADAR_RDI}} }
indicators[#indicators + 1] = { "Sensors::RWR_Indicator", LockOn_Options.script_path.."RWR/RWR_init.lua", nil, { {"PNT_RWR_CENTER","PNT_RWR_DOWN","PNT_RWR_RIGHT"}, } }
indicators[#indicators + 1] = { "Sensors::ECM_Chaff_Indicator", LockOn_Options.script_path.."RWR/ECM_CHF_init.lua", nil, { {"PNT_ECM_C_CENTER", "PNT_ECM_C_DOWN", "PNT_ECM_C_RIGHT"}, } }
indicators[#indicators + 1] = { "Sensors::ECM_Flare_Indicator", LockOn_Options.script_path.."RWR/ECM_FLR_init.lua", nil, { {"PNT_ECM_F_CENTER", "PNT_ECM_F_DOWN", "PNT_ECM_F_RIGHT"}, } }
indicators[#indicators + 1] = { "FlightInstruments::Fuel_Panel", LockOn_Options.script_path.."FUEL/FUEL_init.lua", nil, { {"PNT_FUEL_CENTER","PNT_FUEL_DOWN","PNT_FUEL_RIGHT"}, } }
indicators[#indicators + 1] = { "FlightInstruments::PCA_UR", LockOn_Options.script_path.."PCA_PPA/PCA_UR_init.lua", nil, { {"PNT_PCA_U_CENTER","PNT_PCA_U_DOWN","PNT_PCA_U_RIGHT"}, } }
indicators[#indicators + 1] = { "FlightInstruments::PCA_BR", LockOn_Options.script_path.."PCA_PPA/PCA_BR_init.lua", nil,	{ {"PNT_PCA_L_CENTER","PNT_PCA_L_DOWN","PNT_PCA_L_RIGHT"}, } }
indicators[#indicators + 1] = { "FlightInstruments::PPA", LockOn_Options.script_path.."PCA_PPA/PPA_init.lua", nil, { {"PNT_PPA_CENTER","PNT_PPA_DOWN","PNT_PPA_RIGHT"}, } }
indicators[#indicators + 1] = { "FlightInstruments::COMS", LockOn_Options.script_path.."COM/COM_init.lua", nil, { {"PNT_UHF_CENTER","PNT_UHF_DOWN","PNT_UHF_RIGHT"}, } }
indicators[#indicators + 1] = { "Panels::ccPCN_UR", LockOn_Options.script_path.."PCN/PCN_UR_init.lua", nil, { {"PNT_PCN_U_CENTER","PNT_PCN_U_DOWN","PNT_PCN_U_RIGHT"}, } }
indicators[#indicators + 1] = { "Panels::ccPCN_BR", LockOn_Options.script_path.."PCN/PCN_BR_init.lua", nil, { {"PNT_PCN_L_CENTER","PNT_PCN_L_DOWN","PNT_PCN_L_RIGHT"}, } }
indicators[#indicators + 1] = {"ccControlsIndicatorM2000C",LockOn_Options.script_path.."ControlsIndicator/ControlsIndicator.lua"}
indicators[#indicators + 1] = {"ccHelmetM2000C",LockOn_Options.script_path.."HELMET/Indicator/HelmetIndicator.lua"} 	
							  
kneeboard_implementation 		= "ccKneeboardExtension_M2000C"
disable_kneeboard_render_target = false
---------------------------------------------
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
---------------------------------------------
dofile(LockOn_Options.common_script_path.."PADLOCK/PADLOCK_declare.lua")
---------------------------------------------