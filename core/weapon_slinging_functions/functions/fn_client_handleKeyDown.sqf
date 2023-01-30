private _display_46_keyDown = findDisplay 46 displayAddEventHandler ["KeyDown", 
'
    hint str (_this select 1);
    if (profileNamespace getVariable ["crow_sling_autoSling", false]) then 
    {

        switch (actionKeys (_this select 1)) do {
        
            case "SwitchHandgun": 
            {

            };

            case "SwitchPrimary":
            {

            };
            
            case "SwitchSecondary": 
            {

            };

            case "binocular": 
            {

            };
        
        };
    };
'
];

_display_46_keyDown