params ["_container"];

// _unit addEventHandler ["InventoryOpened", {
// 	params ["_unit", "_container"];
// }];

_container addEventHandler ["ContainerOpened", {
	params ["_container", "_unit"];

	private _invOpened = [_container, _unit] spawn
    {
        params ["_container", "_unit"];

		uiSleep 1; // without delay, it won't register it as opened so won't close

        private _sling = _container getVariable ["crow_sling_helper_weapon", ""];

        diag_log _sling;

        if ( _sling != "" ) exitWith // prevent player from opening the sling inventory
        {
            closeDialog 602;

            private _holder = "GroundWeaponHolder" createVehicle getPosATL _unit;
            _holder setPos (_unit modelToWorld [0,0,0]);

            _unit action ["Gear",_holder];
        };
    };
}];