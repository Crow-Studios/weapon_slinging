class cfgPatches
{
	class weapon_slinging_functions
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
		requiredAddons[] = {"weapon_slinging_common", "weapon_slinging_configs"};
	};
};

class CfgFunctions
{
    class weapon_slinging
    { // weapon_slinging_fnc
        class functions
        {
            class client_hasACE
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_hasACE.sqf";
            };
            class client_handleSling
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_handleSling.sqf";
            };
            class client_retrieveWeapon
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_retrieveWeapon.sqf";
            };
            class client_slingWeapon
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_slingWeapon.sqf";
            };
        };
    };
};