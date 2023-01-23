params ["_unit", "_weapon"];

if (_unit getVariable ["crow_sling", false]) then {
    [_unit] spawn weapon_slinging_fnc_client_retrieveWeapon;
} else {
    [_unit, _weapon] spawn weapon_slinging_fnc_client_slingWeapon;
};