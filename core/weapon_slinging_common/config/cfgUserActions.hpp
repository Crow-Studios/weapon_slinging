class CfgUserActions
{
	class crow_sling_slingWeapon
	{// This class name is used for internal representation and also for the inputAction command.
		displayName = "Sling Weapon";
		tooltip = "Ideally, set this to the same keybind as your unequip weapon keybind";
		onActivate = "[player, (primaryWeapon player)] call weapon_slinging_core_fnc_client_handleSling";		// _this is always true.
		onDeactivate = "";		// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.1; // Minimum change required to trigger the onAnalog EH (default: 0.01).
	};
};

class UserActionGroups
{
	class crow_sling
	{
		name = "Weapon Slinging"; // Display name of your category.
		isAddon = 1;
		group[] =
		{
			"crow_sling_slingWeapon"
		};
	};
};