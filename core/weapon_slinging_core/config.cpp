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
		requiredAddons[] = {"weapon_slinging_common"};
	};
};

class CfgFunctions
{
    class weapon_slinging_core
    { // weapon_slinging_core_fnc
        class functions
        {
            class client_hasACE
            {
				postInit = 0;
                file = "weapon_slinging_core\functions\fn_client_hasACE.sqf";
            };
            class client_handleSling
            {
				postInit = 0;
                file = "weapon_slinging_core\functions\fn_client_handleSling.sqf";
            };
            class client_retrieveWeapon
            {
				postInit = 0;
                file = "weapon_slinging_core\functions\fn_client_retrieveWeapon.sqf";
            };
            class client_slingWeapon
            {
				postInit = 0;
                file = "weapon_slinging_core\functions\fn_client_slingWeapon.sqf";
            };
        };
    };
};

// class Extended_InitPost_EventHandlers {
//     class CAManBase {
// 		class training_core_addEvent {
// 			init = "[(_this select 0)] call training_core_fnc_client_addEvent";
// 		};
//     };
// };