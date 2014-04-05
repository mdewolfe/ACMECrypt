//
//  ACMEHash.h
//  ACMECrypt
//
//  Created by Mike De Wolfe on 2014-04-04.
//
//

#ifndef ACMECrypt_ACMEHash_h
#define ACMECrypt_ACMEHash_h

#include <CoreFoundation/CoreFoundation.h>

/*
 *	@function
 *		ECGetMD5
 *	@abstract
 *		Calculates the MD5 hash of the provided data object.
 *	@discussion
 *		Will only calculate the MD5 hash if the provided data object has a lenght of greater than zero.
 *	@param
 *		data (CFDataRef), data to hash.
 *	@return
 *		CFDataRef, 'NULL' if an error occurs.
 */
CFDataRef ACGetMD5(CFDataRef data);

CFDataRef ACGetSHA1(CFDataRef data);

CFDataRef ACGetSHA224(CFDataRef data);

CFDataRef ACGetSHA256(CFDataRef data);

CFDataRef ACGetSHA384(CFDataRef data);

CFDataRef ACGetSHA512(CFDataRef data);

#endif