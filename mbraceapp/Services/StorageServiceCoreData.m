//
//  StorageService.m
//  mbraceapp
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#define MR_SHORTHAND

#import "StorageServiceCoreData.h"
#import <CoreData+MagicalRecord.h>
#import "note.h"
#import "note+Validation.h"

#import "CDNote.h"

//------------------------------------------------//

static BOOL needToSave = NO;

//------------------------------------------------//

@implementation StorageServiceCoreData

//------------------------------------------------//

+ (id)sharedClass
{
  static StorageServiceCoreData *sharedStorageService = nil;
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    sharedStorageService = [[self alloc] init];
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"mbraceappDatabase"];
  });
  
  return sharedStorageService;
}

//------------------------------------------------//

- (NSArray *)retrieveNotes
{
  return [self retrieveNotesFromStorage];
}

//------------------------------------------------//

- (NSArray *)retrieveDefaultNotes
{
  NSArray *notes = @[@{@"id":@1, @"text": @"First note"},
                     @{@"id":@2, @"text": @"Secon note with a link to http://www.google.de"},
                     @{@"id":@3, @"text": @"Third note"},
                     @{@"id":@4, @"text": @"Fourth note"},
                     @{@"id":@5, @"text": @"Fifth note with an email adress to jakob@mbraceapp.com"},
                     @{@"id":@6, @"text": @"6th note"},
                     @{@"id":@6, @"text": @"6th note updated"},
                     @{@"id":@7, @"text": @"7th note"},
                     @{@"id":@8, @"text": @"8th note"},
                     @{@"id":@9, @"text": @"9th note"},
                     @{@"id":@10, @"text": @"10th note"},
                     @{@"id":@11, @"text": @"11th note"},
                     @{@"id":@12, @"text": @"12th note"},
                     @{@"id":@13, @"text": @"13th note"},
                     @{@"id":@14, @"text": @"14th note"},
                     @{@"id":@15, @"text": @"get mbrace at http://www.getmbrace.com"},
                     @{@"id":@16, @"text": @"16th note"},
                     @{@"id":@17, @"text": @"17th note"},
                     @{@"id":@18, @"text": @"18th note"},
                     @{@"id":@19, @"text": @"19th note"},
                     @{@"id":@20, @"text": @"20th note"},
                     @{@"id":@21, @"text": [NSNull null]},
                     @{@"id":@22, @"text": @"22th note"},
                     @{@"id":@23, @"text": @"23th note"},
                     @{@"id":@24, @"text": @"Visit www.mbraceapp.com"},
                     @{@"id":@25, @"text": @"25th note"},
                     @{@"id":@26, @"text": @"Note that is a little bit longer than all the other notes because of consiting of some strings that are useless and take a lot of space"},
                     @{@"id":@27, @"text": @"27th note"},
                     @{@"id":@28, @"text": @"28th note"},
                     @{@"id":@29, @"text": @"29th note"},
                     @{@"id":@30, @"text": @"another email to lukas@mbraceapp.com"},
                     @{@"id":@31, @"text": @"31th note"},
                     @{@"id":@32, @"text": @"32th note"},
                     @{@"id":@33, @"text": @"33th note"},
                     @{@"id":@34, @"text": @"almost at the end note"},
                     @{@"id":@35, @"text": @"Last note note"},
                     @{@"id":@12, @"text": @"Updated 12th note"}];
  
  return notes;
}

//------------------------------------------------//

- (NSArray *)retrieveNoteModels
{
  NSMutableArray *result = [NSMutableArray new];
  
  for(NSDictionary *data in [self retrieveDefaultNotes])
  {
    note *_note = [[note alloc] init];
    _note.id = [data valueForKey:@"id"];
    _note.text = [data valueForKey:@"text"];
    
    [_note validateText];
    
    [result addObject:_note];
  }
  
  return [result copy];
}

//------------------------------------------------//

- (void)checkModelsInCoreData
{
  for(note *_note in [self retrieveNoteModels])
  {
    [self addIfNeededToCoreData:_note];
  }
  
  if(needToSave)
  {
    [self save];
  }
}

//------------------------------------------------//

- (void)addIfNeededToCoreData:(note *)note
{
  CDNote *cdNote = [CDNote MR_findFirstByAttribute:@"id" withValue:note.id];
  
  if(!cdNote)
  {
    cdNote = [CDNote MR_createEntity];
    
    cdNote.id = [NSString stringWithFormat:@"%@",note.id];
    cdNote.text = note.text;
    
    needToSave = YES;
  }
  else
  {
    if(![cdNote.text isEqualToString:note.text])
    {
      cdNote.text = note.text;
      
      needToSave = YES;
    }
  }
}

//------------------------------------------------//

- (NSArray *)retrieveNotesFromStorage
{
  [self checkModelsInCoreData];
  
  NSArray *result = [CDNote MR_findAll];
  
  return result;
}

//------------------------------------------------//

- (void)save
{
  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
      if(success)
      {
        needToSave = NO;
      }
    }];
  });
}

//------------------------------------------------//

@end
