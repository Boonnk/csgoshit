-- paster since 2020 --
-- pasted by Hunajan kerääjä#3377 --


-- autobuy --

local primaryWeapons = {
    { "SCAR 20 | G3SG1", "scar20" };
    { "SG 008", "ssg08" };
    { "AWP", "awp" };
    { "G3 SG1 | AUG", "sg556" };
    { "AK 47 | M4A1", "ak47" };
};
local secondaryWeapons = {
    { "Dual Elites", "elite" };
    { "Desert Eagle | R8 Revolver", "deagle" };
    { "Five Seven | Tec 9", "tec9" };
    { "P250", "p250" };
};
local armors = {
    { "None", nil, nil };
    { "Kevlar Vest", "vest", nil };
    { "Kevlar Vest + Helmet", "vest", "vesthelm" };
};
local granades = {
    { "Off", nil, nil };
    { "Grenade", "hegrenade", nil };
    { "Flashbang", "flashbang", nil };
    { "Smoke Grenade", "smokegrenade", nil };
    { "Decoy Grenade", "decoy", nil };
    { "Molotov | Incindiary Grenade", "molotov", "incgrenade" };
};

-- GUI --

local TAB = gui.Tab(gui.Reference("SETTINGS"), "better_script.settings", "Dogwater 0.0.1")

-- info --

local info_groupbox = gui.Groupbox(TAB, "This lua is fully pasted by Hunajan kerääjä#3377", 16, 16, 340, 100 );

-- clantag --

local misc_clantag= gui.Groupbox(TAB, "Clantags", 385, 576, 230, 100)
local enable_clantags = gui.Checkbox(misc_clantag, "enable.clantags", "Enable Premade Clantags", false)
local clantag_mode = gui.Combobox(misc_clantag, "clantag.mode", "Select clantag", "nullcoreproject", "Yiffer.xyz")
local set_clantag = ffi.cast('int(__fastcall*)(const char*, const char*)', mem.FindPattern("engine.dll", "53 56 57 8B DA 8B F9 FF 15"))
local clantagset = 0

-- misc --

local misc_groupbox = gui.Groupbox(TAB, "Misc", 385, 310, 230, 100 );
local airstuck = gui.Keybox(misc_groupbox, "ref_airstuck", "Airstuck Key", 0)
local ui, f, n = {danger = {fasthop = gui.Keybox(misc_groupbox, "danger.fasthop", "FastHop", 70),},}, 0; ui.danger.fasthop:SetDescription("movement exploit for danger zone.");
local Engine_radar = gui.Checkbox(misc_groupbox, "Engine_radar", "Engine Radar", false);
local RecoilCrosshair = gui.Checkbox(misc_groupbox, "recoilcrosshair", "Recoil Crosshair", false)

-- viewmodel --

local view_groupbox = gui.Groupbox(TAB, "Custom Viewmodel Editor", 385, 16, 230, 100 );
local visuals_custom_viewmodel_editor = gui.Checkbox(view_groupbox, "lua_custom_viewmodel_editor", "Custom Viewmodel", 0 );
local xO = client.GetConVar("viewmodel_offset_x"); 
local yO = client.GetConVar("viewmodel_offset_y"); 
local zO = client.GetConVar("viewmodel_offset_z");
local fO = client.GetConVar("viewmodel_fov");  
local xS = gui.Slider(view_groupbox, "lua_x", "X", xO, -20, 20);  
local yS = gui.Slider(view_groupbox, "lua_y", "Y", yO, -100, 100);  
local zS = gui.Slider(view_groupbox, "lua_z", "Z", zO, -20, 20);  
local vfov = gui.Slider(view_groupbox, "vfov", "Viewmodel FOV", fO, 0, 120);

-- autobuy -- 

local lua_groupbox = gui.Groupbox(TAB, "Autobuy", 16, 76, 340, 100 );
local ENABLED = gui.Checkbox(lua_groupbox, "autobuy.active", "Enable Auto Buy", false);
local PRIMARY_WEAPON = gui.Combobox(lua_groupbox, "autobuy.primary", "Primary Weapon", primaryWeapons[1][1], primaryWeapons[2][1], primaryWeapons[3][1], primaryWeapons[4][1], primaryWeapons[5][1]);
local SECONDARY_WEAPON = gui.Combobox(lua_groupbox, "autobuy.secondary", "Secondary Weapon", secondaryWeapons[1][1], secondaryWeapons[2][1], secondaryWeapons[3][1], secondaryWeapons[4][1]);
local ARMOR = gui.Combobox(lua_groupbox, "autobuy.armor", "Armor", armors[1][1], armors[2][1], armors[3][1]);
local GRENADE_SLOT1 = gui.Combobox(lua_groupbox, "autobuy.grenade1", "Grenade Slot #1", granades[1][1], granades[2][1], granades[3][1], granades[4][1], granades[5][1], granades[6][1]);
local GRENADE_SLOT2 = gui.Combobox(lua_groupbox, "autobuy.grenade2", "Grenade Slot #2", granades[1][1], granades[2][1], granades[3][1], granades[4][1], granades[5][1], granades[6][1]);
local GRENADE_SLOT3 = gui.Combobox(lua_groupbox, "autobuy.grenade3", "Grenade Slot #3", granades[1][1], granades[2][1], granades[3][1], granades[4][1], granades[5][1], granades[6][1]);
local GRENADE_SLOT4 = gui.Combobox(lua_groupbox, "autobuy.grenade4", "Grenade Slot #4", granades[1][1], granades[2][1], granades[3][1], granades[4][1], granades[5][1], granades[6][1]);
local TASER = gui.Checkbox(lua_groupbox, "autobuy.taser", "Buy Taser", false);
local DEFUSER = gui.Checkbox(lua_groupbox, "autobuy.defuser", "Buy Defuse Kit", false);

