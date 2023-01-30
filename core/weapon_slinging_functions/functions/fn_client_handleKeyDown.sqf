//params ["_unit"];

waituntil {!(IsNull (findDisplay 46))};

private _display_46_keyDown = findDisplay 46 displayAddEventHandler ["KeyUp", 
'
    //hint str (_this select 1);
    if (profileNamespace getVariable ["crow_sling_autoSling", false]) then 
    {

        private _unit = player;

        private _weapon = primaryWeapon _unit;

        switch (true) do {
        
            case ((_this select 1) in actionKeys "SwitchHandgun"):
            {
                if (handgunWeapon _unit isEqualTo "") exitWith {false};
                [_unit, _weapon, "handgun"] spawn weapon_slinging_fnc_client_slingWeapon; 
                //true
            };
            
            case ((_this select 1) in actionKeys "SwitchSecondary"):
            {
                if (secondaryWeapon _unit isEqualTo "") exitWith {false};
                [_unit, _weapon, "secondary"] spawn weapon_slinging_fnc_client_slingWeapon; 
                //true
            };

            case ((_this select 1) in actionKeys "binocular"):
            {
                if (binocular _unit isEqualTo "") exitWith {false};
                [_unit, _weapon, "binocular"] spawn weapon_slinging_fnc_client_slingWeapon; 
                //true
            };

            case ((_this select 1) in actionKeys "SwitchPrimary"):
            {
                if (primaryWeapon _unit != "") exitWith {false};
                [_unit] spawn weapon_slinging_fnc_client_retrieveWeapon;
                //true
            };
        
        };
    };
    false
'
];

//_display_46_keyDown