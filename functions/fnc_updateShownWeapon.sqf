#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Updates shown weapon based on player's currently equipped primary.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_TwoPrimaryWeapons_fnc_updateShownWeapon
 * 
 *  Public: No
 */


private _currentWeaponObjects = player getVariable [QGVAR(currentWeaponObjects),[]];

private _weaponInfo = (weaponsItems player select {_x#0 isEqualTo handgunWeapon player})#0;

if (GVAR(selectedPosition) isEqualTo [[]]) exitWith {};

private _positions = [GVAR(selectedPosition)];
private _objects = [];

{
	deleteVehicle _x;
} forEach _currentWeaponObjects;

if (isNil "_weaponInfo" || {_weaponInfo isEqualTo []}) exitWith {};

private _class = QGVAR(GWH);
if (isClass (configFile >> "CfgPatches" >> "KJW_TwoSecondaryWeapons")) then {
	_class = "KJW_TwoSecondaryWeapons_GWH";
};
if (isClass (configFile >> "CfgPatches" >> "KJW_TwoPrimaryWeapons")) then {
	_class = "KJW_TwoPrimaryWeapons_GWH";
}; // There is probably a better way to do this, I am just too tired to think of it.

{
	private _holder = createVehicle [_class,[0,0,0]];
	_holder addWeaponWithAttachmentsCargoGlobal [_weaponInfo, 1];
	_holder setDamage 1;
	_holder attachTo [player, _x#2, _x#0, true];
	_holder setVectorDirAndUp _x#1;
	_objects pushBack _holder;
} forEach _positions;
player setVariable [QGVAR(currentWeaponObjects), _objects, true];

/*
	Positions array:
	[mempoint,vectordirandup,position]
*/