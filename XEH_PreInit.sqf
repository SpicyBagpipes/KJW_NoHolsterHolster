#include "macro_general.hpp"
/*
 *  Author: KJW
 * 
 *  Handles relevant code to be run pre init.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_TwoPrimaryWeapons_XEH_PreInit
 * 
 *  Public: No
 */


call FUNC(addSettings);

GVAR(positions) = [
	[ 
		"pelvis", //Mempoint 
		[ 
			[-0.770787,-0.0117306,0.636797], //VectorDir 
			[0.095098,0.986385,0.133278]  //VectorUp 
		], 
		[0.001263,-0.098181,0.000453] //Position relative to player 
	],
	[
		"pelvis", //Mempoint
		[
			[-0.936274,-0.066636,0.344852], //VectorDir
			[-0.125986,0.980204,-0.152648]  //VectorUp
		],
		[-0.0007754,0.120279,-0.0288749] //Position relative to player
	],
	[
		"rightupleg",
		[
			[-0.501943,0.851872,0.149468],
			[0.840361,0.521234,-0.1486]
		],
		[0.041241,0.081639,-0.0639336]
	],
	[
		"spine3", //Mempoint
		[
			[-0.166655,-0.496812,0.851691], //VectorDir
			[-0.9607,-0.112603,-0.25367]  //VectorUp
		],
		[-0.193477,-0.0006439,-0.004554] //Position relative to player
	],
	[
		"spine3", //Mempoint
		[
			[-0.942853,0.330874,0.0362221], //VectorDir
			[-0.33272,-0.939935,-0.0747082] //VectorUp
		],
		[-0.215057,-0.176157,-0.136247] //Position relative to player
	],
	[
		"pelvis", //Mempoint
		[
			[-0.713304,0.700795,-0.00756299], //VectorDir
			[0.698764,0.710324,-0.0845198]  //VectorUp
		],
		[-0.163846,-0.163029,-0.1981146] //Position relative to player
	],
	[
		[]
	]
];
GVAR(displayNames) = [
	"Small of Back",
	"Appendix",
	"Pocket",
	"Boomer",
	"Second Rifle",
	"Breacher",
	"Disabled"
]; //Displaynames.