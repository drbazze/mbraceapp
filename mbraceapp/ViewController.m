//
//  ViewController.m
//  mbraceapp
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#import "ViewController.h"

#import <SVProgressHUD/SVProgressHUD.h>
#import "ContentProvider.h"
#import "Constants.h"
#import "noteCell.h"
#import "note.h"

//------------------------------------------------//

@interface ViewController ()

@property(nonatomic,strong) ContentProvider *contentProvider;

@property(nonatomic,strong) NSArray *notes;

@end

//------------------------------------------------//

@implementation ViewController


//------------------------------------------------//
#pragma mark - Start methods -
//------------------------------------------------//

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self)
  {
    
  }
  return self;
}

//------------------------------------------------//

- (void)start
{
  self.notes = [NSArray new];
  self.contentProvider = [[ContentProvider alloc] init];
  self.notes = [[_contentProvider retrieveNotes] copy];
  
  [contentTable reloadData];
}

//------------------------------------------------//
#pragma mark - Table methods -
//------------------------------------------------//

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return _notes.count;
}

//------------------------------------------------//

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *_cellID = @"noteCell";
  noteCell *_cell = (noteCell *)[tableView dequeueReusableCellWithIdentifier:_cellID];
  
  if(_cell == nil)
  {
    NSArray *_xibs = [[NSBundle mainBundle] loadNibNamed:_cellID owner:self options:nil];
    
    for (id currentObject in _xibs) {
      if ([currentObject isKindOfClass:[UITableViewCell class]]) {
        _cell =  (noteCell *)currentObject;
        break;
      }
    }
  }
  
  note *_note = [_notes objectAtIndex:indexPath.row];
  
  [_cell addNote:_note.text];
  
  _cell.backgroundColor = [UIColor clearColor];
  
  if(indexPath.row % 2)
  {
    _cell.backgroundColor = RGB(247,247,247);
  }
  else
  {
    _cell.backgroundColor = RGB(255,255,255);
  }
  
  return _cell;
}

//------------------------------------------------//

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  note *_note = [_notes objectAtIndex:indexPath.row];
  
  float _Height = [self calculateCellHeight:_note.text];
  
  if(IS_IPAD && _Height < 200)
  {
    _Height = 200;
  }
  
  return _Height;
}

//------------------------------------------------//

- (float)calculateCellHeight :(NSString *) _String
{
  CGRect textRect = [_String boundingRectWithSize:CGSizeMake(300.0f, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica Neue" size:14.0]}
                                          context:nil];
  
  return textRect.size.height + 20;
}

//------------------------------------------------//
#pragma mark - Other -
//------------------------------------------------//

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self start];
}

//------------------------------------------------//

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

//------------------------------------------------//

@end
