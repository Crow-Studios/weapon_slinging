params ["_unit"];

inGameUISetEventHandler [
	"Action",
	"
	if (_this select 3 == 'takeWeapon' && {(_this select 0) getVariable ['crow_sling_helper_weapon',false] isEqualTo false}) then 
	{ 
		false
	} else {
		true
	}
	"
]; // this took me far too long to figure out

[_unit] call weapon_slinging_fnc_client_handleKilled;