params ["_unit"];

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

    private _weaponHolder = _corpse getVariable ["crow_sling_helper", objNull];

    _unit setVariable ["crow_sling_reloading", false];
    _unit setVariable ["crow_sling", false];

    if (_weaponHolder isEqualTo objNull) exitWith {nil};

    if (missionNamespace getVariable ["crow_sling_restoreLoadout", false]) then {
        _unit removeWeapon (primaryWeapon _unit);
        [_unit, _corpse] call weapon_slinging_fnc_client_retrieveWeapon;
    };

    [
        {
            deleteVehicle (_this select 0);

            (_this select 1) setVariable ["crow_sling_helper", objNull];
        },
        [_weaponHolder, _corpse],
        5
    ] call CBA_fnc_waitAndExecute;
}];

// removed the spawn, swapped to cba_fnc_waitAndExecute instead