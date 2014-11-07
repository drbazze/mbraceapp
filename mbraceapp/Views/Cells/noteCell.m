//
//  noteCell.m
//  mbraceapp
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#import "noteCell.h"

//------------------------------------------------//

@implementation noteCell
@synthesize textLabel;

//------------------------------------------------//

- (void)awakeFromNib
{

}

//------------------------------------------------//

- (void)addNote:(NSString *)note
{
  NSMutableDictionary *mutableActiveLinkAttributes = [NSMutableDictionary dictionary];
  [mutableActiveLinkAttributes setValue:[NSNumber numberWithBool:NO] forKey:(NSString *)kCTUnderlineStyleAttributeName];
  [mutableActiveLinkAttributes setValue:(__bridge id)[[UIColor redColor] CGColor] forKey:(NSString *)kCTForegroundColorAttributeName];
  [mutableActiveLinkAttributes setValue:(__bridge id)[[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.1f] CGColor] forKey:(NSString *)kTTTBackgroundFillColorAttributeName];
  [mutableActiveLinkAttributes setValue:(__bridge id)[[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.25f] CGColor] forKey:(NSString *)kTTTBackgroundStrokeColorAttributeName];
  [mutableActiveLinkAttributes setValue:[NSNumber numberWithFloat:1.0f] forKey:(NSString *)kTTTBackgroundLineWidthAttributeName];
  [mutableActiveLinkAttributes setValue:[NSNumber numberWithFloat:5.0f] forKey:(NSString *)kTTTBackgroundCornerRadiusAttributeName];
  textLabel.activeLinkAttributes = mutableActiveLinkAttributes;
  
  textLabel.enabledTextCheckingTypes = NSTextCheckingTypeLink;
  textLabel.text = note;
  textLabel.delegate = self;
}

//------------------------------------------------//

- (void)attributedLabel:(__unused TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url
{
  [[[UIActionSheet alloc] initWithTitle:[url absoluteString] delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Open in Browser", nil), nil] showInView:self.superview];
}

//------------------------------------------------//
#pragma mark - UIActionSheetDelegate
//------------------------------------------------//

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
  if(buttonIndex == actionSheet.cancelButtonIndex)
  {
    return;
  }
  
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:actionSheet.title]];
}

//------------------------------------------------//

@end
