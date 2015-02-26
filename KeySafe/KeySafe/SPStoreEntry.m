//
//  SPStoreItem.m
//  StorePass
//
//  Created by Vishnu on 2/9/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "SPStoreEntry.h"

@implementation SPStoreEntry


-(id) initSPEntryWithEntry:(NSString *) folderName  sptitle:(NSString *)sptitle login:(NSString *)login passWord:(NSString *)passWord url:(NSString *)url notes:(NSString *) notes keyid:(NSNumber *) keyid{
   
    self= [super init];
    
    if(self){
        _folderName = folderName;
        _sptitle    = sptitle;
        _login      = login;
        _passWord   = passWord;
        _url        = url;
        _notes      = notes;
        _keyid      = keyid;
        
        
    }
    
    return self;
    
}


+(instancetype) createSPEntry:(NSString *) folderName  sptitle:(NSString *)sptitle login:(NSString *)login passWord:(NSString *)passWord url:(NSString *)url notes:(NSString *) notes keyid:(NSNumber *) keyid{
    
    
    return [[SPStoreEntry alloc]initSPEntryWithEntry:folderName sptitle:sptitle login:login passWord:passWord url:url notes:notes keyid:keyid];
}


@end
