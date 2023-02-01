params ["_unit", "_weapon", ["_swapTo", "default"]];

// Spawn this function

if (_unit getVariable ["crow_sling_reloading",false]) exitWith {hint "You are currently reloading! You can't sling right now."}; // don't sling if reloading
if (_unit getVariable ["crow_sling", false]) exitWith {};

if !(vehicle _unit isEqualTo _unit) exitWith {nil};
if (_weapon isEqualTo "") exitWith {nil};

//if (_weapon isEqualTo (secondaryWeapon _unit)) exitWith {[_unit, (secondaryWeapon _unit), _swapTo] spawn weapon_slinging_fnc_client_slingLauncher};

if (_weapon != primaryWeapon _unit) exitWith {hint "You need to have your primary equipped to sling."};
//if (stance _unit != "STAND") exitWith {hint "You need be standing to sling."};

private _weaponHolder = "GroundWeaponHolder_Scripted" createVehicle [0,0,0];
//_weaponHolder setDamage 1;

[_weaponHolder, true] call weapon_slinging_fnc_server_lockInventory; // never wants to be false, allows people to take the gun out of it normally (which breaks it)
[_weaponHolder] call weapon_slinging_fnc_client_handleSlingOpen;

private _magazines = primaryWeaponMagazine _unit; // returns ["main_mag", "secondary_mag"] (secondary_mag being the underbarrel etc)
private _attachments = primaryWeaponItems _unit;
private _ammo = _unit ammo _weapon;

_unit setVariable ["crow_sling_helper", _weaponHolder, true];

_weaponHolder setVariable ["crow_sling_helper_weapon", _weapon, true]; // fix taking in mp
_weaponHolder setVariable ["crow_sling_helper_weapon_magazines", [_magazines, _ammo]];
_weaponHolder setVariable ["crow_sling_helper_weapon_attachments", _attachments];
// store data to be taken later

private _muzzle = (_attachments select 0);
private _rail   = (_attachments select 1);
private _optics = (_attachments select 2);
private _bipod  = (_attachments select 3);

private _slingType = profileNamespace getVariable ["crow_sling_slingType", "default"];

private _offset     = [(configFile >> "weapon_slings" >> _slingType), "offset", []] call BIS_fnc_returnConfigEntry;
private _rotation   = [(configFile >> "weapon_slings" >> _slingType), "rotation", 0] call BIS_fnc_returnConfigEntry;
private _bone       = [(configFile >> "weapon_slings" >> _slingType), "bone", ""] call BIS_fnc_returnConfigEntry;
private _vector     = [(configFile >> "weapon_slings" >> _slingType), "vector", []] call BIS_fnc_returnConfigEntry;

if ( ([(configFile >> "weapon_slings" >> _weapon), "sling", 0] call BIS_fnc_returnConfigEntry) isEqualTo 1) then {
    _offset     = [(configFile >> "weapon_slings" >> _weapon), "offset", []] call BIS_fnc_returnConfigEntry;
    _rotation   = [(configFile >> "weapon_slings" >> _weapon), "rotation", 0] call BIS_fnc_returnConfigEntry;
    _bone       = [(configFile >> "weapon_slings" >> _weapon), "bone", ""] call BIS_fnc_returnConfigEntry;
    _vector     = [(configFile >> "weapon_slings" >> _weapon), "vector", []] call BIS_fnc_returnConfigEntry;
};

_weaponHolder attachTo [_unit, _offset, _bone, true]; // offset = left/right, back/forward, up/down
_weaponHolder setDir _rotation; // move values to config
_weaponHolder setVectorUp _vector;

_weaponHolder addWeaponWithAttachmentsCargoGlobal [[_weapon, _muzzle, _rail, _optics, [(_magazines select 0), _ammo], [(_magazines select 1), 1], _bipod], 1]; // _magazines select 1 defaults to 1, can't find a way to check for underbarrel ammo count

//_unit switchMove "amovpercmstpsnonwnondnon";

_unit removeWeapon _weapon;

switch (_swapTo) do 
{
    case "handgun":
    {
        if (handgunWeapon _unit isEqualTo "") exitWith {};
        _unit selectWeapon (handgunWeapon _unit)
    };

    case "secondary": 
    {
        _unit selectWeapon (secondaryWeapon _unit)
    };

    case "binocular": 
    {
        _unit selectWeapon (binocular _unit)
    };

    case "default": 
    {
        [_unit] call weapon_slinging_fnc_client_handleAnim;
    };
};

// if !(handgunWeapon _unit isEqualTo "") then {
//     _unit selectWeapon (handgunWeapon _unit);
// } else {
//     [_unit, "amovpercmstpsnonwnondnon"] call weapon_slinging_fnc_server_executeAnim;
// };

_unit setVariable ["crow_sling", true];