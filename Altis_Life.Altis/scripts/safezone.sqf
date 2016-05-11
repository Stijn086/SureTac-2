/*

File: al_safezone.sqf



Edited by: 

Tyler - ALRPG Profile: http://goo.gl/VmgCB0



Description:

Allows you to setup markers that execute the SafeZone script.



Note:

A lot of this is just C&P with different code. It's kinda simple to add / remove stuff

*/



#define POLICE_ZONES    [["pz_xx", 1], ["pz_kav", 1], ["pz_kav1", 1], ["pz_kav2", 1], ["pz_kav3", 1], ["pz_hq", 1], ["pz_at", 1], ["pz_pr", 1], ["pz_hp", 1]]

#define CIV_ZONES    [["cz_xx", 1], ["cz_kav", 1], ["cz_reb", 1], ["cz_reb1", 1], ["cz_reb2", 1], ["cz_hos", 1], ["cz_hos1", 1], ["cz_at", 1], ["cz_pr", 1]]

#define KOS_ZONES    [["kos_xx", 1], ["kos_fd", 1]]





#define PZ_MSG "You are entering a Police Base. Do not Kill or Rob here!"

#define CIV_MSG "You are entering a Civilian SafeZone. Do not commit crimes, rob people, or kill!"

#define KOS_MSG "You are entering a KOS (Kill on sight) area. You may commit crimes, rob, and kill people without initation."



     if (isDedicated) exitWith {};

     waitUntil {!isNull player};



switch (playerSide) do

{ 

case civilian: 
    {
     player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count POLICE_ZONES > 0) then {
                deleteVehicle (_this select 6);
                titleText [PZ_MSG, "PLAIN", 3];
            };
        }
    };
};

switch (playerSide) do

{ 

case civilian:
    {
     player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count CIV_ZONES > 0) then {
                deleteVehicle (_this select 6);
                titleText [CIV_MSG, "PLAIN", 3];
            };
        };
    };
};

switch (playerSide) do

{

case civilian:
    {
     player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count KOS_ZONES > 0) then {
             deleteVehicle (_this select 6);
             titleText [KOS_MSG, "PLAIN", 3];
            };
        };
    };
};