//
//  StorageService.h
//  mbraceapp
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IStorageService.h"

@interface StorageServiceCoreData : NSObject <IStorageService>

+ (id)sharedClass;


@end
