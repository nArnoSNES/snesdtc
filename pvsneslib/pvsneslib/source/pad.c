/*---------------------------------------------------------------------------------

	Copyright (C) 2012
		Alekmaul 

	This software is provided 'as-is', without any express or implied
	warranty.  In no event will the authors be held liable for any
	damages arising from the use of this software.

	Permission is granted to anyone to use this software for any
	purpose, including commercial applications, and to alter it and
	redistribute it freely, subject to the following restrictions:

	1.	The origin of this software must not be misrepresented; you
		must not claim that you wrote the original software. If you use
		this software in a product, an acknowledgment in the product
		documentation would be appreciated but is not required.
	2.	Altered source versions must be plainly marked as such, and
		must not be misrepresented as being the original software.
	3.	This notice may not be removed or altered from any source
		distribution.

---------------------------------------------------------------------------------*/

#include <snes/pad.h>

extern u16 pad_keys[2];// = {0,0};
extern u16 pad_keysold[2];//  = {0,0};
extern u16 pad_keysrepeat[2];//  = {0,0};

extern u16 scope_holddelay, scope_repdelay;

//------------------------------------------------------------------------------
unsigned short padsDown(unsigned short value) {
	return (pad_keys[value] & ~pad_keysold[value]);
}

//------------------------------------------------------------------------------
unsigned short padsUp(unsigned short value) {
	return (pad_keys[value] ^ pad_keysold[value]) & (~pad_keys[value]);
}

//------------------------------------------------------------------------------
void padsClear(unsigned short value) {
	// Value for pads
	pad_keys[value] = 0;
	pad_keysold[value]  = 0;
	pad_keysrepeat[value]  = 0;
}

//------------------------------------------------------------------------------
void superScopeClear(void) {
	scope_holddelay = 25;
	scope_repdelay = 25;
}

