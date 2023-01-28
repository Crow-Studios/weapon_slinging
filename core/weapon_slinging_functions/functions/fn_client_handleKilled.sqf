params ["_unit"];

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

    _unit setVariable ["crow_sling_reloading", false];
    _unit setVariable ["crow_sling", false];

    private _weaponHolder = _corpse getVariable ["crow_sling_helper", objNull];
    if (_weaponHolder isEqualTo objNull) exitWith {nil};

    deleteVehicle _weaponHolder;
    _corpse setVariable ["crow_sling_helper", objNull];
}];