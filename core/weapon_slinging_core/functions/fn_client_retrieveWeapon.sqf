params ["_unit"];

private _weaponHolder   = _unit getVariable ["crow_sling_helper", objNull];

private _weapon         = _weaponHolder getVariable ["crow_sling_helper_weapon", ""];
private _magazines      = _weaponHolder getVariable ["crow_sling_helper_weapon_magazines", []];
private _attachments    = _weaponHolder getVariable ["crow_sling_helper_weapon_attachments", []];

if (_weaponHolder isEqualTo objNull)    exitWith {diag_log "fn_client_retrieveWeapon.sqf was called without _weaponHolder defined, aborting"};
if (_magazines isEqualTo [])            exitWith {diag_log "fn_client_retrieveWeapon.sqf was called without _magazines defined, aborting"};
if (_weapon isEqualTo "")               exitWith {diag_log "fn_client_retrieveWeapon.sqf was called without _weapon defined, aborting"};

private _mag            = ((_magazines select 0) select 0);
private _magSecondary   = ((_magazines select 0) select 1);
private _ammo           = (_magazines select 1);
// don't ask

_unit addMagazine _mag;

if !(_magSecondary isEqualTo "") then {
    _unit addMagazine _magSecondary;
};

_unit addWeapon _weapon;

_unit setAmmo [primaryWeapon _unit, _ammo];

deleteVehicle _weaponHolder;

_unit setVariable ["crow_sling", false, true];

// ignoring setting ammo for secondary mag for now, refer slingWeapon for more info