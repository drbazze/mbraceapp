//
//  note+Validation.m
//  mbraceapp
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#import "note+Validation.h"

@implementation note (Validation)

- (void)validateText
{
  if([self.text isKindOfClass:[NSNull class]])
  {
    self.text = @"Null";
  }
}

@end
