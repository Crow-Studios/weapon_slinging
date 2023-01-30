params ["_unit", "_anim"];

[_unit, _anim] remoteExec ["switchMove"];

//diag_log format ["Weapon Slinging: Animation %1 was played on %2", _anim, _unit];