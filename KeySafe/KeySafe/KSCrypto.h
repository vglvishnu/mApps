//
//  KSCryptoEngine.h
//  KeySafe
//
//  Created by Vishnu on 4/7/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>


typedef struct _KSCryptorSettings
{
 
    CCAlgorithm ksAlgorithm;
    size_t ksAlgorithmKeySize;
    size_t ksAlgorithBlockSize;
    size_t ksAlgorithmIVSize;
    size_t ksAlgorithSaltSize;
    NSUInteger ksAlgorithmRounds;
    
} KSCryptoSetting;


static const KSCryptoSetting ksCryptoSettings = {
    .ksAlgorithm           = kCCAlgorithmAES128 ,
    .ksAlgorithmKeySize    = kCCKeySizeAES128   ,
    .ksAlgorithBlockSize   = kCCBlockSizeAES128 ,
    .ksAlgorithmIVSize     = kCCBlockSizeAES128 ,
    .ksAlgorithSaltSize    = 8                  ,
    .ksAlgorithmRounds     =10000
    
};

@interface KSCrypto : NSObject






@end
