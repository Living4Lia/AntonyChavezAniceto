

function AddWeapons()
{
	local weapons =
	{
		custom_ammo_pack = 	{script = "custom_ammo_pack", model = "models/weapons/melee/v_ammo_pack.mdl"}
	}
		
	foreach(weaponName, props in weapons)
	{
		if(g_WeaponController.AddCustomWeapon(props.model, props.script))
		{
			g_WeaponController.SetReplacePercentage(weaponName, 10)
		}
	}
}

printl("Custom Weapon Base loading...")
if(!("g_WeaponController" in getroottable()))
{
	::g_WeaponController <- {}
	DoIncludeScript("custom_weapon_controller", g_WeaponController)
}
else
{
	g_WeaponController.Initialize()
}

AddWeapons()


// Run CS:S gun unlocker if available.
/*::g_CSSUnlocker <- {}
DoIncludeScript("custom_css_unlocker", ::g_CSSUnlocker)
if("PrecacheWeapons" in ::g_CSSUnlocker)
{
	g_CSSUnlocker.PrecacheWeapons()	
	DoEntFire("!self", "RunScriptCode", "g_CSSUnlocker.Replace()", 1, null, Entities.FindByClassname(null, "worldspawn"))
}*/