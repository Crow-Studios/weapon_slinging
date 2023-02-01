params ["_unit"];

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

    private _respawn = [_unit, _corpse] spawn 
    {
        params ["_unit", "_corpse"];

        private _weaponHolder = _corpse getVariable ["crow_sling_helper", objNull];

        _unit setVariable ["crow_sling_reloading", false];
        _unit setVariable ["crow_sling", false];

        if (_weaponHolder isEqualTo objNull) exitWith {nil};

        if (missionNamespace getVariable ["crow_sling_restoreLoadout", false]) then {
            _unit removeWeapon (primaryWeapon _unit);
            [_unit, _corpse] spawn weapon_slinging_fnc_client_retrieveWeapon;
        };

        uiSleep 5; // give it time to grab all data

        deleteVehicle _weaponHolder;

        _corpse setVariable ["crow_sling_helper", objNull];
    };
}];