#include "script_component.hpp"

ADDON = true;

[
    "weapon_slinging_", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Weapon Slinging", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		missionNamespace setVariable ["weapon_slinging_",_value,true];
    }
] call CBA_fnc_addSetting;