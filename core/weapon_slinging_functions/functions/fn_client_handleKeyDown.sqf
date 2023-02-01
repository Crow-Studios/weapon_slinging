//params ["_unit"];

waituntil {!(IsNull (findDisplay 46))}; // wait until player exists

private _display_46_keyDown = findDisplay 46 displayAddEventHandler ["KeyDown",
{
    if (profileNamespace getVariable ["crow_sling_autoSling", false]) then 
    {

        private _unit = player;

        private _curWeapon = currentWeapon _unit;
        private _weapon = primaryWeapon _unit;

        switch (true) do
        {
            case ((_this select 1) in actionKeys "SwitchHandgun"):
            {
                if (_curWeapon != _weapon) exitWith {false};
                if (handgunWeapon _unit isEqualTo "") exitWith {false};
                [_unit, _weapon, "handgun"] spawn weapon_slinging_fnc_client_slingWeapon;
            };
            
            case ((_this select 1) in actionKeys "SwitchSecondary"):
            {
                if (_curWeapon != _weapon) exitWith {false};
                if (secondaryWeapon _unit isEqualTo "") exitWith {false};
                //[_unit] spawn weapon_slinging_fnc_client_retrieveWeapon;
                [_unit, _weapon, "secondary"] spawn weapon_slinging_fnc_client_slingWeapon; 
            };

            case ((_this select 1) in actionKeys "binocular"):
            {
                if (_curWeapon != _weapon) exitWith {false};
                if (binocular _unit isEqualTo "") exitWith {false};
                [_unit, _weapon, "binocular"] spawn weapon_slinging_fnc_client_slingWeapon;
            };

            case ((_this select 1) in actionKeys "SwitchPrimary"):
            {
                if (primaryWeapon _unit != "") exitWith {false};
                [_unit] spawn weapon_slinging_fnc_client_retrieveWeapon;
            };

            default
            {
                false
            };
        };
    };

    false
}];

//_display_46_keyDown