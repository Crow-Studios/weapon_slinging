class cfgPatches
{
	class weapon_slinging_core
	{
		units[] =
		{
			""
		};
		weapons[] =
		{
			""
		};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Data_F_AoW_Loadorder"};
	};
};

class cfgWeapons
{
	class RifleCore;
	class Rifle: RifleCore
	{
		class EventHandlers
		{
			reload		= "(_this select 0) setVariable [""crow_sling_reloading"", true]";
			reloaded	= "(_this select 0) setVariable [""crow_sling_reloading"", false]";
		};
	};
};