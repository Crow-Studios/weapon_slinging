params ["_unit"];

_unit addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if (_unit getVariable ["crow_sling", false] isEqualTo true) then {
		[_unit] call weapon_slinging_fnc_client_retrieveWeapon;
	};
}];