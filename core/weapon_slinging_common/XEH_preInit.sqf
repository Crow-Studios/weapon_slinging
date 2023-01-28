#include "script_component.hpp"

ADDON = true;

[
    "crow_sling_slingType", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Sling Position", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Weapon Slinging", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [["default", "default_tilted", "default_low"], ["Default High", "Default Tilted", "Default Low"], 0],
    false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		profileNamespace setVariable ["crow_sling_slingType",_value];
    }
] call CBA_fnc_addSetting;