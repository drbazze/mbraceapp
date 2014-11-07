//
//  IStorageService.h
//  mbraceapp
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol IStorageService <NSObject>

@required
- (NSArray *)retrieveNotes;

@end
