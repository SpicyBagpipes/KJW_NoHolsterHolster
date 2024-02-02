#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds event handlers required for the mod to function.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_TwoPrimaryWeapons_fnc_addEventHandlers
 * 
 *  Public: No
 */


[
	"weapon",
	{
		private _pistolEquipped = currentWeapon player isEqualTo handgunWeapon player;
		private _hasProxies = count ((selectionNames vestContainer player) select {"weapon" in _x}) > 0;
		if (_pistolEquipped || _hasProxies) exitWith {
			private _currentWeaponObjects = player getVariable [QGVAR(currentWeaponObjects),[]];
			{
				deleteVehicle _x;
			} forEach _currentWeaponObjects;
		};
		[{call FUNC(updateShownWeapon);}, [], 1.6] call CBA_fnc_waitAndExecute;
	}
] call CBA_fnc_addPlayerEventHandler;

[
	"loadout",
	{
		private _pistolEquipped = currentWeapon player isEqualTo handgunWeapon player;
		private _hasProxies = count ((selectionNames vestContainer player) select {"weapon" in _x}) > 0;
		if (_pistolEquipped || _hasProxies) exitWith {
			private _currentWeaponObjects = player getVariable [QGVAR(currentWeaponObjects),[]];
			{
				deleteVehicle _x;
			} forEach _currentWeaponObjects;
		};
		[{call FUNC(updateShownWeapon);}, [], 0.05] call CBA_fnc_waitAndExecute;
	}
] call CBA_fnc_addPlayerEventHandler;

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _objects = player getVariable [QGVAR(currentWeaponObjects),[]];
	if (_objects isEqualTo []) exitWith {}; // No other guns.
	{
		deleteVehicle _x;
	} forEach _objects;
	player setVariable [QGVAR(currentWeaponObjects),[]];
}];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	private _currentWeaponObjects = player getVariable [QGVAR(currentWeaponObjects),[]];
	{
		deleteVehicle _x;
	} forEach _currentWeaponObjects;
}];

player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	call FUNC(updateShownWeapon);
}];

if (isServer) then {
	addMissionEventHandler ["HandleDisconnect", {
		params ["_unit", "_id", "_uid", "_name"];
		private _weaps = _unit getVariable [QGVAR(currentWeaponObjects), []];
		{
			deleteVehicle _x;
		} forEach _weaps;
	}];
};