params ["_unit", "_weapon"];

if !(_unit getVariable ["crow_sling", false]) then {
    [_unit, _weapon] call weapon_slinging_core_fnc_client_slingWeapon;
} else {
    [_unit] call weapon_slinging_core_fnc_client_retrieveWeapon;
};