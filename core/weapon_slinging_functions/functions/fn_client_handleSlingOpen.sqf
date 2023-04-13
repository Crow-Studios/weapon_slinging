params ["_container"];

// _unit addEventHandler ["InventoryOpened", {
// 	params ["_unit", "_container"];
// }];

_container addEventHandler ["ContainerOpened", {
	params ["_container", "_unit"];
    [
        {
            private _sling = (_this select 0) getVariable ["crow_sling_helper_weapon", ""];

            diag_log _sling;

            if ( _sling != "" ) exitWith // prevent player from opening the sling inventory
            {
                closeDialog 602;

                private _holder = "GroundWeaponHolder" createVehicle getPosATL (_this select 1);
                _holder setPos ((_this select 1) modelToWorld [0,0,0]);

                (_this select 1) action ["Gear",_holder];
            };
        },
        [_container, _unit],
        1
    ] call CBA_fnc_waitAndExecute;
}];

// removed the spawn, swapped to cba_fnc_waitAndExecute instead