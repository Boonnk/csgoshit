--PastedByBonk--
--ThanksForUsing--

--GUI--
local TAB = gui.Tab(gui.Reference("SETTINGS"), "BonksLua", "BonksLua")

--Extra--
local misc_groupbox = gui.Groupbox(TAB, "Extra", 275, 15, 250, 100 );
local Engine_radar = gui.Checkbox(misc_groupbox, "Engine_radar", "Engine Radar", false)
local misc_groupbox = gui.Groupbox(TAB, "Crosshair", 15, 575, 250, 100 );
local misc_groupbox = gui.Groupbox(TAB, "ViewModel", 275, 270, 250, 100 );

--Clantag--
local misc_clantag= gui.Groupbox(TAB, "Clantags", 275, 475, 250, 100)
local enable_clantags = gui.Checkbox(misc_clantag, "enable.clantags", "Enable Premade Clantags", false)
local clantag_mode = gui.Combobox(misc_clantag, "clantag.mode", "Select clantag", "nullcoreproject", "Yiffer.xyz")
local set_clantag = ffi.cast('int(__fastcall*)(const char*, const char*)', mem.FindPattern("engine.dll", "53 56 57 8B DA 8B F9 FF 15"))
local clantagset = 0

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

callbacks.Register('Draw', for_clantags)



--AutoBuy--
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
local TAB = gui.Tab(gui.Reference("SETTINGS"), "BonksLua");
local GROUP = gui.Groupbox(gui.Reference("SETTINGS", "BonksLua"), "AutoBuy", 15, 15, 250, 100);
local ENABLED = gui.Checkbox(GROUP, "autobuy.active", "Enable Auto Buy", false);
local PRIMARY_WEAPON = gui.Combobox(GROUP, "autobuy.primary", "Primary Weapon", primaryWeapons[1][1], primaryWeapons[2][1], primaryWeapons[3][1], primaryWeapons[4][1], primaryWeapons[5][1]);
local SECONDARY_WEAPON = gui.Combobox(GROUP, "autobuy.secondary", "Secondary Weapon", secondaryWeapons[1][1], secondaryWeapons[2][1], secondaryWeapons[3][1], secondaryWeapons[4][1]);
local ARMOR = gui.Combobox(GROUP, "autobuy.armor", "Armor", armors[1][1], armors[2][1], armors[3][1]);
local GRENADE_SLOT1 = gui.Combobox(GROUP, "autobuy.grenade1", "Grenade Slot #1", granades[1][1], granades[2][1], granades[3][1], granades[4][1], granades[5][1], granades[6][1]);
local GRENADE_SLOT2 = gui.Combobox(GROUP, "autobuy.grenade2", "Grenade Slot #2", granades[1][1], granades[2][1], granades[3][1], granades[4][1], granades[5][1], granades[6][1]);
local GRENADE_SLOT3 = gui.Combobox(GROUP, "autobuy.grenade3", "Grenade Slot #3", granades[1][1], granades[2][1], granades[3][1], granades[4][1], granades[5][1], granades[6][1]);
local GRENADE_SLOT4 = gui.Combobox(GROUP, "autobuy.grenade4", "Grenade Slot #4", granades[1][1], granades[2][1], granades[3][1], granades[4][1], granades[5][1], granades[6][1]);
local TASER = gui.Checkbox(GROUP, "autobuy.taser", "Buy Taser", false);
local DEFUSER = gui.Checkbox(GROUP, "autobuy.defuser", "Buy Defuse Kit", false);

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

--ViewModel--

local v_ref = gui.Reference("SETTINGS", "BonksLua", "ViewModel")

local x_value = gui.Slider(v_ref, "lua_viewmodelx", "Viewmodel Offset X", 2, -40, 40)
local y_value = gui.Slider(v_ref, "lua_viewmodely", "Viewmodel Offset Y", 0, -40, 40)
local z_value = gui.Slider(v_ref, "lua_viewmodelz", "Viewmodel Offset Z", -1, -40, 40)

callbacks.Register( "Draw", function()
        client.SetConVar("viewmodel_offset_x", x_value:GetValue(), true);
        client.SetConVar("viewmodel_offset_y", y_value:GetValue(), true);
        client.SetConVar("viewmodel_offset_z", z_value:GetValue(), true);
end) 

--RecoilCrosshair--

