//
//  NSString+MD5.m
//  KeySafe
//
//  Created by Vishnu on 4/13/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(MD5)

-(NSString *)MD5 {
    
    const char *ptr = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr,strlen(ptr),md5Buffer);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i =0 ; i < CC_MD5_DIGEST_LENGTH; i++)
        
        [output appendFormat:@"%02x", md5Buffer[i]];
    
    return output;
    
}

@end
