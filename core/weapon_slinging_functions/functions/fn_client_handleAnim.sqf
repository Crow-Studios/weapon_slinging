params ["_unit"];

switch (stance _unit) do {

    case "STAND": 
    {
        [_unit, "amovpercmstpsnonwnondnon"] call weapon_slinging_fnc_server_executeAnim;
    };

    case "CROUCH":
    {
        [_unit, "amovpknlmstpsnonwnondnon"] call weapon_slinging_fnc_server_executeAnim;
    };

    case "PRONE": 
    {
        [_unit, "amovppnemstpsnonwnondnon"] call weapon_slinging_fnc_server_executeAnim;
    };

    case "UNDEFINED":
    {
        diag_log "client_handleAnim.sqf - doing nothing, player couldn't swap anim. Possibly in water?"
    };

};