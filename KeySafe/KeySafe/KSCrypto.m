//
//  KSCryptoEngine.m
//  KeySafe
//
//  Created by Vishnu on 4/7/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "KSCrypto.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation KSCrypto

- (NSData *) encryptDataForData:(NSData *) data
                       password:(NSString *) password
                             iv:(NSData **)iv
                           salt:(NSData **)salt
                          error:(NSError **)error{
    
    NSAssert(iv,@" IV must not be null");
    NSAssert(salt,@" SALT must not be null");
    
    *iv = [self randomDataForLength:ksCryptoSettings.ksAlgorithmIVSize];
    *salt = [self randomDataForLength:ksCryptoSettings.ksAlgorithSaltSize];
    
    NSData *key = [self aesKeyForPassword:password salt:*salt];
    
    size_t outLength;
    
    NSMutableData *cipherData = [NSMutableData dataWithLength:data.length + ksCryptoSettings.ksAlgorithBlockSize];
    
    CCCryptorStatus
    result = CCCrypt(kCCEncrypt,
                     ksCryptoSettings.ksAlgorithm,
                     kCCOptionPKCS7Padding,
                     key.bytes,
                     key.length,
                     (*iv).bytes,
                     data.bytes,
                     data.length,
                     cipherData.mutableBytes,
                     cipherData.length,
                     &outLength);
    
    
    if(result == kCCSuccess) {
        
        cipherData.length = outLength;
    } else {if (error) {
        
        *error = [NSError errorWithDomain:@"ksCryptoDomain"
                                     code:result
                                 userInfo:nil];
    }
        return nil;
    }
    
    return cipherData;
};


- (NSData *) decryptDataForData:(NSData *) data
                       password:(NSString *) password
                             iv:(NSData **)iv
                           salt:(NSData **)salt
                          error:(NSError **)error{
    
    return nil;
};

- (NSData *) hashDataForData:(NSData *) data
                    password:(NSString *) password
                          iv:(NSData **)iv
                        salt:(NSData **)salt
                       error:(NSError **)error{
    
    return nil;
};

- (NSData *)randomDataForLength:(size_t) length {
    
    
    NSMutableData *data = [NSMutableData dataWithLength:length];
    int result = SecRandomCopyBytes(kSecRandomDefault,
                                    length, data.mutableBytes);
    NSAssert(result ==0, @"Unable to generate random bytes: %d", errno);
    
    return data;
}


-(NSData *) aesKeyForPassword:(NSString *) password
                         salt:(NSData *) salt {
    
    NSMutableData *derivedKey = [NSMutableData dataWithLength:ksCryptoSettings.ksAlgorithmKeySize];
    
    
    int result = CCKeyDerivationPBKDF(kCCPBKDF2,
                                      password.UTF8String,
                                      [password lengthOfBytesUsingEncoding:(NSUTF8StringEncoding)],
                                      salt.bytes,
                                      salt.length,
                                      kCCPRFHmacAlgSHA1,
                                      ksCryptoSettings.ksAlgorithmRounds,
                                      derivedKey.mutableBytes,
                                      derivedKey.length);
    
    NSAssert(result==kCCSuccess,@" Unable to create AES key for password");
    
    return derivedKey;
}


@end