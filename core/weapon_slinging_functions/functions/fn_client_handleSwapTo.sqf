params ["_unit"];

private _weapon = "";

switch (true) do {
    case ((secondaryWeapon _unit) isEqualTo (currentWeapon _unit)): {_weapon = "primary"};

    case ((primaryWeapon _unit) isEqualTo (currentWeapon _unit)): {_weapon = "launcher"};
};

_weapon