params ["_unit", "_weapon"];

// if (_unit getVariable ["crow_sling_autoSling", false]) exitWith {}; // no point having this enabled, is there?
// see above, that was a lie

if (_unit getVariable ["crow_sling", false]) then {
    [_unit] call weapon_slinging_fnc_client_retrieveWeapon;
} else {
    [_unit, _weapon] call weapon_slinging_fnc_client_slingWeapon;
};