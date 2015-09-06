//
//  AddFeelingsViewController.m
//  demo3
//
//  Created by 郑涵 on 15/8/28.
//  Copyright © 2015年 nick. All rights reserved.
//

#import "AddFeelingsViewController.h"

@interface AddFeelingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddFeelingsViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.textField.text.length > 0) {
    
    self.toDoItem = [[Feeling alloc] init];
    NSDateFormatter *formater1=[[NSDateFormatter alloc]init];
    
    formater1.dateFormat=@" yy-MM-dd HH:mm";
    NSString *datestr=[formater1 stringFromDate:[NSDate date]];
    NSString *feeling=[self.textField.text stringByAppendingString:datestr];
    self.toDoItem.itemName = feeling;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
