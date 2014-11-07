//
//  ContentProvider.m
//  mbraceapp
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#import "ContentProvider.h"

#import "StorageServiceCoreData.h"

@interface ContentProvider()

@property(nonatomic,strong) id<IStorageService> storageService;

@end

@implementation ContentProvider

//------------------------------------------------//

- (id)init
{
  if(self = [super init])
  {
    self.storageService = [StorageServiceCoreData sharedClass];
  }
  return self;
}

//------------------------------------------------//

- (NSArray *)retrieveNotes
{
  return [_storageService retrieveNotes];
}

//------------------------------------------------//

@end
