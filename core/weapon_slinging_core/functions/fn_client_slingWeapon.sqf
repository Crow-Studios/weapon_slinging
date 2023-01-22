params ["_unit", "_weapon"];

if !(vehicle player isEqualTo player) exitWith {nil};
if (_weapon isEqualTo "") exitWith {};

private _weaponHolder = "GroundWeaponHolder_Scripted" createVehicle [0,0,0];

_weaponHolder lockInventory true; // never wants to be false, allows people to take the gun out of it normally (which breaks it)

private _magazines = primaryWeaponMagazine _unit; // returns ["main_mag", "secondary_mag"] (secondary_mag being the underbarrel etc)
private _attachments = primaryWeaponItems _unit;
private _ammo = _unit ammo _weapon;

_unit setVariable ["crow_sling_helper", _weaponHolder, true];

_weaponHolder setVariable ["crow_sling_helper_weapon", _weapon, true];
_weaponHolder setVariable ["crow_sling_helper_weapon_magazines", [_magazines, _ammo], true];
_weaponHolder setVariable ["crow_sling_helper_weapon_attachments", _attachments, true];
// store data to be taken later

private _muzzle = (_attachments select 0);
private _rail = (_attachments select 1);
private _optics = (_attachments select 2);
private _bipod = (_attachments select 3);

_weaponHolder attachTo [_unit, [0,0.77,0.3], "Spine3", true]; 
_weaponHolder setDir 180; // move values to config
_weaponHolder setVectorUp [-0.1,1,0.5];
// to do, make a custom config that allows certain weapons to use different spine points, coordinates, and angles, use default value if weapon isn't in config

_weaponHolder addWeaponWithAttachmentsCargoGlobal [[_weapon, _muzzle, _rail, _optics, [(_magazines select 0), _ammo], [(_magazines select 1), 1], _bipod], 1]; // _magazines select 1 defaults to 1, can't find a way to check for underbarrel ammo count

_unit removeWeapon _weapon;

_unit setVariable ["crow_sling", true, true];