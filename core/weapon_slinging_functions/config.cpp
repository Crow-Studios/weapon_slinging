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
            class client_handleAnim
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_handleAnim.sqf";
            };
            class client_handleKeyDown
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_handleKeyDown.sqf";
            };
            class client_handleKilled
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_handleKilled.sqf";
            };
            class client_handleSling
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_handleSling.sqf";
            };
            class client_handleSlingOpen
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_handleSlingOpen.sqf";
            };
            class client_handleSwapTo
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_handleSwapTo.sqf";
            };
            class client_hasACE
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_hasACE.sqf";
            };
            class client_init
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_init.sqf";
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
            class client_slingLauncher
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_client_slingLauncher.sqf";
            };
            class server_executeAnim
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_server_executeAnim.sqf";
            };
            class server_lockInventory
            {
				postInit = 0;
                file = "weapon_slinging_functions\functions\fn_server_lockInventory.sqf";
            };
        };
    };
};

class Extended_InitPost_EventHandlers {
    class CAManBase {
		class weapon_slinging_handleKilled {
			init = "[(_this select 0)] call weapon_slinging_fnc_client_init";
		};
    };
};