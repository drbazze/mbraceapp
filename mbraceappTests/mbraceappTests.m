//
//  mbraceappTests.m
//  mbraceappTests
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#define HC_SHORTHAND

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>

#import "Constants.h"
#import "StorageServiceCoreData.h"
#import "ContentProvider.h"
#import "note.h"

//------------------------------------------------//

@interface mbraceappTests : XCTestCase

@end

//------------------------------------------------//

@implementation mbraceappTests

- (void)setUp
{
  [super setUp];
}

//------------------------------------------------//

- (void)test_storageservice_notes_are_not_empty
{
  StorageServiceCoreData *storage = [StorageServiceCoreData sharedClass];
  
  NSArray *result = [storage retrieveNotes];
  
  assertThat(result,notNilValue());
}

//------------------------------------------------//

- (void)test_contentprovider_notes_are_not_empty
{
  ContentProvider *contentProvider = [[ContentProvider alloc] init];
  
  NSArray *result = [contentProvider retrieveNotes];
  
  assertThat(result,notNilValue());
}

//------------------------------------------------//

- (void)tearDown
{
  [super tearDown];
}

//------------------------------------------------//

@end
