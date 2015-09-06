//
//  FeelingsTableViewController.h
//  demo3
//
//  Created by 郑涵 on 15/8/28.
//  Copyright © 2015年 nick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Motion.h"

@interface FeelingsTableViewController : UITableViewController

@property Motion *toDoItem;
//extern NSMutableArray *MoveSpeed;//only store speed for this moment, later, add the timestamp

- (IBAction)unwindToFeelings:(UIStoryboardSegue *)segue;

@end