-- scirpts --

--------Draw Image--------
local function OnUnload()
	client.Command("toggleconsole", true)

	client.Command('echo "⠄⠄⠄⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄"', true)
	client.Command('echo "⠄⠄⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄"', true)
	client.Command('echo "⠄⠄⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄"', true)
	client.Command('echo "⠄⠄⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄"', true)
	client.Command('echo "⠄⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰"', true)
	client.Command('echo "⠄⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤"', true)
	client.Command('echo "⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗"', true)
	client.Command('echo "⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄"', true)
	client.Command('echo "⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠄"', true)
	client.Command('echo "⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃⠄"', true)
	client.Command('echo "⠄⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄⠄"', true)
	client.Command('echo "⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄⠄"', true)
	client.Command('echo "⠄⠄⠄⠄⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁⠄⠄⠄⠄⠄"', true)
	client.Command('echo "⠄⠄⠄⠄⠄⠄⠄⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁⠄⠄⠄⠄⠄⢀⣠⣴"', true)
	client.Command('echo "⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿"', true)

	if clantagset == 1 then
		set_clantag("", "")
	end
end

-- viewmodel --

local function Visuals_Viewmodel()

   if visuals_custom_viewmodel_editor:GetValue() then 
client.SetConVar("viewmodel_offset_x", xS:GetValue(), true);
client.SetConVar("viewmodel_offset_y", yS:GetValue(), true);
client.SetConVar("viewmodel_offset_z", zS:GetValue(), true);
client.SetConVar("viewmodel_fov", vfov:GetValue(), true);
   end
   end
local function Visuals_Disable_Post_Processing()
       if visuals_disable_post_processing:GetValue() then 
           client.SetConVar( "mat_postprocess_enable", 0, true );
   else
       client.SetConVar( "mat_postprocess_enable", 1, true );
       end
   end

callbacks.Register("Draw", "Custom Viewmodel Editor", Visuals_Viewmodel)

-- autobuy --

local function buy(wat)
    if (wat == nil) then return end;
    if (printLogs) then
        print('Bought x1 ' .. wat);
    end;
    client.Command('buy "' .. wat .. '";', true);
end


local function buyTable(table)
    for i, j in pairs(table) do
        buy(j);
    end;
end

local function buyWeapon(selection, table)
    local selection = selection:GetValue();
    local weaponToBuy = table[selection + 1][2];
    buy(weaponToBuy);
end

local function buyGrenades(selections)
    for k, selection in pairs(selections) do
        local selection = selection:GetValue();
        local grenadeTable = granades[selection + 1];
        buyTable({ grenadeTable[2], grenadeTable[3] });
    end
end

callbacks.Register('FireGameEvent', function(e)
    if (ENABLED:GetValue() ~= true) then return end;
    local localPlayer = entities.GetLocalPlayer();
    local en = e:GetName();
    if (localPlayer == nil or en ~= "player_spawn") then return end;
    local userIndex = client.GetPlayerIndexByUserID(e:GetInt('userid'));
    local localPlayerIndex = localPlayer:GetIndex();
    if (userIndex ~= localPlayerIndex) then return end;
    buyWeapon(PRIMARY_WEAPON, primaryWeapons);
    buyWeapon(SECONDARY_WEAPON, secondaryWeapons);
    local armorSelected = ARMOR:GetValue();
    local armorTable = armors[armorSelected + 1];
    buyTable({ armorTable[2], armorTable[3] });
    if (DEFUSER:GetValue()) then
        buy('defuser');
    end
    if (TASER:GetValue()) then
        buy('taser');
    end
    buyGrenades({ GRENADE_SLOT1, GRENADE_SLOT2, GRENADE_SLOT3, GRENADE_SLOT4 });
end);

client.AllowListener("player_spawn");

-- airstuck --

