StartProgress = false;

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "scripts\safezone.sqf";
[] spawn life_fnc_fatigueReset;

StartProgress = true;