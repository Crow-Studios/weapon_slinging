params ["_unit"];

inGameUISetEventHandler [
	"Action",
	"
	if (_this select 3 == 'takeWeapon' && {(_this select 0) getVariable ['crow_sling_helper_weapon',false] isEqualTo false}) then 
	{ 
		false
	};
	if (_this select 3 == 'takeWeapon' && {(_this select 0) getVariable ['crow_sling_helper_weapon',""default""] != ""default""}) then 
	{
		true
	};	
	"
]; // please work

[] spawn weapon_slinging_fnc_client_handleKeyDown;

[_unit] call weapon_slinging_fnc_client_handleKilled;