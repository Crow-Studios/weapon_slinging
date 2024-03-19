#include "script_component.hpp"

ADDON = true;

[
    "crow_sling_slingType", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Sling Position", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Weapon Slinging", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [["default", "default_tilted", "default_low", "default_back"], ["Default High", "Default Tilted", "Default Low", "Default Back"], 0],
    false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		player setVariable ["crow_sling_slingType",_value];
    }
] call CBA_fnc_addSetting;

[
    "crow_sling_autoSling", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Auto Sling When Changing Weapons", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Weapon Slinging", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		player setVariable ["crow_sling_autoSling",_value];
    }
] call CBA_fnc_addSetting;

[
    "crow_sling_restoreLoadout", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Restore Slinged Weapon After Respawn", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Weapon Slinging", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		player setVariable ["crow_sling_restoreLoadout",_value];
    }
] call CBA_fnc_addSetting;