local ButtonPosition = gui.Reference( "SETTINGS", "BonksLua", "Extra" );
local PunchCheckbox = gui.Checkbox( ButtonPosition, "lua_recoilcrosshair", "Recoil Crosshair", 0 );
local recoilcolor = gui.ColorPicker(PunchCheckbox, "recoilcolor", "Recoil Crosshair Color", 255,255,255,255)
local IdleCheckbox = gui.Checkbox( ButtonPosition, "lua_recoilidle", "Hide Recoil Crosshair When Idle", 0 );

local function punch()

local rifle = 0;
local me = entities.GetLocalPlayer();
if me ~= nil and not gui.GetValue("rbot.master") then
    if me:IsAlive() then
    local scoped = me:GetProp("m_bIsScoped");
    if scoped == 256 then scoped = 0 end
    if scoped == 257 then scoped = 1 end
    local my_weapon = me:GetPropEntity("m_hActiveWeapon");
    if my_weapon ~=nil then
        local weapon_name = my_weapon:GetClass();
        local canDraw = 0;
        local snipercrosshair = 0;
        weapon_name = string.gsub(weapon_name, "CWeapon", "");
        if weapon_name == "Aug" or weapon_name == "SG556" then
            rifle = 1;
            else
            rifle = 0;
            end

        if scoped == 0 or (scoped == 1 and rifle == 1) then
            canDraw = 1;
            else
            canDraw = 0;
            end

        if weapon_name == "Taser" or weapon_name == "CKnife" then
            canDraw = 0;
            end

        if weapon_name == "AWP" or weapon_name == "SCAR20" or weapon_name == "G3SG1"  or weapon_name == "SSG08" then
            snipercrosshair = 1;
            end

    --Recoil Crosshair by Cheeseot

        if PunchCheckbox:GetValue() and canDraw == 1 then
            local punchAngleVec = me:GetPropVector("localdata", "m_Local", "m_aimPunchAngle");
            local punchAngleX, punchAngleY = punchAngleVec.x, punchAngleVec.y
            local w, h = draw.GetScreenSize();
            local x = w / 2;
            local y = h / 2;
            local fov = 90 --gui.GetValue("vis_view_fov");      polak pls add this back

            if fov == 0 then
                fov = 90;
                end
            if scoped == 1 and rifle == 1 then
                fov = 45;
                end
            
            local dx = w / fov;
            local dy = h / fov;
			
			local px = 0
			local py = 0
			
            if gui.GetValue("esp.other.norecoil") then
				px = x - (dx * punchAngleY)*1.2;
				py = y + (dy * punchAngleX)*2;
            else
				px = x - (dx * punchAngleY)*0.6;
				py = y + (dy * punchAngleX);
			end
            
            if px > x-0.5 and px < x then px = x end
            if px < x+0.5 and px > x then px = x end
            if py > y-0.5 and py < y then py = y end
            if py < y+0.5 and py > y then py = y end

			if IdleCheckbox:GetValue() then
            if px == x and py == y and snipercrosshair ~=1 then return; end
			end
				
            draw.Color(recoilcolor:GetValue());
            draw.FilledRect(px-3, py-1, px+3, py+1);
            draw.FilledRect(px-1, py-3, px+1, py+3);
            end
        end
    end
    end
end
callbacks.Register("Draw", "punch", punch);

--RainbowHUD--

local REF = gui.Reference( "SETTINGS", "BonksLua", "Extra" )
local CHECKBOX = gui.Checkbox( REF, "rainbowhud.enable", "Rainbow Hud", false )
local SLIDER = gui.Slider( REF, "rainbowhud.interval", "Rainbow Hud Interval", 1, 0, 5, 0.05 )

local color = 1
local time = globals.CurTime()
local orig = client.GetConVar( "cl_hud_color" )

callbacks.Register( "Draw", function()
    if CHECKBOX:GetValue() then
        client.Command( "cl_hud_color " .. color, true )
        if globals.CurTime() - SLIDER:GetValue() >= time then
            color = color + 1
            time = globals.CurTime()
        end
        if color > 9 then color = 1 end
    end
end )

callbacks.Register( "Unload", function()
    client.Command( "cl_hud_color " .. orig, true )
end )

--EngineRadar--

local function engine_radar_draw()
    for index, Player in pairs(entities.FindByClass("CCSPlayer")) do
    if not Engine_radar:GetValue() then        
    Player:SetProp("m_bSpotted", 0);
    else
    Player:SetProp("m_bSpotted", 1);
    end
    end
    end
	
	-- callbacks --
	
	callbacks.Register( "Draw", Clantag);
    callbacks.Register("Draw", "engine_radar_draw", engine_radar_draw);