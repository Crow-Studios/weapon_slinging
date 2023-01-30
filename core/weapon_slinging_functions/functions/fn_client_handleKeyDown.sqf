private _display_46_keyDown = findDisplay 46 displayAddEventHandler ["KeyDown", 
"
    hint str (_this select 1);

    if ((_this select 1) in actionKeys ""SwitchHandgun"") exitWith {};

    if ((_this select 1) in actionKeys ""SwitchPrimary"") exitWith {};

    if ((_this select 1) in actionKeys ""SwitchSecondary"") exitWith {};

    if ((_this select 1) in actionKeys ""binocular"") exitWith {};
"
];

_display_46_keyDown