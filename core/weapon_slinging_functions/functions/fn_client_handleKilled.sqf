params ["_unit"];

_unit addEventHandler ["Killed", {
	params ["_unit"];

    _unit setVariable ["crow_sling_reloading", false];

    private _weaponHolder = _unit getVariable ["crow_sling_helper", objNull];
    if (_weaponHolder isEqualTo objNull) exitWith {nil};

    deleteVehicle _weaponHolder;
    _unit setVariable ["crow_sling_helper", objNull];
}];