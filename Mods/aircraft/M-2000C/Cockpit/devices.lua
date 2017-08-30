---- COUNTER FOR DEVICE ID-----
local count = 0
local function counter()
	count = count + 1
	return count
end
-------DEVICE ID-------
devices = {}
devices["FLIGHTINST"]	        = counter()	-- 1
devices["NAVINST"]		        = counter()	-- 2
devices["ENGINE"]		        = counter()	-- 3
devices["INSTPANEL"]	        = counter()	-- 4
devices["VTH_VTB"]		        = counter()	-- 5
devices["PCA_PPA"]		        = counter()	-- 6
devices["ENGPANEL"]		        = counter()	-- 7
devices["PWRPNL"]		        = counter()	-- 8
devices["PCN_NAV"]		        = counter()	-- 9
devices["RADAR_RDI"]	        = counter()	-- 10
devices["RADAR"]		        = counter()	-- 11
devices["EW_RWR"]		        = counter()	-- 12
devices["RWR"]			        = counter()	-- 13
devices["SUBSYSTEMS"]	        = counter()	-- 14
devices["MAGIC"]		        = counter()	-- 15
devices["SYSLIGHTS"]	        = counter()	-- 16
devices["AFCS"]			        = counter()	-- 17
devices["ELECTRIC"] 	        = counter()	-- 18
devices["UVHF"]			        = counter()	-- 19
devices["UHF"]			        = counter()	-- 20
devices["INTERCOM"]		        = counter()	-- 21
devices["MISCPANELS"]	        = counter() -- 22
devices["TACAN"]	            = counter() -- 23
devices["VORILS"]	            = counter() -- 24
devices["ECS"]	                = counter() -- 25
devices["FBW"]	                = counter() -- 26
devices["DDM"]	                = counter() -- 27
devices["DDM_IND"]              = counter() -- 28
devices["WEAPONS_CONTROL"]      = counter() -- 29
devices["HELMET_DEVICE"] = counter() -- 30