callbacks.Register("CreateMove", function(c)
local airstuck_key = airstuck:GetValue()
if airstuck_key == 0 then return end
if not input.IsButtonDown(airstuck_key) then return end

c.command_number = 0x00000
c.tick_count = 0x7F7FFFFF
end)

-- recoil crosshair --

local function CrosshairRecoil()
	if RecoilCrosshair:GetValue() and not gui.GetValue("rbot.master") then
		client.SetConVar("cl_crosshair_recoil", 1, true)
	else
		client.SetConVar("cl_crosshair_recoil", 0, true)
	end
end

-- speedhack --

callbacks.Register("Draw", function()
    f = (ui.danger.fasthop:GetValue() ~= nil and ui.danger.fasthop:GetValue() ~= 0 and input.IsButtonPressed(ui.danger.fasthop:GetValue())) and 0 or f;
end);
callbacks.Register("CreateMove", function(ucmd)
    if ui.danger.fasthop:GetValue() ~= nil and ui.danger.fasthop:GetValue() ~= 0 and input.IsButtonDown(ui.danger.fasthop:GetValue()) and not gui.Reference("Menu"):IsActive() then
        -- initial jump + bhop
        ucmd.buttons = f < 2 and (f == 0 and ucmd.buttons - 4 or (f == 1 and ucmd.buttons - 2 or ucmd.buttons)) or (n and ucmd.buttons - 6 or ucmd.buttons);
        local isTouchingGround = bit.band(entities.GetLocalPlayer():GetPropInt("m_fFlags"), 1) ~= 0;
        -- get that speed
        ucmd.viewangles, f, n = EulerAngles(ucmd.viewangles.x, isTouchingGround and ucmd.viewangles.y + 135 or ucmd.viewangles.y, ucmd.viewangles.z), f + 1, isTouchingGround;
        gui.SetValue("misc.strafe.air", not isTouchingGround);
    end;
end);

--------Clantag Animation--------
local ClanTags = {
	['nullcoreproject'] = {
	"                          ",
	"n                         ",
	"nu                        ",
	"nul                       ",
	"null                      ",
	"nullc                     ",
	"nullco                    ",
	"nullcor                   ",
	"nullcore                  ",
	"nullcorep                 ",
	"nullcorepr                ",
	"nullcorepro               ",
	"nullcoreproj              ",
	"nullcoreproje             ",
	"nullcoreprojec            ",
	"nullcoreproject           ",
	"nullcoreproject           ",
	"nullcoreprojec            ",
	"nullcoreproje             ",
	"nullcoreproj              ",
	"nullcorepro               ",
	"nullcorepr                ",
	"nullcorep                 ",
	"nullcore                  ",
	"nullcor            	   ",
	"nullco            	       ",
	"nullc                     ",
	"null             	       ",
	"nul             	       ",
	"nu             	       ",
	"n            	           ",	
	"           	           ",
},

['Yiffer.xyz'] = {
    "                  ",
    "Y                 ",
    "Yi                ",
    "Yif               ",
    "Yiff              ",
    "Yiffe             ",
    "Yiffer            ",
    "Yiffer.           ",
    "Yiffer.x          ",
    "Yiffer.xy         ",
    "Yiffer.xyz        ",
    "Yiffer.xy         ",
    "Yiffer.x          ",
    "Yiffer.           ",
    "Yiffer            ",
    "Yiffe             ",
    "Yiff              ",
    "Yif               ",
    "Yi                ",
    "Y                 ",
    "                  ",
},
}

local function for_clantags()
	if not enable_clantags:GetValue() then
		if clantagset == 1 then
			set_clantag("", "")
			clantagset = 0
		end

		return
	end

	local mode = clantag_mode:GetString()
	local tag = ClanTags[mode]
	local curtime = math.floor(globals.CurTime() * 2.3)

	if old_time ~= curtime then
		local t = tag[curtime % #tag+1]
		set_clantag(t, t)
	end

	old_time = curtime
	clantagset = 1
end

--------Miscellaneous--------
client.Command("+right", true)
client.Command("+left", true)
client.Command("snd_menumusic_volume 0", true)
client.Command("cl_timeout 0 0 0 7", true)

-- inventory unlock --

local function UnlockInventory()
	panorama.RunScript('LoadoutAPI.IsLoadoutAllowed = () => true');
end

-- engine radar -- 

callbacks.Register('CreateMove', function()
	local isEngineRadarOn = Engine_radar:GetValue() and 1 or 0

	for _, Player in ipairs(entities.FindByClass('CCSPlayer')) do
		Player:SetProp('m_bSpotted', isEngineRadarOn)
	end
end)


-- callbacks --
	
callbacks.Register('Draw', for_clantags)
callbacks.Register("Draw", UnlockInventory)
callbacks.Register('CreateMove', CrosshairRecoil)
