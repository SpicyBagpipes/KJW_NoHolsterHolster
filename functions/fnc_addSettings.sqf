#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds CBA Settings required for the mod to function.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_TwoPrimaryWeapons_fnc_addSettings
 * 
 *  Public: No
 */


private _arr = [];
private _componentBeautified = QUOTE(COMPONENT_BEAUTIFIED);

[
	QGVAR(selectedPosition), //Setting classname
	"LIST", //Setting type. Can be CHECKBOX, LIST, SLIDER, COLOR, EDITBOX, TIME
	[
		"Selected Position", //Display name
		"Selected Position for secondary to appear." //Tooltip
	],
	_componentBeautified, //Category
	[
		GVAR(positions), //Values
		GVAR(displayNames), //Displaynames.
		0
	], //Setting properties. Varies based on type
	0, //1: all clients share the same setting, 2: setting can’t be overwritten
	{call FUNC(updateShownWeapon)}, //Code to execute upon setting change
	false //Requires restart?
] call CBA_fnc_addSetting;