//
//  ACMEHelpers.m
//  ACMECrypt
//
//  Created by Michael De Wolfe on 2014-04-29.
//
//

#import "ACMEAdditions.h"
#include "ACMEStrings.h"

BOOL acm_valid_encoding(NSStringEncoding enc) {
    BOOL isGood;
    
    switch ( enc ) {
        case NSASCIIStringEncoding             :
        case NSNEXTSTEPStringEncoding          :
        case NSJapaneseEUCStringEncoding       :
        case NSUTF8StringEncoding              :
        case NSISOLatin1StringEncoding         :
        case NSSymbolStringEncoding            :
        case NSNonLossyASCIIStringEncoding     :
        case NSShiftJISStringEncoding          :
        case NSISOLatin2StringEncoding         :
        case NSUnicodeStringEncoding           :
        case NSWindowsCP1251StringEncoding     :
        case NSWindowsCP1252StringEncoding     :
        case NSWindowsCP1253StringEncoding     :
        case NSWindowsCP1254StringEncoding     :
        case NSWindowsCP1250StringEncoding     :
        case NSISO2022JPStringEncoding         :
        case NSMacOSRomanStringEncoding        :
        case NSUTF16BigEndianStringEncoding    :
        case NSUTF16LittleEndianStringEncoding :
        case NSUTF32StringEncoding             :
        case NSUTF32BigEndianStringEncoding    :
        case NSUTF32LittleEndianStringEncoding : isGood = TRUE;
            break;
        default : isGood = FALSE;
            break;
    }

    return isGood;
}


#pragma mark -
#pragma mark NSString+ACMEHash

@implementation NSString (ACMEHash)

- (NSString*)acm_hash:(ACMHashAlg)alg encoding:(NSStringEncoding)encoding {
    NSString *final = nil;
    
    if ( acm_valid_encoding(encoding) ) {
        NSData *data = [self dataUsingEncoding:encoding];
        final = [data acm_hash:alg];
    }
    
    return final;
}

#pragma mark MD5

- (NSString*) acm_md5Hash {
    return [self acm_md5HashWithEncoding:NSUTF8StringEncoding];
}

- (NSString*) acm_md5HashWithEncoding:(NSStringEncoding)encoding {
    return [self acm_hash:ACMHashAlgMD5 encoding:encoding];
}

- (NSString*) acm_sha1 {
    return [self acm_sha1WithEncoding:NSUTF8StringEncoding];
}

- (NSString*)acm_sha1WithEncoding:(NSStringEncoding)encoding {
    return [self acm_hash:ACMHashAlgSHA1 encoding:encoding];
}

- (NSString*) acm_sha224 {
    return [self acm_sha224:NSUTF8StringEncoding];
}

- (NSString*) acm_sha224:(NSStringEncoding)encoding {
    return [self acm_hash:ACMHashAlgSHA224 encoding:encoding];
}

- (NSString*)acm_sha256 {
    return [self acm_sha256WithEncoding:NSUTF8StringEncoding];
}

- (NSString*)acm_sha256WithEncoding:(NSStringEncoding)encoding {
    return [self acm_hash:ACMHashAlgSHA256 encoding:encoding];
}

- (NSString*)acm_sha384 {
    return [self acm_sha384WithEncoding:NSUTF8StringEncoding];
}

- (NSString*)acm_sha384WithEncoding:(NSStringEncoding)encoding {
    return [self acm_hash:ACMHashAlgSHA384 encoding:encoding];
}

- (NSString*)acm_sha512 {
    return [self acm_sha512WithEncoding:NSUTF8StringEncoding];
}

- (NSString*)acm_sha512WithEncoding:(NSStringEncoding)encoding {
    return [self acm_hash:ACMHashAlgSHA512 encoding:encoding];
}

@end

#pragma mark -
#pragma mark NSData+ACMEHash

@implementation NSData (ACMEHash)

#pragma mark Main Hash Method

-(NSString*)acm_hash:(ACMHashAlg)alg {
    NSString *hashString = nil;
    if ( acm_hash_valid_algorithm(alg) ) {
        NSData *md5Data = (NSData*)CFBridgingRelease(ACMHash((__bridge CFDataRef)self, alg));
        hashString = (NSString*)CFBridgingRelease(ACMDataToHEX((__bridge CFDataRef)md5Data, false));
    }

    return hashString;
}

#pragma mark MD5

- (NSString*) acm_md5Hash {
    return [self acm_hash:ACMHashAlgMD5];
}

#pragma mark SHA

-(NSString*)acm_sha1 {
    return [self acm_hash:ACMHashAlgSHA1];
}

-(NSString*)acm_sha224 {
    return [self acm_hash:ACMHashAlgSHA224];
}

-(NSString*)acm_sha256 {
    return [self acm_hash:ACMHashAlgSHA256];
}

-(NSString*)acm_sha384 {
    return [self acm_hash:ACMHashAlgSHA384];
}

-(NSString*)acm_sha512 {
    return [self acm_hash:ACMHashAlgSHA512];
}

@end
