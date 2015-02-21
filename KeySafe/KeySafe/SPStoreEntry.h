//
//  SPStoreItem.h
//  StorePass
//
//  Created by Vishnu on 2/9/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPStoreEntry : NSObject

@property NSString *folderName;
@property NSString *sptitle;
@property NSString *login;
@property NSString *passWord;
@property NSString *url;
@property NSString *notes;

-(id) initSPEntryWithEntry:(NSString *) folderName  sptitle:(NSString *)sptitle login:(NSString *)login passWord:(NSString *)passWord url:(NSString *)url notes:(NSString *) notes;

+(instancetype) createSPEntry:(NSString *) folderName  sptitle:(NSString *)sptitle login:(NSString *)login passWord:(NSString *)passWord url:(NSString *)url notes:(NSString *) notes;

@end
