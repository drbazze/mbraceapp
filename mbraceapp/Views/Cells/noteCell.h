//
//  noteCell.h
//  mbraceapp
//
//  Created by Zumpf Tamás on 2014. 11. 07..
//  Copyright (c) 2014. Legion Services Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@interface noteCell : UITableViewCell<TTTAttributedLabelDelegate,UIActionSheetDelegate>
{

}

//------------------------------------------------//

@property(nonatomic,weak) IBOutlet TTTAttributedLabel *textLabel;

//------------------------------------------------//

- (void)addNote:(NSString *)note;

//------------------------------------------------//

@end
