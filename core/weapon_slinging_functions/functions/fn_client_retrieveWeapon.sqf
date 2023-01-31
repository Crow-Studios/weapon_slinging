params ["_unit"];

// Spawn this function

//private _weaponType = [_unit] call weapon_slinging_fnc_client_handleSwapTo; // grab secondaryWeapon or primaryWeapon

private _weapon = primaryWeapon _unit;

// if (_weaponType isEqualTo "primary") then {
//     _weapon = primaryWeapon _unit;
// } else {
//     _weapon = secondaryWeapon _unit;
// };

if !(_weapon isEqualTo "") exitWith {hint "You already have a weapon on the sling."};

private _weaponHolder   = _unit getVariable ["crow_sling_helper", objNull];

private _weapon         = _weaponHolder getVariable ["crow_sling_helper_weapon", ""];
private _magazines      = _weaponHolder getVariable ["crow_sling_helper_weapon_magazines", []];
private _attachments    = _weaponHolder getVariable ["crow_sling_helper_weapon_attachments", []];

if (_weaponHolder isEqualTo objNull)    exitWith {diag_log "fn_client_retrieveWeapon.sqf was called without _weaponHolder defined, aborting"};
if (_magazines isEqualTo [])            exitWith {diag_log "fn_client_retrieveWeapon.sqf was called without _magazines defined, aborting"};
if (_weapon isEqualTo "")               exitWith {diag_log "fn_client_retrieveWeapon.sqf was called without _weapon defined, aborting"};

deleteVehicle _weaponHolder;

// if !(_weapon isEqualTo "") then {
//     [_unit, _weapon] call weapon_slinging_fnc_client_slingWeapon;
// };

private _mag            = (_magazines select 0);
private _ammo           = (_magazines select 1);
// don't ask

{
    _unit addMagazine _x;
} forEach _mag;

_unit addWeapon _weapon;

_unit setAmmo [primaryWeapon _unit, _ammo];

{
    _unit addPrimaryWeaponItem _x;
} forEach _attachments;

//uiSleep 0.5;

_unit selectWeapon _weapon;

_unit setVariable ["crow_sling", false];

// ignoring setting ammo for secondary mag for now, refer slingWeapon for more info