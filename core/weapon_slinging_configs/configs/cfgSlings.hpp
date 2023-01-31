class weapon_slings
{
    class default 
    {
        offset[] = {0,0.77,0.3};
        vector[] = {-0.1,1,0.5};

        rotation = 185;
        bone = "Spine3";
    };
    class default_tilted : default
    {
        rotation = 192;
    };
    class default_low : default
    {
        offset[] = {-0.11,0.85,0.0};
        vector[] = {-0.1,1,0.3};

        rotation = 200;
    };
    class default_back : default
    {
        offset[] = {-0.13,0.45,0};
        vector[] = {-0.1,2,0.5};

        rotation = 15;
    };

    class default_back_launcher : default_back
    {
        offset[] = {0.03,0.45,0};
        vector[] = {-0.1,2,0.5};

        rotation = 15;
    };

    /*

    class arifle_SPAR_01_blk_F : default_tilted
    {
        sling = 1;
        rotation = 43;
    }; // debug class
    
    */

    /*

    // these are default classes, they can also be selected via CBA settings. If you want weapon specific ones, do this:    
    class default; // import base class (if not already defined)

    class weapon_classname : default
    {
        sling = 1;

        // custom values here
    };
    
    */
};